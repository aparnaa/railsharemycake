class Contact < ActiveRecord::Base

belongs_to :member
#belongs_to :invitaion

attr_accessible :contact_name, :email, :phone_no

  #attr_accessor :contact_name, :email, :phone_no
  validates_presence_of :contact_name, :email, :phone_no  
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_length_of :phone_no, :maximum => 10
  validates_numericality_of  :phone_no, :message=>"Error Message"  

end

