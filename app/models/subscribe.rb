class Subscribe < ActiveRecord::Base
  belongs_to :normal_user
  belongs_to :car_wash
end
