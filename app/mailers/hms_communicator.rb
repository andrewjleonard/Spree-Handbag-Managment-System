class HmsCommunicator < ApplicationMailer

	default from: 'notifications@example.com'
 
  def test
    mail(to: "al@thehandbagspa.com", subject: 'Welcome to My Awesome Site')
  end

  def entered_email(handbag)
  	@handbag = handbag
    mail(to: @handbag.user.email, subject: 'Item Update | The Handbag Spa')
  end

    def progress_email(handbag, stage, movedTo)
  	@handbag = handbag
  	@stage = stage
  	@movedTo = movedTo
    mail(to: @handbag.user.email, subject: 'Item Update | The Handbag Spa')
  end

    def completed_email(handbag)
  	@handbag = handbag
    mail(to: @handbag.user.email, subject: 'Item Update | The Handbag Spa')
  end


end
