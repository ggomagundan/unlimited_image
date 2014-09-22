# -*- encoding : utf-8 -*-
class Five00px

  def five_px(pages)

    require 'open-uri'
    require 'nokogiri'
    url = "http://500px.com/search?utf8=%E2%9C%93&q=&type=photos&order=votes&license_type=4&page=#{pages}" # CC BY
    page = Nokogiri::HTML(open(url))
    page.css("div.container div.col.d4")
    @link_arr= []
    page.css("div.container div.col.d4").each do |link|
      original_url = link.css("a")[0]["href"].to_s
      if Unlimited.where(original_url: original_url).blank?
        img_url = real_500px_image(link.css("a")[0]["href"])
        owner_name, owner_link = get_owner_name(link.css("a")[0]["href"])
        if img_url != "none" && Unlimited.where(image_url: img_url).blank?
          Unlimited.create(original_url: original_url, image_url: img_url, owner_name: owner_name, owner_link: owner_link, image_source: "500px", cc_code: 1)
        end
      end
    end


    url = "http://500px.com/search?utf8=%E2%9C%93&q=&type=photos&order=votes&license_type=5&page=#{pages}" # CC BY ND
    page = Nokogiri::HTML(open(url))
    page.css("div.container div.col.d4")
    @link_arr= []
    page.css("div.container div.col.d4").each do |link|
      original_url = link.css("a")[0]["href"].to_s
      if Unlimited.where(original_url: original_url).blank?
        img_url = real_500px_image(link.css("a")[0]["href"])
        owner_name, owner_link = get_owner_name(link.css("a")[0]["href"])
        if img_url != "none" && Unlimited.where(image_url: img_url).blank?
          Unlimited.create(original_url: original_url, image_url: img_url, owner_name: owner_name, owner_link: owner_link, image_source: "500px", cc_code: 2)
        end
      end
    end

    url = "http://500px.com/search?utf8=%E2%9C%93&q=&type=photos&order=votes&license_type=6&page=#{pages}" # CC BY SA
    page = Nokogiri::HTML(open(url))
    page.css("div.container div.col.d4")
    @link_arr= []
    page.css("div.container div.col.d4").each do |link|
      original_url = link.css("a")[0]["href"].to_s
      if Unlimited.where(original_url: original_url).blank?
        img_url = real_500px_image(link.css("a")[0]["href"])
        owner_name, owner_link = get_owner_name(link.css("a")[0]["href"])
        if img_url != "none" && Unlimited.where(image_url: img_url).blank?
          Unlimited.create(original_url: original_url, image_url: img_url, owner_name: owner_name, owner_link: owner_link, image_source: "500px", cc_code: 3)
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
 
  def get_owner_name(append_url)

   
    begin
      puts "http://500px.com#{append_url}"
      url = "http://500px.com#{append_url}"
      page = Nokogiri::HTML(open(url))
      owner_name = page.css(".author_wrap .author_name a")[0].text
      owner_link= page.css(".author_wrap .author_name a")[0]["href"]
      [owner_name, owner_link]
    rescue => e
      puts e
      return ["none", "none"]
    end
  end
 
end
