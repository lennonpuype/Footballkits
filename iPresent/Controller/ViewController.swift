//
//  ViewController.swift
//  iPresent
//
//  Created by Lennon Puype on 21/03/2019.
//  Copyright © 2019 Lennon Puype. All rights reserved.
//

import UIKit
import SwiftyJSON


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var footballers:AllFootballers?;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadJSON();
        changeBasicAppTheme();
    }
    
    func changeBasicAppTheme(){
        
        
        self.navigationController?.navigationBar.backItem?.title = "Go back"
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
                active: subJSON["active"].boolValue,
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
        
        myCell.FootballerImage.image = UIImage(named: footballers!.list[indexPath.item].name.lowercased())
        myCell.FootballerName.text =  footballers!.list[indexPath.item].fullName
        
        myCell.FootballerImage.layer.cornerRadius =  20;
        myCell.FootballerImage.layer.borderColor =  UIColor.customPurple.cgColor;
        myCell.FootballerImage.layer.borderWidth =  4;
        
        
        return myCell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        performSegue(withIdentifier: "gotoFootballerDetail", sender: indexPath);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoFootballerDetail"{
            let vc = segue.destination as! FootballerDetailViewController;
            let index = (sender as! IndexPath).item;
            let selectedFootballer = footballers?.list[index];
            vc.footballer = selectedFootballer;
            
        }
    }


}

