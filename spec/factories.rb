FactoryBot.define do
  factory :tasklist do
    title { "tasklist" }
  end

  factory :task do
    title { "task1" }
    tasklist
  end

  factory :user, aliases: [:assignees] do
    sequence(:email) { |n| "tester-#{n}@app.com" }
    password { "tester123" }
  end

  factory :task_user do
    task
    user

    trait :assignees do
      role { 1 }
    end

    trait :followers do
      role { 0 }
    end
  end

  factory :room do
    title { "room_1" }
  end

  factory :message do
    body { "content" }
    room
    user
  end

  factory :room_user do
    room
    user
  end
end
