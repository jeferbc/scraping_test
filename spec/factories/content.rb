FactoryGirl.define do
  factory :content do
    tag { "h1" }
    content { "test" }
    webpage
  end
end
