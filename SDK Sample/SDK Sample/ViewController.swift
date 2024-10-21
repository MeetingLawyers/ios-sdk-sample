//
//  ViewController.swift
//  SDK Sample
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
        self.configMoreSpecificStyles()
        self.launchSdk()
    }
}

extension ViewController {
    private func configStyle() {
        MeetingLawyersApp.setStyle(primaryColor: .blue)
        MeetingLawyersApp.setStyle(secondaryColor: .systemBlue)
    }

    private func configMoreSpecificStyles() {
        // TODO: Add more specific styles
    }

    @objc private func onClickNavigation() {
        print("onClickNavigation topButtonBar")
    }

    private func launchSdk() {
        Task {
            do {
                try await MeetingLawyersApp.configure(apiKey: Constants.apiKey)
                try await MeetingLawyersApp.authenticate(userId: Constants.userId)
                self.launchProfessionalList()
            } catch {
                print("Error: \(error.localizedDescription)")
            }

        }
    }
    
    private func launchProfessionalList() {
        DispatchQueue.main.async {
            if let result = MeetingLawyersApp.professionalListViewController() {
                self.present(result, animated: true)
            }
        }
    }
}
