require 'spec_helper'

describe "leads/new.html.erb" do
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
    assign(:lead, stub_model(Lead,
      :agent_id => 1,
      :contact_id => @contact,
      :note => "MyText"
    ).as_new_record)
    view.stub(:current_user).and_return(stub_model(User))
  end

  it "renders new lead form" do
    render

    assert_select "form", :action => leads_path, :method => "post" do
      assert_select "input#lead_agent_id", :name => "lead[agent_id]"
      assert_select "select#lead_contact_id", :name => "lead[contact_id]"
      assert_select "textarea#lead_note", :name => "lead[note]"
    end
  end
end
