class Book < ApplicationRecord
  # I dont want to asume more attributes, but we could add uuids/rooms/etc
  validates :title, presence: true
  validates :user_email, presence: true, if: -> { reserved? }

  # enum status: { available: "available", reserved: "reserved" }
  # I prefer to use enums but for this time I generated the method, for the time, and
  # depending too if we can use a boolean, i prefer to dont asume that and generate some enum,
  # for this case I used string, but we can change it to as integer,
  def reserved?
    status == "reserved"
  end
end
