import UIKit

//If no extra same is needed same as base size then space complixity is O(1) else O(n)

class Bubble {
    //Time complixity Worst Case :- is 0(n^2)
    //Time complixity Best Case :- is 0(n)
    
    /*
     Worst case
     Comparison :-  n-1,n-2,n-3.....1 = n(n+1)/2 = n(n^2)
     Swaps :- n-1,n-2,n-3.....1 = n(n+1)/2 = n(n^2)
     */

    class func sort(arr : [Int]) -> [Int] {
        var outputArr = arr
        for _ in 0..<outputArr.count {
            for j in 0..<outputArr.count-1 {
                if (outputArr[j+1] < outputArr[j]) {
                    let temp = outputArr[j+1]
                    outputArr[j+1] = outputArr[j]
                    outputArr[j] = temp
                }
            }
        }
        return outputArr
    }
}

//let arr = [45,12,34,7,78,65,4,89,43]
//let sortedArr = Bubble.sort(arr: arr)
//print(sortedArr)

    
class Selection{
    //Time complixity Worst Case :- is 0(n^2)
    //Time complixity Best Case :- is 0(n^2)
    
    /*
     Best case :-
     Comparision :- (n-1),(n-2),(n-3)...n = n(n-1)/2 = O(n^2)
     Swaps :- 0 = O(1)
     
     overall :- (n^2)
     */
    
    /*
     Worst case :-
     Comparision :- (n-1),(n-2),(n-3)...n = n(n-1)/2 = )(n^2)
     Swaps :- 1,1,1,1 = O(n)
     
     overall :- (n^2)
     */
    
    /*
     Average case :-
     Comparision :- (n-1),(n-2),(n-3)...n = n(n-1)/2 = )(n^2)
     Swaps :- 1,1,1,1 = O(n)
     
     overall :- (n^2)
     */
    
     /*
      Selection sort is In place no extra space is required.
      Selection sort is not stable. (Relative position chages)
     */
    
    class func sort(arr : [Int]) -> [Int]{
        var sortedArr = arr
        for i in 0..<sortedArr.count {
            var min = sortedArr[i]
            var index = i
            for j in i..<sortedArr.count {
                if min > sortedArr[j] {
                    min = sortedArr[j]
                    index = j
                }
            }
            if min != sortedArr[i] {
                let temp = sortedArr[index]
                sortedArr[index] = sortedArr[i]
                sortedArr[i] = temp
            }
        }
        return sortedArr
    }
}




class Insertion {
     /*
     Best case time complixity is O(n)
     for [10,20,30,40,50,60]
     number of comparison = O(n)
     and number of swaps = 0
     so inbest case time complixity is O(n)
     */
    
    
     /*
     Worst case :-
     Comparison :- 1,2,3,4,5.....n
     swap :- 1,2,3,4,5......n
     
     this can be written as n(n+1)/2
     which is O(n^2)
     */
    
    
     /*
     Average case :- O(n^2)
     */
    
     /*
     Insertion sort is stable = Change position of same elements
     Insertion sort is in place = Need extra space
     */
     
    
    class func sort(arr : [Int]) -> [Int] {
        var sortedArr = arr
        for i in 1..<sortedArr.count { //let say one item in sorted arr.
            let temp = sortedArr[i]
            var j = i-1
            while (j >= 0) && (temp < sortedArr[j]) {
                sortedArr[j+1] = sortedArr[j]
                j -= 1
            }
            sortedArr[j+1] = temp
        }
        return sortedArr
    }
}


//let arr = [45,12,34,7,78,65,4,89,43]
//let sortedArr = Insertion.sort(arr: arr)
//print(sortedArr)

class Quick {
    /*
        Partition exchange sort
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
    
    func sort(arr : inout [Int],lb :Int, ub : Int) {
        if lb < ub {
            let loc = partitionWithHigh(arr: &arr, lb: lb, ub: ub)
            Quick().sort(arr: &arr, lb: lb, ub: loc-1)
            Quick().sort(arr: &arr, lb: loc+1, ub: ub)
            print("---------\(arr)")
        }
    }
    
    private func partitionWithHigh(arr : inout [Int], lb : Int, ub : Int) -> Int{
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

//var arr = [45,12,34,7,78,65,4,89,43]
//Quick().sort(arr: &arr, lb: 0, ub: arr.count-1)
//print(sortedArr)

class Merge {
    /*
        Divide and conquor.
     */
    
    /*
     Worst case :-
       T(n) =  T(n/2) + T(n/2) + n = 2T(n/2) = O(nlogn)
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
    
    func sort(arr : [Int]) -> [Int]{
        guard arr.count > 1 else { return arr }
        let left = Array(arr[0..<arr.count/2]) // O(1)
        let right = Array(arr[arr.count/2..<arr.count]) //O(1)
        return mergeArr(left: sort(arr: left), right: sort(arr: right)) // T(n/2) + T(n/2) = 2T(n/2) for recursion and for Merge
    }
    
    private func mergeArr(left : [Int], right : [Int]) -> [Int]{
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


//var arr1 = [211, 11, 52, 211, 334,423] //[45,12,34,7,78,65,4,89,43]
//let sortedArr = Merge().sort(arr: arr1)
//print(sortedArr)

class Heap {
    
    /*
     Time to insert an element in heap depends on height and height of heap is O(logn)
     so time to insert one element is O(logn)
     time to insert n elements is = O(n logn)
     
     Complixity of maxHeapify = O(n)
     Time for deletion is = O(n logn)
     Total = n logn
     */
    
    func sort(arr : inout [Int],n : Int) -> [Int]{
        //Steps
        //First = Build a max heap
        //Delete item form heap
        
        //Create a heap
        //Build from non leaft node which is at larget index.
        for i in stride(from: (n/2), through: 0, by: -1) {
            print(i)
            maxHeapify(arr: &arr, n: n, i: i)
        }
        //Delete items from max heap to sort array
        for i in stride(from: n-1, through: 0, by: -1) {
            //Mode root node to last node
            arr.swapAt(i, 0)
            maxHeapify(arr: &arr, n: i, i: 0)
        }
        return arr
    }
    
    fileprivate func maxHeapify(arr : inout [Int],n : Int,i : Int) {
        var largest = i
        let left = 2*i  //left node
        let right = (2*i)+1 // Right node
        
        while (left < n && arr[left] > arr[largest]) {
            largest = left
        }
        while (right < n && arr[right] > arr[largest]) {
            largest = right
        }

        if largest != i {
            arr.swapAt(i, largest)
            maxHeapify(arr: &arr, n: n, i: largest)
        }
    }
    
}

//var arr = [211, 11, 52, 211, 334,423] //[30,17,20,1,5,10,15,19]
//let heapObj = Heap()
//let sortedArr = heapObj.sort(arr: &arr,n: arr.count)
//print(sortedArr)

class Counting {

    /*
     Time complexity is
     first loop = O(n)
     second loop = O(k) k = number of items 0...9
     third loop = O(n)
     forth loop = O(n)
     
     Total = O(n) + O(k) + O(n) + O(n) =  O(3n+k) = O(n+k)
     It does not work on float values and negative values.
     */
    
    func sort(arr : inout [Int]) -> [Int]{
        var b = [0,0,0,0,0,0,0,0,0,0,0,0,0]
        var count = [0,0,0,0,0,0,0,0,0,0]

        //1. Count the occurance of repeating items.
        for i in 0..<arr.count {
            count[arr[i]] += 1
        }

        //2.Get position
        for i in 1..<count.count {
            count[i] = count[i] + count[i-1]
        }

        //3.Place items in sorted arr from main arr.
        for i in stride(from: arr.count-1, through: 0, by: -1) {
            let pos = count[arr[i]]-1
            count[arr[i]] -= 1
            b[pos] = arr[i]
        }
        
        //4 .
        for i in 0..<arr.count {
            arr[i] = b[i]
        }
        return arr
    }
    
}

//var arr = [1,3,2,4,1,1,5,1,9,6,8,3,7]
//let obj = Counting()
//let sortedArr = obj.sort(arr: &arr)
//print(sortedArr)


class Radix {

    func sort(arr : inout [Int]) -> [Int]{
        guard let largest = arr.max() else { return [] }
        var pos = 1
        while largest/pos > 0 {
            countSort(arr: &arr, pos: pos)
            pos *= 10
        }
        return arr
    }
    
    fileprivate func countSort(arr : inout [Int],pos : Int) -> [Int]{
        
        var b = arr
        var count = [0,0,0,0,0,0,0,0,0,0]
        
        //1. get count of each element.
        for i in 0..<arr.count {
            let index = (arr[i]/pos)%10
            count[index] += 1
        }
        print(count)
        //2. Set position.
        for i in 1..<count.count {
            count[i] = count[i] + count[i-1]
        }
        print(count)

        //3. Set data in exact postion from main array to new array using count arr.
        for i in stride(from: arr.count-1, through: 0, by: -1) {
            let pos = (arr[i]/pos)%10
            count[pos] -= 1
            b[count[pos]] = arr[i]
        }

        print(b)
        //4. Set data back to main array.
        for i in 0..<arr.count {
            arr[i] = b[i]
        }
        
        return arr
    }
    
}

//var arr1 = [111,121,34,45,677,344,233,433]
//let obj1 = Radix()
//let sortedArr = obj1.sort(arr: &arr1)
//print(sortedArr)

class Shell {
    /*
     Works on gep sequence.
     
     Time complexity
     Best Case :- O(n)
     Worst Case :- O(n^2)
     Space Complixity :- O(1)
     
     Best case:- O(n)
     Worst Case :- O(n^2)
     
     Space :- O(1) no extra space required
     Not stable.
     */
    class func sort(arr : inout [Int]) -> [Int] {
        
        //Outer loop for gap
        var gap = arr.count/2
        while gap >= 1 {
            for j in gap..<arr.count {
                for i in stride(from: j-gap, through: 0, by: -gap) {
                    if arr[i+gap] > arr[i] {
                        break
                    } else {
                        arr.swapAt(i+gap, i)
                    }
                }
            }
            gap = gap/2
        }
        return arr
    }

}

var arr2 = [111,121,34,45,677,344,233,433]
let sortedArr3 = Shell.sort(arr: &arr2)
print(sortedArr3)




