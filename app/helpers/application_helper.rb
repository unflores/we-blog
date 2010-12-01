module ApplicationHelper
  def linkify(text)
    text.gsub(/(http:\/\/[^\s]*)/,'<a href="\1" target="_blank">\1</a>') unless text[/<a[^>]*>/]
  end
end
