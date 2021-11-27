class ProspectsController < ApplicationController
  def index
    @prospects = Prospect.all
  end
  
  def new
    @prospect = Prospect.new
  end

  def show
    @prospect = Prospect.find(params[:prospect_id]) 
  end

  def create
    @prospect = Prospect.new(prospect_params)
    @prospect.user_id = current_user.id
    if @prospect.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @prospect = Prospect.find(params[:prospect_id])
  end

  def update
    @prospect = Prospect.find(params[:prospect_id])
    @prospect.full_name = params[:full_name]
    @prospect.phone = params[:phone]
    @prospect.email = params[:email]
    @prospect.status = params[:status]
    @prospect.user_id = current_user.id
    if @prospect.update(prospect_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @prospect = Prospect.find(params[:prospect_id])
    @prospect.destroy
    redirect_to root_path
  end

  private

  def prospect_params
    params.require(:prospect).permit(:full_name, :phone, :email, :status) # Permitidos en el formulario
  end

end
