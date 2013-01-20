require 'spec_helper'
require 'fake_dropbox'
require 'iguazu/master_image_store/clients/dropbox'

fake_dropbox = FakeDropbox::Glue.new('spec/fixtures')

describe Iguazu::MasterImageStore::Clients::Dropbox do
  
  subject { described_class.new }
  
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