//
//  DataService.swift
//  Recipe App
//
//  Created by Andrew on 2023-05-04.
//

import Foundation

class RecipeService {
   //static allows direct calls no need for instance "()"
   static func getLocalData() -> [Recipe] {
        //parse json
        
        //get url path
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        // Check if pathString is != nil, else.. (guard does not execute unless true
        guard pathString != nil else {
            // return a blank list
            return [Recipe]()
        }
        //creat url object
        let url = URL(fileURLWithPath: pathString!)
        
        
        do {
            //create data object
            let data = try Data(contentsOf: url)
            //decode data
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //add UUID
                for r in recipeData {
                    r.id = UUID()
                }
                //return [Recipe]
                return recipeData
                
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
        
        return [Recipe]()
    }
    
}
