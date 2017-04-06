class AddressesController < ApplicationController
  def shorten
    address = Address.new(url: address_params[:url])
    address.shorten
    if address.save
      render json: { shorten: address.short }
    else
      render json: { error: address.errors.full_messages }, status: 422
    end
  end

  def enlarge
    address = Address.enlarged(address_params[:short]).first
    raise(ActiveRecord::RecordNotFound, 'Element not found') if address.nil?
    redirect_to address.url
  end

  def address_params
    params.permit(:url, :short)
  end
end
