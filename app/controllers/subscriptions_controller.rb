class SubscriptionsController < ApplicationController

  def new
    @user = current_user
    @subscription = Subscription.new
  end

  def create
    @user = User.find(params[:user_id])
    @subscription = @user.subscriptions.new(subscription_params)
    if @subscription.save
      TWITTER_CLIENT.follow(@subscription.twitter_handle)
      flash[:success] = "New subscription added"
      redirect_to user_path(@user)
    else
      flash[:alert] = @subscription.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @subscription = Subscription.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @subscription = Subscription.find(params[:id])
    @user = User.find(params[:user_id])
    if @subscription.update(subscription_params)
      flash[:success] = "Subscription updated successfully"
      redirect_to user_path(@user)
    else
      flash[:alert] = @subscription.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    flash[:success] = "Subscription deleted"
    redirect_to :back
  end

  protected

  def subscription_params
    params[:subscription][:twitter_handle] = params[:subscription][:twitter_handle].sub(/^@/,'')
    params.require(:subscription).permit(:twitter_handle, :phrase)
  end

end
