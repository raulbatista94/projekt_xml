//
//  NewTeamViewController.swift
//  PROJECT_XML
//
//  Created by Raul Batista on 03/04/2017.
//  Copyright © 2017 default. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

protocol SaveTeamDelegate {
    func saveTeam(name : String, score : Int)
}

class NewTeamViewController: UIViewController, UINavigationControllerDelegate {
    var saveDelegate: SaveTeamDelegate?
   
    
    @IBOutlet weak var TeamName: UITextField!
    
    @IBAction func save(_ sender: Any) {
        print("Ulozilo sa ")
        let name = self.TeamName.text ?? "No name entred"
        saveDelegate?.saveTeam(name: name, score : 0)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
