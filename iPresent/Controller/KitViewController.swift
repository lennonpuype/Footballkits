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
        
        cell.kitName.text = kits[indexPath.item].playername;
        
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
