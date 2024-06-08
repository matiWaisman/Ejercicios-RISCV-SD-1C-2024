def binary(arr, low, high, target):
    if(low > high):
        return -1
    mid = low + (high - low) // 2
    if(arr[mid] == target):
        return mid + 1
    if(arr[mid] < target):
        return binary(arr, mid + 1, high, target)
    else:
        return binary(arr, low, mid - 1, target)

arr = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
res = binary(arr, 0, len(arr) - 1, 0)
print(res)
    