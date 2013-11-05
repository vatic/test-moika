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

end
