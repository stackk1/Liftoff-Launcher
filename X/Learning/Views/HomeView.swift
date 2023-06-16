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
        
        NavigationView {
            VStack(alignment: .leading){
                
                Text("What would you like to do today?")
                    .font(.subheadline)
                    .padding(.leading)
                
                ScrollView {
                    LazyVStack{
                        ForEach(model.modules) {module in
                            NavigationLink(
                                destination:
                                    ContentView()
                                    .onAppear(perform: {
                                        model.beginModule(module.id)
                                        print(model.currentContent)
                                    }
                                             ),
                                tag: module.id,
                                selection: $model.currentContent,
                                label: {LearningCardView(module: module)
                                }
                            )
                            NavigationLink (
                                destination: TestView(),
                                tag: module.id,
                                selection: $model.currentTest,
                                label: {TestCardView(module: module)
                                    
                                }
                            )
                        }
                    }
                }
            }.navigationTitle("Get Started")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
        
    }
}
