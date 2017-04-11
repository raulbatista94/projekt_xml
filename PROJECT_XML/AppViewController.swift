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



class AppViewController : UIViewController {

    
    var seconds = 60
    var timer_t = Timer()
    var count = 10
    
    
    @IBOutlet weak var timer: UILabel!
    
    @IBOutlet weak var guessWord: UILabel!
    

    
    
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func configureView(){
        
        
        // RANDOM WORD GENERATED FROM URL
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
    
    
    @IBAction func start(_ sender: Any) {
            timer_t = Timer.scheduledTimer(timeInterval: 1,target: self, selector: #selector(AppViewController.counter), userInfo: nil, repeats: true)
        
        
    }
    
    func counter(){
        if (seconds > 0){
        seconds -= 1
        timer.text = String(seconds) + " Seconds"
        }
        
        if (seconds == 0) {
            timer_t.invalidate()
        }
    }

    

    
    @IBAction func stop(_ sender: Any) {
        timer_t.invalidate()
    }
        
    @IBAction func hideWord(_ sender: Any) {
        self.guessWord.isHidden = true
    }
    


    @IBAction func showWord(_ sender: Any) {
        self.guessWord.isHidden = false
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
