class Singleton
  # Змінна, яка зберігає єдиний екземпляр класу
  @instance = nil

  private_class_method :new

  # Метод, який повертає єдиний екземпляр класу
  def self.instance
    @instance ||= new
  end

  def some_method
    puts "Calling a method of a unique Singleton instance"
  end
end

# Отримуємо єдиний екземпляр класу
obj1 = Singleton.instance
obj2 = Singleton.instance

puts obj1 == obj2 # Виведе true, оскільки obj1 та obj2 - це один і той же екземпляр

# Виклик методу через один і той самий екземпляр.
obj1.some_method  # => Calling a method of a unique Singleton instance
obj2.some_method  # => Calling a method of a unique Singleton instance

# require 'singleton'
#
# class NotSingleton
#   # 'initialize' is called everytime an instance is created
#   def initialize
#     puts 'This will be printed many times'
#   end
# end
#
# class MySingleton
#   include Singleton
#
#   # 'initialize' is called everytime an instance is created
#   def initialize
#     puts 'This will be printed once'
#   end
# end
#
# NotSingleton.new # => 'This will be printed many times'
#
# MySingleton.instance # => 'This will be printed once'
# MySingleton.instance # Nothing is printed


