//
//  DetailViewController.swift
//  PROJECT_XML
//
//  Created by Raul Batista on 03/04/2017.
//  Copyright © 2017 default. All rights reserved.
//

import UIKit

var actual_activity : String = ""
var points : Int = 0

    class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var randomActivity: UILabel!
    
    

    @IBOutlet weak var TeamName: UILabel!

    
    func configureView() {
        // Update the user interface for the detail item.
        if let team = self.team {
            if let label = self.detailDescriptionLabel {
                label.text = "\(team.score)"
            }
            if let label = self.TeamName{
                label.text = team.name
            }
        }
        if let label = self.randomActivity{ //RANDOM SELECTION OF ACTIVITY FROM VECTOR
            let array = ["Draw", "Describe", "Panthomime"]
            let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
            actual_activity = (array[randomIndex])
            label.text = actual_activity

        
        }
    
    }
    
    @IBAction func points3(_ sender: Any) {
        self.team?.rounds += 1
        points = 3
    }

    @IBAction func points4(_ sender: Any) {
        self.team?.rounds += 1
        points = 4
    }
    
    @IBAction func points5(_ sender: Any) {
        self.team?.rounds += 1
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

    var team: Team? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

