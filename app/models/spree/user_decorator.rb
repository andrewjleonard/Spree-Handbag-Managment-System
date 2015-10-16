Spree::User.class_eval do
   has_many :handbags , class_name: Spree::Handbag, dependent: :destroy
   has_many :microposts , class_name: Spree::Micropost, dependent: :destroy
end