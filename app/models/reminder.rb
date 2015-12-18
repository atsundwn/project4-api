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
    update(sent: true)
  end

  def when_to_run
    year = send_date.split(' ')[0].split('-')[2].to_i
    month = send_date.split(' ')[0].split('-')[0].to_i
    day = send_date.split(' ')[0].split('-')[1].to_i
    hour = send_date.split(' ')[1].split(':')[0].to_i
    minute = send_date.split(' ')[1].split(':')[1].to_i

    hour -= 24 if hour >= 19

    Time.new(year, month, day, hour + 5, minute)
  end

  handle_asynchronously :send_sms, run_at: proc { |i| i.when_to_run }
  # handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
