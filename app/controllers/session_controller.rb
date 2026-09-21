class SessionController < ApplicationController
  def index
  end

  def login
    puts "#######################"
    login = params
    for user in User.all
      if user.name == login[:name] && user.identifier == login[:identifier]
        redirect_to timer_path(user)
      end
    end
  end

  private
  def session_params
    params.expect(user: [:name, :identifier])
  end
end