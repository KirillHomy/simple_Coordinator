//
//  YellowViewController.swift
//  simple_Coordinator
//
//  Created by Kirill Khomicevich on 14.06.2023.
//

import UIKit

import UIKit
import SnapKit

class YellowViewController: UIViewController {

    // MARK: - Weak variables
    weak var appCoordinator: AppCoordinator?

    // MARK: - Private interfase constatns
    private let orangeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Orange View", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    private let blueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Blue View", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .gray
        stackView.layer.cornerRadius = 10.0
        return stackView
    }()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupController()
    }

}

// MARK: - private extension
private extension YellowViewController {

    func setupController() {
        setupAddSubview()
        setupCoordinate()
        setupAddTarget()
        setupSettingView()
    }

    func setupAddSubview() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(orangeButton)
        stackView.addArrangedSubview(blueButton)
    }

    func setupCoordinate() {
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.right.equalTo(view).inset(20)
        }
    }

    func setupAddTarget() {
        orangeButton.addTarget(self, action: #selector(didTapOrangeButton), for: .touchUpInside)
        blueButton.addTarget(self, action: #selector(didTapBlueButton), for: .touchUpInside)
    }

    func setupSettingView() {
        view.backgroundColor = .yellow
    }

}

// MARK: - @objc private extension
@objc private extension YellowViewController {

    func didTapOrangeButton() {
        print("print didTapOrangeButton")
        guard let appCoordinator = self.appCoordinator else { return }

        appCoordinator.setupOrangeViewController()
    }

    func didTapBlueButton() {
        print("print didTapBlueButton")
        guard let appCoordinator = self.appCoordinator else { return }

        appCoordinator.setupBlueViewController()
    }
}
