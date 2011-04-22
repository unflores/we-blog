module ApplicationHelper
  def linkify(text)
    return text if anchor_exists text
    text.gsub(/(http:\/\/[^\s]*)/,'<a href="\1" target="_blank">\1</a>')
  end

  def linkify_tweet text
    text = linkify text
    text.gsub(/@([a-zA-Z\_]+)/, '<a href="http://twitter.com/#!/\1">@\1</a>')
  end

  def anchor_exists text
    not text[/<a[^>]*>/].nil?
  end

end
