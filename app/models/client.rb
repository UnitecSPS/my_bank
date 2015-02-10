class Client < ActiveRecord::Base
	validates_presence_of :name, :identity
	validates_uniqueness_of :identity
	validates_uniqueness_of :email, allow_blank: true
  validates_length_of :phone, is: 8, allow_blank: true
end
