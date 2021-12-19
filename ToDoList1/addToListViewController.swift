//
//  addToListViewController.swift
//  ToDoList1
//
//  Created by admin on 18/12/2021.
//

import UIKit
protocol sendDataDelegate {
    func sendData(data:ItemStruct)
}

class addToListViewController: UIViewController {
 
        @IBOutlet weak var TitleText: UITextField!
        var delegate:sendDataDelegate?
        @IBOutlet weak var DateText: UIDatePicker!
        @IBOutlet weak var DescText: UITextField!
    
        override func viewDidLoad() {
            super.viewDidLoad()
 }
        
        @IBAction func AddItemBtnPressed(_ sender: UIButton) {
            
             let format = DateFormatter()
             format.dateFormat="dd/MM/yyy"
             let Date = format.string(from: DateText.date)
            
            
             let itemData = ItemStruct(title: TitleText.text , desc: DescText.text, date: Date)
             delegate?.sendData(data:itemData)
             self.navigationController?.popViewController(animated: true)
        }
    }
