module TaskUsersHelper
  def assignable_users(users, task, role)
    if task.users.empty?
      users
    else
      excluded_user_ids = task.task_users.where(role: role.to_sym).pluck(:user_id)

      users.reject { |user| excluded_user_ids.include? user.id }
    end
  end
end
