module Spree
  class Handbag < ActiveRecord::Base
	validates :make,:colour, presence: true
	belongs_to :user
    acts_as_list
    default_scope { order(:position) }
  end
end
