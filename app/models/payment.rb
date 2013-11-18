class Payment < ActiveRecord::Base
  belongs_to :car_wash

  def confirm!
    self.update(confirmed: true)
  end

  def mark_failed!
    self.update(failed: true)
  end

  def verifity!
    self.update(verified: true)
  end

end
