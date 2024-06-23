//
//  RecipeCardView.swift
//  Recipe App
//
//  Created by Andrew on 2023-05-04.
//
//
import SwiftUI

struct RecipeCardView: View {
    var recipe: Recipe
    
    var body: some View {
        
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            VStack(spacing: 0){
                Image(recipe.image)
                    .resizable()
                    .aspectRatio(CGSize(width: 4, height: 3.3), contentMode: .fill)
                    .clipped()
                Spacer()
                Text(recipe.name)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 20)
                    .truncationMode(.tail)
                    .padding(.horizontal)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding(.bottom)
                
            }
            
        }.aspectRatio(CGSize(width: 4, height: 4), contentMode: .fit)
            .cornerRadius(25)
            .padding(40)
        
        
        
    }
}
struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeCardView(recipe: model.recipes[6])
    }
}
