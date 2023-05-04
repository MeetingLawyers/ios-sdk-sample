//
//  ViewController.swift
//  SDK Sample
//
//  Created by Manel MeetingLawyers on 27/7/22.
//

import UIKit
import MeetingLawyers

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickButton(_ sender: Any) {
        self.configStyle()
        self.authenticate()
    }
}

extension ViewController {
    private func configStyle() {
        MeetingLawyersApp.setStyle(primaryColor: .blue)
        MeetingLawyersApp.setStyle(secondaryColor: .systemBlue)
    }

    private func authenticate() {
        let userId = "<#userID#>"
        MeetingLawyersApp.authenticate(userId: userId) { error in
            guard let error = error else {
                // AUTH OK
                self.launchProfessionalList()
                return
            }
            // AUTH KO
        }
    }

    private func launchProfessionalList() {
        if let result = MeetingLawyersApp.messengerViewController() {
            present(result, animated: true)
        }
    }
}
