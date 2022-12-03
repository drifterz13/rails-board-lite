require "rails_helper"

RSpec.describe TaskUsersHelper, type: :helper do
  it "returns assignable users" do
    task = create(:task)
    user1 = create(:user, email: "test1@test.com")
    user2 = create(:user, email: "test2@test.com")
    task_user1 = create(:task_user, :follower, task: task, user: user1)
    task_user2 = create(:task_user, :assignee, task: task, user: user2)

    users = User.all

    assignable_followers = helper.assignable_users(users, task, :follower)
    expect(assignable_followers.length).to be(1)
    expect(assignable_followers).to include(user2)

    assignable_assignees = helper.assignable_users(users, task, :assignee)

    expect(assignable_assignees.length).to be(1)
    expect(assignable_assignees).to include(user1)
  end
end
