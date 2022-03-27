class ApplicationController < ActionController::Base
  # devise発動時に実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  # nameのデータ操作を許可するアクションメソッド
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
