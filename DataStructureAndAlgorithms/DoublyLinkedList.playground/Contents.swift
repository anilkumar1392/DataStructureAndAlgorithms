import UIKit
import Foundation


//Node
public final class Node<T> {
    var value : T
    var next : Node<T>?
    var prev : Node<T>?
    
    init(value : T) {
        self.value = value
    }
}

//Linked list
public class LinkedList<T> {
    
    public var head : Node<T>?
    
    var isEmpty : Bool {
        return head == nil
    }
    
    var last : Node<T>? {
        guard var node = head else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    var count : Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            count += 1
            node = next
        }
        return count
    }
}

//Print list
extension LinkedList {
    func printList(){
        guard var node = head else {
            return
        }
        print("Node item is \(node.value)")
        while let next = node.next {
            print("Node item is \(next.value)")
            node = next
        }
    }
}

//Add node
extension LinkedList{
    func addNode(value : T){
        let newNode = Node(value: value)
        if let last = last {
            last.next = newNode
            newNode.prev = last
        } else {
            head = newNode
        }
    }
    
    func addInTheBegining(value : T){
        let newNode = Node(value: value)
        if let head = head {
            newNode.next = head
            head.prev = newNode
            self.head = newNode
        } else {
            self.head = newNode
        }
    }
    
    func addAtEnd(value : T) {
        let newNode = Node(value: value)
        if let last = last {
            last.next = newNode
            newNode.prev = last
        } else {
            head = newNode
        }
    }
    
    func add(at index : Int, value : T){
        let newNode = Node(value: value)
        assert(index >= count,"Invalid index")
        
        if index == 0 {
            newNode.next = head
            head = newNode
        } else {
            let prevNode = node(at: index-1)
            let nextNode = prevNode.next
            newNode.prev = prevNode
            newNode.next = nextNode
            prevNode.next = newNode
            nextNode?.prev = newNode
            //newNode.next = prevNode.next
            //prevNode.next = newNode
        }
    }
    
    fileprivate func node(at index : Int) -> Node<T> {
        if index == 0 {
            return head!
        } else {
            var node = head
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node!
        }
    }
}

//Remove
extension LinkedList {
    func removeFromStart(){
        head = head?.next
    }
    
    func removeFromEnd(){
        let prevNode = node(at: count-1)
        prevNode.next = nil
    }
    
    func remove(at index : Int) {
        if index == 0 {
            print("Enter valid number")
        } else {
            if index == 1 {
                head = head?.next
            } else {
                let currentNode = node(at: index)
                let previousNode = currentNode.prev
                let nextNode = currentNode.next
                previousNode?.next = nextNode
                nextNode?.prev = previousNode
                currentNode.prev = nil
                currentNode.next = nil
            }
        }
    }
}

//Print inreverse order
extension LinkedList {
    
}

let list = LinkedList<Int>()
list.addNode(value: 5)
list.addNode(value: 6)
list.addNode(value: 7)
list.addInTheBegining(value: 4)
list.addAtEnd(value: 9)
list.add(at: 5, value: 8)
list.printList()
list.remove(at: 1)
print("Delete")
list.printList()
