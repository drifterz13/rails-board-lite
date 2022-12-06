require "rails_helper"

RSpec.describe TaskUser, type: :model do
  it "has task reference and user reference" do
    task = create(:task)
    user = create(:user)
    task_user = create(:task_user, task: task, user: user)

    expect(task_user.valid?).to eq(true)
    expect(task_user.task).to eq(task)
    expect(task_user.user).to eq(user)
    expect(task.users).to include(user)
    expect(user.tasks).to include(task)
  end

  it "has default followers role" do
    task_user = create(:task_user)

    expect(task_user.followers?).to eq(true)
  end

  it "destroy task_user when asscociate task is destroyed" do
    task_user = create(:task_user)
    task_user.task.destroy
    expect(TaskUser.all).not_to include(task_user)
  end
end
