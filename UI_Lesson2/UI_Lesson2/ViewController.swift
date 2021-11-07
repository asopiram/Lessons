//
//  ViewController.swift
//  UI_Lesson2
//
//  Created by Дмитрий Шароваров on 29.10.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        moveToNextController()
        
    }
    
    
    @IBAction func someButtonPressed(_ sender: UIButton) {
        print("I'm pressed")
        
    }
    
    func moveToNextController() {
        
        performSegue(withIdentifier: "FirstSegue", sender: self)
    }
    

//    @IBSegueAction func firstSegue(_ coder: NSCoder, sender: Any?, sequeIdentifier: String?) -> UIViewController? {
//        return UIViewController()
//    }
    
    
    
}

