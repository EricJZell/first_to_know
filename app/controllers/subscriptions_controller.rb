class SubscriptionsController < ApplicationController

  def new
    @user = current_user
    @subscription = Subscription.new
  end

  def create
    @user = User.find(params[:user_id])
    @subscription = @user.subscriptions.new(subscription_params)
    if @subscription.save
      flash[:success] = "New subscription added"
      redirect_to user_path(@user)
    else
      flash[:alert] = @subscription.errors.full_messages.join(', ')
      render :new
    end
  end

  protected

  def subscription_params
    params.require(:subscription).permit(:twitter_handle, :phrase)
  end

end
