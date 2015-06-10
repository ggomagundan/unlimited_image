json.status  @json_result.status
json.msg @json_result.msg
json.code @json_result.code

if @json_result.object.present?

  @images = @json_result.object
  json.images @images.each do |image|

    if image.cc_code == 1
      #cc_url = asset_path("ccby.png")
      cc_name= "CC-BY"
    elsif image.cc_code == 2 
      #cc_url = asset_path("ccbynd.png")
      cc_name = "CC-BY-ND"
    elsif image.cc_code == 3
      #cc_url = asset_path("ccbysa.png")
      cc_name= "CC-BY-SA"
    else
      cc_url = nil
      cc_name = nil
    end
    cc_url = nil
 
    json.image_url image.image_url
    json.cc_code image.cc_code
    json.cc_code_image_url cc_url
    json.cc_author image.owner_name
    json.cc_author_link image.owner_link
    json.cc_author_text  "Entitled #{image.owner_name}, #{image.owner_link}"
    json.cc_ment "These Photo Licensed CC-BY, CC-BY-ND, CC-BY-SA by Creative Commons under a Creative Commons Attribution 3.0 Unported License"
    json.cc_url "http://creativecommons.org/" 
    json.cc_license_url "http://creativecommons.org/licenses/by/3.0/"


  end
end

