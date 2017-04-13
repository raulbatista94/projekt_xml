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
//import AudioToolbox
//import AVFoundation






class AppViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    var seconds = 60
    var timer_t = Timer()
    var count = 10
    
    
    @IBOutlet weak var timer: UILabel!
    
    @IBOutlet weak var guessWord: UILabel!
    
   // var systemSoundID: SystemSoundID = 0

    
    
    
    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
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
            //systemSoundID = 1016
            timer_t.invalidate()
            //AudioServicesPlaySystemSound(systemSoundID)
            //AudioServicesPlaySystemSound(1521)
        }
    }

    

    
    @IBAction func stop(_ sender: Any) {
        timer_t.invalidate()
        //systemSoundID = 0
    }
        
    @IBAction func hideWord(_ sender: Any) {
        self.guessWord.isHidden = true
    }
    


    @IBAction func showWord(_ sender: Any) {
        self.guessWord.isHidden = false
        
    }
    
    @IBAction func correct(_ sender: Any) {
        func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let controller = (segue.destination as! UINavigationController).topViewController as! MasterViewController
        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
        controller.navigationItem.leftItemsSupplementBackButton = true
        
        }
    }
    
    @IBAction func incorrect(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var photoButton: UIButton!
    @IBAction func takePhoto(_ sender: Any) { //Opning camera or saved images if the activity is draw
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            self.present(imagePicker, animated: true, completion: nil)
            
        }else{
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
            
        }
        
        
    
    }
    
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBAction func cameraButtonPressed(_ sender: Any) {
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        if actual_activity == "Panthomime"{
            cameraButton.isHidden = false
            photoButton.isHidden = true
            
        }else{
            if actual_activity == "Draw"{
            photoButton.isHidden = false
            cameraButton.isHidden = true
            }else{
                if actual_activity == "Describe"{
                    photoButton.isHidden = true
                    cameraButton.isHidden = true
                }
            }
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
