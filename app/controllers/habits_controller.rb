class HabitsController < ApplicationController
  before_action :set_habit, only: %i[ edit update destroy ]

  def toggle_completion
    @habit = Habit.find(params[:id])
    date = JSON.parse(request.body.read)["date"]

    today_completion = @habit.habit_completions.where(date: date)[0]

    if today_completion
      today_completion.destroy!
      respond_to do |format|
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "habit_completions_#{params[:id]}",
            partial: 'habits/habit_completions',
            locals: { habit: @habit, dates: past_31_days }
          )
        }
        format.html { redirect_to habits_path, notice: "Occurence successfully removed." }
      end
    else
      HabitCompletion.create(habit_id: @habit.id, date: date)
      respond_to do |format|
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "habit_completions_#{params[:id]}",
            partial: 'habits/habit_completions',
            locals: { habit: @habit, dates: past_31_days }
          )
        }
        format.html { redirect_to habits_path, notice: "Occurence added." }
      end
    end
  end

  def past_31_days
    dates = []
    (31.days.ago.to_date..Date.today).each { |date| dates << date }
    dates
  end

  # GET /habits
  def index
    @habits = Habit.all
    @dates = past_31_days
  end

  # GET /habits/new
  def new
    @habit = Habit.new
  end

  # GET /habits/1/edit
  def edit
  end

  # POST /habits
  def create
    @habit = Habit.new(habit_params)

    if @habit.save
      redirect_to habits_path, notice: "Habit was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /habits/1
  def update
    if @habit.update(habit_params)
      redirect_to habits_path, notice: "Habit was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

   # DELETE /habits/1
   def destroy
    @habit.destroy!
    redirect_to habits_url, notice: "Habit was successfully destroyed.", status: :see_other
  end

  private
    def habit_params
      params.require(:habit).permit(:name)
    end
    def set_habit
      @habit = Habit.find(params[:id])
    end
end
