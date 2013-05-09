module ApplicationHelper
  def markdown(text)
    Kramdown::Document.new(text).to_html.html_safe
  end

  def title(str)
    content_for(:title, str)
  end
end
