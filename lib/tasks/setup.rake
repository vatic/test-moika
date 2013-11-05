namespace :setup do
  desc "Add 4 emty banners to each Car Wash"
  task add_empty_client_banners: :environment do
    puts "Add empty banners"
    banners_data = [
      {place: "client_fat_top", text: "Широкий баннер под камерами"},
      {place: "client_thin_bottom", text: "Баннер слева от акций"},
      {place: "client_thin_top_1", text: "Первый из двух баннеров под широким"},
      {place: "client_thin_top_2", text: "Второй из двух баннеров под широким"}
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
