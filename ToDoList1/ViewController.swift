//
//  ViewController.swift
//  ToDoList1
//
//  Created by admin on 18/12/2021.
//

import UIKit
import CoreData

class ViewController: UITableViewController, sendDataDelegate {
    
    func sendData(data: ItemStruct) {
        
        saveItem(item: data)
        getItem()
        
    }
    
    var itemsInTableView:[ItemTable]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getItem()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return  itemsInTableView.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        
        
        cell.TitleLabel.text = itemsInTableView[indexPath.row].title1
        cell.DescLabel.text = itemsInTableView[indexPath.row].desc1
        cell.DateLabel.text = itemsInTableView[indexPath.row].date1
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if let Item = itemsInTableView[indexPath.row].title1 {
            deleteItem(item:Item)
            
        }
    }
    
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        
        let addtoListVC = storyboard?.instantiateViewController(withIdentifier: "addtolist") as! addToListViewController
        addtoListVC.delegate = self
        self.navigationController?.pushViewController(addtoListVC, animated: true)
    }
}

struct ItemStruct{
    var title:String?
    var desc:String?
    var date:String?
}

extension ViewController{
    
    func getContext () -> NSManagedObjectContext {
       
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
        
    }
    
    func saveItem(item:ItemStruct ) {
        
        let context = getContext()
        let Item = ItemTable.init(context: context)
        Item.title1 = item.title
        Item.desc1 = item.desc
        Item.date1 = item.date
        
        do {
            try  context.save()
        }catch {
            print (error.localizedDescription)
        }
    }
    
    func getItem () {
       
        let context = getContext()
        let request = NSFetchRequest<ItemTable>.init(entityName: "ItemTable")
        
        do {
            let Item = try context.fetch(request)
            itemsInTableView = Item
            tableView.reloadData()
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    func deleteItem(item:String) {
        let context = getContext()
        let request = NSFetchRequest<ItemTable>.init(entityName: "ItemTable")
        let predicate = NSPredicate.init(format: "title1 = %@", item )
        request.predicate = predicate
        
        do{
            if let recievedItem = try context.fetch(request).first{
                context.delete(recievedItem)
                try context.save()
                getItem()
            }
        }catch{
            print(error.localizedDescription)
            
        }
    }
}





