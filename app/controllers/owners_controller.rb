class OwnersController < ApplicationController
  def properties_list
    if params[:owner_id]
      @properties = Property.where(owner_id: params[:owner_id])
    else
      @properties = Property.all
    end

    respond_to do |format|
      format.json {render :json => @properties.to_json(only: [:id, :value])}
    end
  end
end
