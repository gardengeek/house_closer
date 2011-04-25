class Lead < ActiveRecord::Base
  belongs_to :contact
  belongs_to :agent, :class_name => 'User'

  validates_presence_of :contact_id,
    :agent_id

  attr_accessible :active,
    :contact_id,
    :note

  before_validation :assign_agent

  def assign_agent
    if !self.agent
      # Look for agents with no leads
      self.agent =  User.find(:first, :conditions => [ 'users.id = roles_users.user_id and roles_users.role_id = roles.id and roles.title = ? and users.id not IN (select distinct(agent_id) from leads)', 'agent'], :include => [:roles])

      if !self.agent 
        # Look for agents with only inactive leads 
        @lead = Lead.find(:first, :conditions => ['leads.id IN (select max_id from users u1 inner join roles_users on roles_users.user_id = u1.id inner join roles on roles_users.role_id = roles.id left join (select leads.agent_id, max(leads.id) as max_id from leads where agent_id not IN (select distinct(agent_id) from leads where leads.active = ?) group by leads.agent_id) recent_lead on u1.id = recent_lead.agent_id where roles.title = ? order by max_id)', true, 'agent'])
        self.agent = @lead.agent if @lead

        if !self.agent
          # Look for agents with active leads 
          @lead = Lead.find(:first, :conditions => ['leads.id IN (select max_id from users u1 inner join roles_users on roles_users.user_id = u1.id inner join roles on roles_users.role_id = roles.id left join (select leads.agent_id, max(leads.id) as max_id from leads where leads.active = ? group by leads.agent_id) recent_lead on u1.id = recent_lead.agent_id where roles.title = ? order by max_id)', true, 'agent'])
          self.agent = @lead.agent if @lead
        end
      end
    end
  end
end
