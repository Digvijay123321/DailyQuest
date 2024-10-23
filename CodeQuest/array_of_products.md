# Array Of Products

```
input = [1, 2, 3, 4]
```

```
output = [24, 12, 8, 6]
// 24 = 2 * 3 * 4
// 12 = 1 * 3 * 4
// 8 = 1 * 2 * 4
// 6 = 1 * 2 * 3
```
```python
def arrayOfProducts(array):
    products = [1 for _ in range(len(array))]
    
    running_product_left = 1
    for i in range(len(array)):
        products[i] = running_product_left
        running_product_left *= array[i]
        
    running_product_right = 1
    for i in reversed(range(len(array))):
        products[i] *= running_product_right
        running_product_right *= array[i]
    return products
```

### Complexity
- **Time Complexity**: `O(N)`  
  The function iterates through the array twice (left and right pass), so it’s linear.

- **Space Complexity**: `O(N)`  
  It uses an additional array `products` of the same size as the input array, making space complexity linear.
