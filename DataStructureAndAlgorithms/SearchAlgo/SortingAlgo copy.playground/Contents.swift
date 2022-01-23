import UIKit

class Bubble {
    // Time complixity :- O(n^2)
    // Space complixity :- O(1)
    class func sort(arr : inout [Int]) -> [Int]{
        for i in 0..<arr.count {
            for j in 0..<arr.count {
                if arr[i] < arr[j] {
                    arr.swapAt(i, j)
                }
            }
        }
        return arr
    }
}

//var arr = [4,3,6,4,8,1,2,945,32]
//let sortedArr = Bubble.sort(arr: &arr)
//print(sortedArr)

class Selection {
    //Time complixity :- O(N^2)
    class func sort(arr : inout [Int]) -> [Int]{
        for i in 0..<arr.count {
            var min = arr[i]
            var index = i
            for j in i..<arr.count {
                if arr[j] < min {
                    min = arr[j]
                    index = j
                }
            }
            
            if min != arr[i] {
                arr.swapAt(i, index)
            }
        }
        return arr
    }
}

//var arr = [4,3,6,4,8,1,2,945,32]
//let sortedArr = Selection.sort(arr: &arr)
//print(sortedArr)

class Insertion {
    //Time complixity :- O(N^2)
    class func sort(arr : inout [Int]) -> [Int] {
        for i in 1..<arr.count {
            let temp = arr[i]
            var j = i-1
            while j >= 0 && arr[j] > temp {
                arr[j+1] = arr[j]
                j -= 1
            }
            arr[j+1] = temp
        }
        return arr
    }
}

//var arr = [4,3,6,4,8,1,2,945,32]
//let sortedArr = Insertion.sort(arr: &arr)
//print(sortedArr)

class Quick{
    class func sort(arr : inout [Int], lb : Int, ub : Int) {
        if lb < ub {
            let position = partition(arr: &arr, lb: lb, ub: ub)
            Quick.sort(arr: &arr, lb: lb, ub: position-1)
            Quick.sort(arr: &arr, lb: position+1, ub: ub)
        }
    }
    
    class func partition(arr : inout [Int], lb : Int, ub : Int) -> Int {
        let pivot = arr[ub]
        var i = lb
        
        for j in lb..<ub {
            if arr[j] <= pivot {
                arr.swapAt(i, j)
                i += 1
            }
        }
        
        arr.swapAt(i, ub)
        return i
    }
}

var arr = [4,3,6,4,8,1,2,945,32]
Quick.sort(arr: &arr,lb: 0, ub: arr.count-1)

class Merge {
    //TIme complixity :- O(n logn)
    //Worst Case :-
    class func sort(arr : [Int]) -> [Int] {
        guard arr.count > 1 else {return arr}
        let mid = arr.count/2
        let leftArray = Array(arr[0..<mid])
        let rightArray = Array(arr[mid..<arr.count])
        return merge(left: sort(arr: leftArray), right: sort(arr: rightArray))
    }
    
    private class func merge(left : [Int], right : [Int]) -> [Int] {
        var b = [Int]()
        var leftArr = left
        var rightArr = right
        
        while leftArr.count > 0 && rightArr.count > 0 {
            if leftArr.first! < rightArr.first! {
                b.append(leftArr.removeFirst())
            } else {
                b.append(rightArr.removeFirst())
            }
        }
        return b + leftArr + rightArr
    }
}

//var arr = [4,3,6,4,8,1,2,945,32]
//let sortedArr = Merge.sort(arr: arr)
//print(sortedArr)

class Heap  {
    class func sort(arr : inout [Int], n : Int) -> [Int]{
        //1. Create a max heap
        for i in stride(from: n/2, through: 0, by: -1) {
            maxHeapify(arr: &arr, i: i,n: n)
        }
        
        //2.Delete item from heap
        for i in stride(from: n-1, through: 0, by: -1) {
            arr.swapAt(i, 0)
            maxHeapify(arr: &arr, i: 0,n: i)
        }
        
        return arr
    }
    private class func maxHeapify(arr : inout [Int], i : Int, n : Int){
        var largest = i
        let left = 2*i
        let right = 2*i+1
        
        while left < n && arr[left] > arr[largest] {
            largest = left
        }
        
        while right < n && arr[right] > arr[largest] {
            largest = right
        }
        
        if largest != i {
            arr.swapAt(i, largest)
            maxHeapify(arr: &arr, i: largest, n: n)
        }
    }
}

//var arr = [4,3,6,4,8,1,2,945,32]
//let sortedArr = Heap.sort(arr: &arr,n : arr.count)
//print(sortedArr)

class Shell {
    class func sort(arr : inout [Int]) -> [Int]{
        var gap = arr.count/2
        while gap > 0 {
            for j in gap..<arr.count {
                for i in stride(from: j-gap, through: 0, by: -gap) {
                    if arr[j] < arr[i] {
                        arr.swapAt(i, j)
                    } else {
                        break
                    }
                }
            }
            gap = gap/2
        }
        return arr
    }
}

//var arr = [4,3,6,4,8,1,2,945,32]
//let sortedArr = Shell.sort(arr: &arr)
//print(sortedArr)
