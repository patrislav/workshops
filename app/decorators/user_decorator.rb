class UserDecorator < Draper::Decorator
  delegate_all

  def name
    "#{object.firstname} #{object.lastname}"
  end

  def last_reviews
    object.reviews.last(5).order(id: :desc)
  end

end

