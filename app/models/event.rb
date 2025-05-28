class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances
  has_many :attendees, through: :attendances

  validates :name, presence: true
  validates :date, presence: true

  def self.upcoming_events
    where(date: Date.today..)
  end

  def self.past_events
    where(date: ...Date.today)
  end
end
