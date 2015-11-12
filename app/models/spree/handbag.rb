module Spree
  class Handbag < ActiveRecord::Base
    belongs_to :user
    before_create :init
    has_many :microposts , class_name: Spree::Micropost, dependent: :destroy
    validates :make,:colour,:arrival_date,:completion_date,:user_id,:work_details,:security_tag, presence: true
    mount_uploader :picture, PictureUploader
    mount_uploaders :pictures, PictureUploader
    validate  :picture_size

    acts_as_list
    default_scope { order(:completion_date).reverse_order }

    def init
      count = {'is_clean' => is_clean, 'is_repair' => is_repair, 'is_colour' => is_colour}.values.count(true)
      days_per_stage = (completion_date - arrival_date).to_i / count
      if is_clean == true
        self.clean_by_date = arrival_date + days_per_stage
      end
      if is_repair == true
        self.repair_by_date = arrival_date + (days_per_stage * 2)
      end
      if is_colour == true
        self.colour_by_date = completion_date
      end
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
      where("security_tag LIKE ?", "%#{search}%")
    end

    scope :is_clean, -> { where('is_clean IS true AND stage = 1').order(:clean_by_date).reverse_order }
    scope :is_repair, -> { where('is_repair IS true AND stage = 2').order(:repair_by_date).reverse_order }
    scope :is_colour, -> { where('is_colour IS true AND stage = 3').order(:colour_by_date).reverse_order }
    scope :is_quality, -> { where(stage: 4) }
    scope :is_complete, -> { where(stage: 5) }
    scope :is_limbo, -> { where(stage: 6) }

  end
end
