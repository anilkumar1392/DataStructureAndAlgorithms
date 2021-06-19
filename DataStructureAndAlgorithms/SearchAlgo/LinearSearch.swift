//
//  LinearSearch.swift
//  DataStructureAndAlgorithms
//
//  Created by mac on 19/06/21.
//

import Foundation

class Linear {
    class func search(arr: inout [Int], item : Int) -> Bool{
        for i in 0..<arr.count {
            if item == arr[i] {
                return true
            }
        }
        return false
    }
}


