# -*- encoding : utf-8 -*-
class ExoImageCrawled

  def exo_crwaled

    require 'open-uri'
    require 'nokogiri'

    (0..99).each do |i|

      index = i * 10 + 1

      conn_url = "https://www.googleapis.com/customsearch/v1?q=%EC%97%91%EC%86%8C&start=1&cx=013349361031800895469%3Aagjlz2i9l6u&searchType=image&key=AIzaSyCpeapXtuhpgrszGry_GWJ2gLuRYAJWjvg"
      conn_url = "#{GOOGLE_SEARCH_URL}?q=엑소&start=#{index}&cx=#{GOOGLE_CX_KEY}&searchType=#{GOOGLE_IMAGE_SEARCH_TYPE}&key=#{GOOGLE_SEARCH_API_KEY}"


      conn_url = URI.encode(conn_url)
      puts conn_url
      puts "\n\n"

      data = URI.parse(conn_url).read
      response = JSON.parse(data)
      if response["error"].blank?
        items = response["items"]
        crawled_exo(items)
      else
      end
    end


    (0..99).each do |i|

      index = i * 10 + 1

      conn_url = "https://www.googleapis.com/customsearch/v1?q=%EC%97%91%EC%86%8C&start=1&cx=013349361031800895469%3Aagjlz2i9l6u&searchType=image&key=AIzaSyCpeapXtuhpgrszGry_GWJ2gLuRYAJWjvg"
      conn_url = "#{GOOGLE_SEARCH_URL}?q=exo&start=#{index}&cx=#{GOOGLE_CX_KEY}&searchType=#{GOOGLE_IMAGE_SEARCH_TYPE}&key=#{GOOGLE_SEARCH_API_KEY}"


      conn_url = URI.encode(conn_url)
      puts conn_url
      puts "\n\n"

      data = URI.parse(conn_url).read
      response = JSON.parse(data)
      if response["error"].blank?
        items = response["items"]
        crawled_exo(items)
      else
      end
    end
 
  end

  def crawled_exo(items)

    items.each do |item|

      original_url = item["image"]["contextLink"]
      image_url = item["link"]
      image_thumbnail_url = item["image"]["thumbnailLink"]

      if ExoImage.where(image_url: image_url).present?
        ExoImage.where(image_url: image_url).update_all(original_url: original_url, image_thumnail_url: image_thumbnail_url)
      else
        ExoImage.create(image_url: image_url, original_url: original_url, image_thumnail_url: image_thumbnail_url)
        puts image_url
      end

    end

  end
 
end
