class ActionType < ActiveRecord::Base
  has_many :actions
  scope :main, ->{ where(text: 'main') }
  scope :left, ->{ where(text: 'left') }
  scope :bottom1, ->{ where(text: 'bottom1') }
  scope :bottom2, ->{ where(text: 'bottom2') }

  def main?
    self.text == 'main'
  end

end
