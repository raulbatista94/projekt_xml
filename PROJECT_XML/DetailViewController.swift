//
//  DetailViewController.swift
//  PROJECT_XML
//
//  Created by Raul Batista on 03/04/2017.
//  Copyright © 2017 default. All rights reserved.
//

import UIKit
import Foundation
import CoreData
import AVFoundation
import MobileCoreServices

var actual_activity : String = ""
var points : Int = 0
var seconds = 60
var timer_t = Timer()
var count = 10


    class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

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

    @IBOutlet weak var hideButton: UIButton!
        
    @IBOutlet weak var showButton: UIButton!
    
        var context : NSManagedObjectContext?
  

    
    func configureView() {
        
        
        if let team = self.team {
            if let label = self.TeamName{
                label.text = "Team: " + team.name! + "     Score: " + String(team.score)
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
        @IBAction func cancelPress(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }

//points and hiding previous labels
    @IBOutlet weak var points3Button: UIButton!
        
    @IBAction func points3(_ sender: Any) {
        
        
        
        points3Button.isHidden = true
        points4Button.isHidden = true
        points5Button.isHidden = true
        randomActivity.isHidden = true
        if (self.team?.score)! < 60 {
        self.team?.rounds += 1
        }
        points = 3
        startButton.isHidden = false
        stopButton.isHidden = false
        hideButton.isHidden = false
        showButton.isHidden = false
        
        
        
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
        if (self.team?.score)! < 60 {
            self.team?.rounds += 1
        }
        points = 4
        startButton.isHidden = false
        stopButton.isHidden = false
        hideButton.isHidden = false
        showButton.isHidden = false
        
        
        
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
        if (self.team?.score)! < 60 {
            self.team?.rounds += 1
        }
        points = 5
        startButton.isHidden = false
        stopButton.isHidden = false
        hideButton.isHidden = false
        showButton.isHidden = false
        
        
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
   
        
        
        //FUNCTIONS
        
        @IBAction func hideWord(_ sender: Any) {
            self.guessWord.isHidden = true
        }
        
        @IBAction func showWord(_ sender: Any) {
            self.guessWord.isHidden = false
        }
        
        
        
        func youWin(){//message pops up when the team wins
            var winTeam:String = (team?.name)!
            let alertVC = UIAlertController(
                title: "Team \(winTeam) wins",
                message: "Your team already won and cant obtain more points",
                preferredStyle: .alert)
            let okAction = UIAlertAction(
                title: "OK",
                style:.default,
                handler: nil)
            alertVC.addAction(okAction)
            present(
                alertVC,
                animated: true,
                completion: nil)
        }
        
        
        @IBAction func correct(_ sender: Any) {
            if (team?.score)! < 60 {
            if let context = self.context{
            team?.score += points
            self.team?.setValue(team?.score, forKey: "score")
            self.team?.setValue(team?.rounds, forKey: "rounds")
            dismiss(animated: true, completion: nil)
                do {
                    try context.save()
                } catch {
                    print("Could not be saved")
                }
            }
            }else{
                youWin()
            }
        }
        

        @IBAction func incorrect(_ sender: Any) {
            if (team?.score)! < 60 {
            if let context = self.context{
                self.team?.setValue(team?.rounds, forKey: "rounds")
                do {
                    try context.save()
                }catch {
                    print("Could not be saved")
                }
                }
            dismiss(animated: true, completion: nil)
            }else{
                dismiss(animated: true, completion: nil)
            }
            }
            
        

        
        
        
        
        
        func noCamera(){//message pops up if the device has no cammera
            let alertVC = UIAlertController(
                title: "No Camera",
                message: "Sorry, this device has no camera",
                preferredStyle: .alert)
            let okAction = UIAlertAction(
                title: "OK",
                style:.default,
                handler: nil)
            alertVC.addAction(okAction)
            present(
                alertVC,
                animated: true,
                completion: nil)
        }
        
        
        
        @IBAction func takeVideo(_ sender: Any) {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.mediaTypes = [kUTTypeMovie as String]
                imagePicker.sourceType = .camera
                imagePicker.cameraCaptureMode = .video
                imagePicker.allowsEditing = true
                imagePicker.videoQuality = .typeMedium
                //imagePicker.videoMaximumDuration = Double(seconds)
                self.present(imagePicker, animated: true, completion: nil)
                
                
            }else{
                noCamera()
                
            }
        }
        
        func videoPickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: NSDictionary!) {
        let tempImage = info[UIImagePickerControllerMediaURL] as? NSURL
        let pathString = tempImage?.relativePath
        self.dismiss(animated: true, completion: nil)

        UISaveVideoAtPathToSavedPhotosAlbum((pathString)!, self, nil, nil)

    }
        
        
        @IBAction func takePhoto(_ sender: Any) {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = true
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                imagePicker.cameraCaptureMode = .photo
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
        
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
                UIImageWriteToSavedPhotosAlbum(pickedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
                
                dismiss(animated: true, completion: nil)
            }
        }
        
        func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
            if let error = error {
                // we got back an error!
                let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
            } else {
                let ac = UIAlertController(title: "Saved!", message: "Your image has been saved to your photo gallery.", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
            }
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
        hideButton.isHidden = true
        showButton.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var team: Team? {
        didSet {
            // Update the view
            self.configureView()
        }
    }


}

