class RemoteLabPolicy
  attr_reader :current_user, :remote_lab

  def initialize(current_user, remote_lab)
    @current_user = current_user
    @remote_lab = remote_lab
  end

  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin? or @current_user == @remote_lab.user
  end

  def update?
    @current_user.admin?
  end

  def new?
    @current_user.admin?
  end

  def create?
    @current_user.admin?
  end

  def edit?
    @current_user.admin? or @current_user == @remote_lab.user
  end

  def destroy?
    @current_user.admin? or @current_user == @remote_lab.user
  end

end
