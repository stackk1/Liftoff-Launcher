//
//  WeatherModel.swift
//  X
//
//  Created by AndrewStack on 2023-07-20.
//

import Foundation

class WeatherModel:ObservableObject {
    //Current
    @Published var currentTemp: Double = 0.0
    @Published var feelTemp: Double = 0.0
    @Published var conditions: String = "Clear"
    @Published var conditonId: Int = 800
    @Published var conditionDetail: String = ""
    @Published var humidity: Int = 0
    @Published var sunset: String = "2023-06-18 18:00:00"
    @Published var sunrise: String = "2023-06-18 18:00:00"
    @Published var windspeed: Double = 0
    //Hourly
    @Published var timeStamp: [String] = []
    
    //Daily
    @Published var highTemp: Double = 0.0
    @Published var lowTemp: Double = 0.0
    
    @Published var dailyWeather: [DailyWeatherData] = []
    
    //Location
    
    @Published var city: String = "Kelowna"
    
    init() {
        fetchWeather(){ [self] weatherData in
            DispatchQueue.main.async {
                if let weatherData = weatherData {
                    self.currentTemp = weatherData.current.temp
                    self.feelTemp = weatherData.current.feels_like
                    self.conditions = weatherData.current.weather[0].main
                    self.conditonId = weatherData.current.weather[0].id
                    self.conditionDetail = weatherData.current.weather[0].description
                    self.humidity = weatherData.current.humidity
                    self.sunset = self.convertTimestampToDate(timestamp: weatherData.current.sunset)
                    self.sunrise = self.convertTimestampToDate(timestamp: weatherData.current.sunrise)
                    self.windspeed = weatherData.current.wind_speed
                    
                    self.dailyWeather = Array(weatherData.daily.prefix(7))
                }
                else {
                    print("Failed to fetch weather data.")
                }
            }
        }
    }
    
    func fetchWeather(completion: @escaping (WeatherData?) -> Void) {
        let apiKey = "f80dcf0bd93deb17028472270d91d0b6"
        let apiURL = "https://api.openweathermap.org/data/3.0/onecall?"
        let apiUnit = "metric"
        let currentLat = 49.88
        let currentLon = -119.50
        let urlString = "\(apiURL)lat=\(currentLat)&lon=\(currentLon)&appid=\(apiKey)&units=\(apiUnit)&exclude=minutely"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Forcast Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("Data Request Error: \(error!.localizedDescription)")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let WeatherData = try decoder.decode(WeatherData.self, from: data)
                completion(WeatherData)
            } catch {
                print("Error decoding Forcast JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    func formatPrecision (temp: Double, places: Int = 1) -> String {
        let number: Double = temp
        let formattedString = String(format: "%.\(places)f", number)
        return formattedString
    }
    
    func convertTimestampToDate(timestamp: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    func formatDaylightHours(date: String) -> String {
        let startIndex = date.index(date.endIndex, offsetBy: -8)
        let time = date.suffix(from: startIndex)
        
        return String(time)
    }
    
}

