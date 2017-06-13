
def fusc(n):
    if 0 >= n: return 0
    if 1 == n: return 1
    while 0 == n % 2: n /= 2
    return fusc(n / 2) + fusc(n / 2 + 1)
