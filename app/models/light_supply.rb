class LightSupply < ApplicationRecord
  include Billable
  belongs_to :house
end
