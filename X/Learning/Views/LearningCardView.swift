//
//  CardView.swift
//  Learning App
//
//  Created by Andrew on 2023-05-26.
//

import SwiftUI

struct LearningCardView: View {
    @EnvironmentObject var model: ContentModel
    var module: Module
    
    var body: some View {
        
        
        ZStack {
            ZStack(alignment:.leading){
                Rectangle()
                
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .aspectRatio(CGSize(width: 335, height: 175),contentMode: .fit)
                
                HStack{
                    
                    Image("\(module.content.image)")
                        .resizable()
                        .frame(width:100, height: 100)
                        .clipShape(Circle())
                    
                    
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Learn \(module.category)")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text(module.content.description)
                        // .font(.caption)
                        // font size affects justification 
                            .font(.system(size: 12))
                            .padding(.bottom, 20)
                        
                        HStack{
                            Image(systemName: "text.book.closed")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("\(module.content.lessons.count) Lessons")
                                .font(.system(size: 11))
                                .fontWeight(.thin)
                            Image(systemName: "clock")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text(module.content.time)
                                .font(.system(size: 11))
                                .fontWeight(.thin)
                        }
                    }.padding()
                        .accentColor(.black)
                    
                }.padding(.horizontal, 15)
                
            }.padding()
        }
    }
}

struct LearningCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ContentModel()
        LearningCardView(module: model.modules[0])
            .environmentObject(ContentModel())
    }
}
