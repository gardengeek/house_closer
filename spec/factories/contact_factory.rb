Factory.define :contact do |c|
  c.email      { Factory.next :email}
  c.first_name {|user| user.email.match(/(.*)@/)[1].titleize }
  c.last_name "Jones"
end

Factory.define :lead_contact, :parent => :contact do |l|
  l.leads { |contact|
    [ Factory.create(:lead, :contact_id => :lead_contact, :agent_id => Factory.create(:agent_user))]
  }
end
