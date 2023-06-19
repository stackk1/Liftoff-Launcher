//
//  WeatherModel.swift
//  WeatherAPITest
//
//  Created by Andrew on 2023-06-16.
//
//
import Foundation

class WeatherModel:ObservableObject {
    //Weather Data
    @Published var location: String = ""
    @Published var currentTemp: Double = 0.0
    @Published var highTemp: Double = 0.0
    @Published var lowTemp: Double = 0.0
    @Published var feelTemp: Double = 0.0
    @Published var long: Double = 0
    @Published var lat: Double = 0
    @Published var conditions: String = "Clear"
    @Published var conditonId: Int = 800
    @Published var conditionDetail: String = ""
    //Forcast Data
    @Published var timeS: Int = 1687118746
    @Published var timeT: String = "2023-06-18 18:00:00"
    @Published var vis: Int = 10000
    @Published var forcast: [Daily] = []

    
    @Published var dayOne: [Daily] = []
    @Published var dayTwo: [Daily] = []
    @Published var dayThree: [Daily] = []
    @Published var dayFour: [Daily] = []
    @Published var dayFive: [Daily] = []
    
    init() {
        fetchWeatherData(city: "Kelowna") { [self] weatherData in
            DispatchQueue.main.async {
                if let weatherData = weatherData {
                    self.location = weatherData.name
                    self.currentTemp = weatherData.main.temp
                    self.highTemp = weatherData.main.temp_max
                    self.lowTemp = weatherData.main.temp_min
                    self.feelTemp = weatherData.main.feels_like
                    self.long = weatherData.coord.lon
                    self.lat = weatherData.coord.lat
                    self.conditions = weatherData.weather[0].main
                    self.conditonId = weatherData.weather[0].id
                    self.conditionDetail = weatherData.weather[0].description
                    
                } else {
                    print("Failed to fetch weather data.")
                }
            }
        }
        fetchForcastData(city: "Kelowna") { [self] forcastData in
            DispatchQueue.main.async {
                if let forcastData = forcastData {
                    self.forcast = forcastData.list
                }
                else {
                    print("Failed to fetch forcast data.")
                }
            }
        }
        updateForcast()
    }
    
    func fetchWeatherData(city: String, completion: @escaping (WeatherData?) -> Void) {
        let apiKey = "f80dcf0bd93deb17028472270d91d0b6"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Weather Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                print("data check:")
                print(data)
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(WeatherData.self, from: data)
                completion(weatherData)
            } catch {
                print("Error decoding Weather JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    func fetchForcastData(city: String, completion: @escaping (ForcastData?) -> Void) {
        let apiKey = "f80dcf0bd93deb17028472270d91d0b6"
        let urlString =  "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)&units=metric"
        
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
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let forcastData = try decoder.decode(ForcastData.self, from: data)
                completion(forcastData)
            } catch {
                print("Error decoding Forcast JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }
  
    func formattedTemp (temp: Double, places: Int = 1) -> String {
        let number: Double = temp
        let formattedString = String(format: "%.\(places)f", number)
        return formattedString
    }
  
    func splitArrayIntoDays(_ array: [Daily]) -> (dayOne: [Daily], dayTwo: [Daily], dayThree: [Daily], dayFour: [Daily], dayFive: [Daily]) {
        if (array.count > 0) {
            dayOne = Array(array[0..<8])
            dayTwo = Array(array[8..<16])
            dayThree = Array(array[16..<24])
            dayFour = Array(array[24..<32])
            dayFive = Array(array[32..<40])
        }
            return (dayOne, dayTwo, dayThree, dayFour, dayFive)
        
    }
    
    func updateForcast(){
        let splitDays = splitArrayIntoDays(self.forcast)
        self.dayOne = splitDays.dayOne
        self.dayTwo = splitDays.dayTwo
        self.dayThree = splitDays.dayThree
        self.dayFour = splitDays.dayFour
        self.dayFive = splitDays.dayFive
    }
}
