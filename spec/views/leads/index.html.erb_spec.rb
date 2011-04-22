require 'spec_helper'

describe "leads/index.html.erb" do
  before(:each) do
    @contact = stub_model(Contact,
        :id => 12,
        :first_name => 'Mary',
        :last_name => 'Jones'
      )
    @agent = stub_model(User,
        :id => 11,
        :first_name => 'Pat',
        :last_name => 'Smith'
    )
    assign(:leads, [
      stub_model(Lead,
        :agent => @agent,
        :contact => @contact,
        :note => "MyText",
        :active => true
      ),
      stub_model(Lead,
        :agent => @agent,
        :contact => @contact,
        :note => "MyText",
        :active => true
      )
    ])
  end

  it "renders a list of leads" do
    render
    assert_select "tr>td", :text => "Mary Jones".to_s, :count => 2
    assert_select "tr>td", :text => "Pat Smith".to_s, :count => 2
    assert_select "tr>td", :text => "true".to_s, :count => 2
  end
end
