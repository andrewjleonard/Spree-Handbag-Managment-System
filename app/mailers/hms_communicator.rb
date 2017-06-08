class HmsCommunicator < ApplicationMailer

	default from: 'admin@thehandbagspa.com'
  default track_opens: 'true'

  def test
    mail(to: "al@thehandbagspa.com", subject: 'blah')
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

	def final_completed_email(handbag)
	@handbag = handbag
	mail(to: @handbag.user.email, subject: 'Item Update | The Handbag Spa')
end

end
