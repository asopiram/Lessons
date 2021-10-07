//
//  main.swift
//  Lesson-3
//
//  Created by Дмитрий Шароваров on 27.09.2021.
//

import Foundation

// КОМПЛЕКСНЫЕ ТИПЫ ДАННЫХ

// ПЕРЕЧИСЛЕНИЯ

//нужно создать пулл переменных
//перечисление - проблема в неуниверсальности названий
//переменная может быть создана в любом месте программы и мы ее можем потерять
var russianCurrence: String = "Rouble"
var dollarCur: String = "dollar"
var euro: String = "euro"

//массив, вроде бы все хорошо
var currencyArray: [String] = ["Rouble", "Dollar", "Euro"]
print(currencyArray[0])// мы не всегда помним под каким индексом наше значение

//перечисление enum
enum currency_enum {//перечисление содержит ассоциированные параметры
    case Rouble
    case Dollar
    case Euro
}

var rouble: currency_enum = .Rouble // Название перечисления указывается как тип данных. После точки предлагаются варианты из перечисления. Первый вариант вызова данных
var dollar = currency_enum.Dollar // Второй вариант вызова


//движения черепашки:)
enum Direction: String {// чтобы не ошибиться, уточнаяем тип данных
    case Left = "left"
    case Right = "right"
}
enum Action{
    case Walk(meters: Int) //задаем тип параметров
    case Run(meters: Int, speed: Int) // может быть несколько параметров
    case Stop
    case Turn(direction: Direction)
    
//    enum action2{//может храниться другое перечисление
//        case fly
//       case jump
//    }
}

var action = Action.Run(meters: 1000, speed: 10)
action = Action.Walk(meters: 50) //можем не прописывать Action при изменении параметров.
action = .Run(meters: 100, speed: 4)
action = .Turn(direction: .Left)

//var action2 = Action.action2.fly
//action2 = .jump //после того, как уже показывали адрес, можно вызывать быстро без этого адреса.

switch action{

case .Stop:
    print("Stop") // action определен перечислением, поэтому можем выбирать только из перечисления
    
case .Walk(let meters) where meters < 100: // создаем параметр meters
    print("Small walk") // можем проверить
    
case .Walk:
    print("Long walk")
    
case .Run(let m, let s):
    print("пробежали \(m) со скоростью \(s)")
    
case .Turn(let direction) where direction == .Left:
    print(direction.rawValue) //rawValue выводит то, что есть в перечислении. Это чтобы не ошибиться с тем, что выводить на print

default:
    break
}


// СТРУКТУРЫ
// нужна для создания скелета / основны программы
// int - тоже структура

struct playerChess {// это как тип данных
    var name: String = ""//значения по умолчанию. Это свойство структуры
    var wins: Int = 0 // это свойство структуры
    
    func description(){//функции в структурах называются МЕТОДЫ
        print("Игрок \(name) выиграл \(wins) игр")
    }
    
    mutating func addWins(countOfwins: Int){//mutating - будем изменять свойства, на основании данных , которые передали в структуру
        self.wins += countOfwins //обращение к свойству структуры при помощи self, а не к параметру, который передали в функцию
        
    }
    
    init(namePlayer: String, winsPlayer: Int){//в структуре автоматически создаются конструкторы, но когда мы хотим понять более подробно, что нам нужно передавать в структуру, мы создает init
        self.name = namePlayer
        self.wins = winsPlayer
    }
    
    init(){ // init - инициализация. Тут прописываем случай, когда ничего не написали
        self.name = ""
        self.wins = 0
    }
}

var oleg: playerChess = playerChess(namePlayer: "Олег", winsPlayer: 3)//инициализируем (конструктор) свойство нашей структуры
print(oleg.wins)


var max = playerChess()
print(max.wins)

if oleg.wins > max.wins {
    print("Олег играет лучше")
} else {
    print("Макс играет лучше")
}

oleg.description()
max.description()

oleg.addWins(countOfwins: 4)
max.addWins(countOfwins: 10)

oleg.description()
max.description()

//oleg.addWins(wins: 10)


var alex = oleg //создали экземпляр из другу экземпляра структуры
print(alex.name) // будет копировать параметры
alex.name = "Alex" // можем изменить имя
print(alex.name) //поменялось в алекс
print(oleg.name) // не затронуто в олег


/*// пример использования структур в работе как из говна и палок получить что-то внятное. Не работает у меня, поэтому я все закомментил:)
// скачиваем данные по биткоину

let urlBitcoin = URL(string: "https://www.cryptingup.com/api/markets")

URLSession.shared.dataTask(with: urlBitcoing){(data, responce, error)} in
if let data = data {
    let jsonString = String(data: data, encogin: .utf8)
    print(jsonString)
    
} else {
    print(error)
} .resume()

struct Bitcoin: Decodable {
    var markets: [Markets]
}

struct Markets: Decodable {
    let symbol: String
    let price: Double
    let change_24h: Double
}

URLSession.shared.dataTask(with: urlBitcoin) {(data, responce, error) in
    
    do{
        
        let markets = try JSONDecoder().decode(Bitcoin.self, from: data)
    } catch {
        print(error)
    }
    
    
}
*/
