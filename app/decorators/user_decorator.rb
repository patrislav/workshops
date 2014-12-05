class UserDecorator < Draper::Decorator
  delegate_all

  def name
    "#{object.firstname} #{object.lastname}"
  end

  def last_reviews
    object.reviews.order(id: :desc).limit(5)
  end

end

