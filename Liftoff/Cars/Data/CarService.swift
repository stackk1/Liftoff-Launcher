//
//  DataService.swift
//  L16Challenge
//
//  Created by Andrew on 2023-05-08.
//

import Foundation

class CarService {
   //static allows direct calls no need for instance "()"
   static func getLocalData() -> [Car] {
        //parse json
        
        //get url path
        let pathString = Bundle.main.path(forResource: "CarData", ofType: "json")
        // Check if pathString is != nil, else.. (guard does not execute unless true
        guard pathString != nil else {
            // return a blank list
            return [Car]()
        }
        //creat url object
        let url = URL(fileURLWithPath: pathString!)
        
        
        do {
            //create data object
            let data = try Data(contentsOf: url)
            //decode data
            let decoder = JSONDecoder()
            
            do {
                let carData = try decoder.decode([Car].self, from: data)
                
                //add UUID
//                for c in carData {
//                    c.id = c.VIN
//                }
                //return [Car]
                return carData
                
            }
            // Decode Error
            catch {
                print(error)
            }
        }
        // Data retrival Error
        catch{
            print(error)
        }
        
        return [Car]()
    }
    
}
