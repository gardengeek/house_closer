Factory.define :lead do |l|
  l.agent { |a| User.find(:first)}
  l.contact { |c| Contact.find(:first) }
end
