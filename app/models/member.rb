class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
:confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :role, 
                :mobile, :address_line1, :address_line2, :city, :state, :country 
has_many :contacts
has_many :transactions
has_many :myevents
has_many :invoices


validates_presence_of :firstname, :lastname 

end
