import UIKit


// Sort an array using heap Tree sort

class Heap {
    
    class func sort(arr :inout [Int], n : Int) -> [Int] {
        //1. Create a heap O(n)
        for i in stride(from: n/2, through: 0, by: -1) {
            maxHeapify(arr: &arr, n: n, i: i)
        }
        
        
        //2.Delete O(n logn)
        for i in stride(from: n-1, through: 0, by: -1){
            arr.swapAt(i, 0)
            maxHeapify(arr: &arr, n: i, i: 0)
        }
        return arr
    }
    
    private class func maxHeapify(arr :inout  [Int],n : Int, i : Int){
        var largest = i
        let left = i*2
        let right = i*2+1
        
        while left < n && arr[largest] < arr[left] {
            largest = left
        }
        
        while right < n && arr[largest] < arr[right] {
            largest = right
        }
        
        if largest != i {
            arr.swapAt(i, largest)
            maxHeapify(arr: &arr, n: n, i: largest)
        }
    }
}

//var arr = [34,12,54,32,6,78,23]
//let sortedArr = Heap.sort(arr: &arr, n: arr.count)
//print(sortedArr)
//Binary tree implementation using pointers

class Node<T>{
    var data : T
    var left : Node?
    var right : Node?
    
    init(data : T, left : Node?, right : Node?) {
        self.data = data
        self.left = left
        self.right = right
    }
}

class BinaryTree<T>{
    var root : Node<T>?
    
    var inOrder : [T] = [T]()
    var preOrder : [T] = [T]()
    var postOrder : [T] = [T]()
}

extension BinaryTree {
    final class func createNode(data : T) -> Node<T>{
        return Node(data: data, left: nil, right: nil)
    }
}

//left root right
func inOrderTraversal(root : Node<Int>?){
    if root == nil {return}
    inOrderTraversal(root: root?.left)
    if let data = root?.data {
        print("item is \(data)")
    }
    inOrderTraversal(root: root?.right)
}

//root left right
func preOrderTraversal(root : Node<Int>?){
    if root == nil {return}
    if let data = root?.data {
        print("item is \(data)")
    }
    preOrderTraversal(root: root?.left)
    preOrderTraversal(root: root?.right)
}

//left right root
func postOrderTraversal(root : Node<Int>?){
    if root == nil {return}

    postOrderTraversal(root: root?.left)
    postOrderTraversal(root: root?.right)
    if let data = root?.data {
        print("item is \(data)")
    }
}

var tree = BinaryTree<Int>()
tree.root = BinaryTree.createNode(data: 1)
tree.root?.left = BinaryTree.createNode(data: 2)
tree.root?.right = BinaryTree.createNode(data: 3)
tree.root?.left?.left = BinaryTree.createNode(data: 4)
tree.root?.left?.right = BinaryTree.createNode(data: 5)
tree.root?.right?.left = BinaryTree.createNode(data: 6)
tree.root?.right?.right = BinaryTree.createNode(data: 7)

//inOrderTraversal(root: tree.root)
//preOrderTraversal(root: tree.root)
//postOrderTraversal(root: tree.root)



