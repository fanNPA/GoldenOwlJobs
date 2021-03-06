class Employers::RegistrationsController < Devise::RegistrationsController
  include Accessible
  before_action :avoid_conflict_user, only: [:new]
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    resource.images.build
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, 
                                      keys: [:email,
                                              :name,
                                              :password,
                                              :password_confirmation])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, 
                                      keys: [:email,
                                            :name,
                                            :offer,
                                            :address,
                                            :short_description,
                                            :full_description,
                                            :logo,
                                            images_attributes: [:_destroy, :id, :file]])
  end

  # permit images
  # def account_update_params
  #   images_attribute = params.require(:employer)[:images_attributes]
  #   if images_attribute.present?
  #     devise_parameter_sanitizer.sanitize(:account_update)
  #                             .merge(images_attributes: images_attribute)
  #   else
  #     devise_parameter_sanitizer.sanitize(:account_update)
  #   end
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
    edit_employer_registration_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
  # update without current password
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
