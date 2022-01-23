import UIKit

class Node<T> {
    var value : T
    var next : Node?
    
    init(value : T) {
        self.value = value
    }
}

class LinkedList<T> {
    var head : Node<T>?
    
    var isEmpty : Bool {
        return head == nil
    }
    
    var tail : Node<T>? {
        guard var node = head else {return nil}
        while let next = node.next {
            node = next
        }
        return node
    }
    
    var count : Int {
        guard var node = head else {return 0}
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    private func node(at index : Int) -> Node<T>?{
        guard var node = head else {
            return nil
        }
        var i = 1
        while i < index {
            let next = node.next
            node = next!
            i += 1
        }
        return node
    }
}

extension LinkedList {
    func printList(){
        guard var node = head else {return}
        print("Node value :- \(node.value)")
        while let next = node.next {
            print("Node value :- \(next.value)")
            node = next
        }
    }
}

extension LinkedList {
    func add(_ value : T){
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
        } else {
            tail?.next = newNode
        }
    }
    
    func addInTheStart(value : T){
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
        } else {
            newNode.next = head
            head = newNode
        }
    }
    
    func addAtEnd(value : T){
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
        } else {
            tail?.next = newNode
        }
    }
    
    func addAtPoisition(value : T, pos : Int) {
        let newNode = Node(value: value)
        if pos <= count {
            if let previousNode = node(at: pos-1) {
                newNode.next = previousNode.next
                previousNode.next = newNode
            }
        }
    }
}

extension LinkedList {
    
    func removeFromStart(){
        head = head?.next
    }
    
    func removefromEnd(){
        if count == 0 || count == 1 {
            head == nil
        } else {
            let secondLastNode = node(at: count-1)
            secondLastNode?.next = nil
        }
    }
    
    func removeAtPosition(pos : Int) {
        if pos <= count {
            let previousNode = node(at: pos-1)
            let nextNode = previousNode?.next
            previousNode?.next = nextNode?.next
        }
    }
}


func reverseList(list : LinkedList<Int>) {
    var previous, current, next : Node<Int>?
    current = list.head
    previous = nil
    for _ in 0..<list.count {
        next = current?.next
        current?.next = previous
        previous = current
        current = next
    }
    list.head = previous
    list.printList()
}


func mergeList(list1 : LinkedList<Int>, list2 : LinkedList<Int>){
    let dummyNode = Node(value: 0)
    var node = dummyNode
    
    var l1 = list1.head
    var l2 = list2.head
    
    while l1 != nil && l2 != nil {
        if l1!.value < l2!.value {
            node.next = l1
            l1 = l1!.next
        } else {
            node.next = l2
            l2 = l2!.next
        }
        node = node.next!
    }
    node.next = l1 ?? l2
    //list.printList()
}


/*
let list = LinkedList<Int>()
list.add(2)
list.add(3)
list.addInTheStart(value: 1)
list.addAtEnd(value: 4)
list.add(6)
list.addAtPoisition(value: 5, pos: 5)
list.printList()
list.removeFromStart()
list.removeAtPosition(pos: 4)
list.removefromEnd()
list.printList()
*/


// Problem reverse a link list.
//let list = LinkedList<Int>()
//list.add(1)
//list.add(3)
//list.add(4)
//list.add(6)
//
//let list2 = LinkedList<Int>()
//list2.add(2)
//list2.add(5)
//list2.add(7)
//list2.add(8)
//
////list.printList()
////reverseList(list: list)
//mergeList(list1: list, list2: list2)


struct Person {
    var age = 16

    lazy var fibonacciOfAge: Int? = {
        return fibonacci(of: self.age)
    }()

    func fibonacci(of num: Int) -> Int {
        if num < 2 {
            return num
        } else {
            return fibonacci(of: num - 1) + fibonacci(of: num - 2)
        }
    }
}
