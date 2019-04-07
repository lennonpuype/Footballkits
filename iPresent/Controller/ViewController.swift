//
//  ViewController.swift
//  iPresent
//
//  Created by Lennon Puype on 21/03/2019.
//  Copyright © 2019 Lennon Puype. All rights reserved.
//

import UIKit
import SwiftyJSON


class ViewController: UIViewController, UICollectionViewDataSource {
    
    var footballers:AllFootballers?;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
    func parseJSON(json: JSON){
        
        var tempList:[Footballer] = [];
        
        for (_, subJSON) in json["defFootballers"] {
            let item:Footballer = Footballer(
                id: subJSON["id"].intValue,
                fullName: subJSON["fullName"].stringValue,
                name: subJSON["name"].stringValue,
                age: subJSON["age"].intValue,
                alive: subJSON["alive"].boolValue,
                team: subJSON["team"].stringValue,
                biggest_period: subJSON["biggest_period"].arrayValue,
                national: subJSON["national"].stringValue,
                bio: subJSON["bio"].stringValue)
            tempList.append(item);
            print(tempList.count)
        }
        
        footballers = AllFootballers(list: tempList);
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return footballers!.list.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "footballer", for: indexPath)
            as! FootballerCollectionViewCell;
        
        myCell.footballerImage.image = UIImage(named: footballers!.list[indexPath.item].name.lowercased())
        myCell.footballerName.text =  footballers!.list[indexPath.item].fullName
        return myCell;
    }


}

