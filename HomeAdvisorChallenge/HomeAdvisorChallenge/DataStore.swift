//
//  DataStore.swift
//  HomeAdvisorChallenge
//
//  Created by Zach Vilardell on 8/12/17.
//  Copyright © 2017 zvilardell. All rights reserved.
//

import UIKit

class DataStore: NSObject {
    
    var allPros: [Pro] = []
    var allSortedPros: [Pro] = []
    
    //---------------------------------------------------------------------------------------------------------------------------
    
    //singleton object
    public static let sharedInstance = DataStore()
    private override init() { //overridden private init function prevents others from using the default public initializer for this class.
        super.init()
    }
    
    //---------------------------------------------------------------------------------------------------------------------------
    
    func sortPros() {
    	self.allSortedPros = self.allPros.sorted { $0.name < $1.name }
    }
    
    func loadJSONData() {
        //read in pro data from project's json file
        if let fileURL = Bundle.main.url(forResource: "pro_data", withExtension: "json") {
            do {
                let rawData = try Data(contentsOf: fileURL)
                let jsonData = try JSONSerialization.jsonObject(with: rawData, options: []) as! [NSDictionary]
                
                //create a Pro object from each json item, add to DataStore's shared array
                for dict in jsonData {
                    self.allPros.append(Pro(properties: dict))
                }
                self.sortPros()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

}
