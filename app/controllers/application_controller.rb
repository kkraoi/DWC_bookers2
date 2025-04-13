class ApplicationController < ActionController::Base
  # ユーザ登録、ログイン認証時にconfigure_permitted_parameters実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # サインアップにnameフィールドを有効にする
  #
  # @return [void] 説明
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
