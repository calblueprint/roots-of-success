module Teachers
  class StudentsController < BaseController
    load_and_authorize_resource # loads @student{s}
  end
end
