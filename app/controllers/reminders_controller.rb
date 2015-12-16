#
class RemindersController < OpenReadController
  before_action :set_reminder, only: [:update, :destroy]

  def index
    if params[:user_id]
      @reminder = Reminder.where(user_id: params[:user_id])
    else
      @reminder = Reminder.all
    end
    render json: @reminder
  end

  def show
    @reminder = Reminder.find(params[:id])

    render json: @reminder
  end

  def create
    @reminder = current_user.reminders.create(reminder_params)

    if @reminder.save
      render json: @reminder, status: :created, location: @reminder
    else
      render json: @reminder.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reminder.update(reminder_params)
      head :no_content
    else
      render json: @reminder.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reminder.destroy

    head :no_content
  end

  def set_reminder
    @reminder = current_user.reminders.find(params[:id])
  end

  def reminder_params
    params.require(:reminder).permit(:message, :send_date, :user_id)
  end

  private :set_reminder, :reminder_params
end
