class CalendarController < ApplicationController
  def index
    if(current_user != nil)
      if(current_user.updated_password == false)
        redirect_to "/users/#{current_user.id}/edit"
      end
    end
  end
end
