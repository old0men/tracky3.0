class TimersController < ApplicationController
  def show
    @timers = []

    user_timers = UserTimer.all
    for user_timer in user_timers do
      if user_timer.user.id.to_s == params[:id].to_s
        @timers.push(user_timer.timer)
      end
    end
  end
  def edit
    start = params[:start].to_s
    finish = params[:end].to_s
    start_in_mins = date_time_to_mins(start)
    finish_in_mins = date_time_to_mins(finish)

    if start_in_mins != nil && finish_in_mins != nil
      if finish_in_mins > start_in_mins
        duration = ((finish_in_mins - start_in_mins) / 60).to_f

        timer_save = Timer.new(start: start, end: finish, duration: duration)
        timer_save.save

        UserTimer.create(user: User.find_by(id: params[:id]), timer: Timer.find_by(id: timer_save.id))
      end
    end
  end

  public
  def date(date_time_object)
    list = date_time_object.split("-")
    "#{list[2]}.#{list[1]}.#{list[0]}"
  end

  private
  def date_time_to_mins(date_time_object)
    list = date_time_object.split("T")
    hours = (list[1].to_s.split(":")[0].to_i)*60
    mins = list[1].to_s.split(":")[1].to_i
    hours + mins
  end
end
