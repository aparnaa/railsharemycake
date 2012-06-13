class Myevent < ActiveRecord::Base
has_many :invitations
has_one :organisation
belongs_to :member
has_many :transactions
has_many :invoices
validates_presence_of :mobile_number, :title, :venue, :description, :share_amount, :message
validates_inclusion_of :share_amount, :in => 1..100
  validates_length_of :mobile_number, :maximum => 10
  validates_numericality_of  :mobile_number, :message=>"Error Message"  

end
