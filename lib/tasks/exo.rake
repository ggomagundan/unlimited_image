 # -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../../config/environment.rb'


namespace :exo_image do

  desc "Parsing exo google"
  task :google_parse => :environment do
      ExoImageCrawled.new.exo_crwaled()
  end

end

