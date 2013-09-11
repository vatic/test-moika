require 'spec_helper'

describe "car_washes/edit" do
  before(:each) do
    @car_wash = assign(:car_wash, stub_model(CarWash,
      :title => "MyString",
      :address => "MyString",
      :lat => 1.5,
      :lon => 1.5,
      :contacts => "MyString",
      :services => "MyString",
      :price => "MyString",
      :zones_count => 1,
      :actions => "MyString",
      :video_url1 => "MyString",
      :video_url2 => "MyString",
      :signal => false
    ))
  end

  it "renders the edit car_wash form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", car_wash_path(@car_wash), "post" do
      assert_select "input#car_wash_title[name=?]", "car_wash[title]"
      assert_select "input#car_wash_address[name=?]", "car_wash[address]"
      assert_select "input#car_wash_lat[name=?]", "car_wash[lat]"
      assert_select "input#car_wash_lon[name=?]", "car_wash[lon]"
      assert_select "input#car_wash_contacts[name=?]", "car_wash[contacts]"
      assert_select "input#car_wash_services[name=?]", "car_wash[services]"
      assert_select "input#car_wash_price[name=?]", "car_wash[price]"
      assert_select "input#car_wash_zones_count[name=?]", "car_wash[zones_count]"
      assert_select "input#car_wash_actions[name=?]", "car_wash[actions]"
      assert_select "input#car_wash_video_url1[name=?]", "car_wash[video_url1]"
      assert_select "input#car_wash_video_url2[name=?]", "car_wash[video_url2]"
      assert_select "input#car_wash_signal[name=?]", "car_wash[signal]"
    end
  end
end
