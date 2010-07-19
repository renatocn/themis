class PostsController < InheritedResources::Base
  belongs_to :section
  before_filter :authenticate_user!, :only => [:create, :update, :destroy]
  before_filter :assign_user, :only => [:create]

  private

  def assign_user
    params[:post][:user] = current_user
  end
end
