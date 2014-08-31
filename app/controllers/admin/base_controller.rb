class Admin::BaseController < ApplicationController
  before_action :admin_required!
  http_basic_authenticate_with(name: 'hacker_board', password: 'fukefuke')

  private def admin_required!
    redirect_to :root unless current_user && [1,2,4].include?(current_user.id)
  end
end
