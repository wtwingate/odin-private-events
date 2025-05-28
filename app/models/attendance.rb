class Attendance < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: "User"

  validates :attendee_id, uniqueness: { scope: :event_id, message: "is already registered for this event" }
  validate :attendee_cannot_be_creator

  private

  def attendee_cannot_be_creator
    if event.creator_id == attendee.id
      errors.add(:attendee_id, "cannot be the creator of the event")
    end
  end
end
