class Park < ApplicationRecord
  validates_presence_of :name, :price
  has_many :rides

  def ave_thrill_rating
    average = rides.average(:rating)
    average.to_f.to_s + "/10"
  end

  def alphabetical_rides
    test = rides.order(:name)
  end
end
