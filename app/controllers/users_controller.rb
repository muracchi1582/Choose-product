class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @videos = @user.videos
  end
  
  def show
  end

  def history
    @histories = History.all
  end

  def profit
    @profits = Profit.all
    @total__price=0
    @profits.each do |profit|
      @total__price = @total__price + profit.price 
    end
  end

end
