//
//  FootballerDetailViewController.swift
//  iPresent
//
//  Created by Lennon Puype on 07/04/2019.
//  Copyright © 2019 Lennon Puype. All rights reserved.
//

import UIKit

class FootballerDetailViewController: UIViewController {

   

    @IBOutlet weak var FootballerName: UILabel!
    @IBOutlet weak var FootballerImage: UIImageView!
    
    
    
    var footballer:Footballer?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        FootballerImage.image = UIImage(named: footballer!.name.lowercased());
       
        FootballerName.text = footballer?.fullName;
        
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
