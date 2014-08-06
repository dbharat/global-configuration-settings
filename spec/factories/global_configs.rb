FactoryGirl.define do
  factory :test_global_config do
    name       { Faker::Lorem.word }
    value      { Faker::Lorem.word }
    value_type { :string }

    factory :test_global_config_integer do
      value      { rand(1000).to_s }
      value_type { :integer }
    end

    factory :test_global_config_float do
      value      { rand.to_s }
      value_type { :float }
    end

    factory :test_global_config_boolean do
      value      { (rand > 0.5).to_s }
      value_type { :boolean }
    end
  end
end