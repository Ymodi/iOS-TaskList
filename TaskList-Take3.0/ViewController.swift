//
//  ViewController.swift
//  TaskList-Take3.0
//
//  Created by Yesha Modi on 2017-02-15.
//  Copyright © 2017 Yesha Modi-300895482. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var data : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Bring the data from core data
            getData()
        
        //Reload the screen
            tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = data[indexPath.row]
        if task.isImportant{
            print ("Yesh it is!")
            
            //Why I cant see smiley there
            cell.textLabel?.text = "🤓\(task.name!)"
        }else{
         print ("not fetching data")
        }
        cell.textLabel?.text = task.name!
        
        return cell
    }
    
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            data = try context.fetch(Task.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
    }


}

