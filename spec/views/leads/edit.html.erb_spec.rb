require 'spec_helper'

describe "leads/edit.html.erb" do
  before(:each) do
    @lead = assign(:lead, stub_model(Lead,
      :agent_id => 1,
      :contact_id => 1,
      :note => "MyText"
    ))
    view.stub(:current_user).and_return(nil)
  end

  it "renders the edit lead form" do
    render

    assert_select "form", :action => leads_path(@lead), :method => "post" do
      assert_select "input#lead_agent_id", :name => "lead[agent_id]"
      assert_select "textarea#lead_note", :name => "lead[note]"
    end
  end
end
