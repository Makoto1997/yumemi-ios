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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func tapReloadButton(_ sender: Any) {
        
        do {
            let image = try YumemiWeather.fetchWeather(at: "")
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
}

