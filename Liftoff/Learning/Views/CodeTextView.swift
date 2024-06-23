//
//  CodeTextView.swift
//  Learning App
//
//  Created by Andrew on 2023-06-07.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
   
    @EnvironmentObject var model: ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        // Set the text for the lesson
        textView.attributedText = model.CodeText
        //scroll back to the top
        textView.scrollRectToVisible(CGRect(x:0, y:0, width: 1, height: 1), animated: false)
    }
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
            .environmentObject(ContentModel())
    }
}
