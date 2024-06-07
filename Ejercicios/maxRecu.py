def maximo(arr, n):
    if(n == 1):
        return arr[0]
    max_anterior = maximo(arr, n-1)
    return max(arr[n - 1], max_anterior)

max = maximo([3, 1, 4, 1, 5, 9, 2, 6], 8)
print(max)
