//
//  AppViewController.swift
//  PROJECT_XML
//
//  Created by Raul Batista on 03/04/2017.
//  Copyright © 2017 default. All rights reserved.
//

import Foundation
import UIKit
import CoreData

    var points:Int = 0

class ActivitySelectorController : UIViewController {
    
    
    @IBOutlet weak var activity: UILabel!
    
    
    
    
    func configureView(){
        
        if let label = self.activity{ //RANDOM SELECTION OF ACTIVITY FROM VECTOR
            let array = ["Draw", "Describe", "Panthomime"]
            let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
            label.text = (array[randomIndex])
            
        }
        
     
        
        
        
    }
    
    

    @IBAction func points3(_ sender: Any) {
        points = 3
    }
    
    

    @IBAction func points4(_ sender: Any) {
        points = 4
    }

    
    @IBAction func points5(_ sender: Any) {
        points = 5
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
}
