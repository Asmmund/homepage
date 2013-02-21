require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'news'

describe News do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:text) }

end