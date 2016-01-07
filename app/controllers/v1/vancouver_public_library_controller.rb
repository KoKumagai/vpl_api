class V1::VancouverPublicLibraryController < ApplicationController
  def search
    @searchinfo = V1::SearchInfo.new(params[:keyword], params[:category], params[:page])
    @contents = @searchinfo.parse
    render 'search', formats: [:json], handlers: [:jbuilder]
  end
end
