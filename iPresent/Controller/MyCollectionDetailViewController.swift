//
//  MyCollectionDetailViewController.swift
//  iPresent
//
//  Created by Lennon Puype on 11/04/2019.
//  Copyright © 2019 Lennon Puype. All rights reserved.
//

import UIKit

class MyCollectionDetailViewController: UIViewController {

   
    @IBOutlet weak var backButton: UIButton!
    
    var footballer:AnyKit?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backButton.layer.cornerRadius =  20;
        
        print(footballer?.playerName)
    }
    
    @IBAction func goBackToCollection(_ sender: Any) {
        
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
