//
//  KitViewController.swift
//  iPresent
//
//  Created by Lennon Puype on 09/04/2019.
//  Copyright © 2019 Lennon Puype. All rights reserved.
//

import UIKit
import CoreData

class KitViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: IBOutlets
    @IBOutlet weak var emptyLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var kitCollectionView: UICollectionView!
    
    //MARK: Global variables
    var kits = [Kit]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    
    
    //MARK: View Loading
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        changeBasicAppTheme();
        
        addButton.layer.cornerRadius = 30;
        addButton.layer.borderColor =  UIColor.white.cgColor;
        addButton.layer.borderWidth =  4;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        //Getting new data
        loadKits();
        self.kitCollectionView.reloadData()
    }
    
    //MARK: normal functions
    func changeBasicAppTheme(){
        
        //navigationBar - image
        let navController = navigationController!
        
        let image = UIImage(named: "logo_white.png")
        let imageView = UIImageView(image: image);
        
        let bannerWidth=navController.navigationBar.frame.size.width-50;
        let bannerHeight=navController.navigationBar.frame.size.height-50;
        
        
        
        let bannerX = bannerWidth / 2 - image!.size.width / 2
        let bannerY = bannerHeight / 2 - image!.size.height / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight);
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView;
        
    }
    
    //MARK: Getting data
    func loadKits(){
        let request: NSFetchRequest<Kit> = Kit.fetchRequest();
        
        do{
            kits = try context.fetch(request);
        }catch{
            print(error);
        }
        
        //Manage Empty Label
        if(kits.count == 0){
            emptyLabel.isHidden = false
        }else{
            emptyLabel.isHidden = true
        }
    }
    
    
    //MARK: Collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return kits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! KitCollectionViewCell;
        
        let img = UIImage(data: kits[indexPath.item].image!);
        cell.kitImage.image = img;
        cell.kitName.text = kits[indexPath.item].playername;
        
        cell.layer.cornerRadius =  20;
        cell.layer.borderColor =  UIColor.customPurple.cgColor;
        cell.layer.borderWidth =  4;
        
        return cell;
    }
    
    //MARK: Segues
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoYourCollectionDetail", sender: indexPath);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoYourCollectionDetail"{
            let vc = segue.destination as! KitDetailViewController;
            let index = (sender as! NSIndexPath).item;
            let selectedKit = kits[index];
            
            vc.kit = selectedKit;
        }
    }
  
    //MARK: IBActions
    //Verplicht nodig voor de unwind segue
    @IBAction func unwindToYourCollection(_sender: UIStoryboardSegue){}
    
   
}
