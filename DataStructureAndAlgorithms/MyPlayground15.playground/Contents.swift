import UIKit

//func printThis() {
//    print("c")
//    DispatchQueue.global().async {
//        print("a")
//        DispatchQueue.global().async {
//            print("d")
//        }
//    }
//    DispatchQueue.global().async {
//        print("r")
//        DispatchQueue.global().async {
//            print("w")
//        }
//        DispatchQueue.global().sync {
//            print("q")
//        }
//        DispatchQueue.global().async {
//            print("x")
//        }
//        DispatchQueue.global().sync {
//            print("y")
//        }
//    }
//
//    print("g")
//}
//printThis()

    /*
----------------------------------------------------------
let queue = DispatchQueue(label: "some serial queue")
queue.async {
  //some time taking task for 5 seconds
    ....
    print("x")
}
queue.sync {
    print("y")
}

queue.async {
    print("z")
}
----------------------------------------------------------
func printThis() {
    print("c")
    Dispatch.global.async {
        print("a")
        Dispatch.global.async {
            print("d")
        }
    }
    Dispatch.global.async {
        print("r")
        Dispatch.main.async {
            print("w")
        }
    }
    Dispatch.main.sync {
            print("q")
    }
    print("g")
}

c,g,a,r,q,w,d




printThis()
---------------------------------------------------------------
var thread = DispatchQueue(name : "xyz", priority : .dackground,  cocurrent )


---------------------------------------------------------------
  var messages: [String]?
    func addMessage(_ str: String) {
        if var allMessages = messages {
            allMessages.append(str)
        } else {
            messages = [str]
        }
    }
    addMessage ("Hi")
    addMessage ("my")
    addMessage ("name")
    addMessage ("is")
    addMessage ("James")
    print(messages)

---------------------------------------------------------------
Q2) What is the output?
    var messages: [String]?
    func addMessage(_ str: String) {
        if messages != nil {
            messages.append(str)
        } else {
            messages = [str]
        }
    }
    addMessage ("Hi")
    addMessage ("my")
    addMessage ("name")
    addMessage ("is")
    addMessage ("James")
    print(messages)

// -------------------------------------------------------------------- //
Q) What will be the retain count of obj in following? Will it compile?

class MyObj: Hashable {
  var key: String
  init(_ key: String) {
    self.key = key
  }
  .
  .
  .
}

var obj = MyObj("key1") //1
var array = [obj] //2
let dict = [obj: 10] //3

obj.key = "key2"
---------------
var abc = "Anil"
let dict: [String: Int] = [abc: 123]
abc = "Pankaj"
//dict ["Pankaj: 123]

let val = dict["Anil"]
// -------------------------------------------------------------------- //
*/


//class MyObj: Hashable {
//    static func == (lhs: MyObj, rhs: MyObj) -> Bool {
//        return true
//    }
//
//  var key: String
//  init(_ key: String) {
//    self.key = key
//  }
//}
//
//var obj = MyObj("key1") //1
//var array = [obj] //2
//let dict = [obj: 10] //3
//
//obj.key = "key2"
//---------------
//var abc = "Anil"
//let dict: [String: Int] = [abc: 123]
//abc = "Pankaj"
////dict ["Pankaj: 123]
//
//let val = dict["Anil"]



//protocol ABC {
//   func extensionMethod()
//}
//
//extension ABC {
//    func extensionMethod() {
//        print("in exe")
//    }
//}
//
//struct MyStruct: ABC {}
//extension MyStruct {
//    func extensionMethod() {
//        print("in struct")
//    }
//}
//
//class MyClass: ABC {}
//extension MyClass {
//    func extensionMethod() {
//        print("in Class")
//    }
//}
//
//let classVar = MyClass()
//let proto1: ABC = classVar
//
//
//var mystruct = MyStruct()
//var proto: ABC = mystruct
//
//
//mystruct.extensionMethod() // print(“in struct”)
//proto.extensionMethod() // print(“in struct”)
//proto1.extensionMethod() // print(“in Class”)


protocol MyProtocol {
}
struct MyStruct: MyProtocol {
}
extension MyStruct {
    func extensionMethod() {
        print("In Struct")
    }
}
extension MyProtocol {
    func extensionMethod() {
        print("In Protocol")
    }
}

let myStruct = MyStruct()
let proto: MyProtocol = myStruct

myStruct.extensionMethod() // -> “In Struct”
proto.extensionMethod() // -> “In Protocol”
