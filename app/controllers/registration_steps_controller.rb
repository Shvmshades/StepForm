class RegistrationStepsController <  ApplicationController
	include Wicked::Wizard
  layout :false
  layout 'specific_layout', :only=> :show

 
 # steps(*User.wizard_steps)
  steps :first, :second

  def show
    @user = current_user
    debugger
    render_wizard
    
  end

  def update
    @user = current_user
    params[:user][:current_step] = step
    params[:user][:registration_step] = step
    #@user = @user.update(user_params)
    #@user.update(user_params)
    @user.attributes = user_params

    render_wizard @user
  end

  private

  def finish_wizard_path
    #debugger
    welcome_path(current_user.id)
  end

  def user_params
    params.require(:user).permit!
  end

end
