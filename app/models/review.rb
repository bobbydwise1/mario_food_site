class Product < ActiveRecord::Base
  validates :author, :presence => true
  validates :content_body, :presence => true
  validates :rating, :presence => true
end
