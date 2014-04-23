class TestMailer < ActionMailer::Base
  default from: "from@example.com"


  def publish_email(usertest)
    @usertest = usertest
    @url  = 'http://google.com'
    mail(to: "tjerk.dijkstra@gmail.com", subject: 'Dit is een test')
  end
end
