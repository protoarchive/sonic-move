FactoryGirl.define do
  factory :user do
    username "Janedoe"
    email "jane@nowhere.org"
    password_digest "secret"
  end

end
