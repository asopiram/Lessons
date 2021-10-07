//
//  main.swift
//  Lesson 2
//
//  Created by Дмитрий Шароваров on 23.09.2021.
//

import Foundation

// СОСТАВНЫЕ ОПЕРАТОРЫ

/*
 var a = 10
a = a + 5
a -= 5
print(a)
*/

/*
//ЛОГИЧЕСКИЕ ОПЕРАТОРЫ

// логическое И

(a > b) true/false
(a>b) && (b==0) // true


true && true //true
true && false //false
false && true //false
false && false //flase

 // логическое ИЛИ ||

 (a>b) || (b==0)
 true || true //true
 true || false //true
 false || true //true
 false || false //flase

 // логическое НЕ !
 
 !true // false
 !false // true
 */


let t = 8
let f = 7


// IF

if (t > f) || (f == 7) {
    print("t=5")
    
} else if t == 6 {
    print("t=6")
} else {
    print("Not t")
}


// ТЕРНАРНЫЙ ОПЕРАТОР

t == 5 ? print("t == 5") : print("t != 5") // сокращенное if. Пишем условие, после ? первое действие, если нет, то делаем то, что после :

var h = 100
var isHeader = false
let r = h + (isHeader ? 20 : 10) // по умолчанию переменная сравнивается с истиной. Тернарный оператор в составе вычисления
print(r)


//  SWITCH

let userMark = 4
switch userMark{
case 1,2:
    print("Экзамен не сдан")
case 4,5:
    print("Экзамен сдан")
default:
    print("Студент не пришел")//сюда попадает любое значени, которое мы не обработали

}

let level: Character = "Б"

switch level {
case "А":
    print("Все плохо")
case "Б":
    print("Ну норм")
    fallthrough //выполняем следующее принудительно после завершения "проваливаемся дальше"
case "В":
    print("Все отлично")
default:
    break //если передали какое-то другие значение, то прекращаем работу и код ничего не передает.
}


// пример с квадратным уравнением
// можно использовать readline - это позволит вводить значения через консоль
var a = 5
var b = 10
var c = 2
var D = (b * b) - 4 * a * c

switch a {
case _ where D > 0: // мы пропускаем значние, если не хотим все перечислять, а затем условие where - логическое И
    print("root 2")
case _ where D < 0:
    print ("no roots")
default:
    print("1 root")

}


// ЦИКЛИЧЕСКИЕ ОПЕРАТОРЫ

// FOR IN

var totalSum = 0
for i in 1...20 {
    totalSum += i
}
print(totalSum)

// можем пробегаться по массиву
var musicStyleArray = ["Rock", "Hip", "Jazz"]

for musicStyle in musicStyleArray {// если не указывать условие, то счетчик всегда идет с шагом +1.
    print("I love \(musicStyle)")
}

// можем пробегаться по словарю
var country = ["Россия":"ЕАЭС", "США":"НАТО", "Франция":"ЕС"]

for (countryName, blockName) in country {// создаем два счетчика. Записываются оба значения по порядку.
    print("\(countryName) вступила в \(blockName)")
}


// можем изменять счетчик по-другому, не +1
var result = 0

for i in stride(from: 1, to: 100, by: 4){// можем воздействовать на наш счетчика
    print(i)
    result += i
}
print(result)


//WHILE


var i = 10 //счетчик создается независимо
var resultSumWhile = 0

while i <= 10 { // пишем условие
    resultSumWhile += i // пишем действие
    i += 1 // изменяем i, иначе произойдет зацикливание, потому что i не будет меняться
}
print(resultSumWhile)


//REPEAT

var resultRepeatWhile = 0
var o = 1

repeat { //в случае repeat сначала выполняется, потом проверяется, поэтому while предпочтительнее
    resultRepeatWhile += o
    o += 1 // не забываем изменить
} while o <= 0
print(resultRepeatWhile)
print(o) //видим, что о поменялось, хотя условие не выполняется


// ФУНКЦИИ

 func myFirstFunction(firstValue someValue: Int, another: String, _ value: String) -> String {
    //Можем написать два имени, можем одно, если стоит _ то это пропуск аргумента, в данном случе - глобального имени.
    let c: String = String(someValue) + another + value
    return c //нужно писать, когда мы -> тип данных
}

print(myFirstFunction(firstValue: 10, another: "1001", "test"))
// первым идет глобальное имя. Внутри функции, локально, можем работать со вторым именем. Если одно имя - то оно используется как локально, так и глобально. Если _ - то не видим название аргумента



func printMessage() -> Void { // если функция ничего не возвращает можно не писать ничего, можно  -> Void можно не писать или можно ->()
    print("hello")
}
printMessage()


//СКВОЗНЫЕ ПАРАМЕТРЫ

var q = 10
var k = 20

func changeValue(_ a: inout Int, _ b: inout Int) {// inout -  сквозные аргументы, могут изменяться. Без inout мы не сможем менять переменные

    let tmp = a
    a = b
    b = tmp
}

print(q)
print(k)

changeValue(&q, &k) // Амперсанд - ключ, который указывает, что мы используем сквозные аргументы.

print(q)
print(k)
