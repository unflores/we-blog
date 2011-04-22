module ApplicationHelper
  def linkify(text)
    text.gsub(/(http:\/\/[^\s]*)/,'<a href="\1" target="_blank">\1</a>') unless anchor_exists text
  end

  def linkify_tweet text
    text.gsub(/@([a-zA-Z\_]+)/, '<a href="http://twitter.com/#!/\1">@\1</a>') unless anchor_exists text
  end

  def anchor_exists text
    not text[/<a[^>]*>/].nil?
  end

end
