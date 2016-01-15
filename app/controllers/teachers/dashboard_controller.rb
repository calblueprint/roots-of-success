module Teachers
  class DashboardController < BaseController
    before_action :authenticate_teacher!

    def show
      @teacher = current_teacher
      # This query will eventually get really slow because we essentially do a
      # Student.where for each active classroom.
      #
      # TODO(sam): Make it faster.
      @classrooms = @teacher.classrooms.active
                    .includes(:students)
                    .includes(:presented_learning_modules)
                    .decorate
      @latest_changelog_item = ChangelogItem.first.decorate
    end
  end
end
