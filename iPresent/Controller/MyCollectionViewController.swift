//
//  MyCollectionViewController.swift
//  iPresent
//
//  Created by Lennon Puype on 10/04/2019.
//  Copyright © 2019 Lennon Puype. All rights reserved.
//

import UIKit
import SwiftyJSON

class MyCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    //MARK: IBOutlets
    @IBOutlet weak var LCGradientView: LDGradientView!
    
    //MARK: Global Variables
    var myCollection:AllKits?;
    var gl:CAGradientLayer!;
    
    //MARK: View Loading
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadJSON();
        changeBasicAppTheme();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //MARK: Normal functions
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
    
    //MARK: Managing data
    func loadJSON(){
        let url = Bundle.main.url(forResource: "footballers", withExtension: "json");
        
        if let path = url{
            do{
                let data = try Data(contentsOf: path);
                let result = try JSON(data: data);
                parseJSON(json: result);
            }catch{
                print("ERROR: JSON DATA CAN NOT BE LOADED");
            }
        }else{
            print("ERROR: PATH TO JSON NOT CORRECT");
        }
        
    }
    
    func parseJSON (json: JSON){
        var tempList:[AnyKit] = [];
        
        for (_, subJSON) in json["myCollection"] {
            let item:AnyKit = AnyKit(
                id: subJSON["id"].intValue,
                playerName: subJSON["playerName"].stringValue,
                backName: subJSON["backName"].stringValue,
                name: subJSON["name"].stringValue,
                year: subJSON["year"].stringValue,
                team: subJSON["team"].stringValue,
                signed: subJSON["signed"].boolValue,
                matchworn: subJSON["matchworn"].boolValue,
                description: subJSON["description"].stringValue,
                brand: subJSON["brand"].stringValue)
            tempList.append(item);
            
        }
        
        myCollection = AllKits(list: tempList);
    }
    
    //MARK: Collectionview
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer_collectionview_mycollection", for: indexPath)
        // Customize footerView here
        return footerView
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myCollection!.list.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionCell", for: indexPath)
            as! MyKitCollectionViewCell;
        
        myCell.kitImage.image = UIImage(named: "\(myCollection!.list[indexPath.item].name.lowercased() )_kit")
        myCell.playerImage.image = UIImage(named: myCollection!.list[indexPath.item].name.lowercased())
        myCell.playerName.text =  myCollection!.list[indexPath.item].playerName
        
        //Design van de cell
        //Border rondom de cell
        myCell.layer.cornerRadius =  20;
        myCell.layer.borderColor =  UIColor.customPurple.cgColor;
        myCell.layer.borderWidth =  4;
        
        //Border rondom img
        myCell.playerImage.layer.borderColor =  UIColor.customPurple.cgColor;
        myCell.playerImage.layer.borderWidth =  4;
        
        return myCell;
    }
    
    
    
    //MARK: Segues
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoMyCollectionDetail", sender: indexPath);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoMyCollectionDetail"{
            let vc = segue.destination as! MyCollectionDetailViewController;
            let index = (sender as! NSIndexPath).item;
            let selectedFootballer = myCollection?.list[index];
            
            vc.footballer = selectedFootballer;
        }
    }
    
    //MARK: IBActions
    //Verplicht nodig voor de unwind segue
    @IBAction func unwindToCollection(_sender: UIStoryboardSegue){}
    

}
