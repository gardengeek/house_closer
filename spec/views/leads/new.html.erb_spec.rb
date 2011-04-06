require 'spec_helper'

describe "leads/new.html.erb" do
  before(:each) do
    assign(:lead, stub_model(Lead,
      :agent_id => 1,
      :contact_id => 1,
      :note => "MyText"
    ).as_new_record)
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
