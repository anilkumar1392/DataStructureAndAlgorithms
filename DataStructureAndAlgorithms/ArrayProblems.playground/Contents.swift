import UIKit

/*
let arr = [1,5,7,1,1,1,1]
let k = 6

// Find all the possible pairs having sum equal to k.


var count = 0
var dict : [Int : Int] = [:]

// Also confirms to number of occurance
for i in 0..<arr.count {
    if dict[arr[i]] == nil {
        dict[arr[i]] = 1
    } else {
        dict[arr[i]]! += 1  // dict[arr[i]]!
    }
}
print(dict)

// Find the possible num of sums.
for i in 0..<arr.count {
    let num = k - arr[i]
    if dict[num] != nil {
        count += dict[num]!
    }
}
print(count/2)
*/


/*
// Find all common items
let arr1 = [1,2,4,6,8]
let arr2 = [1,4,5,8,9]
 
var commonItemsArray : [Int] = []
var dict : [Int : Int] = [:]

for i in 0..<arr1.count {
    if dict[arr1[i]] == nil {
        dict[arr1[i]] = 1
    } else {
        dict[arr1[i]]! += dict[arr1[i]]!
    }
}
print(dict)

for i in 0..<arr2.count {
    if dict[arr2[i]] != nil {
        commonItemsArray.append(arr2[i])
    }
}
print(commonItemsArray)
*/

/*
//Reverse an array
let arr = [1,2,4,6,8]
var reversedArr : [Int] = []


for i in stride(from: arr.count-1, through: 0, by: -1){
    reversedArr.append(arr[i])
}
print(reversedArr)
*/

/*
// Find max and min in an array
var min = arr[0]
var max = arr[0]

for i in 0..<arr.count {
    if arr[i] < min {
        min = arr[i]
    }
    
    if arr[i] > max {
        max = arr[i]
    }
}
*/

/*
HCF.
Second largest In array.
23rd
*/

/*
1. You are given a number. Find a palindrome number closest to the given number.
Ex - Input - 123, Expected output - 121
     Input - 998, Exepcted output - 999
     
2. Find all the index of the substring in a given string without using any library methods.
string - blahaaaablah
Substring - blah
Output- [0, 8]

3. Print a rhombus
   *
  ***
 *****
  ***
   *
*/


/*
HCF.
*/

/*
// LCM of two number withpout recursion.
var a = 8
var b = 24

var low = a < b ? a : b
var lcm = 1
while (1 == 1) {
    if low%a == 0 && low%b == 0 {
        lcm = low
        break
    }
    low += 1
}

print("Numbers are \(a), \(b) and lcm is \(lcm)")
// Swift Code

// HCF of two number withpout recursion.
var n1 = 12
var n2 = 8

var i = 1
var hcf = 0
while (i <= n1 && i <= n2) {
    if (n1%i == 0)  && (n2%i == 0) {
        hcf = i
    }
    i += 1
}

print("Numbers are \(n2) \(n1) and hcf is \(hcf)")
 */

/*
3. Print a rhombus
   *
  ***
 *****
  ***
   *
 */

/*
*
* *
* * *
* * * *
* * * * *
 */

var rows = 5
//for i in 1...rows {
//    for j in 1...rows {
//        if j <= i {
//          print("*", separator: "", terminator: "")
//        }
//    }
//    print("\n")
//}


/*
 * * * * *
 * * * *
 * * *
 * *
 *
 */


//for i in stride(from: rows, to: 0, by: -1) {
//    for _ in 0..<i{
//        print("*", separator: "", terminator: "")
//    }
//    print("\n")
//}


/*
 *
* * *
* * * * *
* * * * * * *
* * * * * * * * *
 */


var k = 0
for i in 1...rows {
    k = i
    
    // logic for space
    for j in 0..<rows {

    }
    
    //logic for star
    if k != 2*i-1 {
    }
}
