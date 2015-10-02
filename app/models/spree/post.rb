module Spree
  class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :handbag
	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :content, presence: true, length: { maximum: 140 }
  end
end
