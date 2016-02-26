class V2::VancouverPublicLibraryController < ApplicationController
  def search
    @searchinfo = V2::SearchInfo.new(params[:keyword], params[:category], params[:page])
    @contents = @searchinfo.parse
    render 'search', formats: [:json], handlers: [:jbuilder]
  end
end
