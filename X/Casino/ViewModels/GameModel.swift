//
//  GameModel.swift
//  Casino
//
//  Created by Andrew on 2023-05-05.
//
import SwiftUI
import Foundation

class GameModel:ObservableObject {
    @Published var background = true
    @Published var backgroundImage = "Plain"
    var gameNames = ["War","Slots","Dice War","Dice Roller","Card Flipper","Settings"]
    var gameList:[AnyView] = [AnyView(WarView()),AnyView(SlotView()),AnyView(DiceView()),AnyView(DiceRoller()),AnyView(CardFlipperView()),AnyView(GameSettingsView())]
}
