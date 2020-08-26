class Trainers::SubjectsController < TrainersController
  before_action :logged_in_user, only: :index

  def index
    @subjects = Subject.page(params[:page])
                       .per Settings.pagination.subject.default
  end

  def new
    @subject = Subject.new
    @subject.tasks.build
  end

  private

  def subject_params
    params.require(:subject).permit Subject::PERMITTED_CREATE_ATTRS
  end
end
