# Register new application here
class Developers::AppsController < Developers::BaseController
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  def index
    @applications = Application.where(owner: current_user)
  end

  def new
    @application = Application.new
  end

  def show
  end

  def create
    @application = Application.new(application_params)
    @application.redirect_uri = Doorkeeper.configuration.native_redirect_uri
    @application.owner = current_user
    if @application.save
      flash[:notice] = I18n.t(:notice, scope: [:doorkeeper, :flash, :applications, :create])
      redirect_to developers_app_path(@application)
    else
      render :new
    end
  end

  def update
    if @application.update_attributes(application_params)
      flash[:notice] = I18n.t(:notice, scope: [:doorkeeper, :flash, :applications, :update])
      redirect_to developers_app_path(@application)
    else
      render :edit
    end
  end

  def destroy
    flash[:notice] = I18n.t(:notice, scope: [:doorkeeper, :flash, :applications, :destroy]) if @application.destroy
    redirect_to developers_apps_path
  end

  private

    def set_application
      @application = Application.find_by(id: params[:id])
      if @application.blank? or @application.owner != current_user
        redirect_to developers_apps_path
      end
    end

    def application_params
      params.require(:application).permit(:name, :redirect_uri, :scopes)
    end

end
