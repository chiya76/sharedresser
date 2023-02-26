class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @age = user.age.name
    @personal_color = user.personal_color.name
    @skin_color = user.skin_color.name
    @skin_type = user.skin_type.name
    @face_type = user.face_type.name
    @makeup_type = user.makeup_type.name
    @items = user.items
  end
end
