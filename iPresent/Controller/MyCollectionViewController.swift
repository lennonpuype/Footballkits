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

    var myCollection:AllKits?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadJSON();
    }
    
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
                name: subJSON["name"].stringValue,
                year: subJSON["year"].intValue,
                team: subJSON["team"].stringValue,
                signed: subJSON["signed"].boolValue,
                matchworn: subJSON["matchworn"].boolValue,
                description: subJSON["description"].stringValue,
                brand: subJSON["brand"].stringValue)
            tempList.append(item);
            
        }
        
        myCollection = AllKits(list: tempList);
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myCollection!.list.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionCell", for: indexPath)
            as! MyKitCollectionViewCell;
        
        myCell.kitImage.image = UIImage(named: "\(myCollection!.list[indexPath.item].name.lowercased())_kit")
        myCell.playerImage.image = UIImage(named: myCollection!.list[indexPath.item].name.lowercased())
        myCell.playerName.text =  myCollection!.list[indexPath.item].playerName
        
        myCell.layer.cornerRadius =  20;
        myCell.layer.borderColor =  UIColor.customPurple.cgColor;
        myCell.layer.borderWidth =  4;
        
        return myCell;
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.item)
//        performSegue(withIdentifier: "gotoFootballerDetail", sender: indexPath);
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
