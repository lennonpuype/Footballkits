//
//  Footballer.swift
//  iPresent
//
//  Created by Lennon Puype on 07/04/2019.
//  Copyright © 2019 Lennon Puype. All rights reserved.
//

import Foundation

class Footballer{
    var id: Int;
    var fullName: String;
    var name: String;
    var rating: String;
    var age: Int;
    var alive: Bool;
    var active: Bool;
    var team: String;
    var biggest_period: String;
    var national_team: String;
    var bio: String;
    
    init(id: Int, fullName:String, name: String, rating: String, age: Int, alive: Bool, active: Bool, team: String, biggest_period: String, national_team: String, bio: String){
        self.id = id;
        self.fullName = fullName;
        self.name = name;
        self.rating = rating;
        self.age = age;
        self.alive = alive;
        self.active = active;
        self.team = team;
        self.biggest_period = biggest_period;
        self.national_team = national_team;
        self.bio = bio;
    }
}
