//
//  ViewController.swift
//  GradientAndShadow
//
//  Created by Роман Крендясов on 01.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    var squareView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 10)
        return $0
    }(UIView())
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addGradientToSquareView()
        layoutSquareView()
    }
    
    // MARK: - Configure View
    private func addGradientToSquareView() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemCyan.cgColor, UIColor.systemRed.cgColor]
        gradient.locations = [0, 0.8]
        gradient.startPoint = CGPoint(x: -0.2, y: 0.4)
        gradient.endPoint = CGPoint(x: 1.1, y: 1)
        gradient.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        gradient.cornerRadius = 15
        squareView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func layoutSquareView() {
        view.addSubview(squareView)
        
        NSLayoutConstraint.activate([
            squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            squareView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            squareView.widthAnchor.constraint(equalToConstant: 120),
            squareView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}

#Preview  {
    ViewController()
}
