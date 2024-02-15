class ProvidersController < ApplicationController
    
    def index
        @providers = Provider.all
    end

    def show
        provider
    end

    def new
        @provider = Provider.new
    end

    def create
        @provider = Provider.new(provider_params)
        if @provider.save
            redirect_to providers_path, notice: t('.created')
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        provider
    end

    def update
        if provider.update(provider_params)
            redirect_to providers_path, notice: t('.updated')
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        provider.destroy
        redirect_to providers_path, notice: t('.destroyed')
    end

    private 

    def provider
        @provider = Provider.find_by(params[:nit])
    end

    def provider_params
        params.require(:provider).permit(:name, :nit, :name_contact, :phone_contact, :account_number, :country_code, :department_code, :city_code, :address)
    end
end
