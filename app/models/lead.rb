class Lead < ActiveRecord::Base
  belongs_to :contact
  belongs_to :agent, :class_name => 'User'

  validates_presence_of :contact_id,
    :agent_id
end
