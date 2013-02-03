module Iguazu
  module LiveImageStore
    class DirectoryStructureUpdater

      def initialize(client)
        @client = client
      end

      def update_directories(directories)
        @client.update_directories(directories)
      end
      
    end
  end
end