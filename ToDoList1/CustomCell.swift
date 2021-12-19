//
//  CustomCell.swift
//  ToDoList1
//
//  Created by admin on 18/12/2021.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var DescLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
