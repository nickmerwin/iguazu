require 'dropbox-api'

module Iguazu
  module MasterImageStore
    module Clients
      class Dropbox

        ::Dropbox::API::Config.app_key    = ENV['DROPBOX_APP_KEY']
        ::Dropbox::API::Config.app_secret = ENV['DROPBOX_APP_SECRET']
        ::Dropbox::API::Config.mode       = "sandbox"        
        
        def initialize
          @client = ::Dropbox::API::Client.new(:token => ENV['DROPBOX_TOKEN'],
                                               :secret => ENV['DROPBOX_SECRET'])
          @dirs = []
        end

        def list_directories
          recursive_list_directories
          @dirs.sort!
        end

        private

        def recursive_list_directories(path = '')
          @client.ls(path).each do |entry|
            if entry.is_dir
              @dirs << entry.path
              recursive_list_directories(entry.path)
            end
          end
        end
        
      end
    end
  end
end
