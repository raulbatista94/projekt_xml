//
//  DetailViewController.swift
//  PROJECT_XML
//
//  Created by Raul Batista on 03/04/2017.
//  Copyright © 2017 default. All rights reserved.
//

import UIKit
import Foundation

var actual_activity : String = ""
var points : Int = 0
var seconds = 60
var timer_t = Timer()
var count = 10
    class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var randomActivity: UILabel!

    @IBOutlet weak var timer: UILabel!
        
    @IBOutlet weak var guessWord: UILabel!

    @IBOutlet weak var TeamName: UILabel!
    
    @IBOutlet weak var correctButton: UIButton!

    @IBOutlet weak var incorrectButton: UIButton!
        
    @IBOutlet weak var takePhotoButton: UIButton!
        
    @IBOutlet weak var takeVideoButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
        
    @IBOutlet weak var stopButton: UIButton!
    
    
    
    func configureView() {
        if let team = self.team {
            /*if let label = self.detailDescriptionLabel {
                label.text = "\(team.score)"
            }*/
            if let label = self.TeamName{
                label.text = "Team: " + team.name! + " Score: " + String(team.score)
            }
        }
        if let label = self.randomActivity{ //RANDOM SELECTION OF ACTIVITY FROM VECTOR
            let array = ["Draw", "Describe", "Panthomime"]
            let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
            actual_activity = (array[randomIndex])
            label.text = actual_activity

        
        }
        
        if let label = self.guessWord{
            let myURLString = "http://randomword.setgetgo.com/get.php"
            guard let myURL = URL(string: myURLString) else {
                print("Error, \(myURLString) seems to be not valid")
                return
            }
            
            do{
                let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
                label.text = myHTMLString
            }catch let error {
                print("Error: \(error)")
            }
            
        }
    
    }

//points and hiding previous labels
    @IBOutlet weak var points3Button: UIButton!
    @IBAction func points3(_ sender: Any) {
        points3Button.isHidden = true
        points4Button.isHidden = true
        points5Button.isHidden = true
        randomActivity.isHidden = true
        self.team?.rounds += 1
        points = 3
        startButton.isHidden = false
        stopButton.isHidden = false
        if actual_activity == "Panthomime"{
            takeVideoButton.isHidden = false
            takePhotoButton.isHidden = true
            
        }else{
            if actual_activity == "Draw"{
                takePhotoButton.isHidden = false
                takeVideoButton.isHidden = true
            }else{
                if actual_activity == "Describe"{
                    takePhotoButton.isHidden = true
                    takeVideoButton.isHidden = true
                }
            }
        }

        correctButton.isHidden = false
        incorrectButton.isHidden = false
        guessWord.isHidden = false
        timer.isHidden = false
    }

    @IBOutlet weak var points4Button: UIButton!
    @IBAction func points4(_ sender: Any) {
        points3Button.isHidden = true
        points4Button.isHidden = true
        points5Button.isHidden = true
        randomActivity.isHidden = true
        self.team?.rounds += 1
        points = 4
        startButton.isHidden = false
        stopButton.isHidden = false
        if actual_activity == "Panthomime"{
            takeVideoButton.isHidden = false
            takePhotoButton.isHidden = true
            
        }else{
            if actual_activity == "Draw"{
                takePhotoButton.isHidden = false
                takeVideoButton.isHidden = true
            }else{
                if actual_activity == "Describe"{
                    takePhotoButton.isHidden = true
                    takeVideoButton.isHidden = true
                }
            }
        }
        
        correctButton.isHidden = false
        incorrectButton.isHidden = false
        guessWord.isHidden = false
        timer.isHidden = false
    }
    
    @IBOutlet weak var points5Button: UIButton!
    @IBAction func points5(_ sender: Any) {
        points3Button.isHidden = true
        points4Button.isHidden = true
        points5Button.isHidden = true
        randomActivity.isHidden = true
        self.team?.rounds += 1
        points = 5
        startButton.isHidden = false
        stopButton.isHidden = false
        if actual_activity == "Panthomime"{
            takeVideoButton.isHidden = false
            takePhotoButton.isHidden = true
            
        }else{
            if actual_activity == "Draw"{
                takePhotoButton.isHidden = false
                takeVideoButton.isHidden = true
            }else{
                if actual_activity == "Describe"{
                    takePhotoButton.isHidden = true
                    takeVideoButton.isHidden = true
                }
            }
        }
        
        correctButton.isHidden = false
        incorrectButton.isHidden = false
        guessWord.isHidden = false
        timer.isHidden = false
    }
        
 //end of points part
  
   //Starting to work with timer part

        @IBAction func start(_ sender: Any) {
            timer_t = Timer.scheduledTimer(timeInterval: 1,target: self, selector: #selector(AppViewController.counter), userInfo: nil, repeats: true)
            
            
        }
        
        func counter(){
            if (seconds > 0){
                seconds -= 1
                timer.text = String(seconds) + " Seconds"
            }
            
            if (seconds == 0) {
                //systemSoundID = 1016
                timer_t.invalidate()
                //AudioServicesPlaySystemSound(systemSoundID)
                //AudioServicesPlaySystemSound(1521)
            }

        }
        

        @IBAction func stop(_ sender: Any) {
            timer_t.invalidate()
        }
        
        
   //end of the timer part
   
        
        @IBAction func correct(_ sender: Any) {
            team?.score += points
            
            dismiss(animated: true, completion: nil)
            
        }
        
        @IBAction func incorrect(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }
        

        
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.isHidden = true
        stopButton.isHidden = true
        takePhotoButton.isHidden = true
        takeVideoButton.isHidden = true
        correctButton.isHidden = true
        incorrectButton.isHidden = true
        timer.isHidden = true
        guessWord.isHidden = true
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

