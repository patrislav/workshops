class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates_presence_of :content, :rating, :user_id
end
