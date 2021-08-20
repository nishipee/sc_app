class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when CorporateUser
      corporate_user_path(resource)
    end
  end
end