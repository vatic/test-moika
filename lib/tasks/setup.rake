namespace :setup do
  desc "Add 4 emty banners to each Car Wash"
  task add_empty_client_banners: :environment do
    puts "Add empty banners"
    banners_data = [
      {place: "client_fat_top"},
      {place: "client_thin_bottom"},
      {place: "client_thin_top_1"},
      {place: "client_thin_top_2"}
    ]

    CarWash.find_each do |cw|
      cw.banners.destroy_all
      banners_data.each do |data| 
        puts "Add #{data[:place]} banner to #{cw.title}"
        cw.banners << ClientBanner.new(data)
      end
      puts
    end
  end

  task add_empty_left_bottom_client_banners: :environment do
    puts "Add empty banners"
    banners_data = [
      {place: "client_thin_top_3"},
      {place: "client_thin_top_4"}
    ]

    CarWash.find_each do |cw|
      banners_data.each do |data| 
        puts "Add #{data[:place]} banner to #{cw.title}"
        cw.banners << ClientBanner.new(data)
      end
      puts
    end
  end

  task add_empty_client_video_banners: :environment do
    puts "Add empty video banners"

    CarWash.find_each do |cw|
      cw.banners.where(type: 'ClientVideoBanner').destroy_all
      cw.banners << ClientVideoBanner.new
    end
  end

  task add_first_payment: :environment do
    puts "Add first payment to all car_washes"
    CarWash.find_each do |cw|
      cw.payments << Payment.new(amount: 6000.00)
    end
  end

  task add_signal_type: :environment do
    puts "add signal_type"
    CarWash.find_each do |cw|
      if cw.blink
        cw.signal_type = 'blink'
      elsif cw.videoned
        cw.signal_type = 'videoned'
      elsif cw.action_on_map
        cw.signal_type = 'action_on_map'
      else
        cw.signal_type = 'normal'
      end
      cw.save
    end
  end

end
