//
//  ViewController.swift
//  Without_Storyboard
//
//  Created by 선민재 on 2022/05/17.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    let plusButton = UIButton().then {
        $0.setTitle("+", for: .normal)
    }
    let minusButton = UIButton().then {
        $0.setTitle("-", for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
        setLabel()
        setButton()
    }
    
    func setButton() {
        //plusButton.setTitle("+", for: .normal)
        plusButton.backgroundColor = .systemGray2
        //minusButton.setTitle("-", for: .normal)
        minusButton.backgroundColor = .systemGray2
        
    }
    
    private func addView() {
        [plusButton, minusButton].forEach {
            view.addSubview($0)
        }
    }
    private func setLayout() {
        plusButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(100)
            $0.size.equalTo(100)
        }
        minusButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(200)
            $0.size.equalTo(100)
        }
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

