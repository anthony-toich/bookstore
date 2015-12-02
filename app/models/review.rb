class Review < ActiveRecord::Base
  belongs_to :book
  has_many :reviews
end
