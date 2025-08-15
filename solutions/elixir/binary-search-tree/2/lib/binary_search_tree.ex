defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data), do: %{data: data, left: nil, right: nil}

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(tree, data) when data > tree.data do
    case tree.right do
      nil -> %{tree | right: new(data)}
      node -> %{tree | right: insert(node, data)}
    end
  end

  def insert(tree, data) do
    case tree.left do
      nil -> %{tree | left: new(data)}
      node -> %{tree | left: insert(node, data)}
    end
  end
  
  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(nil), do: []
  def in_order(tree), do: in_order(tree.left) ++ [tree.data] ++ in_order(tree.right)
end
