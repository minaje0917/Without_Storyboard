//
//  ViewController.swift
//  Without_Storyboard
//
//  Created by 선민재 on 2022/05/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLabel()
        setButton()
    }
    
    func setButton() {
        let setButton = UIButton()
        setButton.setTitle("상어상어", for: .normal)
        setButton.backgroundColor = .systemMint
        setButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(setButton)
        
        let layout = view.safeAreaLayoutGuide
        
        setButton.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 20).isActive = true
        setButton.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: -20).isActive = true
        setButton.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -20).isActive = true
    }
    
    func setLabel() {
        let setLabel = UILabel()
        setLabel.text = "Story_board 없이 계산기를 만들어보자!"
        setLabel.translatesAutoresizingMaskIntoConstraints = false
        setLabel.font = .italicSystemFont(ofSize: 17)
        setLabel.textColor = .black
        setLabel.numberOfLines = 0
        setLabel.textAlignment = .center
        
        view.addSubview(setLabel)
        
        let layout = view.safeAreaLayoutGuide
        
        setLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 16).isActive = true
        setLabel.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -16).isActive = true
        setLabel.topAnchor.constraint(equalTo: layout.topAnchor,constant: 10).isActive = true
        
    }
}

