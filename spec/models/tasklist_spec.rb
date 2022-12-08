require "rails_helper"

RSpec.describe Tasklist do
  it "has many tasks" do
    tasklist = create(:tasklist)
    task = create(:task, tasklist: tasklist)

    expect(tasklist.tasks).to include(task)
  end

  it "must has title" do
    tasklist = build(:tasklist, title: nil)
    expect { tasklist.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Title can't be blank")
  end
end
