#
class Reminder < ActiveRecord::Base
  belongs_to :user

  after_create :send_sms

  # @@REMINDER_TIME = self.send_date

  def send_sms
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    message = @client.account.messages.create(
      from: @twilio_number,
      to: user.phone_number,
      body: self.message
    )
    puts message.to
  end

  def when_to_run
    Time.new + self.send_date.to_i.seconds
  end

  handle_asynchronously :send_sms, run_at: proc { |i| i.when_to_run }
  # handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
