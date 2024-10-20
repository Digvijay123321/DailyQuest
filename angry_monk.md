# Angry Monk
Question link: [Angry Monk](https://codeforces.com/contest/1992/problem/B)

credit: codeforces, [noobish_monk](https://codeforces.com/profile/Noobish_Monk)

To celebrate his recovery, k1o0n has baked an enormous 𝑛
 metres long potato casserole.

Turns out, Noobish_Monk just can't stand potatoes, so he decided to ruin k1o0n's meal. He has cut it into 𝑘
 pieces, of lengths 𝑎1,𝑎2,…,𝑎𝑘
 meters.

k1o0n wasn't keen on that. Luckily, everything can be fixed. In order to do that, k1o0n can do one of the following operations:

Pick a piece with length 𝑎𝑖≥2
 and divide it into two pieces with lengths 1
 and 𝑎𝑖−1
. As a result, the number of pieces will increase by 1
;
Pick a slice 𝑎𝑖
 and another slice with length 𝑎𝑗=1
 (𝑖≠𝑗
) and merge them into one piece with length 𝑎𝑖+1
. As a result, the number of pieces will decrease by 1
.
Help k1o0n to find the minimum number of operations he needs to do in order to merge the casserole into one piece with length 𝑛
.

For example, if 𝑛=5
, 𝑘=2
 and 𝑎=[3,2]
, it is optimal to do the following:

Divide the piece with length 2
 into two pieces with lengths 2−1=1
 and 1
, as a result 𝑎=[3,1,1]
.
Merge the piece with length 3
 and the piece with length 1
, as a result 𝑎=[4,1]
.
Merge the piece with length 4
 and the piece with length 1
, as a result 𝑎=[5]
.
 
Input
```
4
5 3
3 1 1
5 2
3 2
11 4
2 3 1 5
16 6
1 6 1 1 1 6

```

Output
```
2
3
9
15

```
Solution 1: O(nlog(n))
```python
def solution(n, a):
    a = sorted(a)
    largest_slice = a[-1]
    operations = 0
    for i in range(len(a)-1):
        if a[i] != 1:
            operations += a[i] - 1
    return operations - largest_slice + n
```

Let's say we want to connect two casseroles with lengths 𝑥 and 𝑦
. We can disassemble one of them into pieces of length 1 and then attach them to the casserole of size 𝑦
. In total, we will perform 𝑥−1 operations plus x operations to add all 1's to y so that will be 2x - 1. Since we want to connect 𝑘 pieces, at least 𝑘−1 of them will have to be disassembled and then attached to something. If we attach something to a piece, there is no point in disassembling it, because to disassemble it, we will need to remove these pieces as well. Therefore, we want to choose a piece to which we will attach all the others. It will be optimal to choose a piece with the maximum size and attach everything to it. Thus, the answer is 2⋅(𝑛−𝑚𝑥)−𝑘+1 , where 𝑚𝑥 − the length of the maximum piece.

Solution 2: O(n)
```python
def solution(n, a):
    largest_slice = max(a)
    return (n - largest_slice) * 2 - (len(a) - 1)
```