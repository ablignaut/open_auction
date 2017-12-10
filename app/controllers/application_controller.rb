class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do
    flash[:error] = I18n.t('cancan.not_access')
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js do
        render :update do |page|
          page.redirect_to root_url
        end
      end
    end
  end
end
