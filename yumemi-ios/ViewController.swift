//
//  ViewController.swift
//  yumemi-ios
//
//  Created by Makoto on 2022/05/06.
//

import UIKit
import YumemiWeather

final class ViewController: UIViewController {
    
    @IBOutlet private weak var weatherImageView: UIImageView!
    
    private var weather = WeatherImageModel.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func tapReloadButton(_ sender: Any) {
        
        let image = YumemiWeather.fetchWeather()
        switch image {
        case "sunny":
            weatherImageView.image = UIImage(named: image)?.withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = .red
        case "cloudy":
            weatherImageView.image = UIImage(named: image)?.withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = .gray
        case "rainy":
            weatherImageView.image = UIImage(named: image)?.withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = .blue
        default:
            break
        }
    }
}

