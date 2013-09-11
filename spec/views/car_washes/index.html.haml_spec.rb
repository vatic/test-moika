require 'spec_helper'

describe "car_washes/index" do
  before(:each) do
    assign(:car_washes, [
      stub_model(CarWash,
        :title => "Title",
        :address => "Address",
        :lat => 1.5,
        :lon => 1.5,
        :contacts => "Contacts",
        :services => "Services",
        :price => "Price",
        :zones_count => 1,
        :actions => "Actions",
        :video_url1 => "Video Url1",
        :video_url2 => "Video Url2",
        :signal => false
      ),
      stub_model(CarWash,
        :title => "Title",
        :address => "Address",
        :lat => 1.5,
        :lon => 1.5,
        :contacts => "Contacts",
        :services => "Services",
        :price => "Price",
        :zones_count => 1,
        :actions => "Actions",
        :video_url1 => "Video Url1",
        :video_url2 => "Video Url2",
        :signal => false
      )
    ])
  end

  it "renders a list of car_washes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Contacts".to_s, :count => 2
    assert_select "tr>td", :text => "Services".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Actions".to_s, :count => 2
    assert_select "tr>td", :text => "Video Url1".to_s, :count => 2
    assert_select "tr>td", :text => "Video Url2".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
