import UIKit

/*
    Linear search
    Best Time complixity of linear search = O(1)
    Worst Time complixity of linear search = O(n)
    Space complixity of linear search = O(1)
 */

/*
    Binary search
    Precondition for binary search list should be sorted.
    Best Time complixity of linear search = O(1)
    Worst Time complixity of linear search = O(log n)
    Space complixity of linear search = O(n)
 */


class Linear {
    class func search(arr : [Int],item : Int) -> Int?{
        var index : Int?
        for i in 0..<arr.count-1 {
            if arr[i] == item {
                index = i
                break
            }
        }
        return index
    }
}

//let arr = [22,1,34,56,23,76,89,34,56]
//let index = Linear.search(arr: arr, item: 23)
//print("----------\(index)")


class Binary {
    class func search(arr : [Int], item : Int, range : Range<Int>) -> Int? {
        let lowerBound = 0
        let upperBound = arr.count
        
        if lowerBound > upperBound {
            return nil
        } else {
            let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
            if arr[midIndex] == item {
                return midIndex
            } else if item < arr[midIndex] {
                return Binary.search(arr: arr, item: item, range: 0..<midIndex)
            } else {
                return Binary.search(arr: arr, item: item, range: (midIndex+1..<range.upperBound))
            }
        }
    }
}

let arr = [10,20,30,40,45,50,55,60,65,70]
let index = Binary.search(arr: arr, item: 10, range: 0..<arr.count)
print("----------\(index)")
