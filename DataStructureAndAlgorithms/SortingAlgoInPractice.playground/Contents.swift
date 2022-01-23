import UIKit

class Shell {
    
     /*
     Shell sort works on insertion sort but in insertion sort we move element one position ahead.
     when an element has to move far ahead many comparison and swap operations required.
     
     The idea of shell sort is to move far items by using gap sequence.
     */
    
     /*
     Time and space complixity
     
     Best case:- O(n)
     Worst Case :- O(n^2)
     
     Space :- O(1) no extra space required
     Not stable.
     */
    
    class func sort(arr : inout [Int]) -> [Int]{
        //1. Calculate gap.
        var gap = arr.count/2
        while gap >= 1 {
            //2. Loop from j means second item to end by comparing each item.
            for j in gap..<arr.count {
                //3. Get i gap positions before J.
                for i in stride(from: j-gap, through: 0, by: -gap){
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

//var arr = [12, 34, 54, 2, 3]
//let sortedArr = Shell.sort(arr: &arr)
//print("\(sortedArr)")


class Counting {
    /*
     works :- is a sorting technique based on keys between a specific range
     works by counting the number of occurance of each element in the array.
     */
    
    /*
     Time and space complixity
     first loop = O(n)
     second loop = O(r)
     third loop = O(n)
     forth loop = O(n)
     
     Total = O(3n+k) = O(n+r)

     Worst complexity: n+r
     Average complexity: n+r
     Space complexity: n+r
     
     IS Stable = yes
     
     Note :- Does not work on floating and negative values.
     */
    
    class func sort(arr : inout [Int]) -> [Int] {
        
        var b = arr
        var count = [0,0,0,0,0,0,0,0,0,0]

        //1. Get the number of occurance of each item
        for i in 0..<arr.count {
            count[arr[i]] += 1
        }
        
        //2. Get postions
        for i in 1..<count.count {
            count[i] += count[i-1]
        }
        
        //3. Look in to base arr and check in count arr then decrement and put item in b arr.
        for i in stride(from: arr.count-1, through: 0, by: -1) {
            let pos = count[arr[i]]-1
            count[arr[i]] -= 1
            b[pos] = arr[i]
        }

        //4. Set data to main arr
        for i in 0..<b.count {
            arr[i] = b[i]
        }
        
        return arr
    }
}

//var arr = [2, 1, 5, 2, 3,4]
//let sortedArr = Counting.sort(arr: &arr)
//print("\(sortedArr)")


class Redix {
    /*
     It uses counting sort as subroutine.
     
     Need to get positions for items from zero to succeding.
     */
    
    func sort(arr : inout [Int]) -> [Int] {
        guard let max = arr.max() else { return []}
        var pos = 1
        while max/pos > 0 {
            arr = countingSort(arr: &arr,pos : pos)
            pos = pos*10
        }
        return arr
    }
    
    func countingSort(arr : inout [Int],pos : Int) -> [Int]{
        //Array to hold sorted data
        var b = arr
        var count = [0,0,0,0,0,0,0,0,0,0]
        
        //1. Get count occurance of each item
        for i in 0..<arr.count {
            let index = (arr[i]/pos)%10
            count[index] += 1
        }

        //2. Get postions
        for i in 1..<count.count {
            count[i] += count[i-1]
        }
        
        //3. Place item from main array by looking its position in count array then put it in sorted arr.
        for i in stride(from: arr.count-1, through: 0, by: -1) {
            let pos = (arr[i]/pos)%10
            count[pos] -= 1
            b[count[pos]] = arr[i]
        }
        //4. Get final array
        for i in 0..<arr.count {
            arr[i] = b[i]
         }
        
        return arr
    }
}

//var arr = [211, 11, 52, 211, 334,423]
//let sortedArr = Redix().sort(arr: &arr)
//print("\(sortedArr)")

class Heap {
    
    /*
     1. Heap sort their are two steps
     a. Create a heap.
     b. Delete the heap.
     
     
     Time and space complixity .
     Height log binary tree = O(logn)
     Time taken to add 1 item in heap is O(logn)
     Time taken to add n item in heap is O(n logn)

     Best Case :- O(n logn)
     Worst Case :- O(n logn)

     Space complixity :- O(1)
     Is stable
     */
    
    class func sort(arr : inout [Int], n : Int) -> [Int]{
        //Start from first parent node leave all leaves node = ()
//        for i in stride(from: n/2, through: 0, by: -1) {
//            maxHeapify(arr: &arr, n: n, i: i)
//        }
        
        for i in stride(from: (n/2), through: 0, by: -1) {
            print(i)
            maxHeapify(arr: &arr, n: n, i: i)
        }
        
        print(arr)

        //Delete from heap
        for i in stride(from: n-1, through: 0, by: -1){
            arr.swapAt(i, 0)
            maxHeapify(arr: &arr, n: i, i: 0)
        }
        return arr
    }
    
    class func maxHeapify(arr : inout [Int], n : Int ,i : Int){
        var largest = i
        let left = 2*i
        let right = (2*i)+1
        
        while (left < n && arr[left] > arr[largest]) {
            largest = left
        }
        
        while (right < n && arr[right] > arr[largest]) {
            largest = right
        }

        if largest != i {
            arr.swapAt(largest, i)
            maxHeapify(arr: &arr, n: n, i: largest)
        }
    }
}


class HeapRe {
    class func sort(arr : inout [Int], n : Int) -> [Int]{
        //Create a Heap
        for i in stride(from: n/2, through: 0, by: -1) {
            maxHeapify(arr: &arr, n: n, i: i)
        }
        
        print(arr)
        //Delete a Heap
        for i in stride(from: n-1, through: 0, by: -1) {
            arr.swapAt(i, 0)
            maxHeapify(arr: &arr, n: i, i: 0)
        }
        return arr
    }
    
    private class func maxHeapify(arr : inout [Int], n : Int, i : Int) {
        var largest = i
        let left = 2 * i
        let right = (2*i)+1
        
        while (left < n && arr[left] > arr[largest]){
            largest = left
        }
        
        while (right < n &&  arr[right] > arr[largest]){
            largest = right
        }
        
        if largest != i {
            arr.swapAt(largest, i)
            maxHeapify(arr: &arr, n: n, i: largest)
        }
    }
}

var arr = [211, 11, 52, 211, 334,423]
let sortedArr = HeapRe.sort(arr: &arr,n: arr.count)
print(sortedArr)

//var arr = [211, 11, 52, 211, 334,423]
//let sortedArr = Heap.sort(arr: &arr, n: arr.count)
//print("\(sortedArr)")

class Merge {
    /*
     Merge sort works on divide and concour technique
     1. Divide
     2. Merge
     
     Time complexity :-
     Divide :- O(1)
     merge recursion :- T(n/2) + T(n/2) + n = 2T(n/2) = O(n logn)
     */
    
    /*
     Best case :-
       T(n) =  T(n/2) + T(n/2) + n = 2T(n/2) = O(nlogn)
     */
    
    /*
      Merge sort is stable so it preserve the position of relative position.
      Merge sort is not Inplace require extra space.
      Space complixity = O(n)
     */
    
    class func sort(arr : [Int]) -> [Int]{
        guard arr.count > 1 else {return arr}
        let leftArr = Array(arr[0..<arr.count/2]) //O(1)
        let rightArr = Array(arr[arr.count/2..<arr.count]) //O(1)
        return merge(left: sort(arr: leftArr), right: sort(arr: rightArr))
    }
    
    private class func merge(left : [Int], right : [Int]) -> [Int] {
        var mergedList = [Int]()
        var left = left
        var right = right

        while left.count > 0 && right.count > 0 {
            if left.first! < right.first! {
                mergedList.append(left.removeFirst())
            } else {
                mergedList.append(right.removeFirst())
            }
        }
        return mergedList + left + right
    }
}

//var arr = [211, 11, 52, 211, 334,423]
//let sortedArr = Merge.sort(arr: arr)
//print("\(sortedArr)")

class Quick {
    /*
     This is partition exchange algo.
     */
    
    /*
     Best or Average case time complixity :-
     T(n) = T(n/2) + T(n/2) + n = 2T(n/2) = O(n logn)
     Add n = because it is time taken to scan entire array.
     */
    
    /*
     Worst case time complixity :-
     Recurance relation :- T(n) = 0 + T(n-1) + n = O(n^2)
     Add n = because it is time taken to scan entire array.
     
     In worst case item in left after partition are 0 and items in right are n-1
     */
    
    
    class func sort(arr : inout [Int], lb : Int, ub : Int) {
        if lb < ub {
            let loc = partition(arr: &arr,lb: lb,ub: ub)
            sort(arr: &arr, lb: lb, ub: loc-1)
            sort(arr: &arr, lb: loc+1, ub: ub)
        }
    }
    
    private class func partition(arr : inout [Int], lb : Int, ub : Int) -> Int {
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

//var arr = [211, 11, 52, 211, 334,423]
//Quick.sort(arr: &arr,lb: 0 ,ub: arr.count-1)

class Insertion {
    /*
     Insertion sort works by shifting one item from unsorted array to an sorted array.
     
     Time complixity :-
     Best Case :- O(n)
     
     Number of comparison = O(n)
     Swaps = 0 = O(1)
     
     Worst Case :- O(n^2)
     Number of comparison = O(n)
     Swaps = 1 + 2 + 3 ... + n = n(n+1)/2 = O(n^2)
     
     Average case :- O(n^2)
     
     space complixity :- O(1)
     Insertion sort is stable.
     */
    
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

//var arr = [211, 11, 52, 211, 334,423]
//let sortedArr = Insertion.sort(arr: &arr)
//print(sortedArr)

class Selection {
    
    /*
     Works by selecting one minimum in a single iteration and then place it on proper location.
     
     Time Complexity :-
     Best Case :- O(N^2)
     Worst Case :- O(N^2)
     Average Case :- O(N^2)

     OuterLoop :- O(n)
     Inner loop :- n + (n-1) + (n-2) + .... 1 = n(n+1)/2 = O(n^2)
     
     Seleciton sort is not stable.
     Space Complixity :- O(1) no extra space is required.
     */
    
    
    class func sort(arr : inout [Int]) -> [Int] {
        for i in 0..<arr.count {
            var min = arr[i]
            var pos = i
            for j in i..<arr.count {
                if arr[j] < min {
                    min = arr[j]
                    pos = j
                }
            }
            
            if min != arr[i] {
                arr.swapAt(i, pos)
            }
        }
        return arr
    }
    
}

//var arr = [211, 11, 52, 211, 334,423]
//let sortedArr = Selection.sort(arr: &arr)
//print(sortedArr)

class Bubble {
    /*
     It works by comparing adjacent items.
     
     Time Complexity :-
     Best Case:- O(n)
     Worst Case :- O(N^2)
     Average Case :- O(N^2)

     Is not stable
     Space complixity :- O(1)
     
     */
    class func sort(arr : inout [Int]) -> [Int] {
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

//var arr = [211, 11, 52, 211, 334,423]
//let sortedArr = Bubble.sort(arr: &arr)
//print(sortedArr)

class QuickRe{
    /*
     time and space complixity :-
     
     Space complixity :- O(1)
     Best case :- T(n/2) + T(n/2) + n = O(n logn)
     worst Case :- O(n^2)
     
     */
    class func sort(arr : inout [Int],lb : Int, ub : Int){
        if lb < ub {
            let pos = partition(arr: &arr,lb: 0, ub: ub) //O(1)
            Quick.sort(arr: &arr, lb: lb, ub: pos-1) //O(1)
            Quick.sort(arr: &arr, lb: pos+1, ub: ub) // T(n/2) + T(n/2)
        }
    }
    
    class func partition(arr : inout [Int],lb : Int, ub : Int) -> Int {
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

//var arr = [211, 11, 52, 211, 334,423]
//QuickRe.sort(arr: &arr,lb: 0,ub: arr.count-1)

class MergeRe {
    class func sort(arr : [Int]) -> [Int] {
        guard arr.count > 1 else {return arr}
        let leftArr = Array(arr[0..<arr.count/2])
        let rightArr = Array(arr[arr.count/2..<arr.count])
        return merge(leftArr: sort(arr: leftArr), rightArr: sort(arr: rightArr))
    }
    
    private class func merge(leftArr : [Int], rightArr : [Int]) -> [Int]{
        var mergedArr = [Int]()
        var leftArr = leftArr
        var rightArr = rightArr
        
        while leftArr.count != 0 && rightArr.count != 0 {
            if leftArr.first! < rightArr.first!{
                mergedArr.append(leftArr.removeFirst())
            } else {
                mergedArr.append(rightArr.removeFirst())
            }
        }
        
        return mergedArr + leftArr + rightArr
    }
}

//var arr = [211, 11, 52, 211, 334,423]
//let sortedArr = MergeRe.sort(arr: arr)
//print(sortedArr)

