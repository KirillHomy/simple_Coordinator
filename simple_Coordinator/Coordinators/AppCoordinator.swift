//
//  AppCoordinator.swift
//  simple_Coordinator
//
//  Created by Kirill Khomicevich on 14.06.2023.
//

import UIKit

class AppCoordinator: Coordinator {

    // MARK: - External variables
    var navigationController: UINavigationController

    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - External Method
    func start() {
        setupOrangeViewController()
    }

}

// MARK: - External extension
extension AppCoordinator {

    func setupOrangeViewController() {
        let orangeViewController = OrangeViewController()
        orangeViewController.appCoordinator = self
        navigationController.pushViewController(orangeViewController, animated: true)
    }

    func setupYellowViewController() {
        let yellowViewController = YellowViewController()
        yellowViewController.appCoordinator = self
        navigationController.pushViewController(yellowViewController, animated: true)
    }

    func setupBlueViewController() {
        let blueViewController = BlueViewController()
        blueViewController.appCoordinator = self
        navigationController.pushViewController(blueViewController, animated: true)
    }


}
