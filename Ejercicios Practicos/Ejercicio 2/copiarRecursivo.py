def copiar(s, q, i):
    if(i == 1):
       s[i-1] = q[i-1]
       return
    s[i-1] = q[i-1]
    copiar(s,q, i-1)

s = [1, 1, 1, 1, 1, 1, 1, 1]
q = [3, 10, 4, 1, 5, 9, 2, 6] 
print(s)
copiar(s, q, 8)
print(s)