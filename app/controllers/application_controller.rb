class ApplicationController < ActionController::API
    def require_login
        head(:unauthorized) unless current_user.presence
    end

    def authentication_admin
      head(:bad_request) unless current_user.presence && current_user.is_admin
    end
end
