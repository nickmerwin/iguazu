require 'spec_helper'
require 'tmpdir'

ENV['LOCAL_FILE_SYSTEM'] = File.join(Dir.tmpdir,"iguazu")

require 'iguazu/live_image_store/clients/local_file_system'

describe Iguazu::LiveImageStore::Clients::LocalFileSystem do

  before(:all) do
    @file_root = ENV['LOCAL_FILE_SYSTEM']
    FileUtils.mkdir_p @file_root
  end

  before(:each) do
    clean_file_system
    FileUtils.mkdir_p File.join(@file_root,'folder 1')
  end

  after(:all) do
    clean_file_system
  end

  subject { described_class.new }

  it "Should create new directories" do
    directories = ['folder 1', 'folder 1/folder 2' ]
    subject.update_directories directories
    Dir.glob(File.join(@file_root,'folder 1','*')).sort.should ==
	[File.join(@file_root,'folder 1','folder 2')]
  end

  it "Should remove deleted directories" do 
    directories = ['folder 2']
    subject.update_directories directories
    Dir.glob(File.join(@file_root,'*')).sort.should ==
	[File.join(@file_root, 'folder 2')]
  end

  def clean_file_system
    FileUtils.rm_r Dir.glob(File.join(@file_root,'*'))
  end

end