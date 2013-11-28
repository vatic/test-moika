require 'spec_helper'

describe "static_pages/index" do
  before(:each) do
    assign(:static_pages, [
      stub_model(StaticPage,
        :title => "Title",
        :header => "MyText",
        :content => "MyText",
        :permalink => "Permalink"
      ),
      stub_model(StaticPage,
        :title => "Title",
        :header => "MyText",
        :content => "MyText",
        :permalink => "Permalink"
      )
    ])
  end

  it "renders a list of static_pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Permalink".to_s, :count => 2
  end
end
