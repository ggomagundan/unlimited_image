# -*- encoding : utf-8 -*-
class Five00px

  def five_px(page)

    require 'open-uri'
    require 'nokogiri'
    url = "http://500px.com/search?utf8=%E2%9C%93&q=&type=photos&order=votes&license_type=4&page=#{page}"
    page = Nokogiri::HTML(open(url))
    page.css("div.container div.col.d4")
    @link_arr= []
    page.css("div.container div.col.d4").each do |link|
      original_url = link.css("a")[0]["href"].to_s
      if Unlimited.where(original_url: original_url).blank?
        img_url = real_500px_image(link.css("a")[0]["href"])
        if img_url != "none"
          Unlimited.create(original_url: original_url, image_url: img_url)
        end
      end
    end

  end

  def real_500px_image(append_url)

   
    begin
    puts "http://500px.com#{append_url}"
    url = "http://500px.com#{append_url}"
    page = Nokogiri::HTML(open(url))
    img_url = page.css("div.photo_wrap img")[0]["src"]
    img_url
    rescue => e
      puts e
      return "none"
    end
  end
 
end
