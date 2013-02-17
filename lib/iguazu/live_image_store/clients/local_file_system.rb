module Iguazu
  module LiveImageStore
    module Clients
      class LocalFileSystem

        def initialize
          @path = ENV['LOCAL_FILE_SYSTEM']
        end

        def update_directories(new_dir_structure)
	  new_dir_structure = make_directories_absolute(new_dir_structure)

          make_new_folders(new_dir_structure)	  

          remove_old_folders(new_dir_structure)
        end
	
	private
	
	# Taken from https://github.com/avh4/ruby-sync/blob/master/lib/ruby-sync/sources/local.rb with slight modification
	def current_directory_structure
	  in_dirs = [@path]
	  out_dirs = []
	  until in_dirs.empty? do
	    dir = in_dirs.pop
	    new_dirs = Dir.entries(dir).select { |f| f != '.' && f != '..' }.map{ |f| dir=='.' ? f : "#{dir}/#{f}" }.select { |f| File.directory?(f) }
	    out_dirs += new_dirs
	    in_dirs += new_dirs
	  end
	  out_dirs	  
	end	

	def make_directories_absolute(new_dir_structure)
	  absolute_directories = []
          new_dir_structure.each do |dir|
	    absolute_directories  << File.join(@path,dir)
	  end
	  absolute_directories
	end
	
	def make_new_folders(new_dir_structure)
	  new_dir_structure.each do |dir|
            FileUtils.mkdir_p dir
          end
	end
	
	def remove_old_folders(new_dir_structure)
	  current_directory_structure.each do |current_directory|
	    FileUtils.rm_rf(current_directory) unless new_dir_structure.include?(current_directory)
	  end
	end
	
      end
    end
  end
end
