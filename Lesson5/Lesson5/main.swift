//
//  main.swift
//  Lesson5
//
//  Created by Дмитрий Шароваров on 04.10.2021.
//

import Foundation


// ПРОТОКОЛЫ
// в протоколах просываем основные правила которые нам необходимо реализовать

// синтаксис

/*protocol SomeProtocol {
    //требования
}

struct SomeStructure: SomeProtocol{
    // 2 требования от протоколв
}


class SomeClass: SuperClass, SomeProtocol {
    
}
*/

protocol SomeProtocol {
    //let тут нельзя написать
    var mustBeSettable: Int {get set} //может быть читаемой и изменяемой и долдны прописывать оба действия
    var doesNotNeedToBeSettavle: Int {get} //только читаема
}


protocol FullyNamed {
    var fullName: String {get}
    
}


struct Person: FullyNamed {
    var fullName: String
}


var John: FullyNamed = Person(fullName: "John")

//John.fullName = "JOHN" //нельзя если подписали протоколом FullyNamed (только get)
print(John.fullName)

//

class Startship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil){
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String{
        return (prefix != nil ? prefix! + " ": "") + name
    }
}


var ncc1701 = Startship(name: "Enterprice", prefix: "NASA")
print(ncc1701.fullName)


//
protocol NameKnight {
    var nameKnight: String {get set}
    
}

struct Knight: NameKnight {
    var name: String
    var nameKnight: String {
        get {
            return name
        
        }
    
        set {
            name = newValue + " kight of Westeros"
        
        }
    }
}

var knightNew = Knight(name: "Walter")
print(knightNew.nameKnight)

knightNew.nameKnight = "John Snow"
print(knightNew.nameKnight)


//
struct Human {
    var name: String
}

struct Animal {
    var name: String
}

func printOutHuman(human: Animal){
    print(human.name)
    
}


func printOutAnimal(animal: Animal){
    print(animal.name)
    
}

///

protocol Printable {
    var name: String {get}
}

struct HumanPro: Printable {
    var name: String
}

struct AnimalPro: Printable {
    var name: String
}

func printOut(object: Printable){
    print(object.name)
    
}


// все что прописано в протоколе (методы) должно содержать это
// подходят к классам и структурам

protocol RandomN: class { //может подписывать только класс, позволяет ограничить использования протокола
    func random() -> Double
}

class LinearRandom: RandomN {
    var l = 42.0
    let m = 1212312.0
    let b = 34.0
    
    func random() -> Double{
        l = l + (m * b)
        return l
    }
}

let l = LinearRandom()
print(l.random())



// изменяемые функции
protocol Togglable { // содержим только название метода, который будет изменяться. Может быть все что угодно. Можем комбинировать протоколы
    mutating func toggle()
}


enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle(){
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
        
    }
    
}

var lightSwitch = OnOffSwitch.off
print(lightSwitch)
lightSwitch.toggle()
print(lightSwitch)



/*
protocol SomeProtocol {
    init(someP: Int)
}

class SomeClass: SomeProtocol {
    init(someP: Int){
        
    }
}

class SubClass: SomeClass, SomeProtocol {
    required override init() {
        
    }
}
*/


// расширения мы может добавить функционал к типам, к которым мы не имеет доступ, но необходим для нашего проекта

extension Double {
    var km: Double {return self * 1000.0}
    var m: Double {return self}
    var cm: Double {return self / 100.0}
    
}

let one = 25.4.km
print(one)


extension RandomN {
    func randomBool() -> Bool {
        return random() > 10000.0
    }
}

print(l.randomBool())


// полиморфизм реализует данные разного рода как было в случае с человеком и животным. Без протокола не могло бы быть полиморфизма


protocol Figure {
    func drawFigure()
}

class Rectangle: Figure {
    func drawFigure() {
        print("draw rectangle")
    }
}

class Triangle: Figure{
    func drawFigure() {
        print("draw triangle")
    }
}


class Ellipse: Figure{
    func drawFigure() {
        print("draw eliipse")
    }
}

func draw(figure: Figure) {//один метод может вызывать разные типы данных
    figure.drawFigure()
}


draw(figure: Rectangle())
draw(figure: Triangle())
draw(figure: Ellipse())


// композиция протоколов

protocol Named {
    var name: String {get}
}

protocol Aged {
    var age: Int {get}
}


struct PersonC: Named, Aged {
    var age: Int
    var name: String
    
}

func wishHB(to celebratin: Named & Aged) {//композиция протоколов, когда параметр соответсвует нескольким протоколам
    print("С днем рождения \(celebratin.name) тебе уже \(celebratin.age)")
}


var sashka = PersonC(age: 34, name: "Сашка")
wishHB(to: sashka)
