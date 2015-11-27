
module Spree
  class HmsCommunicator < BaseMailer
    require 'twilio-ruby'
    def progress_email(handbag, stage, movedTo)
      @handbag = handbag
      @stage = stage
      @movedTo = movedTo
      mail(:subject => 'Handbag update | The Handbag Spa',
           :to  => @handbag.user.email,
           :from => 'info@thehandbagspa.com',
           :track_opens => 'true')
      send_text_message
    end

    def send_text_message
      account_sid = 'ACd77a302884cb38c0cc474bb3d90da9d0'
      auth_token = '7522a409a0a8c9193f8ebdc4769f28bd'
      alphanumeric_id = "TheHandbagS"
      twilio_phone_number = '+441915801542'
      recipient_phone_number = '+447765577235'

      client = Twilio::REST::Client.new(account_sid, auth_token)
      begin
        client.messages.create(
          from: alphanumeric_id,
          to:   recipient_phone_number,
          body: "Hello Freya. We have received your item into the spa. It will be enjoying it's first treatment shortly. Love, The Handbag Spa"
        )
      rescue Twilio::REST::RequestError => error
        if error.code == 21612
          client.messages.create(
            from: twilio_phone_number,
            to:   recipient_phone_number,
            body: "Hello, this is a message from Andrew"
          )
        else
          # handle this some other way
          raise error
        end
      end
    end


  end
end
