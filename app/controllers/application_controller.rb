class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout
  
  private

    def layout
        if is_a?(Devise::SessionsController) || is_a?(Devise::RegistrationsController) || is_a?(Devise::PasswordsController)
          "sign"
        else 
          "admin"           
        end
    end
end
