class CorporateUsersController < ApplicationController
  before_action :authenticate_corporate_user!
  def show
  end
end
