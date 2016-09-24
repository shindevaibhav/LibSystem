module BookingsHelper
  def slots_of_date
    @slots= DateTime.current.beginning_of_hour

  end
end
