//
//  CustomTextField.swift
//  Liftoff
//
//  Created by Andrew Stack on 2024-07-20.
//

import SwiftUI

struct CustomTextField: View {
    var title: String
    @Binding var text: String
    @FocusState var isActive: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .focused($isActive)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
            Text(title)
                .padding(.horizontal)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .foregroundStyle(isActive ? .white : .secondary)
                .animation(.spring(), value: isActive)
        }
    }
}


