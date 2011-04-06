require 'spec_helper'

describe "leads/show.html.erb" do
  before(:each) do
    @lead = assign(:lead, stub_model(Lead,
      :agent_id => 1,
      :contact_id => 1,
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
