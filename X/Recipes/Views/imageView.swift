//
//  imageView.swift
//  Recipe App
//
//  Created by Andrew on 2023-05-04.
//
//
import SwiftUI

struct imageView: View {
    var image: String
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct imageView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        imageView(image: model.recipes[0].image)
    }
}
