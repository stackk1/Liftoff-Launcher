//
//  LessonCardView.swift
//  Learning App
//
//  Created by Andrew on 2023-05-26.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    var index: Int
    
    var body: some View {
        
        let lesson = model.currentModule!.content.lessons[index]
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
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
            
        }.padding(.horizontal)
        
    }
}

struct ContentViewRow_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentViewRow(index: 0)
            .environmentObject(ContentModel())
    }
}
