# First Duplicate Value

```
input = [1, 4, 2, 3, 2, 4]
input = [1, 2, 3, 4, 5, 6]
```

```
output = 2
output = -1
```

## Solution 1
```python
def firstDuplicateValue(array):
    for value in array:
        absolute_value = abs(value)
        if array[absolute_value - 1] < 0:
            return absolute_value
        array[absolute_value - 1] *= -1
    return -1
```

### Complexity
- **Time Complexity**: `O(N)` 

- **Space Complexity**: `O(1)`

## Solution 2:
```python
def firstDuplicateValue(array):
    size = len(array)
    hash_table = dict.fromkeys(range(1, size+1), 0)
    for i in array:
        if hash_table[i] == 0:
            hash_table[i] += 1
        else:
            return i
    return -1
```


### Complexity
- **Time Complexity**: `O(N)` 

- **Space Complexity**: `O(N)`
