class Authorization 
	include Mongoid::Document
	include Mongoid::Timestamps

	field :access_token
	field :expires_at
	
	before_create :generate_access_token
	before_create :set_expiration

	belongs_to :vendor

	def	set_expiration
		self.expires_at = DateTime.now+30
	end

	def	generate_access_token
		self.access_token = SecureRandom.hex
	end
end
