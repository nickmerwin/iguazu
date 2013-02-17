module Iguazu
  class DataMigrator

    def initialize(master_image_store_client, live_image_store_client)
      @mis_client = master_image_store_client
      @lis_client = live_image_store_client
    end

    def update_directories
      get_master_directories
      update_live_directories
    end

    private

    def get_master_directories
      scanner = Iguazu::MasterImageStore::Scanner.new(@mis_client)
      @master_directories = scanner.list_directories
    end

    def update_live_directories
      dir_creator = Iguazu::LiveImageStore::DirectoryStructureUpdater.new(
	@lis_client)
      dir_creator.update_directories(@master_directories)
    end
    
  end
end