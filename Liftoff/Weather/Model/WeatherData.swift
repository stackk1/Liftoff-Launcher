//
//  WeatherViewModel.swift
//  WeatherAPITest
//
//  Created by Andrew on 2023-06-16.
//

import Foundation

struct WeatherData: Codable {
    let current: CurrentWeatherData
    let hourly: [HourlyWeatherData]
    let daily: [DailyWeatherData]
}

struct CurrentWeatherData: Codable {
    let dt: Double
    let sunrise: Double
    let sunset: Double
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let wind_speed: Double
    let wind_deg: Int
    let weather: [Weather]
    
}

struct HourlyWeatherData: Codable {
    let dt: Double
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let wind_speed: Double
    let wind_deg: Int
    let wind_gust: Double
    let weather: [Weather]
    let pop: Double
}

struct DailyWeatherData: Codable{
    let dt: Double
        let sunrise: Int
        let sunset: Int
        let moonrise: Int
        let moonset: Int
        let moon_phase: Double
        let summary: String
        let temp: Temperature
        let feels_like: FeelsLike
        let pressure: Int
        let humidity: Int
        let dew_point: Double
        let wind_speed: Double
        let wind_deg: Int
        let wind_gust: Double
        let weather: [Weather]
        let clouds: Int
        let pop: Double
        let uvi: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Temperature: Codable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct FeelsLike: Codable {
    let day: Double
    let night: Double
    let eve: Double
    let morn: Double
}


//MARK: - Legacy Data Models

//struct WeatherData: Codable {
//    let name: String
//    let main: WeatherMainData
//    let weather: [WeatherConditionData]
//    let coord: WeatherCoordData
//    let dt: Double
//    let sys: SunsetMainData
//}

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
struct SunsetMainData: Codable {
    let sunset: Double
    let sunrise: Double
}
struct DailyForcastData: Codable {
    let hourly: [Hourly]
    let daily: [Daily]
    //    let city: SunsetMainData
}
struct City: Codable {
    let id: Int
    let name: String
}
struct Daily: Codable {
    let dt: Int
    let main: DailyMainData
    let weather: [WeatherConditionData]
    //    let clouds: Clouds
    //    let wind: Wind
    //    let visibility: Int
    //    let pop: Double
    //    let rain: Rain
    //    let sys: Sys
    let dt_txt: String
}
struct DailyMainData: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    //    let pressure: Int
    //    let sea_level: Int
    //    let grnd_level: Int
    let humidity: Int
    //    let temp_kf: Double
}

struct Hourly: Codable {
    let dt: Int
    let main: DailyForcastData
    let weather: [WeatherConditionData]
    //    let clouds: Clouds
    //    let wind: Wind
    //    let visibility: Int
    //    let pop: Double
    //    let rain: Rain
    //    let sys: Sys
    let dt_txt: String
}
