class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  	layout :choose_layout

    protected  
    def after_sign_in_path_for(resource) 
    	if resource.is_admin?
    		admin_home_index_path
    	else
    		records_path
    	end        
    end

    protected

    def choose_layout
    	if current_user.nil?
    		"application"
    	else
    		"admin"
    	end
    end
end
