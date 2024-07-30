class AdminDashboardController < ApplicationController
    before_action :authenticate_admin!
  
    def show
      @products = Product.all
    end
  end
  