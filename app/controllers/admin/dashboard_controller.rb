class Admin::DashboardController < AdminController

  def main
  end

  def load_data_from_ya
    @car_washes = ParseData.save_to_db(ParseData.get_json)
  end
end
