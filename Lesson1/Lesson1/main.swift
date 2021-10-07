//
//  main.swift
//  Lesson1
//
//  Created by Дмитрий Шароваров on 05.10.2021.
//

import Foundation

// КОНСТАНТА

let a = 10

//a = 15

// ПЕРЕМЕННАЯ

var b: UInt = 10

b = 15

print(b)

var s: String = "Hello students"
print(s)

var d: Double = 5.0

var three: Int = 3
var point: Double  = 0.14159

var pi = Double(three) + point //swift не знает какой тип данных применить для суммирования, поэтому нужно уточнять
print(pi)

var pi2 = three + Int(point) // мы теряем дробную часть
print(pi2)



// ОПЦИОНАЛЬНЫЙ тип - используются в тех случаях, когда значение может отсутствовать. Коробка с котом Шредингера:)

var w: String? = nil //nil помечает переменную как пустую

//var ww: String = nil //так не может быть, только опциональная

//нужно развернуть опциональную переменную

var futureTeacher: String? = "Василий Петрович"

print("Будущий учитель \(futureTeacher!)")//не распаковывая опциональный тип, мы будем получать в консоли Optionfl("Василий")
// ! - принудительная распаковка. Если у нас не будет значения в опциональном типе, то мы получим ошибку

if futureTeacher != nil {// распаковываем безопастно опциональный тип
    print("Будущий учитель \(futureTeacher!)")
} else {
    print("Я не знаю")
}

if let knownTeacher = futureTeacher {//let - обычная константа, если получилось записать данные, то значит опциональный тип имеет значение
    print("Учитель \(knownTeacher)")
} else {
    print("Я не знаю")
}



let defaultLunch = "пицца"
var specialLunch: String?

var myLunch = specialLunch ?? defaultLunch //если опциональная переменная nil, то значение возмется из второй переменной
print(myLunch)

specialLunch = "пирог с мясом"
myLunch = specialLunch ?? defaultLunch

print(myLunch)



// КОЛЛЕКЦИИ

// МАССИВ

var firstArray: [String] = ["ARg1", "arg2", "ARg3"]

print(firstArray[1])

firstArray.append("Arg4")

firstArray.removeFirst() //удаление первого элемента
print(firstArray)

firstArray.insert("Arg3", at: 2) //добавили элемент на 3-ю позицию. Нумерация идет с 0
print(firstArray)
firstArray.remove(at: 0)
print(firstArray)

firstArray[0] = "Arg2" //можем заменять элементы
print(firstArray)


// СЛОВАРЬ
// отличие заключается в том, как мы записываем и вызываем значения. Хранится в хаосе. Порядок не важет, используется пара ключ-значение
//

var countris: [String: String] = ["IT":"Italy", "RU":"Russia", "FR":"France"]
print(countris)//вызывая несколько раз порядок будет разный

let fractions = [0.25: "1/4", 0.5: "1/2"] //ключи имеют один тип данных, значения другой. Но внутри значений или ключей не может отличаться по типу.

print(countris["IT"]!) // выдается опциональное значение, потому что мы можем вызвать несуществующее значение


if let bigCountry = countris["RUS"] { //вызываем ошибку
    print(bigCountry)
} else {
    print("Error key")
}


countris["AU"] = "Австрий" // если значения нет, то мы добавляем, если есть, то заменяем
countris["RU"] = nil // удаление

print(countris)

countris["AU"] = "Австралия"
print(countris)


// МНОЖЕСТВО
// не можем напрямую обраться. Может только проверить есть там наше значение или нет

var favGenres: Set<String> = ["Rock", "Hip-Hop", "Rock"] //сохраняются только уникальные значения
print(favGenres)

print(favGenres.count)

if favGenres.contains("Rock") {
    print("Рок жив!")

} else {
    print("Нет")
}

//пример
//set <UITouch> // UITOuch нажатие на экран. Если заданная область хранится в множестве и имеет кнопку на том месте, то вызывается значение.
