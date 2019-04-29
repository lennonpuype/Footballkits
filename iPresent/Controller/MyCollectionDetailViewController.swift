//
//  MyCollectionDetailViewController.swift
//  iPresent
//
//  Created by Lennon Puype on 11/04/2019.
//  Copyright © 2019 Lennon Puype. All rights reserved.
//

import UIKit

class MyCollectionDetailViewController: UIViewController {

    //MARK: IBOutlets
    //Veranderlijke data
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var backName: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var team: UILabel!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var information: UITextView!
    @IBOutlet weak var kitImage: UIImageView!
    @IBOutlet weak var playerImage: UIImageView!
    
    //Variabele Images
    @IBOutlet weak var matchwornImage: UIImageView!
    @IBOutlet weak var signedImage: UIImageView!
    
    @IBOutlet weak var BackButtonForStyling: UIButton!
    
    //MARK: Global variables
    var footballer:AnyKit?;
    
    //MARK: View Loading
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        BackButtonForStyling.layer.cornerRadius = 20;
        useData();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
  
    //MARK: managing data
    func useData(){
        backName.text = footballer?.backName;
        year.text = footballer?.year;
        team.text = footballer?.team;
        brand.text = footballer?.brand;
        information.text = footballer?.description;
        kitImage.image = UIImage(named: ("\(footballer?.name.lowercased() ?? "")_kit"))
        playerImage.image = UIImage(named: (footballer?.name.lowercased())!)
        
        let matchworn = footballer!.matchworn;
        let signed = footballer!.signed;
        
        if(matchworn){
            matchwornImage.image = UIImage(named: "true")
        }else{
            matchwornImage.image = UIImage(named: "false")
        }
        
        if(signed){
            signedImage.image = UIImage(named: "true")
        }else{
            signedImage.image = UIImage(named: "false")
        }
    }
    
    //MARK: IBActions
    @IBAction func goBack(_ sender: Any) {
        performSegue(withIdentifier: "goBackToCollection", sender: nil)
    }
    
}
