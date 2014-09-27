json.status @json_result.status
json.msg @json_result.msg
json.code @json_result.code

if @json_result.object.present?

  @images = @json_result.object
  json.images @images.each do |image|

    json.image_url image.image_url
    json.original_url image.original_url

  end
end

