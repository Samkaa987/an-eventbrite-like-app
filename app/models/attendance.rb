class Attendance < ApplicationRecord
	after_create :new_participant_send

	belongs_to :participant, class_name: "User"
	belongs_to :event



	def new_participant_send
		UserMailer.new_participant_email(self).deliver_now
	end

end
