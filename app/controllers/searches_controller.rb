class SearchesController < ApplicationController

  def channels
    @channels = Channel.where('name LIKE ?', "%#{params[:keyword]}%").all
    respond_to do |format|
      format.json { render 'admin/index', json: @channels }
    end
  end

end
