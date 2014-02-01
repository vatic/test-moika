class ClientBanner < Banner
  belongs_to :car_wash, :class_name=>'CarWash', :foreign_key=>'car_wash_id'
end
