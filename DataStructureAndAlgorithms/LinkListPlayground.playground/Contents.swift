import UIKit

//Node
public class Node {
    var value : String
    var next : Node?

    init(value : String) {
        self.value = value
    }
}

//Linked list
class LinkedList {
    fileprivate var head : Node?
    
    public var isEmpty : Bool {
      return head == nil
    }
    
    public var last : Node? {
        guard var node = head else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return head
    }
    
    public var count : Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
}

extension LinkedList {
    func printList(){
        guard var node = head else {
            return
        }
        print("Item is \(node.value)")
        while let next = node.next {
            print("Item is \(next.value)")
            node = next
        }
    }
}

//Add data in linked list
extension LinkedList {
    func add(data : String) {
        let newNode = Node(value: data)
        """
            if head is present then find the tail to add node at the last
            else asign new node to the head.
        """
        if let last = last {
            last.next = newNode
        } else {
            head = newNode
        }
    }
}

//Insert an element at position
extension LinkedList {

    func insert(value : String,at index : Int) {
        let newNode = Node(value: value)
        if index == 0 {
            newNode.next = head
            head = newNode
        } else {
            let previousNode = node(at: index-1)
            newNode.next = previousNode.next
            previousNode.next = newNode
        }
    }
    
    private func node(at index : Int) -> Node {
        assert(head != nil, "List is empty")
        assert(index >= 0, "index must be greater than 0")
        
        if index == 0 {
            return head!
        } else {
            var node = head?.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            assert(node != nil, "index is out of bounds.")
            return node!
        }
    }
        
}

//Remove for begining, from end, at position.
extension LinkedList {
    
    func remove(at index : Int)
    {
        if index == 0 {
            head = head?.next
        } else {
            let previousNode = node(at: index-1)
            previousNode.next = previousNode.next?.next
        }
    }
    
    func removeFirst()
    {
        let headNode = head
        let secondNode = headNode?.next
        headNode?.next = secondNode
        head = secondNode
    }
    
    func removeLast()
    {
        if count == 0 {
            head = nil
        } else if count == 1 {
            head = nil
        } else {
            let secondLastNode = node(at: count-2)
            secondLastNode.next = nil
        }
    }
}


//Create a linked list.

let list = LinkedList()
list.add(data: "1")
list.add(data: "3")
//list.insert(value: "2", at: 1)
//list.printList()
//list.removeFirst()
//list.printList()
//list.removeLast()
list.printList()
