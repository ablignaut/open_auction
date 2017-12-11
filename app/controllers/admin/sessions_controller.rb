module Admin
  class SessionsController < Devise::SessionsController
    before_action :configure_sign_in_params, only: [:create]

    def new
      super
    end

    def create
      super
    end

    def destroy
      super
    end

    protected

    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in)
    end

    def after_sign_out_path_for(resource_or_scope)
      admin_root_path
    end
  end
end
