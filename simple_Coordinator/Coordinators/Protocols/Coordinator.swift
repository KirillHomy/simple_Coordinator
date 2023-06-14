//
//  Coordinator.swift
//  simple_Coordinator
//
//  Created by Kirill Khomicevich on 14.06.2023.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
