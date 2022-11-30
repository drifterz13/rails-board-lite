require "rails_helper"

RSpec.describe TaskUser, type: :model do
  it "has task reference and user reference" do
    task = create(:task)
    user = create(:user)
    task_user = create(:task_user, task: task, user: user)

    expect(task_user.valid?).to eq(true)
    expect(task_user.task).to eq(task)
    expect(task_user.user).to eq(user)
  end

  it "has default follower role" do
    task_user = create(:task_user)

    expect(task_user.follower?).to eq(true)
  end
end
