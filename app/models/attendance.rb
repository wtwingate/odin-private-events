class Attendance < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: "User"

  validates :attendee_id, uniqueness: { scope: :event_id, message: "is already registered for this event" }
end
