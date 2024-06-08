def binary(arr, n, target):
    low = 0
    high = n - 1
    while low <= high:
        mid = low + (high - low) // 2
        if arr[mid] == target:
            return mid + 1
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    return -1

arr = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
res = binary(arr, len(arr), 1)
print(res)
    