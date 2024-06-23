//
//  RecipeDetailView.swift
//  Recipe App
//
//  Created by Andrew on 2023-05-04.
//
//
import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView{
            VStack(){
                HStack{
                    Text(recipe.name)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Spacer()
                    //TODO: update star image to button
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                .padding(.horizontal)
                // MARK: Recipe Image
                NavigationLink(
                    destination:{
                        // TODO: replace with proper image view
                        imageView(image: recipe.image)},
                    label:{
                        Image(recipe.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 350, height: 150, alignment: .center)
                            .clipped()
                            .cornerRadius(15)
                    })
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.title)
                        .padding(.vertical)
                    ForEach(recipe.ingredients, id: \.self) { i in
                        Text("• " + i)
                    }
                }
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.title)
                        .padding(.vertical)
                    ForEach(0..<recipe.directions.count, id: \.self) { i in
                        Text(String(i+1) + ") " + recipe.directions[i])
                            .padding(.bottom, 5)
                    }
                }
            }
            .padding(.horizontal)
        }
        //.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Placeholder Detail view for preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
