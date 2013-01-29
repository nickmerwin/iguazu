module Iguazu
  module LiveImageStore
    module Clients
      class LocalFileSystem

        def initialize
          @path = ENV['LOCAL_FILE_SYSTEM']
        end

        def update_directories(directories)
          directories.each do |dir|
            FileUtils.mkdir_p File.join(@path,dir)
          end
        end

      end
    end
  end
end
