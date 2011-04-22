require 'spec_helper'

describe Lead do
  describe "#assign_agent" do
    before(:each) do
      @user =  Factory.create(:user, :first_name => 'Mary')
      @agent = Factory.create(:agent_user, :first_name => 'Pat')
      @agent2 = Factory.create(:agent_user, :first_name => 'John')
    end

    describe 'Lead with agent' do
      before(:each) do
        @lead = Factory.build(:lead, :agent => @user)
      end

      it 'does not assign a new agent' do
        agent = @lead.agent
        @lead.save

        @lead.agent_id.should == agent.id
      end
    end

    describe 'lead without agent' do
      describe 'when there are agents with no active leads' do
        describe 'when agent has no leads' do
          before(:each) do
            Factory.create(:lead, :agent => @agent)
            @lead = Factory.build(:lead, :agent => nil)
          end

          it 'assigns agent with no active leads' do
            @lead.save
            @lead.agent_id.should == @agent2.id
          end
        end
        describe 'when agent has only inactive leads' do
          before(:each) do
            Factory.create(:lead, :agent => @agent, :active => false)
            @lead = Factory.build(:lead, :agent => nil)
          end

          it 'assigns agent with no active leads' do
            @lead.save
            @lead.agent_id.should == @agent.id
          end
        end
      end

      describe 'when all agents have active leads' do
        before(:each) do
          @lead = Factory.build(:lead, :agent => nil)
          @lead2 = Factory.build(:lead, :agent => nil)
          @lead3 = Factory.build(:lead, :agent => nil)
        end

        describe 'when agent2 needs the next lead' do
          before(:each) do
            Factory.create(:lead, :agent => @agent, :created_at => Date.today - 3.days)
            Factory.create(:lead, :agent => @agent2, :created_at => Date.today - 2.day)
            Factory.create(:lead, :agent => @agent, :created_at => Date.today - 1.day)
          end

          it 'assigns agent with oldest newest active lead' do
            @lead.save
            @lead.agent_id.should == @agent2.id
            @lead2.save
            @lead2.agent_id.should == @agent.id
            @lead3.save
            @lead3.agent_id.should == @agent2.id
          end
        end

        describe 'when agent1 needs the next lead' do
          before(:each) do
            Factory.create(:lead, :agent => @agent2, :created_at => Date.today - 3.days)
            Factory.create(:lead, :agent => @agent, :created_at => Date.today - 2.day)
            Factory.create(:lead, :agent => @agent2, :created_at => Date.today - 1.day)
          end

          it 'assigns agent with oldest newest active lead' do
            @lead.save
            @lead.agent_id.should == @agent.id
            @lead2.save
            @lead2.agent_id.should == @agent2.id
            @lead3.save
            @lead3.agent_id.should == @agent.id
          end
        end
      end
    end
  end
end
