xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title site.title
    xml.description site.meta_description.to_s
    xml.link root_url
    xml.tag! "atom:link", href: feed_url(format: :rss), rel: "self", type: "application/rss+xml"

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description simple_format(post.body)
        xml.pubDate post.published_at.to_fs(:rfc822)
        xml.link post_url(slug: post.slug)
        xml.guid post_url(slug: post.slug)
      end
    end
  end
end
