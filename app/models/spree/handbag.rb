module Spree
  class Handbag < ActiveRecord::Base
    belongs_to :user
    before_create :init
    has_many :microposts , class_name: Spree::Micropost, dependent: :destroy
    validates :make,:colour,:arrival_date,:completion_date,:user_id, presence: true
    mount_uploader :picture, PictureUploader
    validate  :picture_size

    acts_as_list
    default_scope { order(:completion_date).reverse_order }

    def init
      if is_clean == true
        self.stage = 1
      elsif is_repair == true
        self.stage = 2
      elsif is_colour == true
        self.stage = 3
      end
    end

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

    def self.search(search)
      where(:security_tag = search)
    end

    scope :is_clean, -> { where('is_clean IS true AND stage = 1') }
    scope :is_repair, -> { where('is_repair IS true AND stage = 2') }
    scope :is_colour, -> { where('is_colour IS true AND stage = 3') }
    scope :is_quality, -> { where(stage: 4) }
    scope :is_complete, -> { where(stage: 5) }
    scope :is_limbo, -> { where(stage: 6) }

  end
end
