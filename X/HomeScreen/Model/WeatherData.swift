//
//  WeatherViewModel.swift
//  WeatherAPITest
//
//  Created by Andrew on 2023-06-16.
//

import Foundation
struct WeatherData: Codable {
    let name: String
    let main: WeatherMainData
    let weather: [WeatherConditionData]
    let coord: WeatherCoordData
}
struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
struct WeatherMainData: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int

}

struct WeatherConditionData: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
struct WeatherCoordData: Codable {
    let lon: Double
    let lat: Double
}
struct ForcastData: Codable {
    let list: [Daily]
    let city: City
}
struct City: Codable {
    let id: Int
    let name: String
}
struct Daily: Codable {
    let dt: Int
    let main: ForcastMainData
    let weather: [WeatherConditionData]
//    let clouds: Clouds
//    let wind: Wind
//    let visibility: Int
//    let pop: Double
//    let rain: Rain
//    let sys: Sys
    let dt_txt: String
}
struct ForcastMainData: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
//    let pressure: Int
//    let sea_level: Int
//    let grnd_level: Int
//    let humidity: Int
//    let temp_kf: Double
}

//Sample data:
/*
 struct Daily: Codable {
     let dt: Int
     let main: WeatherMainData
     let weather: [Weather]
     let clouds: Clouds
     let wind: Wind
     let visibility: Int
     let pop: Double
     let rain: Rain
     let sys: Sys
     let dt_txt: String
 }

 struct WeatherMainData: Codable {
     let temp: Double
     let feels_like: Double
     let temp_min: Double
     let temp_max: Double
     let pressure: Int
     let sea_level: Int
     let grnd_level: Int
     let humidity: Int
     let temp_kf: Double
 }

 struct Weather: Codable {
     let id: Int
     let main: String
     let description: String
     let icon: String
 }

 struct Clouds: Codable {
     let all: Int
 }

 struct Wind: Codable {
     let speed: Double
     let deg: Int
     let gust: Double
 }

 struct Rain: Codable {
     let `3h`: Double
 }

 struct Sys: Codable {
     let pod: String
 }

 }
 */




