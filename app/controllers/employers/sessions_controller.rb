class Employers::SessionsController < Devise::SessionsController
  include Accessible
  before_action :avoid_conflict_user, only: [:new]

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
   def create
    super
   end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private
    def employer_params
      params.require(:employer).permit(:email, :password, :password_confirmation)
    end
end
