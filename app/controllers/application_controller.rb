class ApplicationController < ActionController::Base
  # except以外のページは、ログインしていない時にアクセスするとログイン画面へ遷移
  before_action :authenticate_user!, except: [:top, :about]

  # 他人のアクセス防止
  before_action :is_matching_login_user, only: [:edit, :update]

  # ユーザ登録、ログイン認証時にconfigure_permitted_parameters実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン(サインイン)後にどこに遷移するかを設定するdeviseフックメソッド
  #
  # @param resource [Instance] ログインを実行したモデルのデータ、今回の場合はつまりログインしたUserのインスタンス
  # @return [String] ログイン(サインイン)後にリダイレクトするパス
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  # サインアウト後にどこに遷移するかを設定しているdeviseフックメソッド
  # @param param [Instance] アウトを実行したモデルのデータ、今回の場合はつまりログインしたUserのインスタンス
  # @return [String] サインアウト後にリダイレクトするパス
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  # サインアップにemailフィールドを有効にする
  #
  # @return [void]
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
