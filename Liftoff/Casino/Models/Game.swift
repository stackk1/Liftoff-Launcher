//
//  Game.swift
//  Casino
//
//  Created by Andrew on 2023-05-05.
//

import Foundation
import SwiftUI

struct Game: View, Identifiable {
    let title: String
    var id:UUID? = nil
    var body: AnyView
}
