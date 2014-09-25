 # -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../../config/environment.rb'


namespace :five00 do

  desc "Parsing 500px"
  task :parse => :environment do

    (1..3).each do |i|
      Five00px.new.five_px(i)
    end

  end

end

