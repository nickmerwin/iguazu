module Iguazu
  module MasterImageStore
    module Clients
      class Dummy

        def initialize
        end

        def list_directories
          ['Folder 1',
           'Folder 1/Folder A',
           'Folder 1/Folder B',
           'Folder 1/Folder B/Folder C',
           'Folder 2',
           'Folder 2/Folder D',
           'Folder 2/Folder D/Folder E',
           'Folder 2/Folder F',
           'Folder 3']
        end

      end
    end
  end
end
