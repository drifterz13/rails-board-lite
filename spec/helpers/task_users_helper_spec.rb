require "rails_helper"

RSpec.describe TaskUsersHelper do
  it "returns assignable users for the given followers" do
    task = create(:task)
    user1 = create(:user)
    user2 = create(:user)
    create(:task_user, :followers, task: task, user: user1)
    expect(helper.assignable_users(User.all, task, :followers)).to eq([user2])
  end
end
