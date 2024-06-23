//
//  LessonListView.swift
//  Learning App
//
//  Created by Andrew on 2023-05-26.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView {
                LazyVStack (spacing: 0){
                    //confirm current module set
                    if model.currentModule != nil {
                        ForEach(0..<model.currentModule!.content.lessons.count, id:\.self) {index in
                            NavigationLink(
                                destination:
                                    ContentDetailView()
                                    .onAppear(perform: {
                                        model.beginLesson(index)
                                    }),
                                label: {
                                    ContentViewRow(index: index)
                                })
                        }
                    }
                }.foregroundColor(.black)
                    .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
