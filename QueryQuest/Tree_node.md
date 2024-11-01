# Tree Node

**Question link:** [Tree Node](https://leetcode.com/problems/tree-node/description/)

credits: Leetcode


```sql
SELECT id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id IN (SELECT p_id FROM Tree)THEN 'Inner'
        ELSE 'Leaf'
        END AS type
FROM Treeame = 'RED';
```