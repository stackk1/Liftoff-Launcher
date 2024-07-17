//
//  AddRecipeView.swift
//  Liftoff
//
//  Created by Andrew Stack on 2024-07-17.
//

import SwiftUI

struct AddRecipeView: View{
    @EnvironmentObject var model:RecipeModel
    @State private var recipeName = ""
    @State private var category = ""
    @State private var ingredients = [String]()
    @State private var directions = [String]()
    
    var body: some View{
        let bg = model.background
        
        ZStack{
            if bg{
                Image(model.backgroundImage)
                    .resizable()
                    .ignoresSafeArea(edges: .top)
            }
            Form {
                        Section(header: Text("Recipe Details")) {
                            TextField("Recipe Name", text: $recipeName)
                            TextField("Category", text: $category)
                        }
                        
                        Section(header: Text("Ingredients")) {
                            ForEach(0..<ingredients.count, id: \.self) { index in
                                TextField("Ingredient \(index + 1)", text: self.$ingredients[index])
                            }
                            Button(action: {
                                self.ingredients.append("")
                            }) {
                                Text("Add Ingredient")
                            }
                        }
                        
                        Section(header: Text("Directions")) {
                            ForEach(0..<directions.count, id: \.self) { index in
                                TextField("Step \(index + 1)", text: self.$directions[index])
                            }
                            Button(action: {
                                self.directions.append("")
                            }) {
                                Text("Add Direction Step")
                            }
                        }
                        
                        Section {
                            Button(action: {
                                self.addRecipe()
                            }) {
                                Text("Save Recipe")
                            }
                        }
                    }
                }.foregroundColor(.black)
            }
        
    func addRecipe() {
        // Create a new Recipe object
        let newRecipe = Recipe(image: "DefaultImage", name: recipeName, category: category, favourite: false, ingredients: ingredients, directions: directions)
        
        // Handle storing or sending the new recipe data
        // For simplicity, you might add it to an array (in-memory storage)
        // recipes.append(newRecipe)
        
        // Reset fields after saving
        recipeName = ""
        category = ""
        ingredients = []
        directions = []
        
        // Optionally, navigate back to the recipe list or another view
    }
        }


