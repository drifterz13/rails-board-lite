module TaskUsersHelper
  def assignable_users(users, task, role)
    if task.users.empty?
      users
    else
      task_users = task.task_users
      same_role_users = task_users.filter { |task_user| task_user.role == role.to_s }.map { |task_user| task_user.user }

      users.reject { |user| same_role_users.include? user }
    end
  end
end