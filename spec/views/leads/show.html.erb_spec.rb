require 'spec_helper'

describe "leads/show.html.erb" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
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
    ))
    @lead = assign(:lead, stub_model(Lead,
      :agent_id => 1,
      :contact_id => @contact,
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
