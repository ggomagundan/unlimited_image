# -*- encoding : utf-8 -*-
class Api::ApplicationController < ActionController::Base

  before_filter :create_json_object


  def create_json_object
     @json_result = JsonResult.new
     @json_result.status = true
     @json_result.msg = ""
     @json_result.code = "0000"
     @json_result.object = nil
  end


end
