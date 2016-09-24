class Room < ApplicationRecord
  has_many :bookings

  validates :room_number, :presence=>true, :uniqueness => true
  validates :size, :presence=>true
  validates :building, :presence=>true

end
