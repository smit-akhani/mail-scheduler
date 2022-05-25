class GuestsCleanupJob < ApplicationJob
  queue_as :default

  def perform(email)
    UserMailer.schedule_email(email).deliver_now
    #UserMailer.with(email: email).schedule_email.deliver_now
  end
end
