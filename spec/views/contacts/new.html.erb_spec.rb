require 'spec_helper'

describe "contacts/new.html.erb" do
  before(:each) do
    assign(:contact, stub_model(Contact,
      :first_name => "MyString",
      :last_name => "MyString",
      :home_phone => "MyString",
      :cell_phone => "MyString",
      :work_phone => "MyString",
      :email => "MyString",
      :address_line_1 => "MyString",
      :address_line_2 => "MyString",
      :city => "MyString",
      :postal_code => "MyString",
      :state_id => 1
    ).as_new_record)
  end

  it "renders new contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contacts_path, :method => "post" do
      assert_select "input#contact_first_name", :name => "contact[first_name]"
      assert_select "input#contact_last_name", :name => "contact[last_name]"
      assert_select "input#contact_home_phone", :name => "contact[home_phone]"
      assert_select "input#contact_cell_phone", :name => "contact[cell_phone]"
      assert_select "input#contact_work_phone", :name => "contact[work_phone]"
      assert_select "input#contact_email", :name => "contact[email]"
      assert_select "input#contact_address_line_1", :name => "contact[address_line_1]"
      assert_select "input#contact_address_line_2", :name => "contact[address_line_2]"
      assert_select "input#contact_city", :name => "contact[city]"
      assert_select "input#contact_postal_code", :name => "contact[postal_code]"
      assert_select "select#contact_state_id", :name => "contact[state_id]"
    end
  end
end
