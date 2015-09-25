Spree::User.class_eval do
   has_many :handbags , class_name: Spree::Handbag ,:foreign_key => "handbag_id"

end