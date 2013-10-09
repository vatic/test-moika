class ActionType < ActiveRecord::Base
  has_many :actions
  scope :main, ->{ where(text: 'main') }

  def main?
    self.text == 'main'
  end
end
