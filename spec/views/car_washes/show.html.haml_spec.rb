require 'spec_helper'

describe "car_washes/show" do
  before(:each) do
    @car_wash = assign(:car_wash, stub_model(CarWash,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Address/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/Contacts/)
    rendered.should match(/Services/)
    rendered.should match(/Price/)
    rendered.should match(/1/)
    rendered.should match(/Actions/)
    rendered.should match(/Video Url1/)
    rendered.should match(/Video Url2/)
    rendered.should match(/false/)
  end
end
