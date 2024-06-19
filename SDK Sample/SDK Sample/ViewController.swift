//
//  ViewController.swift
//  SDK Sample
//
//  Created by Manel MeetingLawyers on 27/7/22.
//

import UIKit
import MeetingLawyers
import MeetingLawyersSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickButton(_ sender: Any) {
        self.configStyle()
        self.configMoreSpecificStyles()
        self.authenticate()
    }
}

extension ViewController {
    private func configStyle() {
        MeetingLawyersApp.setStyle(primaryColor: .blue)
        MeetingLawyersApp.setStyle(secondaryColor: .systemBlue)
    }

    // always with import MeetingLawyersSDK
    private func configMoreSpecificStyles() {
        let topButtonBar = UIBarButtonItem(image: UIImage(systemName: "heart.fill"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(self.onClickNavigation))
        MLMediQuo.style?.rootLeftBarButtonItem = topButtonBar
        let titleViewLabel = UILabel()
        titleViewLabel.text = "Custom Title"
        titleViewLabel.textColor = UIColor.white
        MLMediQuo.style?.titleView = titleViewLabel // titleView must be a UIView
        MLMediQuo.updateStyle()
    }

    @objc private func onClickNavigation() {
        print("onClickNavigation topButtonBar")
    }

    private func authenticate() {
        MeetingLawyersApp.authenticate(userId: Constants.userId) { error in
            guard let error = error else {
                // AUTH OK
                self.launchProfessionalList()
                return
            }
            // AUTH KO
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
