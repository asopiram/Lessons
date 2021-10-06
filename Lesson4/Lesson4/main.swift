//
//  main.swift
//  Lesson4
//
//  Created by Дмитрий Шароваров on 30.09.2021.
//

import Foundation

//ООП
// НАСЛЕДОВАНИЕ

// ИНКАПСУЛЯЦИЯ
// КЛАССЫ

class Cinema {
    private var genreList: [String]//private пишем для того, чтобы сделать код закрытым и невозможно было к нему обратиться извне
    
    init(genreList: [String]) {//проинициализировали
        self.genreList = genreList
        
    }
    
    func appending(genre: String) -> [String]{//создали метод, который будет добавлять в наш список какие-то жанры
        genreList.append(genre)
        return genreList
        
    }
}

var c = Cinema(genreList: ["Horror"])//создали экземпляр класса (объект)
//c.genreList = [""] //так уже не можем вызвать, так как класс сделали приватным через private

c.appending(genre: "Action")// можем обращаться только через метод


// ПОЛИМОРФИЗМ

//мы можем при помощи + складывать не только значения, но склеивать строки. Это и является полиморфизмом (универсальность)
//5 + 5
//"Hello" + "world"

//класс очень поход на структуру, но с некоторыми отличиями
struct Resolution {
    var w = 0
    var h = 0
    
}

let hd = Resolution(w: 1920, h: 1080)//создаем экземпляр структуры
var cinema = hd //создаем другой экземпляр, просто копируем из одного в другое
cinema.h = 2048 // не влияет на первичный объект и не влияют на друг друга

print(hd.h)
print(cinema.h)


//создаем класс
class VideoMode {
    var f = 0.0

}

var t = VideoMode()//создаем экземпляр (объект)
t.f = 25.0

var alsoT = t //создаем еще один параметр
alsoT.f = 60.0 //поменялись оба значения

print(t.f)
print(alsoT.f)
//класс является ссылочным типом и не копирует значение


enum chessmaType{
    case queen
    case king
    case castle
    
}
enum chessmaColor{
    case white
    case black
}

//создаем новый класс для шахмат
class Chessman {//класс содежит пустой инициализатор и ему нужны значения
    let type: chessmaType
    let color: chessmaColor
    var coordinate: (String, Int)? = nil//фигуры может не быть на доске
    
    init(type: chessmaType, color: chessmaColor){
        self.type = type
        self.color = color
    }
    
    init(type: chessmaType, color: chessmaColor, coordinate: (String, Int)){//может быть несколько инициализаторов
        self.type = type
        self.color = color
        self.setCoordinate(char: coordinate.0, num: coordinate.1) // 0 и 1 соответствует string и int в coordinate
    }
    
    final func setCoordinate(char c: String, num n: Int) {// final используется, когда мы не хотим, чтобы метод изменяли
        self.coordinate = (c, n)
    }
    
    //методы обращаются к свойству класса coordinate и нам не нужно при измении писать mutating
    func kill() {//съели фигуру
        self.coordinate = nil
    }
    
}

var king = Chessman(type: .king, color: .black)// пустые скобки позволяют изменить значения, которые необходимы
king.setCoordinate(char: "A", num: 1)// чтобы не писать по отдельности создание фигуры и ее позицию на доске, добавляем второй инициализатор

var queen = Chessman(type: .queen, color: .white, coordinate: ("A", 2))


// НАСЛЕДОВАНИЕ
// наследник по умолчанию точная копия родителя

class SomeSubClass: Chessman {//этот класс наследует от класса chessman, может быть несколько
    
    func printChessnamType(){//добавляем свои методы и они никак не передаются в родителя
        print(self.type)
    }
    //эту часть комментируем, потому что выше в классе поставили у одного из методов final
    //override func setCoordinate(char c: String, num n: Int) { //override метод меняется только в дочернем классе по отношению к родителю и не изменяет его в родительском
        //self.coordinate = (c, n*2)
    //}
}

var castle = SomeSubClass(type: .castle, color: .black, coordinate: ("B", 8))
castle.printChessnamType()
//king.printChessmanType() // так не получится, так как находится в родительском классе и к нему мы не можем применить метод наследника
castle.setCoordinate(char: "B", num: 5) //можем использовать методы родителя
print(castle.coordinate)


// пример использования классов. В swift все построено на классах
// куча ошибок - все комментирую
/*
var view = UIView()
view.backgroundColor = .blue

var label = UILabel()
label.text = "Hello, world"
lable.frame = CGRect(x: 150, y: 200, width: 150, height: 150)
label.textColor = .cyan
label.backgroundColor = .green

view.addSubview(label)
PlaygroundPage.current.liveView = view
*/


//ДЕНИНИЦИАЛИЗАЦИЯ
// deinit может быть только один


class SuperClass{
    init?(isNil: Bool){
        if isNil == true { // проверяем значение
            return nil
        } else {
            print("Объект создан")
        }
    }
    deinit { // можем создавать только в классах. Он срабавывает тогда, когда произошло удаление того, что мы использовали
        print("Класс удален")
    }
}

var obj = SuperClass(isNil: false)
obj = nil // удалили объект, удаляется и класс, очищается память, срабатывает деинициализатор


class Person {
    let name: String
    
    init(name: String){
        self.name = name
        print("\(name) init")
    }
    deinit {
        print("\(name) kill")
    }
    
}

var ref1: Person?
var ref2: Person?
var ref3: Person?// пока не передали никаких значений, класс не создан

ref1 = Person(name: "Ivan")
ref2 = ref1 //ссыламся на этот объект в памяти
ref3 = ref1

ref1 = nil
ref3 = nil // одна ссылка осталась, поэтому класс остается
ref2 = nil // удалили последнюю ссылку, память очищается и удаляется класс
ref1 = Person(name: "Ivan2") // Когда появится ссылка, класс создается


// утечка памяти и как это может произойти
class Human {
    let name: String
    var child = [Human?]()
    weak var father: Human? // weak помечает свойства, которые ARC может начать удаление с них
    weak var mother: Human? // weak помечает слабую ссылку
    
    init(name: String){
        self.name = name
        print("\(name) init")
    }
    
    deinit {
        print(self.name + "killll")
    }
}

if 1 == 1 {//создаем область видимости где мы создаем класс
    let kirill = Human(name: "Kirill")
    let Olga = Human(name: "Olga")
    let Alex = Human(name: "Alex")
    
    kirill.father = Alex
    kirill.mother = Olga
    
    Alex.child.append(kirill)// Кирилл ребенок двух объектов
    Olga.child.append(kirill)
}
// killll не сработал, хотя мы вышли из области видимости if. Все три объекта сильно ссылаются на класс и ARC не знает с кого начать удаление. Нужно добаление weak
