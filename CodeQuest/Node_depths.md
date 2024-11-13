# Node Depths

Input
```
Tree =    1
       /     \
      2       3
    /   \   /   \
   4     5 6     7
 /   \
8     9

```

Output
```
16
# node 2, 3 has depth of 1
# node 4, 5, 6, 7 has depth of 2
# node 8, 9 has depth of 3
# thus output = 1 + 1 + 2 + 2 + 2 + 2 + 3 + 3 = 16
```
Solution 1: O(nlog(n))
```python
def nodeDepths(root, depth = 0):
    if root is None:
        return 0
    return depth + nodeDepths(root.left, depth + 1) + nodeDepths(root.right, depth + 1)
```