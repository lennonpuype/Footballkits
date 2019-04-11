//
//  MyCollectionDetailViewController.swift
//  iPresent
//
//  Created by Lennon Puype on 11/04/2019.
//  Copyright © 2019 Lennon Puype. All rights reserved.
//

import UIKit

class MyCollectionDetailViewController: UIViewController {

   
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
    
    var footballer:AnyKit?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        BackButtonForStyling.layer.cornerRadius = 20;
        
        useData();
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isStatusBarHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
  
    
    func useData(){
        fullName.text = footballer?.playerName;
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
    
    @IBAction func goBack(_ sender: Any) {
        print("goBack")
        
        performSegue(withIdentifier: "goBackToCollection", sender: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
