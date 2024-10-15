# Binary Tree Branch Sums
  Write a function that takes in a Binary Tree and returns a list of its branch
  sums ordered from leftmost branch sum to rightmost branch sum.

  A branch sum is the sum of all values in a Binary Tree branch. A Binary Tree
  branch is a path of nodes in a tree that starts at the root node and ends at
  any leaf node.

  Each BinaryTree node has an integer value, a
  left child node, and a right child node. Children
  nodes can either be BinaryTree nodes themselves or
  None / null
```
Input  =   1
        /     \
       2       3
     /   \    /  \
    4     5  6    7
  /   \  /
 8    9 10
```
```
output: [15, 16, 18, 10, 11]
```

```python
class BinaryTree:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None


def branchSums(root):
    stack = [(root, 0)]
    branch_sum=[]
    
    while len(stack) > 0:
        current, sum_value = stack.pop()
        if current.left is None and current.right is None:
            branch_sum.append(sum_value + current.value)
        if current.right is not None:
            stack.append((current.right, sum_value + current.value))    
        if current.left is not None:
            stack.append((current.left, sum_value + current.value))

    return branch_sum
```
### Explanation
This code defines a class `BinaryTree` and a function `branchSums` to calculate the branch sums of a binary tree. The function uses an iterative approach with a stack to traverse the tree and calculate the sums of all branches (paths from the root node to leaf nodes).
### Complexity
- **Time Complexity**: `O(N)`  
  The function visits each node in the binary tree exactly once, where `N` is the number of nodes in the tree. Thus, the time complexity is linear.

- **Space Complexity**: `O(N)`  
  In the worst case (for example, a completely unbalanced tree like a linked list), the stack may hold up to `N` nodes. Therefore, the space complexity is also `O(N)`.

