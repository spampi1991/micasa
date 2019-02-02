class WaterSupply < ApplicationRecord
  include Billable
  belongs_to :house
end
