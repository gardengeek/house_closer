require 'spec_helper'

describe "Leads" do
  before(:each) do
    @user = Factory(:admin_user)
    post "/session", :session => { :email => @user.email, :password => @user.password }
  end

  describe "GET /leads" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get leads_path
      response.status.should be(200)
    end
  end
end
