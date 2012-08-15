class Article < ActiveRecord::Base
  attr_accessible :text, :title
  validates :title, :presence=>true,:uniqueness=>true
  validates :text, :presence=>true
end
