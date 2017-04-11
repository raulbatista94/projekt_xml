//
//  ActivitySelectorController.swift
//  PROJECT_XML
//
//  Created by Raul Batista on 11/04/2017.
//  Copyright © 2017 default. All rights reserved.
//

import Foundation
import UIKit

class ActivitySelectorController : UIViewController {
    
    func configureView(){
        
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
    
    var team: Team? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
}
