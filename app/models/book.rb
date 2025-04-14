class Book < ApplicationRecord
  # I dont want to asume more attributes, but we could add uuids/rooms/etc
  validates :title, presence: true
  validates :user_email, presence: true, if: -> { reserved? }

  # enum status: { available: "available", reserved: "reserved" }
  # I prefer to use enums but for this time I generated the method
  def reserved?
    status == "reserved"
  end
end
