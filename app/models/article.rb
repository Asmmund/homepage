class Article < ActiveRecord::Base
  attr_accessible :text, :title
  validates :title,:text, presence: true
  validates :title,uniqueness: true

end
