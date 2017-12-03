module Authentication
  def self.included(action)
    action.class_eval do
      expose :current_user
      before :authenticate_request!
    end
  end

  private

  def current_user
    # return nil unless session[:userinfo]
    # user_repo.find_by_email(decoded_token.first["email"]).to_h
    session[:userinfo]
  end

  def authenticate_request!
    redirect_to "/" unless current_user
  end

  # def user_repo
  #   @user_repo ||= UserRepository.new
  # end
end
