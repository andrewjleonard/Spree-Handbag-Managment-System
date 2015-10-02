module Spree
  class Handbag < ActiveRecord::Base
	validates :make,:colour, presence: true
	belongs_to :user
	has_many :posts , class_name: Spree::Post, dependent: :destroy
	validates :user_id, presence: true
    acts_as_list
    default_scope { order(:position) }
  end
end
