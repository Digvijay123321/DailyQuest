# Test of love
Question link: [Test of love](https://codeforces.com/contest/1992/problem/D)

credit: codeforces, [noobish_monk](https://codeforces.com/profile/Noobish_Monk)

ErnKor is ready to do anything for Julen, even to swim through crocodile-infested swamps. We decided to test this love. ErnKor will have to swim across a river with a width of 1
 meter and a length of 𝑛
 meters.

The river is very cold. Therefore, in total (that is, throughout the entire swim from 0
 to 𝑛+1
) ErnKor can swim in the water for no more than 𝑘
 meters. For the sake of humanity, we have added not only crocodiles to the river, but also logs on which he can jump. Our test is as follows:

Initially, ErnKor is on the left bank and needs to reach the right bank. They are located at the 0
 and 𝑛+1
 meters respectively. The river can be represented as 𝑛
 segments, each with a length of 1
 meter. Each segment contains either a log 'L', a crocodile 'C', or just water 'W'. ErnKor can move as follows:

* If he is on the surface (i.e., on the bank or on a log), he can jump forward for no more than 𝑚
 (1≤𝑚≤10
) meters (he can jump on the bank, on a log, or in the water).
* If he is in the water, he can only swim to the next river segment (or to the bank if he is at the 𝑛
-th meter).
* ErnKor cannot land in a segment with a crocodile in any way.

Determine if ErnKor can reach the right bank.

## Input
```
6
6 2 0
LWLLLW
6 1 1
LWLLLL
6 1 1
LWLLWL
6 2 15
LWLLCC
6 10 0
CCCCCC
6 6 1
WCCCCW
```

## Output
```
YES
YES
NO
NO
YES
YES
```

## Solution:
```python
def solution(river, n, m, k):
    logs = [ i for i in range(n) if river[i] == 'L']    # list of safe indexes
    logs.append(n+1)                                    # adding log as shore at end of river
    i = -1
    next_log = 0
    while i < n-1:                                      
        if m >= logs[next_log] - i:                     # if you can jup over log
            i = logs[next_log]
        else:
            i += m
            if i > n-1:                                 # if you reached other shore
                print("YES")
                return
            while i < n and i < logs[next_log]:
                if river[i] != "C" and k > 0:           # checking if you can swim the wanter
                    i += 1                              
                    k -= 1                              # update k
                else:
                    print("NO")
                    return
        next_log += 1
    print("YES")
```