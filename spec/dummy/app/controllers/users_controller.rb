class UsersController < ApplicationController
  respond_to :html

  def index
    @users = [User.new(1, "jack"), User.new(2, "lucy")]
    respond_with @users
  end

end
