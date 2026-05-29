class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        s_list = [i for i in s]
        if s == '':
            return True
        j = 0
        for i in t:
            if i == s_list[j]:
                j += 1
                if len(s_list) == j:
                    return True
        return False