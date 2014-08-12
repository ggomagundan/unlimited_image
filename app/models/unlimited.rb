class Unlimited

  include Mongoid::Document
  include Mongoid::Timestamps

  field :is_visible, type: Integer, default: 1
  field :original_url, type: String
  field :image_url, type: String

end
