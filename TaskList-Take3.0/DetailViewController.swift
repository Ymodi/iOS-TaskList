//
//  DetailViewController.swift
//  TaskList-Take3.0
//
//  Created by Yesha Modi on 2017-02-20.
//  Copyright © 2017 Yesha Modi-300895482. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var task: Task?
    //var passedValue
    
    @IBOutlet weak var taskTextLabel: UITextField!
    
    
    @IBOutlet weak var notesTextLable: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
   //  taskTextLabel.text = detailName
        //notesTextLable.text = task.notes!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
