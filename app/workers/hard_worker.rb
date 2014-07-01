class HardWorker
  include Sidekiq::Worker

  def perform
    @question = Question.last
    puts 'Doing hard work'
    QuestionMailer.confirmation_email.deliver
  end
end