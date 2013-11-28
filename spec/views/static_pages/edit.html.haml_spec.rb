require 'spec_helper'

describe "static_pages/edit" do
  before(:each) do
    @static_page = assign(:static_page, stub_model(StaticPage,
      :title => "MyString",
      :header => "MyText",
      :content => "MyText",
      :permalink => "MyString"
    ))
  end

  it "renders the edit static_page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", static_page_path(@static_page), "post" do
      assert_select "input#static_page_title[name=?]", "static_page[title]"
      assert_select "textarea#static_page_header[name=?]", "static_page[header]"
      assert_select "textarea#static_page_content[name=?]", "static_page[content]"
      assert_select "input#static_page_permalink[name=?]", "static_page[permalink]"
    end
  end
end
