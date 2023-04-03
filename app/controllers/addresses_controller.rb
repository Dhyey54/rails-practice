class AddressesController < ApplicationController
  before_action :user_address

  def edit; end

  def update
    if @address.update(address_params)
      redirect_to profile_index_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private
  def address_params
    params.require(:address).permit(:address, :pincode, :city, :state)
  end
  def user_address
    @address = Address.find_by(user_id: @current_user[:id])
  end
end
