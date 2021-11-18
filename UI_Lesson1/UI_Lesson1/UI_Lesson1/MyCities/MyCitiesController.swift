//
//  MyCitiesController.swift
//  UI_Lesson1
//
//  Created by Дмитрий Шароваров on 08.11.2021.
//

import UIKit

class MyCitiesController: UITableViewController {

    
    var cities = [String]()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
     let cell = tableView.dequeueReusableCell(withIdentifier: "MyCitiesCell", for: indexPath) as! MyCitiesCell // Получаем ячейку из пула
     let city = cities[indexPath.row] // Получаем город для конкретной строки
     cell.MyCityName.text = city // Устанавливаем город в надпись ячейки
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
        if editingStyle == .delete {// Если была нажата кнопка «Удалить»
            cities.remove(at: indexPath.row) // Удаляем город из массива
            tableView.deleteRows(at: [indexPath], with: .fade)// И удаляем строку из таблицы
        
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addCity(segue: UIStoryboardSegue) {
        
        if segue.identifier == "addCity" {// Проверяем идентификатор, чтобы убедиться, что это нужный переход
            guard let allCitiesController = segue.source as? AllCitiesController  // Получаем ссылку на контроллер, с которого осуществлен переход
            else {
                return
                
            }
            
            if let indexPath = allCitiesController.tableView.indexPathForSelectedRow {// Получаем индекс выделенной ячейки
                let city = allCitiesController.cities[indexPath.row] // Получаем город по индексу
                if !cities.contains(city) { // Проверяем, что такого города нет в списке
                    cities.append(city)// Добавляем город в список выбранных
                    tableView.reloadData()// Обновляем таблицу
    
                }
            }
        }
    }
    
    
}
