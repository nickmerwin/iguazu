require 'spec_helper'
require 'iguazu/data_migrator'
require 'iguazu/master_image_store/clients/dummy'
require 'iguazu/live_image_store/clients/dummy'

describe Iguazu::DataMigrator do

  describe ".initialize" do
    it { expect { described_class.new }.to raise_error(ArgumentError,
                                                       /0 for 2/) }    
  end

  describe "#update_directories" do

    let(:scanner) do
      mocked_scanner = double("scanner")
      Iguazu::MasterImageStore::Scanner.stub(:new) {mocked_scanner}
      mocked_scanner
    end

    let(:directory_structure_updater) do
      mocked_directory_structure_updater = double("directory_structure_updater")
      Iguazu::LiveImageStore::DirectoryStructureUpdater.stub(:new) {mocked_directory_structure_updater}
      mocked_directory_structure_updater
    end

    subject { described_class.new(Iguazu::MasterImageStore::Clients::Dummy.new,
                                  Iguazu::LiveImageStore::Clients::Dummy.new)}

    its(:update_directories) {should be_true}

    it "should list_directories using the scanner" do
      scanner.should_receive(:list_directories)
      subject.update_directories      
    end

    it "should create directories using the directory_structure_updater" do
      scanner.should_receive(:list_directories) {['/tmp']}
      directory_structure_updater.should_receive(:update_directories).with(['/tmp'])
      subject.update_directories            
    end
  end
  
end