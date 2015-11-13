
module Spree
  class TestMailer < BaseMailer
    def confirm_email(email)
      mail(:subject => 'Hello from Postmark',
      :to  => email,
      :from => 'info@thehandbagspa.com',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
    end
  end
end