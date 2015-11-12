
module Spree
  class TestMailer < BaseMailer
    def confirm_email
      mail(:subject => 'Hello from Postmark',
      :to  => 'professional@aleonard.co.uk',
      :from => 'info@thehandbagspa.com',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
    end
  end
end