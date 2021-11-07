//
//  ViewController.swift
//  UI_lesson3
//
//  Created by Дмитрий Шароваров on 07.11.2021.
//

import UIKit

class MyViewController: UIViewController {// на экране мы видим UIViewController, а не ViewController

 
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.backgroundColor = .green
        
        myTableView.dataSource = self// предоставляет информацию для таблицы
        myTableView.delegate = self//обработка событий делегируется кому-то (ViewController) - нажатия, удаления и тд
//        myTableView.isEditing = true//возможность редактировать ячейки
    }

}

// IndexPath = 0; 5 можно представить как кортеж, содержит в себе номер секции и номер ячейки

extension MyViewController: UITableViewDataSource{//два обязательных метода для работы протокола
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2//таблица имеет не только ряды, но и секции. Опциональный метод, реализованный по дефолту
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//возвращает количество рядов
        return 10//вызывает 10 раз метод ниже
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//метод, который просит вернуть сам ряд (ячейку). indexPath - номер ячейки в массиве - начинается с 0.
        
        if indexPath.section == 0 {
//            if indexPath.row == 5 {
//                return UITableViewCell()// выйти из функции на пятой ячейке
//            }
            
            guard let cell = myTableView.dequeueReusableCell(withIdentifier: "MyFirstTableViewCell", for: indexPath) as? MyFirstTableViewCell//прописали ID у ячейки и вызвали ее сюда. as прописываем для того, чтобы работали методы, прописанные в MyFirstTableViewCell
            else {
                return UITableViewCell()
            }
            cell.textLabel?.text = indexPath.row.description // наши ячейки имеют в себе дефолтный лэйбл. indexPath - это целый тип, который репрезентирует адрес ячейки
            cell.myFirstButton.setTitle("Next", for: .normal)
            cell.saySomething()
            return cell
            //return UITableViewCell()//возвращается пустая ячейка без ничего
        } else {
            let cell = myTableView.dequeueReusableCell(withIdentifier: "MySecondTableViewCell", for: indexPath)
            
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400// выдаем высоту ячейки через код, если нужно что-то конфигурировать
//    }
}

extension MyViewController: UITableViewDelegate{//чтобы можно было делегировать. Все методы опциональны
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)//выводить номер при нажатии на ячейку
    }
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        true // можно редактировать ячейки
//    }
  
}
