//
//  AddKitViewController.swift
//  iPresent
//
//  Created by Lennon Puype on 08/04/2019.
//  Copyright © 2019 Lennon Puype. All rights reserved.
//

import UIKit
import CoreData

class AddKitViewController: UIViewController {


    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
   
    
    @IBOutlet weak var playername: UITextField!
    @IBOutlet weak var team: UITextField!
    @IBOutlet weak var moreinfo: UITextField!
    @IBOutlet weak var errorField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func saveKit(playername: String, team: String, moreinfo: String){
       
        
       let kit = Kit(context:context);
        kit.playername = playername;
        kit.team = team;
        kit.moreinfo = moreinfo;

        do{
            try context.save();
            navigationController!.popViewController(animated: true)
        } catch {
            print("Error saving context: \(error)");
        }

        
        
        
    }
    
    @IBAction func saveKitButton(_ sender: Any) {
        let playerName = playername.text!;String();
        let playerTeam = team.text!;String();
        let moreInfo = moreinfo.text!;String();
        
        if(playerName == "" || playerTeam == "" || moreInfo == ""){
            errorField.isHidden = false
            view.endEditing(true)
        }else{
            self.saveKit(playername: playerName, team: playerTeam, moreinfo: moreInfo);
        }
        
        
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
