//
//  LessonCardView.swift
//  Learning App
//
//  Created by Andrew on 2023-05-26.
//

import SwiftUI

struct LessonCardView: View {
    
    @EnvironmentObject var model: ContentModel
    var lesson: Lesson
    
    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .aspectRatio(CGSize(width: 335, height: 100),contentMode: .fit)
                
                HStack{
                    
                    Text(String(lesson.id+1))
                        .font(.largeTitle)
                    
                    
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("\(lesson.title)")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        HStack{
                          
                            Image(systemName: "clock")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text(lesson.duration)
                                .font(.caption)
                                .fontWeight(.thin)
                        }
                    }.padding()
                    Spacer()
                }.padding(.horizontal, 15)
                
            }.padding()
        }
    }
}

struct LessonCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ContentModel()
        LessonCardView(lesson: model.modules[0].content.lessons[1])
            .environmentObject(ContentModel())
    }
}
