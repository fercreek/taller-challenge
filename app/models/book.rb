class Book < ApplicationRecord
  # I dont want to asume more attributes, but we could add uuids/rooms/etc
  validates :title, presence: true
end
