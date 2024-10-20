# Only Pluses
Question link: [Only Pluses](https://codeforces.com/contest/1992/problem/A)

credit: codeforces, [noobish_monk](https://codeforces.com/profile/Noobish_Monk)

Kmes has written three integers 𝑎
, 𝑏
 and 𝑐
 in order to remember that he has to give Noobish_Monk 𝑎×𝑏×𝑐
 bananas.

Noobish_Monk has found these integers and decided to do the following at most 5
 times:

pick one of these integers;
increase it by 1
.
For example, if 𝑎=2
, 𝑏=3
 and 𝑐=4
, then one can increase 𝑎
 three times by one and increase 𝑏
 two times. After that 𝑎=5
, 𝑏=5
, 𝑐=4
. Then the total number of bananas will be 5×5×4=100
.

What is the maximum value of 𝑎×𝑏×𝑐
 Noobish_Monk can achieve with these operations?
 
Input
```
2
2 3 4
10 1 10
```

Output
```
100
600
```

```python
def solution(a, b, c):
    noobish_monk_bananas = sorted([a, b, c])
    for i in range(5):
        noobish_monk_bananas[0] += 1
        noobish_monk_bananas.sort()
    return noobish_monk_bananas[0] * noobish_monk_bananas[1] * noobish_monk_bananas[2]
```
