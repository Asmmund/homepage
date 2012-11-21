class News < ActiveRecord::Base
  attr_accessible :text, :title,:updated_at
  validates :text, :title, presence: true
end
