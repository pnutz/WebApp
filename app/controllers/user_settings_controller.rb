class UserSettingsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user_settings, only: [:show, :edit, :update, :destroy]

  # GET /user_settings
  # GET /user_settings.json
  def index
    @user_setting = current_user.user_setting
  end

  # PATCH/PUT /user_settings/1
  # PATCH/PUT /user_settings/1.json
  def update
    respond_to do |format|
      updateUserSettings = user_settings_params

      if @user_settings.update(updateUserSettings)
        format.html { redirect_to @user_settings, notice: 'User Settings were successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_settings.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_settings
      @user_settings = UserSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_settings_params
      params.require(:user_setting).permit(:id, :currency_id, :hotkey_receipt, :hotkey_vault)
    end
end
