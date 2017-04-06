FactoryGirl.define do
  factory :address do
    url { FFaker::Internet.http_url }

    after(:build, :create) { |address| address.short = address.shorten }
  end
end
