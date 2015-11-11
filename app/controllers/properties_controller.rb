class PropertiesController < OpenReadController
  before_action :set_property, only: [:update, :destroy]
  # get s list of all properties
  def index
    @properties = Property.all
    render json: @properties
  end

  # show a single property
  def show
    @property = Property.find(params[:id])

    render json: @property
  end

  #create a new property
  def create
    @property = current_user.properties.new(property_params)

    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def update
    if @property.update(property_params)
      head :no_content
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Property.delete
    @property.destroy

    head :no_content
  end


  def set_property
    @property = current_user.properties.find(params[:id]) # makes this property the users property
  end

  def property_params
    params.require(:property).permit(:no, :street, :city, :state, :zip, :house_mgmt_co, :manager, :user_id)
  end

  private :set_property, :property_params
end
