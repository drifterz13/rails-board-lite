require "rails_helper"

RSpec.describe TaskUsersHelper, type: :helper do
  it "returns assignable users" do
    task = create(:task)
    user1 = create(:user, email: "test1@test.com")
    user2 = create(:user, email: "test2@test.com")
    task_user1 = create(:task_user, :followers, task: task, user: user1)
    task_user2 = create(:task_user, :assignees, task: task, user: user2)

    users = User.all

    assignable_followerss = helper.assignable_users(users, task, :followers)
    expect(assignable_followerss.length).to be(1)
    expect(assignable_followerss).to include(user2)

    assignable_assigneess = helper.assignable_users(users, task, :assignees)

    expect(assignable_assigneess.length).to be(1)
    expect(assignable_assigneess).to include(user1)
  end
end
