import UIKit

var greeting = "Hello, playground"

let constant: Int = 0
var variable: Int?
variable = 10

if var vari = variable {
    vari = 20
}
print(variable)

class Shape {
    var sides: Int = 0
    var color: CGColor?
    
    var shape: Shape = Shape()
    
    init() {
        
    }
    
    func draw() {
        
    }
    
}

protocol Oval {
    func drawOval()
    func destroy()
    var ratio: Float { get }
}
extension Oval {
    func destroy() {
        print("foos")
    }
}
fileprivate extension Oval {
    func printMe() {
        print(self)
    }
}

var circle: Shape? = .init()

if let circle = circle {
    circle.sides = 10
    print("xyz")
}
print(circle?.sides)
circle?.color = UIColor.black.cgColor
let color: CGColor = circle?.color ?? UIColor.red.cgColor

print(circle?.shape.color?.components)

guard let circle = circle else { fatalError() }

print(circle)



class Circle: Shape, Oval {
    
    let ratio: Float
    
    init(ratio: Float) {
        self.ratio = ratio
    }
    func drawOval() {
        
    }
    
    func destroy() {
        print("boom")
    }
}


let someCircle: Oval = Circle(ratio: 10)


someCircle.drawOval()
someCircle.destroy()
someCircle.printMe()



class singleton {
    @MainActor static let shared: singleton = .init()
}

class Singleton {
    @MainActor static let shared: Singleton = .init()
    
    private init() {
        
    }
}

let S = Singleton.shared

let s = singleton()
let sShared = singleton.shared

let session = URLSession()
let sharedSession = URLSession.shared


class LoginVC: UIViewController {
    static func initialise(apiManager: Any) -> LoginVC {
        let vc = LoginVC()
        vc.apiManager = apiManager
        return vc
    }
    
    var apiManager: Any?
    
}


for (index, element) in (0...10).enumerated() {
   
}

(0...10).forEach { i in
    
}

while true {
    
}


repeat {
    
} while true


let arr = (0...10)

arr.forEach {
    print($0)
}


let mappedArray = arr.map({ "\($0)" })


let arr2: [Int?] = [0, 1, nil, 2]

let compactMappedArray = arr2.compactMap { i in
    if let i {
        return "\(i)"
    }
    return "nil"
}

let cMapped = arr2.compactMap({ $0 })


let filteredArr = arr.filter({
    
    return $0 % 2 == 2
})


let firstEvenNumber: Int? = arr.first(where: { $0 % 2 == 2 })

let sortedArr = arr.sorted(by: { $0 > $1 })

let reduced = arr.reduce(0, +)
