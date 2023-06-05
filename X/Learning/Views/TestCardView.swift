///
//  TestCardView.swift
//  Learning App
//
//  Created by Andrew on 2023-05-26.
//

import SwiftUI

struct TestCardView: View {
    @EnvironmentObject var model: ContentModel
    var module: Module
    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .aspectRatio(CGSize(width: 335, height: 175),contentMode: .fit)
                
                HStack{
                    
                    Image("\(module.test.image)")
                        .resizable()
                        .frame(width:100, height: 100)
                        .clipShape(Circle())
                    
                    
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("\(module.category) Test")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text(module.test.description)
                        // font size affects justification
                            .font(.system(size: 12))
                            .padding(.bottom, 20)
                        
                        HStack{
                            Image(systemName: "text.book.closed")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("\(module.test.questions.count) Questions")
                                .font(.system(size: 11))
                                .fontWeight(.thin)
                            Image(systemName: "clock")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text(module.test.time)
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

struct TestCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ContentModel()
        TestCardView(module: model.modules[0])
            .environmentObject(ContentModel())
        
    }
}
