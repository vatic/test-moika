require 'spec_helper'

describe "requests/edit" do
  before(:each) do
    @request = assign(:request, stub_model(Request,
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :text => "MyString",
      :references => ""
    ))
  end

  it "renders the edit request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", request_path(@request), "post" do
      assert_select "input#request_name[name=?]", "request[name]"
      assert_select "input#request_phone[name=?]", "request[phone]"
      assert_select "input#request_email[name=?]", "request[email]"
      assert_select "input#request_text[name=?]", "request[text]"
      assert_select "input#request_references[name=?]", "request[references]"
    end
  end
end
