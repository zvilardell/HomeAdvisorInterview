//
//  Pro.swift
//  HomeAdvisorChallenge
//
//  Created by Zach Vilardell on 8/12/17.
//  Copyright © 2017 zvilardell. All rights reserved.
//

import UIKit

class Pro: NSObject {
    
    //class members with default values
    var name: String = ""
    var specialty: String = ""
    var services: String = ""
    var overview: String = ""
    var compositeRating: Double = 0.0
    var ratingCount: Int = 0
    var email: String = ""
    var phone: String = ""
    var location: String = ""
    
    //constructs new Pro object from dictionary data
    init(properties: NSDictionary) {
        
        if let name = properties["companyName"] as? String {
        	self.name = name
        }
        
        if let specialty = properties["specialty"] as? String {
            self.specialty = specialty
        }
    	
        if let services = properties["servicesOffered"] as? String {
            self.services = services
        }
        
        if let overview = properties["companyOverview"] as? String {
            self.overview = overview
        }
        
        if let compositeRating = properties["compositeRating"] as? String, let doubleCR = Double(compositeRating) {
            self.compositeRating = doubleCR
        }
        
        if let ratingCount = properties["ratingCount"] as? String, let intRC = Int(ratingCount) {
            self.ratingCount = intRC
        }
        
        if let email = properties["email"] as? String {
            self.email = email
        }
        
        if let phone = properties["phoneNumber"] as? String {
            self.phone = phone
        }
        
        if let location = properties["primaryLocation"] as? String {
            self.location = location
        }
    }

}
