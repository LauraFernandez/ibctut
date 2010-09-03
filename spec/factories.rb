Factory.sequence(:dog_name) { |n| "string_#{n}" }

Factory.define :dog do |d|
  d.name { Factory.next(:dog_name) }
  d.age 1
end

Factory.define :invalid_dog, :class=>Dog do |d|
 
  d.age 1
end

Factory.sequence(:room_name){ |n| "string_#{n}"}
Factory.sequence(:description_name){ |n| "description_#{n}"}

Factory.define :room do |d|
  d.name {Factory.next(:room_name)}
  d.description {Factory.next(:description_name)}
  d.capacity 300
end
