json.set! :updated_at, @updated_at
json.car_washes(@car_washes) do |json, car_wash|
  json.extract! car_wash, 
  :id, :title, :address, :lat, :lon, 
  :contacts, :services, :price, 
  :zones_count, :actions,
  :video_url1, :video_url2, 
  :signal, :blink, :action_on_map, :videoned
  :updated_at
  json.url car_wash_url(car_wash, format: :json)
  json.main_action car_wash.main_action.try(:text)
end
