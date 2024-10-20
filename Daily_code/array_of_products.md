# Array Of Products
Write a function that takes in a non-empty array of integers and returns an array of the same length, where each element in the output array is equal to the product of every other number in the input array.

Note that you're expected to solve this problem without using division.

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
### Explanation
The function `arrayOfProducts` creates an array where each element is the product of all other elements in the input array without using division.

1. **Initialization**: It creates a `products` array initialized to `1` for storing results.
2. **Left Pass**: It iterates from left to right, storing the cumulative product of elements before each index.
3. **Right Pass**: It iterates from right to left, multiplying each element in `products` by the cumulative product of elements after each index.

### Complexity
- **Time Complexity**: `O(N)`  
  The function iterates through the array twice (left and right pass), so it’s linear.

- **Space Complexity**: `O(N)`  
  It uses an additional array `products` of the same size as the input array, making space complexity linear.
