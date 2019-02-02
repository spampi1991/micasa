class House < ApplicationRecord
  has_one :light_supply
  has_one :gas_supply
  has_one :water_supply
end
