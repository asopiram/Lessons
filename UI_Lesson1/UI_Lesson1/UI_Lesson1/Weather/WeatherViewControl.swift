//
//  WeatherViewControl.swift
//  UI_Lesson1
//
//  Created by Дмитрий Шароваров on 25.11.2021.
//

import UIKit

class WeatherViewControl: UIViewController {
    

    @IBOutlet weak var WeatherCollectionView: UICollectionView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            WeatherCollectionView.delegate = self
            WeatherCollectionView.dataSource = self
        }
    }


extension WeatherViewControl: UICollectionViewDelegate{
        
}


extension WeatherViewControl: UICollectionViewDataSource{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherViewCell
        cell.weather.text = "30 C"
        cell.time.text = "30.08.2017 18:00"
            
        return cell
            
    }
}
