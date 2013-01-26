module Iguazu
  module LiveImageStore
    class DirectoryCreator

      def initialize(client)
        @client = client
      end

      def update_directories(directories)
        @client.update_directories
      end
      
    end
  end
end