
module Spree
  class HmsCommunicator < BaseMailer
    def progress_email(handbag, stage, movedTo)
      @handbag = handbag
      @stage = stage
      @movedTo = movedTo
      mail(:subject => 'Handbag Update | The Handbag Spa',
           :to  => @handbag.user.email,
           :from => 'info@thehandbagspa.com',
           :track_opens => 'true')
      #send_text_message
    end

    def test_email
      mail(:subject => 'Handbag Update | The Handbag Spa',
           :to  => 'al@thehandbagspa.com',
           :from => 'info@thehandbagspa.com',
           :body => 'hey',
           :track_opens => 'true')
    end

end
end
