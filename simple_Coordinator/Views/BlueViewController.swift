//
//  BlueViewController.swift
//  simple_Coordinator
//
//  Created by Kirill Khomicevich on 14.06.2023.
//

import UIKit

import UIKit
import SnapKit

class BlueViewController: UIViewController {

    // MARK: - Weak variables
    weak var appCoordinator: AppCoordinator?

    // MARK: - Private interfase constatns
    private let yellowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Yellow View", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    private let oranreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Oranre View", for: .normal)
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
private extension BlueViewController {

    func setupController() {
        setupAddSubview()
        setupCoordinate()
        setupAddTarget()
        setupSettingView()
    }

    func setupAddSubview() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(yellowButton)
        stackView.addArrangedSubview(oranreButton)
    }

    func setupCoordinate() {
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.right.equalTo(view).inset(20)
        }
    }

    func setupAddTarget() {
        yellowButton.addTarget(self, action: #selector(didTapYellowButton), for: .touchUpInside)
        oranreButton.addTarget(self, action: #selector(didTapOrangeButton), for: .touchUpInside)
    }

    func setupSettingView() {
        view.backgroundColor = .blue
    }

}

// MARK: - @objc private extension
@objc private extension BlueViewController {

    func didTapYellowButton() {
        print("print didTapYellowButton")
        guard let appCoordinator = self.appCoordinator else { return }

        appCoordinator.setupYellowViewController()
    }

    func didTapOrangeButton() {
        print("print didTapBlueButton")
        guard let appCoordinator = self.appCoordinator else { return }

        appCoordinator.setupOrangeViewController()
    }
}
