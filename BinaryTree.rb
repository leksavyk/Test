class Node
  attr_accessor :key, :left, :right
  def initialize(key)
    @key = key
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  # Вставка елемента в дерево
  def insert(key)
    @root = insert_recursive(@root, key)
  end

  # Пошук елемента в дереві
  def search(key)
    search_recursive(@root, key)
  end

  # Видалення елемента з дерева
  def delete(key)
    @root = delete_recursive(@root, key)
  end

  # Інфіксний обхід дерева
  def inorder_traversal
    inorder_recursive(@root)
  end

  # Префіксний (прямий) обхід дерева
  def preorder_traversal
    preorder_recursive(@root)
  end

  # Постфіксний (зворотний) обхід дерева
  def postorder_traversal
    postorder_recursive(@root)
  end

  # Вивід дерева на екран (для наглядності)
  def tree_print(node, n)
    return if node.nil?
    # Рекурсивний виклик для правого піддерева
    tree_print(node.right, n + 5)
    # Відступ від лівого краю залежить від рівня в дереві
    print ' ' * n
    # Виведення значення кореня
    puts node.key
    # Рекурсивний виклик для лівого піддерева
    tree_print(node.left, n + 5)
  end

  private

  # Рекурсивна вставка елемента в дерево
  def insert_recursive(root, key)
    return Node.new(key) if root.nil?

    if key < root.key
      root.left = insert_recursive(root.left, key)
    elsif key > root.key
      root.right = insert_recursive(root.right, key)
    end

    root
  end

  # Рекурсивний пошук елемента в дереві
  def search_recursive(root, key)
    return false if root.nil?

    if key == root.key
      return true
    elsif key < root.key
      return search_recursive(root.left, key)
    else
      return search_recursive(root.right, key)
    end
  end

  # Рекурсивне видалення елемента з дерева
  def delete_recursive(root, key)
    return root if root.nil?

    if key < root.key
      root.left = delete_recursive(root.left, key)
    elsif key > root.key
      root.right = delete_recursive(root.right, key)
    else
      # Вузол з одним нащадком або без нащадків
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      # Вузол з двома нащадками
      root.key = min_value_node(root.right).key
      root.right = delete_recursive(root.right, root.key)
    end

    root
  end

  # Рекурсивний інфіксний обхід дерева
  def inorder_recursive(root)
    return [] if root.nil?

    inorder_recursive(root.left) + [root.key] + inorder_recursive(root.right)
  end

  # Рекурсивний префіксний обхід дерева
  def preorder_recursive(root)
    return [] if root.nil?

    [root.key] + preorder_recursive(root.left) + preorder_recursive(root.right)
  end

  # Рекурсивний постфіксний обхід дерева
  def postorder_recursive(root)
    return [] if root.nil?

    postorder_recursive(root.left) + postorder_recursive(root.right) + [root.key]
  end

  # Знаходження вузла з мінімальним значенням в дереві
  def min_value_node(node)
    current = node
    current = current.left until current.left.nil?
    current
  end
end

# Приклад використання
bst = BinarySearchTree.new
bst.insert(50)
bst.insert(30)
bst.insert(20)
bst.insert(40)
bst.insert(70)
bst.insert(60)
bst.insert(80)

puts "Бінарне дерево"
bst.tree_print(bst.root, 0)
# інфіксний обхід
puts "\nІнфіксний обхід: #{bst.inorder_traversal}" # => [20, 30, 40, 50, 60, 70, 80]
puts "Прямий обхід: #{bst.preorder_traversal}" # => [50, 30, 20, 40, 70, 60, 80]
puts "Зворотний обхід: #{bst.postorder_traversal}" # => [20, 40, 30, 60, 80, 70, 50]

puts "Пошук 40: #{bst.search(40) ? 'Знайшли' : 'Не знайшли'}" # => Found
bst.delete(40)
puts "Інфіксний обхід після видалення (видалити 40): #{bst.inorder_traversal}" # => [20, 30, 50, 60, 70, 80]