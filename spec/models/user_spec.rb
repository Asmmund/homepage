require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'user'
describe User do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

end