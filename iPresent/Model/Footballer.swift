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
    var age: Int;
    var alive: Bool;
    var active: Bool;
    var team: String;
    var biggest_period: Array<Any>;
    var national: String;
    var bio: String;
    
    init(id: Int, fullName:String, name: String, age: Int, alive: Bool, active: Bool, team: String, biggest_period: Array<Any>, national: String, bio: String){
        self.id = id;
        self.fullName = fullName;
        self.name = name;
        self.age = age;
        self.alive = alive;
        self.active = active;
        self.team = team;
        self.biggest_period = biggest_period;
        self.national = national;
        self.bio = bio;
    }
}
