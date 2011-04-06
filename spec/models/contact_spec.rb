require 'spec_helper'

describe Contact do

  describe '.no_lead' do
    before(:each) do
      Factory.create(:contact, :first_name => 'Alice')
      Factory.create(:contact, :first_name => 'Bob')
      Factory.create(:contact, :first_name => 'John')
      Factory.create(:contact, :first_name => 'Mark')
      Factory.create(:lead_contact, :first_name => 'David')
      Factory.create(:lead_contact, :first_name => 'Janet')
    end
  
    it 'finds the contacts without leads' do
      Contact.all.size.should == 6
      result = Contact.no_lead
      result.size.should == 4
    end

  end
end
