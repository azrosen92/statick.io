class JsonDatum < ActiveRecord::Base

	validate :valid_json_data
	validates :json_blob, presence: true

	before_create :generate_endpoint

	def access
		self.last_accessed = Time.zone.now
		save
	end

	def json_data
		JSON.load(json_blob)
	end

	def generate_endpoint
		self.endpoint = SecureRandom.urlsafe_base64
	end

	def valid_json_data
		!!JSON.parse(json_blob)
	rescue 
		errors[:json_blob] << I18n.t("errors.invalid_json_blob")
		false
	end
end
