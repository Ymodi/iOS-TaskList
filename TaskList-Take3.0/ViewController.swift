//
//  ViewController.swift
//  TaskList-Take3.0
//
//  Created by Yesha Modi on 2017-02-15.
//  Copyright © 2017 Yesha Modi-300895482. All rights reserved.
// In this example here are some various things:
// IMPORTANT TASKS are in diffrent color(Blue)
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var data : [Task] = []
    var valueToPass: String!
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    let task = Task(context: context)
    
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
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = data[indexPath.row]
        
        if task.isImportant{
            print ("Yesh it is!")
            
            //Why I cant see smiley there
            //cell.textLabel?.text = "🤓 \(task.name!)"
            cell.textLabel?.textColor = UIColor.blue
         }else{
         print ("not fetching data")
             cell.textLabel?.text = task.name!
        }
        cell.textLabel?.text = task.name!
        cell.detailTextLabel?.text = task.notes!
       // cell.editButton?.tag = indexPath.row
        //cell.textLabel?.text = task.notes!
        cell.setEditing(true, animated: true)
        //cell.setEditing(, animated: true)
        //cell.editingStyle.rawValue
        //self.performSegue(withIdentifier: "editTask", sender: task)
        
        return cell
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        let destination = segue.destination as! DetailViewController
//        print("segue is gonna work")
//        // send the task object to the DetailView
//        destination.task = data
        
//        var detailVC: DetailViewController = segue.destination as! DetailViewController
//        
//        var selectedItem: Task = data[self.tableView.indexPathForSelectedRow!.row] as Task
//        
//        detailVC.detailName = selectedItem.valueForKey("name") as String
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

    //var deletePlanetIndexPath: NSIndexPath? = nil
    var delete: IndexPath? = nil
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
        
            //deletePlanetIndexPath = indexPath
//            let dataToDelete = data[indexPath.row]
//            confirmDelete(data: dataToDelete)
//            
            let task = data[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                data = try context.fetch(Task.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
        }
        
//        if editingStyle == .insert{
//           print ("Hello")
//
//        }
        tableView.reloadData()
    }
    
    
        
    
    }

    
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
//        // 1
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        // 2
//        var alert = UIAlertController(title: "Update", message: "Please enter the new name for the assignment.", preferredStyle: .alert)
//        
//        // 3
//        var updateAction = UIAlertAction(title: "Update", style: .default){(_) in
//            let nameTextField = alert.textFields![0]
//            self.updateEntity(indexPath.row, newName: nameTextField.text)
//            self.tableView.reloadData()
//        }
//        
//        // 4
//        var cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//        
//        alert.addTextFieldWithConfigurationHandler(nil)
//        
//        alert.addAction(updateAction)
//        alert.addAction(cancelAction)
//        
//        // 5
//        self.presentViewController(alert, animated: true, completion: nil)
//        
//    }
    
//    
//    func confirmDelete(data: Task) {
//        
//         let actionSheetController = UIAlertController(title: "Delete data", message: "Are you sure you want to permanently delete?", preferredStyle: .actionSheet)
//        
//        let yesButton = UIAlertAction(title: "Delete", style: .destructive, handler: {
//            
//        })
//        
//        let noButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { { action in self.showMyAlert(alertTitle: "Negative", alertMessage: "You missed it!") }})
//        
//        actionSheetController.addAction(yesButton)
//        actionSheetController.addAction(noButton)
//        //need to present the button or alert
//        
//        present(actionSheetController, animated: true, completion: nil)
//    }
    
//    func handleDeleteData(alertAction: UIAlertAction!) -> Void {
//        print ("Will work")
//        if let indexPath
//    }
//    
//    func handleCancelData(alertAction: UIAlertAction!) {
//        //delete = nil
//        // deletePlanetIndexPath = nil
//    }


