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
        $0.backgroundColor = .systemGray2
    }
    let minusButton = UIButton().then {
        $0.setTitle("-", for: .normal)
        $0.backgroundColor = .systemGray2
    }
    let stroke1 = UIView().then {
        $0.backgroundColor = .black
    }
    let stroke2 = UIView().then {
        $0.backgroundColor = .black
    }
    let mulButton = UIButton().then {
        $0.setTitle("x", for: .normal)
        $0.backgroundColor = .systemGray2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
        setLabel()
    }
    
    private func addView() {
        [plusButton, minusButton, stroke1, stroke2, mulButton].forEach {
            view.addSubview($0)
        }
    }
    private func setLayout() {
        plusButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(250)
            $0.leading.equalToSuperview().offset(0)
            $0.size.equalTo(100)
        }
        minusButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(plusButton.snp.bottom).offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.size.equalTo(100)
        }
        stroke1.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(minusButton.snp.top).offset(0)
            $0.leading.equalToSuperview().offset(0)
        }
        stroke2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1)
            $0.leading.equalToSuperview().offset(0)
            $0.top.equalTo(minusButton.snp.bottom).offset(0)
        }
        mulButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(stroke2.snp.bottom).offset(0)
            $0.leading.equalToSuperview().offset(0)
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

