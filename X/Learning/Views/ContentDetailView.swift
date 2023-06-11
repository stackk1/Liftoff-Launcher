//
//  LessonContentView.swift
//  Learning App
//
//  Created by Andrew on 2023-05-29.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostsUrl + (lesson?.video ?? ""))
        VStack(spacing: 0) {
            if url != nil{
                VideoPlayer(player: AVPlayer(url: url!))
                    .aspectRatio(CGSize(width: 16, height: 9),contentMode: .fit)
                    .cornerRadius(10)
            }
            CodeTextView()
            .padding(.vertical)
                .navigationTitle(lesson?.title ?? "")
 
            //Next Lesson Button
            if (model.currentLessonIndex + 1) < model.currentModule!.content.lessons.count {
                Button(action:{
                    model.nextLesson()
                },label: {
                    
                    ZStack {
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.green)
                            .shadow(radius: 5)
                            .frame(height: 48)
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            
                            
                    }
                })
            }
        }
        .padding()
        .navigationTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
            .environmentObject(ContentModel())
    }
}
