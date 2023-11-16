//
//  RootCoordinator.swift
//  iOSStarterTemplate
//
//  Created by diayan siat on 16/11/2023.
//

import SwiftUI
import Combine

class RootCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController? {
        didSet {
            guard let window else { return }
            UIView.transition(with: window, duration: 0.2, options: [.transitionCrossDissolve]) {
                window.rootViewController = self.rootViewController
            }
        }
    }
    private let window: UIWindow?
    private var cancellables: [AnyCancellable] = []
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.parentCoordinator = self
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
        
        guard let homeController = homeCoordinator.rootViewController else { return }
        
        let rootViewController = UINavigationController(
            rootViewController: homeController
        )
        rootViewController.navigationBar.prefersLargeTitles = true
        self.rootViewController = rootViewController
    }
}
