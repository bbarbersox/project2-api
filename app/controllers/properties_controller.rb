class PropertiesController < OpenReadController
  before_action :set_property, only: [:update, :destroy]
  # get s list of all properties
  def index
    @properties = Property.all
    render json: @properties
  end

  # show a single property
  def show
    render json: 'Got to show a single property'
  end

  #create a new property
  def create
    @property = current_user.Property.new(property_params)
    render json: @property

    if @property.save
      render json: @property, status: :created, location: @propoerty
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def property_params
    params.require(:property).permit(:no, :street, :city, :state, :zip, :house_mgmt_co, :manager)
  end

  private :property_params
end
end
