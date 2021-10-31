//
//  main.swift
//  Lesson7
//
//  Created by Дмитрий Шароваров on 11.10.2021.
//

import Foundation

var isInControl = true

func selfDrive() {
    if isInControl {//если ошибок несколько, то надо будет плодить if else
        print("all good")
        
    } else {
        print("baaad")
    }
        
}

enum TeslaError: Error{
    case lostGPS
    case lowBATTERY
    
}


var lostGPS = true
var lowBattery = false

func autoDriveTesla() {//тут мы сразу обрабатываем ошибки
    if lostGPS {
        print("We lost")
    }
    
    if lowBattery {
        print("Low battery")
    }
}


//нам метод выкинет нам ошибку с помощью throws, которую нужно будет обработать отдельно
func autoDriveTeslaError() throws {
    if lostGPS {
        throw TeslaError.lostGPS
    }
    
    if lowBattery {
        throw TeslaError.lowBATTERY
    }
    //если ошибок нет, то можем дальше выполнять методы
    //грузить данные
    //выводить на экран
}


do {//обрабатываем ошибки
    try autoDriveTeslaError()
} catch TeslaError.lostGPS {
    print("we lost")
} catch TeslaError.lowBATTERY {
    print("low battery")
}
            

//еще пример

enum jsonDownload: Error {
    case moreSizeFileDownload
    case noNameFiles
    case serverError(error: Int)
    
}

struct File {
    var image: String
    var size: Int
    
}


class downloadJSON {
    var fileDownload = [
        "dog.jped": File(image: "dog", size: 5),
        "cat.jpeg": File(image: "cat", size: 10),
        "car.jpeg": File(image: "car", size: 2)
    ]
    
    var sizeDownload = 8
    var errorValue = 0
    
    func download(itemNamed name: String, error: Int) throws {
        guard let file = fileDownload[name] else {//guard создает более глобальные параметры, в отличие от if else
            throw jsonDownload.noNameFiles
        }
        
        guard file.size <= sizeDownload else{
            throw jsonDownload.moreSizeFileDownload
        }
        
        guard error == 200 else {
            throw jsonDownload.serverError(error: errorValue)
        }
        
        print("Загружена \(name) размером \(file.size)")
    }
}


let UICollection = [
    "TableView" : "dog.jpeg",
    "TabBar" : "car.jpeg",
    "CollectionView" : "cat.jpeg"
]


func download(collection: String, funcDownload: downloadJSON) throws {//если мы ссылаемся на метод с throws, то тут он тоже должен быть
    let serverMessage = 200
    let collectionItem = UICollection[collection] ?? "LoadScreen"
    try funcDownload.download(itemNamed: collectionItem, error: serverMessage)
}

do {
    try download(collection: "TableView", funcDownload: downloadJSON())
} catch jsonDownload.noNameFiles {
    print("Нет такого файла")
    
} catch jsonDownload.moreSizeFileDownload {
    print("Слишком большой файл")
} catch jsonDownload.serverError(let errorCode) {
    print("Сервер вернул ошибку \(errorCode)")
}


//try! loadImage("/Resource/cat.jpeg")// мы не хотим проходить этап проверки. Это как принудительное раскрытие опционального типа. Нужно быть осторожным


func someThrowingFunction() throws -> Int {
    return 0
}

var y: Int?

do {
    y = try someThrowingFunction()
} catch {
    y = nil //если случается ошибка, то y - nil
}

let x = try? someThrowingFunction() // это заменяет строки сверху


enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password != "password" {
        throws PasswordError.obvious
    }
    return true
}

do {
    try checkPassword("password")
    print("ALL OK")
} catch {
    print("Error password")
}

if let result = try? checkPassword("password") {
    print("all OK \(result)")

} else {
    print("error")
}

//
var array: [String] = ["🔥","💨","⚡️","💧"]
