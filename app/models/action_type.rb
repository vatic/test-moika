class ActionType < ActiveRecord::Base
  has_many :actions
  scope :main, ->{ where(text: 'main') }
  scope :left, ->{ where(text: 'left') }

  def main?
    self.text == 'main'
  end

end
