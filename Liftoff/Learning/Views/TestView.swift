//
//  TestView.swift
//  Learning App
//
//  Created by Andrew on 2023-06-15.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        
        if model.currentQ != nil {
        
            VStack{
                // question number
                Text("Question \(model.currentQIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                //Questions
                CodeTextView()
                //Question answers
                ForEach (0..<model.currentQ!.answers.count, id: \.self) { answer in
                    Button(
                        action: {},
                        label:{
                            ZStack{
                                ButtonBackgroundView(color:.white)
                                Text(model.currentQ!.answers[answer])
                            }
                        }
                    )
                    
                }
                .foregroundColor(.black)
                //Next Q Button
                if ((model.currentQIndex + 1) < model.currentModule!.test.questions.count) {
                    Button(
                        action:{
                        model.nextQuestion()
                    },
                        label: {
                            ZStack {
                                ButtonBackgroundView()
                                Text("Next Question")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                     }
                    })
                }
                else{
                    //Show the complete button
                    Button(
                        action:{
                        model.currentContent = nil
                    },
                        label: {
                        ZStack {
                            ButtonBackgroundView(color:.blue)
                            Text("Complete")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                
                                
                        }
                    })
                }
            }
            .padding(.horizontal)
            .navigationTitle("\(model.currentModule?.category ?? "") Test")
        }
        else{
            // test hasnt loaded yet
            ProgressView()
        }
    }
        
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {

        TestView()
            .environmentObject(ContentModel())
    }
}
