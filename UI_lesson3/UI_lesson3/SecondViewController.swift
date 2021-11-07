//
//  SecondViewController.swift
//  UI_lesson3
//
//  Created by Дмитрий Шароваров on 07.11.2021.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    
}

extension SecondViewController: UICollectionViewDelegate{
    
}

extension SecondViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100//количество ячеек
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionCell", for: indexPath)
        
        return cell
    }
}
