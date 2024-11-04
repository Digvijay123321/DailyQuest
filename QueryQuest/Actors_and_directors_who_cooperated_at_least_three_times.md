# Actors and Directors Who Cooperated At Least Three Times

**Question link:** [Actors and Directors Who Cooperated At Least Three Times](https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/description/)

credits: Leetcode

## Solution 1:
```sql
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING count(*) > 2;
```