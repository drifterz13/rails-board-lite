FactoryBot.define do
  factory :tasklist do
    title { "tasklist" }
  end

  factory :task do
    title { "task1" }
    tasklist
  end
end

