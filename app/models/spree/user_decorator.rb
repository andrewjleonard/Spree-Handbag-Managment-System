Spree::User.class_eval do
   has_many :handbags , class_name: Spree::Handbag, dependent: :destroy
   has_many :posts , class_name: Spree::Post, dependent: :destroy
end