require 'spec_helper'
require 'iguazu/master_image_store/scanner'
require 'iguazu/master_image_store/clients/dummy'

describe Iguazu::MasterImageStore::Scanner do

  let(:dummy_client) {Iguazu::MasterImageStore::Clients::Dummy.new }

  describe ".initialize" do

    it { expect { described_class.new }.to raise_error(ArgumentError,
                                                       /0 for 1/) }

    it { expect { described_class.new(dummy_client) }.to_not raise_error }

    it { described_class.new(dummy_client).should
         be_an_instance_of(described_class) }

  end

  subject(:scanner) { described_class.new(dummy_client) }  
   
  its(:list_directories) {should == ['Folder 1',
                                      'Folder 1/Folder A',
                                      'Folder 1/Folder B',
                                      'Folder 1/Folder B/Folder C',
                                      'Folder 2',
                                      'Folder 2/Folder D',
                                      'Folder 2/Folder D/Folder E',
                                      'Folder 2/Folder F',
                                      'Folder 3']}
end