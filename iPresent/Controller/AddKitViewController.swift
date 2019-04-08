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
        } catch {
            print("Error saving context: \(error)");
        }

        print(FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!)
        
    }
    
    @IBAction func saveKitButton(_ sender: Any) {
        self.saveKit(playername: "Messi", team: "Barcelona", moreinfo: "I got this shirt on a trip in Barcelona");
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
