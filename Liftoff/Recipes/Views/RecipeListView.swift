//
//  ContentView.swift
//  Recipe App
//
//  Created by Andrew on 2023-05-04.
//
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model: RecipeModel

    var body: some View {
        VStack (alignment: .leading) {
            Text("All Recipes")
                .fontWeight(.bold)
                .padding(.top, 40)
                .font(.largeTitle)
            // Recipe list
           
                ScrollView{
                    LazyVStack (alignment: .leading){
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(destination: RecipeDetailView(recipe: r), label: {
                                HStack(spacing: 20.0) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(10)
                                    
                                    Text(r.name)
                                        .foregroundColor(.black)
                                    //truncation not working: see Ham Steak with Brown Sugar Glaze
                                    //create each list item as a sepeate view with .frame to limit width of text?
                                    //use GeoReader to set bounds on ScrollView?
                                        .truncationMode(.tail)
                                    if (r.favourite) {
                                        Spacer()
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                            .padding(.trailing)
                                    }
                                }
                            })
                        }
                    }
                }
               
                
            
        }.padding(.leading)
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
