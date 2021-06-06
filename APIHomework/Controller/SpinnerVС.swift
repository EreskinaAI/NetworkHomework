//
//  SpinnerVС.swift
//  APIHomework
//
//  Created by Анна Ереськина on 06.06.2021.
//

import UIKit

/// Контроллер содержащий Спиннер
class SpinnerVС: UIViewController {
    /// Спиннер вью
    private let spinnerView = UIActivityIndicatorView(style: .large)
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = makeView()
    }
}

// MARK: - User methods

extension SpinnerVС {
    /// Запускаем анимацию
    func startAnimation() {
        spinnerView.startAnimating()
    }
    
    /// Останавливаем анимацию
    func stopAnimation() {
        DispatchQueue.main.async {
            self.spinnerView.stopAnimating()
        }
    }
    
    private func makeView() -> UIView {
        let myView = UIView()
        
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        spinnerView.hidesWhenStopped = true
        myView.addSubview(spinnerView)
        
        spinnerView.centerXAnchor.constraint(equalTo: myView.centerXAnchor).isActive = true
        spinnerView.centerYAnchor.constraint(equalTo: myView.centerYAnchor).isActive = true
        
        return myView
    }
}
