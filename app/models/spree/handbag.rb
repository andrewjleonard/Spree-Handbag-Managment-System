module Spree
  class Handbag < ActiveRecord::Base
	belongs_to :user
	before_create :init
	has_many :microposts , class_name: Spree::Micropost, dependent: :destroy
	validates :make,:colour,:arrival_date,:completion_date,:user_id, presence: true

    acts_as_list
    default_scope { order(:position) }

    def init
    	if is_clean == true
      		self.stage = 1
  		elsif is_repair == true
  			self.stage = 2
  		elsif is_colour == true
  			self.stage = 3
  		end
    end
   	
   	scope :is_clean, -> { where('is_clean IS true AND stage = 1') }
	scope :is_repair, -> { where('is_repair IS true AND stage = 2') }
	scope :is_colour, -> { where('is_colour IS true AND stage = 3') }

  end
end
