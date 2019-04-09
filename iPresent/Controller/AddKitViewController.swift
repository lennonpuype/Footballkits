//
//  AddKitViewController.swift
//  iPresent
//
//  Created by Lennon Puype on 08/04/2019.
//  Copyright © 2019 Lennon Puype. All rights reserved.
//

import UIKit
import CoreData

class AddKitViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imagePicker: UIImagePickerController!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
   
    
    @IBOutlet weak var playername: UITextField!
    @IBOutlet weak var team: UITextField!
    @IBOutlet weak var moreinfo: UITextField!
    @IBOutlet weak var errorField: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    func saveKit(playername: String, team: String, moreinfo: String){
        
       let kit = Kit(context:context);
      
        kit.playername = playername;
        kit.team = team;
        kit.moreinfo = moreinfo;
       // kit.image = image;

        //print(FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!)
        
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
        
        if(playerName == "" || playerTeam == "" || moreInfo == ""){
            errorField.isHidden = false
            view.endEditing(true)
        }else{
            self.saveKit(playername: playerName, team: playerTeam, moreinfo: moreInfo);
        }
    }

    @IBAction func takePic(_ sender: UIButton) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}