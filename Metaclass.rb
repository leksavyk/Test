class Animal
  def generic_sound
    puts "Some generic animal sound"
  end
end

dog1 = Animal.new
cat = Animal.new

# Додаємо метод тільки для об'єкта dog
class << dog1
  def bark
    puts "Woof! Woof!"
  end
end

# Додаємо метод тільки для об'єкта cat
class << cat
  def meow
    puts "Meow! Meow!"
  end
end

# Викликаємо методи
dog1.bark  # => "Woof! Woof!"
cat.meow  # => Meow! Meow!

# (помилка, оскільки метод додано тільки для cat)
dog1.meow  # NoMethodError

# Викликаємо метод для іншого об'єкта того ж класу
# (буде помилка, оскільки для цього об'єкта метод не було додано)
dog2 = Animal.new
dog2.bark  # NoMethodError



