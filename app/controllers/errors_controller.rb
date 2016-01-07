class ErrorsController < ApplicationController
  def routing_error
    @contents = {}
    @contents["status"] = 'NG'
    render 'routing_error', formats: [:json], handlers: [:jbuilder]
  end
end
