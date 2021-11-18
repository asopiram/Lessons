//
//  MyCitiesCell.swift
//  UI_Lesson1
//
//  Created by Дмитрий Шароваров on 08.11.2021.
//

import UIKit

class MyCitiesCell: UITableViewCell {

    @IBOutlet weak var MyCityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
