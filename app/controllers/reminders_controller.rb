#
class RemindersController < OpenReadController
  def index
    @reminders = Reminder.all

    render json: @reminders
  end
end
