//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Batin, Christopher on 13/04/2018.
//  Copyright © 2018 Batin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let apiManager = APIManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func getDataButtonPressed(_ sender: Any) {
        getWeather()
    }


}

extension ViewController {

    private func getWeather() {
        apiManager.getWeather() { (weather, error) in
            if let error = error {
                print("Get weather error: \(error.localizedDescription)")
                return
            }
            guard let weather = weather  else { return }
            print("Current Weather Object:")
            print(weather)
        }
    }

}
