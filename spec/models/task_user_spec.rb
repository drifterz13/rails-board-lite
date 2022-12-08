require "rails_helper"

RSpec.describe TaskUser do
  it "has default followers role" do
    task_user = create(:task_user)

    expect(task_user.followers?).to be(true)
  end

  it "destroy task_user when asscociate task is destroyed" do
    task_user = create(:task_user)
    task_user.task.destroy
    expect(described_class.all).not_to include(task_user)
  end
end
