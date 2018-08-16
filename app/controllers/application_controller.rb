class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected  
    def after_sign_in_path_for(resource)
      if resource.roles[0].name == "frontdesk" 
        frontdesk_index_path
      else
        root_path
      end
    end
end
