require 'dropbox-api'

module Iguazu
  module MasterImageStore
    class Scanner

      
      def initialize(client)
        @client = client
      end

      # Returns an Array of Directory Paths
      #
      # Returns an Array of strings where each string is a full path to the
      # directory from the root.
      def list_directories
        @client.list_directories
      end
      
    end
  end
end
