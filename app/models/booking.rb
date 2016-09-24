class Booking < ApplicationRecord
  belongs_to :room

  validates :room, :presence=>true
  validates :date, :presence=>true
  validates :slot_start, :presence=>true
  validates :member, :presence=>true


  validates :slot_start, uniqueness: {scope: [:room,:date,:member]}


end
