class BanksController < ApplicationController
  def index
    @banks = Bank.all
  end

  def show
    set_bank
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)
    if @bank.save
      redirect_to banks_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_bank
  end

  def update
    if set_bank.update(bank_params)
      redirect_to banks_path, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_bank.destroy
    redirect_to banks_path, notice: t('.destroyed')
  end

  private

  def set_bank
    @bank = Bank.find(params[:id])
  end

  def bank_params
    params.require(:bank).permit(:name, :address, :phone, :email, :web_site, :provider_nit, :country_code, :department_code, :city_code, :type_account)
  end

end
