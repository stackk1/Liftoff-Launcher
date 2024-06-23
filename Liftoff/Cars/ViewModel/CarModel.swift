//
//  CarModel.swift
//  L16Challenge
//
//  Created by Andrew on 2023-05-08.
//

import Foundation

class CarModel: ObservableObject {
    @Published var cars = [Car]()
    
    init() {
        self.cars = CarService.getLocalData()}
}
