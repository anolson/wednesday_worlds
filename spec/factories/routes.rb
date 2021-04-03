# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :route do
    name { "Blacksburg Road" }
    description  { "Out and back on Blackburg Rd." }
  end
end
