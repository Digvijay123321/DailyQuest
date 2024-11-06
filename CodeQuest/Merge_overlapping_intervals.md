# Merge Overlapping Intervals

```
input = [[1, 2], [3, 6], [4, 5], [4, 8], [9, 10]]
```

```
output = [[1, 2], [3, 8], [9, 10]]
```

## Solution 1
```python
def mergeOverlappingIntervals(intervals):
    merged_list = []
    intervals.sort()
    for i in range(len(intervals)-1):
        if intervals[i][1] >= intervals[i+1][0]:
            min_ele = min(intervals[i][0], intervals[i][1], intervals[i+1][0], intervals[i+1][1])
            max_ele = max(intervals[i][0], intervals[i][1], intervals[i+1][0], intervals[i+1][1])
            intervals[i+1][0] = min_ele
            intervals[i+1][1] = max_ele
        else:
            merged_list.append(intervals[i])
        if i == len(intervals)-2:
            merged_list.append(intervals[i+1])
    return merged_list
```

### Complexity
- **Time Complexity**: `O(Nlog(N))` 

- **Space Complexity**: `O(N)`