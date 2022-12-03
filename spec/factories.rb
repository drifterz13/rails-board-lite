FactoryBot.define do
  factory :tasklist do
    title { "tasklist" }
  end

  factory :task do
    title { "task1" }
    tasklist
  end

  factory :user, aliases: [:assignee] do
    email { "tester@app.com" }
    password { "tester123" }
  end

  factory :task_user do
    task
    user

    trait :assignee do
      role { 1 }
    end

    trait :follower do
      role { 0 }
    end
  end
end
