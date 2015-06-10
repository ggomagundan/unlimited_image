class ExoImage

  include Mongoid::Document
  include Mongoid::Timestamps

  field :is_visible, type: Integer, default: 1
  field :original_url, type: String
  field :image_url, type: String
  field :image_thumnail_url, type: String
  field :owner_name, type: String
  field :owner_link, type: String
  field :image_source, type: String
  field :cc_code, type: Integer, default: 0


  # http://creativecommons.org/licenses/
  CC_NAME =[
     "None",
     "CC BY",
     "CC BY-ND",
     "CC BY-SA"
  ]

  def self.searchable
    ExoImage.where(is_visible: 1)
  end

  def cc_str
    Unlimited::CC_NAME[self.cc_code]
  end


end
