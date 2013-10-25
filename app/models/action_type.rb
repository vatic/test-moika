class ActionType < ActiveRecord::Base
  has_many :actions
  scope :main, ->{ where(text: 'main').first }
  scope :left, ->{ where(text: 'left').first }
  scope :bottom1, ->{ where(text: 'bottom1') }
  scope :bottom2, ->{ where(text: 'bottom2') }
  scope :vacancy, ->{ where(text: 'vacancy') }

  def main?
    self.text == 'main'
  end

end
