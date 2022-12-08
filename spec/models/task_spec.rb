require "rails_helper"

RSpec.describe Task do
  it "crete a task record successfully" do
    tasklist = create(:tasklist)
    task = create(:task, tasklist: tasklist)
    expect(task.save!).to be true
  end

  it "raise an error when create a task without title" do
    task = build(:task, title: nil)
    expect { task.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Title can't be blank")
  end

  it "raise an error when create a task without tasklist" do
    task = build(:task, tasklist: nil)
    expect { task.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Tasklist must exist")
  end
end
