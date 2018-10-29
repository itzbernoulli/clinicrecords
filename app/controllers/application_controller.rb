class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    protected  
    def after_sign_in_path_for(resource) 
    	if resource.is_admin?
    		admin_home_index_path
    	else
    		records_path
    	end        
    end
end
