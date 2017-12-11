module Admin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_admin_user!

    layout 'admin'

    rescue_from CanCan::AccessDenied do
      flash[:error] = I18n.t('cancan.not_access')
      respond_to do |format|
        format.html { redirect_to new_admin_user_session_url }
        format.js do
          render :update do |page|
            page.redirect_to new_admin_user_session_url
          end
        end
      end
    end
  end
end
