class Booking < ApplicationRecord
  belongs_to :room

  validates :room_id, :presence=>true
  validates :date, :presence=>true
  validates :slot_start, :presence=>true
  validates :member_id, :presence=>true


  validates :slot_start, uniqueness: {scope: [:room_id,:date]}


end
