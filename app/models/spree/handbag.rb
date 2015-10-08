module Spree
  class Handbag < ActiveRecord::Base
	belongs_to :user
	has_many :posts , class_name: Spree::Post, dependent: :destroy
	validates :make,:colour,:arrival_date,:completion_date,:user_id, presence: true
	scope :is_clean, -> { where('is_clean IS true AND is_clean_complete IS null') }
	scope :is_repair, -> { where('is_repair IS true AND is_repair_complete IS null') }
	scope :is_colour, -> { where('is_colour IS true AND is_colour_complete IS null') }
    acts_as_list
    default_scope { order(:position) }
  end
end
