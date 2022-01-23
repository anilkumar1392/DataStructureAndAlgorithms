import UIKit

// Vardiac property
func vardiacFunc(data : String...) {
    print(data)
}

//vardiacFunc(data: "Anil","Manish")

// Property Wrappers
@propertyWrapper struct AppendWithDot {
    var wrappedValue : String {
        didSet {
            wrappedValue = wrappedValue+"."
        }
    }
}

struct Document {
    @AppendWithDot var name = "Untitled document"
}

//var documents = Document()
//documents.name = "anil kumar"
//print(documents.name)


protocol Fighter {}
struct XWing : Fighter{}

func launchFighter() -> some Fighter {
    XWing()
}

//ARC will not deallocate an instance as long as at least one active reference to that instance still exists.

/*
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?


reference1 = Person(name: "Anil")
reference2 = reference1
reference3 = reference1

reference1 = nil
 */

//To make this possible, whenever you assign a class instance to a property, constant, or variable, that property, constant, or variable makes a strong reference to the instance. The reference is called a “strong” reference because it keeps a firm hold on that instance, and doesn’t allow it to be deallocated for as long as that strong reference remains.

//Use a weak reference when the other instance has a shorter lifetime
//In contrast, use an unowned reference when the other instance has the same lifetime or a longer lifetime.

//Unlike a weak reference, an unowned reference is expected to always have a value
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil


class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}


//var country = Country(name: "Canada", capitalName: "Ottawa")
//print("\(country.name)'s capital city is called \(country.capitalCity.name)")

/*
Weak and Unowned References
Define a capture in a closure as an unowned reference when the closure and the instance it captures will always refer to each other, and will always be deallocated at the same time.

Conversely, define a capture as a weak reference when the captured reference may become nil at some point in the future.
*/





protocol ToggleProtocol {
    func toggle()
}

enum ToggleState {
    case on
    case off
}

extension UIButton: ToggleProtocol {

    private(set) var toggleState = ToggleState.off

    func toggle() {
        toggleState = toggleState == .on ? .off : .on

        if toggleState == .on {
            // Shows background for status on
        } else {
            // Shows background for status off
        }
    }
}
