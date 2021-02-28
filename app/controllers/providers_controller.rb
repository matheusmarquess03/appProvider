class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :update, :edit, :destroy]

  def index
    @providers = Provider.all
    @retorno = Provider.sum("unit_price*quantity")
  end

  def show
  end

  def new
    @provider = Provider.new
  end

  def edit

  end

  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      flash[:notice] = "Provider was successfully created."
      redirect_to action: :show, id: @provider.id
    else
      render :new
    end
  end

  def update
    @provider = Provider.find(params[:id])
      if @provider.update(provider_params)
        flash[:notice] = "Provider was successfully updated." 
        redirect_to @provider, id: @provider.id
      else
        render :edit
      end
  end

  def destroy
    @provider.destroy
      flash[:notice] = "Provider was successfully destroyed." 
      redirect_to action: :index
  end
    
    
  def import
    Provider.import(params[:file])
    redirect_to providers_path, notice: "File was successfully Imported."
  end
  
  def retornaTotal
    @retorno = Provider.calculate_total
  end

  private
      
  def set_provider
    @provider = Provider.find(params[:id])
  end
      
  def provider_params
    params.require(:provider).permit(:buyer, :description, :unit_price, :quantity, :address, :supplier)
  end
end
