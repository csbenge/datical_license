class License < ActiveRecord::Base

	attr_accessor :companyStage
	
	validates :consumerAmount, presence: true
	validates :consumerType, presence: true
	validates :issuer, presence: true
	validates :subject, presence: true
	validates :holder, presence: true
	validates :notAfter, presence: true
	validates :info, presence: true
	validates :companyName, presence: true
	validates :contactName, presence: true
	validates :contactEmail, presence: true

  belongs_to :user
end
