class Message < ActiveRecord::Base
  belongs_to :sender, :class_name=>'User', :foreign_key=>'sender_id'
  belongs_to :receiver, :class_name=>'User', :foreign_key=>'receiver_id'
  belongs_to :car_wash, :class_name=>'CarWash', :foreign_key=>'car_wash_id'
  scope :read, -> {where(read: true)}
  scope :unread, -> {where(read: false)}
end
