# -*- encoding : utf-8 -*-
class JsonResult
  attr_accessor :status, :msg, :code, :object

  def internal_error
    self.status = false
    self.msg = "Internal Server Error"
    self.code = "0901"
  end

  def invalid_token

    self.status = false
    self.msg = "Invalid Token Error"
    self.code = "0902"

  end

  def none_data

    self.status = false
    self.msg = "None Result Data"
    self.code = "0903"

  end

  def miss_params(param)

    self.status = false
    self.msg = "Miss Params :  #{param}"
    self.code = "0904"

  end

end
