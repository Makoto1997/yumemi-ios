//
//  InitialViewController.swift
//  yumemi-ios
//
//  Created by Makoto on 2022/05/15.
//

import UIKit

final class InitialViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        
        guard let vc = UIStoryboard.init(name: "Weather", bundle: nil).instantiateInitialViewController() as? WeatherViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
