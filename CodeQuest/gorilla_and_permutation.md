# Gorilla and Permutation
Question link: [Gorilla and Permutation](https://codeforces.com/contest/1992/problem/C)

credit: codeforces, [noobish_monk](https://codeforces.com/profile/Noobish_Monk)

Gorilla and Noobish_Monk found three numbers 𝑛
, 𝑚
, and 𝑘
 (𝑚<𝑘
). They decided to construct a permutation†
 of length 𝑛
.

For the permutation, Noobish_Monk came up with the following function: 𝑔(𝑖)
 is the sum of all the numbers in the permutation on a prefix of length 𝑖
 that are not greater than 𝑚
. Similarly, Gorilla came up with the function 𝑓
, where 𝑓(𝑖)
 is the sum of all the numbers in the permutation on a prefix of length 𝑖
 that are not less than 𝑘
. A prefix of length 𝑖
 is a subarray consisting of the first 𝑖
 elements of the original array.

For example, if 𝑛=5
, 𝑚=2
, 𝑘=5
, and the permutation is [5,3,4,1,2]
, then:

𝑓(1)=5
, because 5≥5
; 𝑔(1)=0
, because 5>2
;
𝑓(2)=5
, because 3<5
; 𝑔(2)=0
, because 3>2
;
𝑓(3)=5
, because 4<5
; 𝑔(3)=0
, because 4>2
;
𝑓(4)=5
, because 1<5
; 𝑔(4)=1
, because 1≤2
;
𝑓(5)=5
, because 2<5
; 𝑔(5)=1+2=3
, because 2≤2
.
Help them find a permutation for which the value of ($\sum_{i=1}^{n}$𝑓(𝑖) − $\sum_{i=1}^{n}$𝑔(𝑖))
 is maximized.

†
A permutation of length 𝑛
 is an array consisting of 𝑛
 distinct integers from 1
 to 𝑛
 in any order. For example, [2,3,1,5,4]
 is a permutation, but [1,2,2]
 is not a permutation (as 2
 appears twice in the array) and [1,3,4]
 is also not a permutation (as 𝑛=3
, but 4
 appears in the array).


 
Input
```
3
5 2 5
3 1 3
10 3 8
```

Output
```
5 3 4 1 2
3 2 1
10 9 8 4 7 5 6 1 2 3
```
Solution 1: Time Complexity: O(n) with Sapce Complexity: O(n)
```python
def solution(n, m ,k):
    permutation=[n]
    for i in range(1, n - m):
        permutation.append(permutation[i-1] - 1)
    for i in range(m):
        permutation.append(i+1)
    print(permutation)
```

Let 𝑝
 be some permutation. Let's look at the contribution of the number 𝑝𝑖
 to the sum $\sum_{i=1}^{n}$𝑓(𝑖)
. If it is less than 𝑘
, the contribution is 0
, otherwise the contribution is 𝑝𝑖⋅(𝑛−𝑖+1)
. Similarly, let's look at the contribution of 𝑝𝑖
 to the sum $\sum_{i=1}^{n}$𝑔(𝑖)
. If it is greater than 𝑚
, the contribution is 0
, otherwise it is 𝑝𝑖⋅(𝑛−𝑖+1)
. Since 𝑚<𝑘
, each number gives a contribution greater than 0
 in at most one sum. Therefore, it is advantageous to place numbers not less than 𝑘
 at the beginning, and numbers not greater than 𝑚
 at the end. Also, numbers not less than 𝑘
 should be in descending order to maximize the sum of 𝑓(𝑖)
. Similarly, numbers not greater than 𝑚
 should be in ascending order to minimize the sum of 𝑔(𝑖)
.

For example, you can construct such a permutation: 𝑛,𝑛−1,…,𝑘,𝑚+1,𝑚+2,…,𝑘−1,1,2,…,𝑚
. It is easy to see that $\sum_{i=1}^{n}$𝑓(𝑖)
 cannot be greater for any other permutation, and $\sum_{i=1}^{n}$𝑔(𝑖)
 cannot be less for any other permutation, so our answer is optimal.

Solution 2: Time Complexity: O(n) with Sapce Complexity: O(1)
```python
def solution(n, m, k):
    print(*range(n,m,-1), *range(1,m+1))
```