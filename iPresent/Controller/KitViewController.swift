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
  
    var kits = [Kit]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;

    override func viewDidLoad() {
        super.viewDidLoad()
      
        loadKits();
        
        // Do any additional setup after loading the view.
        changeBasicAppTheme();
    }
    
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
    
    func loadKits(){
        let request: NSFetchRequest<Kit> = Kit.fetchRequest();
        
        do{
            kits = try context.fetch(request);
        }catch{
            print(error);
        }
    }
    
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
