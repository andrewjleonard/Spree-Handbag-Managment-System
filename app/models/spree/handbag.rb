module Spree
  class Handbag < ActiveRecord::Base
	belongs_to :user
	has_many :posts , class_name: Spree::Post, dependent: :destroy
	validates :make,:colour,:arrival_date,:completion_date,:user_id, presence: true
	scope :is_clean, -> { where('is_clean IS true AND stage = 1') }
	scope :is_repair, -> { where('is_repair IS true AND stage = 2') }
	scope :is_colour, -> { where('is_colour IS true AND stage = 3') }
    acts_as_list
    default_scope { order(:position) }
  end
end
