module ApplicationHelper

  def glyphicon id
    "<span class='glyphicon glyphicon-#{id.to_s}'></span>".html_safe
  end

end
