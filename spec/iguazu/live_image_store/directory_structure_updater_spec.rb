require 'spec_helper'
require 'iguazu/live_image_store/directory_structure_updater'
require 'iguazu/live_image_store/clients/dummy'

describe Iguazu::LiveImageStore::DirectoryStructureUpdater do

  let(:dummy_client) {Iguazu::LiveImageStore::Clients::Dummy.new }

  describe ".initialize" do

    it { expect { described_class.new }.to raise_error(ArgumentError,
                                                       /0 for 1/) }

    it { expect { described_class.new(dummy_client) }.to_not raise_error }

    it { described_class.new(dummy_client).should
         be_an_instance_of(described_class) }

  end
  
  describe "#update_directories" do
    
    let(:dummy_client) do
      mocked_dummy_client = double("dummy_client")
      Iguazu::LiveImageStore::Clients::Dummy.stub(:new) {mocked_dummy_client}
      mocked_dummy_client
    end
    
    subject { described_class.new(dummy_client) }
    
    it "should pass update the directory structure using the client" do
      dummy_client.should_receive(:update_directories).with(['/tmp'])
      subject.update_directories(['/tmp'])   
    end           
    
  end

end