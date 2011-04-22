Factory.define :lead do |l|
  l.agent { |a| Factory.create(:agent_user)}
  l.contact { |c| Factory.create(:contact) }
end
