class ActivitiesController < OpenReadController

  before_action :set_activity, only: [:update, :destroy]
  # get s list of all activities
  def index
    @activities = Activity.all
    render json: @activities
  end

  # show a single activity
  def show
    @activity = Activity.find(params[:id])

    render json: @activity
  end

  #create a new activity
  def create
    @activity = current_user.activities.new(activity_params)

    if @activity.save
      render json: @activity, status: :created, location: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  def update
    if @activity.update(activity_params)
      head :no_content
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Activity.delete
    @activity.destroy

    head :no_content
  end


  def set_activity
    @activity = current_user.activities.find(params[:id]) # makes this activity the users activity
  end

  def activity_params
    params.require(:activity).permit(:no, :street, :city, :state, :zip, :house_mgmt_co, :manager, :user_id)
  end

  private :set_activity, :activity_params
end
