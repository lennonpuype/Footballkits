//
//  FootballerDetailViewController.swift
//  iPresent
//
//  Created by Lennon Puype on 07/04/2019.
//  Copyright © 2019 Lennon Puype. All rights reserved.
//

import UIKit

class FootballerDetailViewController: UIViewController {

   
    @IBOutlet weak var footballerImage: UIImageView!
    @IBOutlet weak var footballerName: UILabel!
    
    var footballer:Footballer?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        footballerImage.image = UIImage(named: footballer!.name.lowercased());
        footballerName.text = footballer?.name;
        
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