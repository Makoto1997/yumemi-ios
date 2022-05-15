//
//  WeatherViewController.swift
//  yumemi-ios
//
//  Created by Makoto on 2022/05/06.
//

import UIKit
import YumemiWeather

final class WeatherViewController: UIViewController {
    
    @IBOutlet private weak var weatherImageView: UIImageView!
    @IBOutlet private weak var maxTempLabel: UILabel!
    @IBOutlet private weak var minTempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func getWeather() {
        
        let decoder = JSONDecoder()
        let encoder = JSONEncoder()
        
        do {
            let request = APIRequest(area: "tokyo", date: "2020-04-01T12:00:00+09:00")
            let data = try encoder.encode(request)
            guard let requestJson = String(data: data, encoding: .utf8) else { return }
            let responseJson = try YumemiWeather.fetchWeather(requestJson)
            let weatherModel = try decoder.decode(WeatherModel.self, from: responseJson.data(using: .utf8)!)
            maxTempLabel.text = String(weatherModel.maxTemp)
            minTempLabel.text = String(weatherModel.minTemp)
            
            switch weatherModel.weather {
            case "sunny":
                weatherImageView.image = UIImage(named: weatherModel.weather)?.withRenderingMode(.alwaysTemplate)
                weatherImageView.tintColor = .red
            case "cloudy":
                weatherImageView.image = UIImage(named: weatherModel.weather)?.withRenderingMode(.alwaysTemplate)
                weatherImageView.tintColor = .gray
            case "rainy":
                weatherImageView.image = UIImage(named: weatherModel.weather)?.withRenderingMode(.alwaysTemplate)
                weatherImageView.tintColor = .blue
            default:
                break
            }
        } catch YumemiWeatherError.invalidParameterError {
            Alert.autoCloseAlert(vc: self, title: "エラー", message: "invalidParameterErrorです。")
            print("invalidParameterErrorです。")
            return
        } catch YumemiWeatherError.unknownError {
            Alert.autoCloseAlert(vc: self, title: "エラー", message: "unknownErrorです。")
            print("unknownErrorです。")
            return
        } catch {
            Alert.autoCloseAlert(vc: self, title: "エラー", message: "想定外のエラーです。")
            print("想定外のエラーです。", error)
            return
        }
    }
    
    @IBAction private func tapReloadButton(_ sender: Any) {
        
        getWeather()
    }
    
    @IBAction private func tapCloseButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}

