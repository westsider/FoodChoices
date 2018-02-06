//
//  Past Choices.swift
//  FoodChoices
//
//  Created by Warren Hansen on 2/5/18.
//Copyright © 2018 Warren Hansen. All rights reserved.
//

import Foundation
import RealmSwift

class PastChoice: Object {
    
    @objc dynamic var randomChoice  = 0
    
    func choiceMade(choice:Int) {
        let realm = try! Realm()
        let pastChoice = PastChoice()
        pastChoice.randomChoice = choice
        
        try! realm.write {
            realm.add(pastChoice)
        }
        _ = allChoices()
    }
    
    func  allChoices()->[Int] {
        print("inside choicesMade()")
        let realm = try! Realm()
        let allChoices = realm.objects(PastChoice.self)
        var allChoicesMade:[Int] = []
        for each in allChoices {
            print("Here are the choices \(each.randomChoice)")
            allChoicesMade.append(each.randomChoice)
        }
        return allChoicesMade
    }
    
    func deleteChoices() {
        let realm = try! Realm()
        let allChoices = realm.objects(PastChoice.self)
        print("Deleting Chices")
        try! realm.write {
            realm.delete(allChoices)
        }
    }
}

