require 'active_support/concern'

module Billable
  extend ActiveSupport::Concern

  included do
    has_many :invoices, as: :billable
  end

end
