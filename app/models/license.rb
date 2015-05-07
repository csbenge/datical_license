class License < ActiveRecord::Base

	attr_accessor :companyStage
	
	# On form
	validates :consumerType, presence: true
	validates :companyName, presence: true
	validates :contactName, presence: true
	validates :contactEmail, presence: true
	validates :notAfter, presence: true

	# Off form
	#validates :consumerAmount, presence: true
	#validates :issuer, presence: true
	#validates :subject, presence: true
	#validates :holder, presence: true
	#validates :info, presence: true

  belongs_to :user
end
