Spree::User.class_eval do
   has_many :handbags , class_name: Spree::Handbag, dependent: :destroy
   has_many :microposts , class_name: Spree::Micropost, dependent: :destroy
   devise :timeoutable

   def self.to_csv

  CSV.generate(headers: true) do |csv|
    csv << ["ID", "Creation Date", "Email", "First Name", "Last Name"]
    all.each do |u|
      unless u.bill_address.nil?
        first = u.bill_address.first_name
        last = u.bill_address.last_name
      else
        first = ""
        last = ""
      end
      csv << [u.id, u.created_at.strftime("%d/%m/%Y"), u.email, first, last]
    end
  end
end
end
