class QuestionMailer < ActionMailer::Base
  default from: "kevinkang88@gmail.com"


  def confirmation_email
  	@user_email = "akisuzucky@gmail.com"
  	mail(to: @user_email, subject: "A question has been posted")
  end
end
