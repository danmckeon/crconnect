FactoryGirl.define do
  factory :user do
    name "Coffee"
    is_admin? true
    password "beans"
    email "beans@beans.com"
  end

  factory :bad_user, class: User do
    name "Java"
    password "beans"
  end

end
