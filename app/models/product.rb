class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :title, :description, :price
  validates_numericality_of :price
  validate :price_decimal_places_limit

  def average_rating
    @average_rating ||= reviews.average(:rating)
  end


  private
    def price_decimal_places_limit
      parts = price.to_s.split('.')
      if parts.last and parts.last.size > 2
        errors.add(:price, 'Price should have no more than 2 decimal places.')
      end
    end

end
