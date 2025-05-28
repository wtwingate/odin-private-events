class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances
  has_many :attendees, through: :attendances
  has_rich_text :description

  validates :name, presence: true
  validates :date, presence: true

  scope :upcoming, -> { where(date: Date.today..) }
  scope :past, -> { where(date: ...Date.today) }
end
