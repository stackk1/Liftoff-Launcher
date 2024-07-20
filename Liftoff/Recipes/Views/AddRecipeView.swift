//
//  AddRecipeView.swift
//  Liftoff
//
//  Created by Andrew Stack on 2024-07-17.
//

import SwiftUI

struct AddRecipeView: View{
    @EnvironmentObject var model:RecipeModel
    @FocusState private var focusedField: String?
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
            ScrollView{
                VStack(spacing: 45) {
                    Section(header: Text("Recipe Details").font(.title)) {
                        CustomTextField(title: "Recipe Name", text: $recipeName)
                            .focused($focusedField, equals: "recipeName")
                        CustomTextField(title: "Category", text: $category)
                            .focused($focusedField, equals: "category")
                    }
                    
                    Section(header: Text("Ingredients").font(.title)) {
                        ForEach(0..<ingredients.count, id: \.self) { index in
                            CustomTextField(title: "Ingredient \(index + 1)", text: self.$ingredients[index])
                                .focused($focusedField, equals: "ingredient\(index)")
                        }
                        Button(action: {
                            self.ingredients.append("")
                        }) {
                            HStack{
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                Text("Add Ingredient")
                            }
                        }
                    }
                    
                    Section(header: Text("Directions").font(.title)) {
                        ForEach(0..<directions.count, id: \.self) { index in
                            CustomTextField(title: "Step \(index + 1)", text: self.$directions[index])
                                .focused($focusedField, equals: "direction\(index)")
                        }
                        Button(action: {
                            self.directions.append("")
                        }) {
                            HStack{
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                Text("Add Step")
                            }
                            
                        }
                    }
                    
                    Section {
                        Button("Save") {
                            self.addRecipe()
                        }
                        .padding().padding([.leading, .trailing], 40)
                        .background(.gray.opacity(0.5), in: .rect(cornerRadius: 16))
                        .cornerRadius(50)
                        .foregroundColor(Color.white)
                        .font(.system(size: 18, weight: .bold, design: .default))
                    }
                }
                .padding()
            }.foregroundColor(bg == true ? .white : .black)
        }
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


