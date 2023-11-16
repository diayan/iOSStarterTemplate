//
//  Coordinator.swift
//  iOSStarterTemplate
//
//  Created by diayan siat on 16/11/2023.
//

import SwiftUI

public protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var rootViewController: UIViewController? { get set }
    
    @MainActor func start()
    @MainActor func childDidFinish(_ child: Coordinator)
    @MainActor func dismiss(completion: (() -> Void)?)
}

public extension Coordinator {
    var started: Bool {
        rootViewController != nil
    }
    
    @MainActor
    func childDidFinish(_ child: Coordinator) {
        removeChild(child)
    }
    
    @MainActor
    func dismiss(completion: (() -> Void)? = nil) {
        self.rootViewController?.dismiss(animated: true, completion: completion)
        self.parentCoordinator?.childDidFinish(self)
    }
    
    func removeChild(_ child: Coordinator) {
        for(index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
            break
        }
    }
    
    @MainActor
    func present(
        coordinator: Coordinator,
        modally: Bool = false,
        presentationStyle: UIModalPresentationStyle = .automatic
    ) {
        if !coordinator.started {
            childCoordinators.append(coordinator)
            coordinator.parentCoordinator = self
            coordinator.start()
        }
        
        if coordinator.parentCoordinator !== self, 
            let parent = coordinator.parentCoordinator {
            parent.childDidFinish(coordinator)
            
            coordinator.parentCoordinator = self
            childCoordinators.append(coordinator)
        }
        
        guard let controller = coordinator.rootViewController else {
            childDidFinish(coordinator)
            return
        }
        
        controller.modalPresentationStyle = presentationStyle
        
        if modally {
            rootViewController?.present(controller, animated: true)
        }else {
            rootViewController?.show(controller, sender: self)
        }
    }
}
