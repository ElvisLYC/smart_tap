namespace :schedule do
  desc "Turn on light"
  task turn_on: :environment do
  	puts "turning on light"
  end

end

  task turn_off: :environment do
  	puts "turning off light"
  end