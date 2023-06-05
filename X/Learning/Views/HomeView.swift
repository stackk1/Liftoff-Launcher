//
//  ContentView.swift
//  Learning App
//
//  Created by Andrew on 2023-05-24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
    
            VStack(alignment: .leading){
                
                Text("What would you like to do today?")
                    .font(.subheadline)
                    .padding(.leading)
            
                ScrollView {
                    LazyVStack{
                        ForEach(model.modules) {module in
                            NavigationLink(
                                destination: {ContentView()
                                    .onAppear(perform: {
                                        model.beginModule(module.id)
                                    })
                                
                            },
                                label: {LearningCardView(module: module)
                            })
                            TestCardView(module: module)
                            //TODO Add Navigation Link
                        }
                    }
                    
                }
            }.navigationTitle("Get Started")
        
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
        
    }
}
