class TestMailer < ActionMailer::Base
  default from: "from@example.com"
  def publish_email(user)
    @user = user
    @usertest = usertest
    @url  = 'http://google.com'
    mail(to: @user.email, subject: 'Dit is een test')
  end
end
