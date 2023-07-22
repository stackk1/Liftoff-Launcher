//
//  WeatherModel.swift
//  X
//
//  Created by AndrewStack on 2023-07-20.
//

import Foundation

class WeatherModel:ObservableObject {
    //Location
     @Published var currentLat: Double = 49.88
     @Published var currentLon: Double = -119.50
     @Published var weatherUnits: String = "metric"
    @Published var tempUnit: String = "C"
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
    @Published var hourlyWeather: [HourlyWeatherData] = []
    //Daily
    @Published var highTemp: Double = 0.0
    @Published var lowTemp: Double = 0.0
    
    @Published var dailyWeather: [DailyWeatherData] = []
    
    //Location
    
    @Published var city: String = "Kelowna"
    
    
    init() {
        if let weatherData = fetchWeather() {
            DispatchQueue.main.async {
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
                self.hourlyWeather = Array(weatherData.hourly)
            }
        } else {
            print("Failed to fetch weather data.")
        }
    }
    
    
    func fetchWeather() -> WeatherData? {
        let apiKey = "f80dcf0bd93deb17028472270d91d0b6"
        let apiURL = "https://api.openweathermap.org/data/3.0/onecall?"
        let apiUnit = self.weatherUnits
        
        let urlString = "\(apiURL)lat=\(currentLat)&lon=\(currentLon)&appid=\(apiKey)&units=\(apiUnit)&exclude=minutely"
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var weatherData: WeatherData?
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            defer {
                semaphore.signal()
            }
            
            if let error = error {
                print("Forecast Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Data Request Error: \(error!.localizedDescription)")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                weatherData = try decoder.decode(WeatherData.self, from: data)
            } catch {
                print("Error decoding Forecast JSON: \(error.localizedDescription)")
            }
        }
        
        task.resume()
        semaphore.wait()
        
        return weatherData
    }
    func refreshWeather() {
        if let weatherData = fetchWeather() {
            DispatchQueue.main.async {
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
                self.hourlyWeather = Array(weatherData.hourly)
            }
        }
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
    func updateLocation(city: String){
        let coordinates = city
        switch coordinates {
        case "Kelowna":
            self.currentLat = 49.88
            currentLon = -119.50
        case "Kamloops":
            currentLat = 50.67
            currentLon = -120.34
        case "Vancouver":
            currentLat = 49.26
            currentLon = -123.11
        case "Calgary":
            currentLat = 51.05
            currentLon = -114.06
        case "Edmonton":
            currentLat = 53.55
            currentLon = -113.49
        case "Victoria":
            currentLat = 48.43
            currentLon = -123.36
        case "Nakusp":
            currentLat = 50.24
            currentLon = -117.80
        case "Miami":
            currentLat = 49.37
            currentLon = -98.24
        case "London":
            currentLat = 51.50
            currentLon = -0.08
        default:
            currentLat = 49.88
            currentLon = -119.50
        }
    }
    func updateTempUnits(units: String){
        let format = units
        switch format {
        case "metric":
            tempUnit = "C"
        case "imperial":
            tempUnit = "F"
        case "kelvin":
            tempUnit = "K"
        default:
            tempUnit = ""
        }
    }
}

