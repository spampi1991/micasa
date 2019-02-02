class GasSupply < ApplicationRecord
  include Billable
  belongs_to :house
end
