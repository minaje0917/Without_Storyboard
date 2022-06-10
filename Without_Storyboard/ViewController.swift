//
//  ViewController.swift
//  Without_Storyboard
//
//  Created by 선민재 on 2022/05/17.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let bounds = UIScreen.main.bounds
    var fristValue: Int = 0
    var secondValue: Int = 0
    var sum: Int = 0
    var isPlus: Bool = false
    var isMinus: Bool = false
    var isMul: Bool = false
    var isde: Bool = false
    
    lazy var plusButton = UIButton().then {
        $0.setTitle("+", for: .normal)
        $0.backgroundColor = .black.withAlphaComponent(0.8)
        $0.addTarget(self, action: #selector(plusAction), for: .touchUpInside)
    }
    
    lazy var minusButton = UIButton().then {
        $0.setTitle("-", for: .normal)
        $0.backgroundColor = .black.withAlphaComponent(0.8)
        $0.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    lazy var stroke1 = UIView().then {
        $0.backgroundColor = .black
    }
    
    lazy var stroke2 = UIView().then {
        $0.backgroundColor = .black
    }
    
    lazy var mulButton = UIButton().then {
        $0.setTitle("x", for: .normal)
        $0.backgroundColor = .black.withAlphaComponent(0.8)
        $0.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    lazy var deButton =  UIButton().then {
        $0.backgroundColor = .black.withAlphaComponent(0.8)
        $0.setTitle("÷", for: .normal)
        $0.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    lazy var stroke3 = UIView().then {
        $0.backgroundColor = .black
    }
    
    lazy var equalButton = UIButton().then {
        $0.setTitle("=", for: .normal)
        $0.backgroundColor = .systemOrange
        $0.addTarget(self, action: #selector(resultAction), for: .touchUpInside)
    }
    
    lazy var stroke4 = UIView().then {
        $0.backgroundColor = .black
    }
    
    lazy var resultField = UITextField().then {
        $0.backgroundColor = .black.withAlphaComponent(0.5)
        $0.textAlignment = .center
        $0.keyboardType = .numberPad
        $0.becomeFirstResponder()
        $0.addTarget(self, action: #selector(buttonAction), for: .editingChanged)
    }
    
    lazy var refreshButton = UIButton().then {
        $0.backgroundColor = .black.withAlphaComponent(0.8)
        $0.setTitle("AC", for: .normal)
        $0.addTarget(self, action: #selector(clearAction), for: .touchUpInside)
    }
    
    lazy var sResultLabel = UILabel().then {
        $0.backgroundColor = .black.withAlphaComponent(0.3)
        $0.textAlignment = .center
    }
    
    @objc func buttonAction() {
        print("Button")
        
    }
    
    @objc func clearAction() {
        print("clear")
        fristValue = 0
        secondValue = 0
        sum = 0
        resultField.text = nil
        sResultLabel.text = nil
    }
    
    @objc func minusAction() {
        sum = sum - fristValue
        print("sum",sum)
        resultField.text = nil
        fristValue = 0
        
    }
    
    @objc func plusAction() {
        if let value = Int(resultField.text ?? "" ){
            fristValue = Int(value)
            print("value", fristValue)
        }
        
        sum = sum + fristValue
        print("sum",sum)
        resultField.text = nil
        fristValue = 0
        isPlus = true
    }
    
    @objc func resultAction() {
        if let value = Int(resultField.text ?? "" ){
            secondValue = Int(value)
            print("value", secondValue)
        }
        if isPlus == true {
            sum = sum + secondValue
            sResultLabel.text = String(sum)
            secondValue = 0
            isPlus = false
            resultField.text = ""
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    private func addView() {
        [plusButton, minusButton, stroke1, stroke2, mulButton,deButton, stroke3, equalButton, stroke4, resultField, refreshButton, sResultLabel].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        equalButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(0)
            $0.trailing.equalTo(view.snp.centerX)
            $0.size.equalTo(bounds.height * 0.1)
        }
        refreshButton.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(view.snp.centerX)
            $0.trailing.equalToSuperview().offset(0)
            $0.size.equalTo(bounds.height * 0.1)
        }
        stroke4.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1)
            $0.leading.equalToSuperview().offset(0)
            $0.bottom.equalTo(equalButton.snp.top).offset(0)
            $0.bottom.equalTo(refreshButton.snp.top).offset(0)
        }
        deButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(stroke4.snp.top).offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.size.equalTo(bounds.height * 0.1)
        }
        stroke3.snp.makeConstraints{
            $0.bottom.equalTo(deButton.snp.top).offset(0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1)
            $0.leading.equalToSuperview().offset(0)
        }
        mulButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(stroke3.snp.top).offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.size.equalTo(bounds.height * 0.1)
        }
        stroke2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1)
            $0.leading.equalToSuperview().offset(0)
            $0.bottom.equalTo(mulButton.snp.top).offset(0)
        }
        minusButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(stroke2.snp.top).offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.size.equalTo(bounds.height * 0.1)
        }
        stroke1.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(1)
            $0.bottom.equalTo(minusButton.snp.top).offset(0)
            $0.leading.equalToSuperview().offset(0)
        }
        plusButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(stroke1.snp.top).offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.size.equalTo(bounds.height * 0.1)
        }
        resultField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(plusButton.snp.top).offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.size.equalTo(bounds.height * 0.1)
        }
        sResultLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(resultField.snp.top).offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.size.equalTo(bounds.height * 0.1)
        }
        
    }
    
    func setLabel() {
        let setLabel = UILabel()
        setLabel.text = "Story_board 없이 계산기를 만들어보자!"
        setLabel.translatesAutoresizingMaskIntoConstraints = false
        setLabel.font = .boldSystemFont(ofSize: 17)
        setLabel.textColor = .black
        setLabel.numberOfLines = 0
        setLabel.textAlignment = .center
        
        view.addSubview(setLabel)
        
        let layout = view.safeAreaLayoutGuide
        
        setLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 16).isActive = true
        setLabel.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -16).isActive = true
        setLabel.topAnchor.constraint(equalTo: layout.topAnchor,constant: 10).isActive = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
        setLabel()
    }
}

