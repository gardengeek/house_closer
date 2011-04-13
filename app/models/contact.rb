class Contact < ActiveRecord::Base

  belongs_to :state

  validates_presence_of :first_name,
    :last_name

  attr_accessible :first_name,
    :last_name,
    :home_phone,
    :cell_phone,
    :work_phone,
    :email,
    :address_line_1,
    :address_line_2,
    :city,
    :postal_code,
    :state_id

  def name
    "#{first_name} #{last_name}"
  end

  validate :contact_info_supplied

  def contact_info_supplied
    if home_phone.blank? && cell_phone.blank? && work_phone.blank? && email.blank?
      errors.add(:base,"Home phone, cell phone, work phone or email must have a value")
    end    
  end
end
