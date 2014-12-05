class ReviewDecorator < Draper::Decorator
  delegate_all

  def author
    "#{object.user.firstname} #{object.user.lastname}"
  end

  def stars
    list = object.rating.times.collect { '<span class="glyphicon glyphicon-star golden"></span>' }
    list += (5-object.rating).times.collect { '<span class="glyphicon glyphicon-star-empty gray"></span>' }
    list.join('').html_safe
  end

  def publication_time
    created_at.strftime("%-d %b %Y, %H:%M")
  end

end
