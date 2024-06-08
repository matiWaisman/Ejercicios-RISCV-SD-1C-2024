def copiar(s, q, i):
    if(i == 2): # No tiene sentido ver el 1 porque es impar
       s[i-1] = q[i-1]
       return
    if(i % 2 == 0):
        s[i-1] = q[i-1]
    copiar(s,q, i-1)

s = [1, 1, 1, 1, 1, 1, 1, 1]
q = [3, 10, 4, 11, 5, 9, 2, 6] 
print(s)
copiar(s, q, 8)
print(s)