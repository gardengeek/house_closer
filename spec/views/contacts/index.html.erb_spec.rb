require 'spec_helper'

describe "contacts/index.html.erb" do
  before(:each) do
    assign(:contacts, [
      stub_model(Contact,
        :first_name => "First Name",
        :last_name => "Last Name",
        :home_phone => "Home Phone",
        :cell_phone => "Cell Phone",
        :work_phone => "Work Phone",
        :email => "Email",
        :address_line_1 => "Address Line 1",
        :address_line_2 => "Address Line 2",
        :city => "City",
        :postal_code => "Postal Code",
        :state_id => 1
      ),
      stub_model(Contact,
        :first_name => "First Name",
        :last_name => "Last Name",
        :home_phone => "Home Phone",
        :cell_phone => "Cell Phone",
        :work_phone => "Work Phone",
        :email => "Email",
        :address_line_1 => "Address Line 1",
        :address_line_2 => "Address Line 2",
        :city => "City",
        :postal_code => "Postal Code",
        :state_id => 1
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => "First Name Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Home Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Cell Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Work Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
