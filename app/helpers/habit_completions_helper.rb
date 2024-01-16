module HabitCompletionsHelper
  def render_themed_widget(habit, dates)
    render 'habit_completions', habit: habit, dates: dates
  end
end
