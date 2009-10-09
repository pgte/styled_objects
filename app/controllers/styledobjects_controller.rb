class StyledobjectsController < ApplicationController
  caches_page :show
  
  def show
    path_spec = params[:id]

    headers['Cache-Control'] = 'public; max-age=2592000'
    render :text => StyledObjects::Generator.generate(view_paths, params[:id].join('/')), :content_type => "text/css"
  end
  
  private
  
  # Don't log.
  def logger
    nil
  end
end