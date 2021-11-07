//
//  MyFirstTableViewCell.swift
//  UI_lesson3
//
//  Created by Дмитрий Шароваров on 07.11.2021.
//

import UIKit

class MyFirstTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myFirstButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        print("I'm alive!")//при создании ячейки выдавать текст
    }
    
    func saySomething(){
        print("Hello")
    }
    

}
