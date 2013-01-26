require 'spec_helper'
require 'iguazu/live_image_store/directory_creator'
require 'iguazu/live_image_store/clients/dummy'

describe Iguazu::LiveImageStore::DirectoryCreator do

  let(:dummy_client) {Iguazu::LiveImageStore::Clients::Dummy.new }

  describe ".initialize" do

    it { expect { described_class.new }.to raise_error(ArgumentError,
                                                       /0 for 1/) }

    it { expect { described_class.new(dummy_client) }.to_not raise_error }

    it { described_class.new(dummy_client).should
         be_an_instance_of(described_class) }

  end

end