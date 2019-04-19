//
//  AddKitViewController.swift
//  iPresent
//
//  Created by Lennon Puype on 08/04/2019.
//  Copyright © 2019 Lennon Puype. All rights reserved.
//

import UIKit
import CoreData

protocol AddKitDelegate: class{
    func kitAdded();
}

class AddKitViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    weak var delegate: AddKitDelegate?;

    var imagePicker: UIImagePickerController!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    
    var img:UIImage? = nil;
    var imageData:Data? = nil;
    
    var activity = true;
    
    @IBOutlet weak var playername: UITextField!
    @IBOutlet weak var team: UITextField!
    @IBOutlet weak var moreinfo: UITextField!
    @IBOutlet weak var errorField: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func switchPlayerActivity(_ sender: UISwitch) {
        if(sender.isOn){
            print("yes!")
            activity = true;
        }else{
            print("No :(")
            activity = false;
        }
    }
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!)
        // Do any additional setup after loading the view.
    }
    

   
    func saveKit(playername: String, team: String, moreinfo: String){
        
       let kit = Kit(context:context);
      
        kit.playername = playername;
        kit.team = team;
        kit.moreinfo = moreinfo;
        kit.image = imageData;
        kit.activity = activity;
       // kit.image = image;
        print(imageData);

        
        
        do{
            try context.save();
            navigationController!.popViewController(animated: true)
            
        } catch {
            print("Error saving context: \(error)");
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil);
        imageView.image = info[.originalImage] as? UIImage;
        
        img = info[.originalImage] as? UIImage;
        imageData = img!.jpegData(compressionQuality: 0.30);
    }
    
    // MARK: -IBActions
    @IBAction func saveKitButton(_ sender: Any) {
        let playerName:String
        playerName = playername.text!
        let playerTeam:String
        playerTeam = team.text!
        let moreInfo:String
        moreInfo = moreinfo.text!
        //let currentImage = imageView.image!;UIImage();
        
        if(playerName == "" || playerTeam == "" || moreInfo == "" || img == nil){
            errorField.isHidden = false
            view.endEditing(true)
        }else{
            self.saveKit(playername: playerName, team: playerTeam, moreinfo: moreInfo);
            delegate?.kitAdded();
        }
    }
    
    @IBAction func hiddenArea(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func takePic(_ sender: UIButton) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
}
