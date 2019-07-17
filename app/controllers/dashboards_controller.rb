class DashboardsController < ApplicationController
  before_action :authenticate_admin, :only => [:dashboard ]
  def index
  end

  private

  def authenticate_admin
    authenticate_admin!
  end

end
