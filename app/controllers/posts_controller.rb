class PostsController < InheritedResources::Base
  before_filter :authenticate_user!, :only => [:create]
  before_filter :assign_user

  private

  def assign_user
    params[:post][:user] = current_user
  end
end
