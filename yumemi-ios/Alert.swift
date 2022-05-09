//
//  Alert.swift
//  yumemi-ios
//
//  Created by Makoto on 2022/05/09.
//

import UIKit

final class Alert {
    
    static func autoCloseAlert(vc: UIViewController, title: String, message: String) {
        let autoCloseAlertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        vc.present(autoCloseAlertVC, animated: true) {
            // 1.5秒後に削除
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                autoCloseAlertVC.dismiss(animated: true, completion: nil)
            }
        }
    }
}
