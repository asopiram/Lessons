//
//  main.swift
//  Lesson6
//
//  Created by Дмитрий Шароваров on 07.10.2021.
//

import Foundation

//Дженерики - универсальный шаблон, заменитель типа данных
// массив - дженерик

//например нам нужно махнуть местами
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let  temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 104

swapTwoInts(&someInt, &anotherInt)

print(someInt, anotherInt)

func swapTwoString(_ a: inout String, _ b: inout String){
    let  temp = a
    a = b
    b = temp
}

func swapTwoDouble(_ a: inout Double, _ b: inout Double){
    let  temp = a
    a = b
    b = temp
}
//не очень красиво получается, приходится три раза мисать метод.


//для красоты пишем дженерик, <заменитель имени типа>, называется так, как нравится <type>, <element> и тд
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
    
}

var aString = "Hello"
var bString = "World"
swapTwoValues(&aString, &bString)
print(aString, bString)

swapTwoValues(&someInt, &anotherInt)


//создаем стек
//новый элемент может добавить только в конец
//межет работать только с одним типом данных
struct IntStack {
    var items = [Int]()
    
    mutating func push(_ item: Int) {
        items.append(item)
        
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}


//нам это не нравится, поэтому мы пишем дженерик

struct StackU<Element> {
    var items = [Element]()
    
    mutating func push(_ item: Element){
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfString = StackU<String>()

stackOfString.push("One")
stackOfString.push("Two")

print(stackOfString.items)

stackOfString.pop()
print(stackOfString.items)


//class SomeClass {

//}

//protocol SomeProtocol {

//}

//func SumeFunction<T: SomeClass, U: SomeProtocol> () {
//}

  
func findIndexInt(ofInt valueToFind: Int, in array: [Int]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
        return index
        }
    }
    return nil
}
print(findIndexInt(ofInt: 4, in: [1,23,5,4])!)


//универсальный метод поиска индекса по массиву
func findIndex<T:Equatable>(ofValueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == ofValueToFind {
        return index
        }
    }
    return nil
}


var animalArray = ["кот", "собака", "жираф"]

print(findIndex(ofValueToFind: "кот", in: animalArray)!)

struct test: Equatable{
    var a: Int
    var b: Int
    
    static func == (lhs: test, rhs: test) -> Bool {//если мы хотим сравнивать по одному экземпляру
        return lhs.a == rhs.a
    }
}

var aTest = test(a: 10, b: 11)
var bTest = test(a: 10, b: 12)

if aTest == bTest {
    print("равны")
} else {
    print("не равны")
}


//SUBSCRIPTING

print(animalArray[0])//обращение к элементу в скобках и есть subscript
//если мы хотим в нашу структуру добавить subscript

//subscript(index: Int) -> Int {
//    get{
//        // возвращает значние
//    }
//    set {
//        //меняет значние
//    }
//}

struct TimeTable {
    let multiplier: Int
    
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let treeTimesTable = TimeTable(multiplier: 3)

print(treeTimesTable[6])


//посмотрим как отрабатывают сетторы

struct Welcome {
    var a = "Hello"
    var b = "Hi"
    var c = "Privet"
    
    subscript(index: Int) -> String {
        get {
            switch index {
            case 0: return a
            case 1: return b
            case 2: return c
            default:
                return ""
            }
        }
        set {//позволяет нам менять значения
            switch index{
            case 0: a = newValue
            case 1: b = newValue
            case 2: c = newValue
            default: break
            }
        }
    }
    
    subscript(index: Int, word: String) -> String {//не может быть двух идентичных subscript
        var text = self[index] //тут мы вызываем первый subscript
        text += " " + word
        return text
    }
}

var w = Welcome()

print(w[0])//не всегда понятно что мы тут вызываем, есть некая недосказанность. Мы должны точно знать как работает subscript

w[1] = "Hiiiiiii"//записали новое значение. Изменили свойство структуры без mutating
print(w[1])

print(w[1, "Students"])


// ЗАМЫКАНИЕ
// это самодостаточный блок кода. Замыкание не имеет имени в отличие от функции
let valueArray = [1,23,4,123,5,6,1269,2]

func filterA(array: [Int], function: (Int) -> Bool) -> [Int]{
    var newFilterArray = [Int]()
    
    for i in array {
        if function(i) {
            newFilterArray.append(i)
        }
    }
    return newFilterArray
}

func compare(i: Int) -> Bool{
    return i % 2 == 0
}

print(filterA(array: valueArray, function: compare))


filterA(array: valueArray, function: {(i: Int) -> Bool in
    return i % 2 == 0
})

filterA(array: valueArray, function: {(i: Int) -> Bool in
    return i > 100
})


let names = ["Степан", "Костя", "Юлия", "Дмитрий"]

func backward(_ s1: String, _ s2: String) -> Bool{
    return s1 > s2
}

var reverseNames = names.sorted(by: backward)
print(reverseNames)



reverseNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 < s2
})

//print(reverseNames)

//варианты написания
reverseNames = names.sorted(by: {s1, s2 in return s1 > s2})

reverseNames = names.sorted(by: {$0 < $1})

reverseNames = names.sorted() {$0 > $1}


var arrayII = [1,26,64,28,89]

var newArray = arrayII.map {$0 * 2}
print(newArray)

var newNewArray = arrayII.map {$0 % 2}.filter {$0 == 1}
print(newNewArray)

//изменили все с маленькой буквы
let lowerNames = names.map {$0.lowercased()}
print(lowerNames)


