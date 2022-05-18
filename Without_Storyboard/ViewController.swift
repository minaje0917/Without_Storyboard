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
        view.addSubview(label)
        
    }
    
    
    let tableview = UITableView()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "상어상어"
        return label
    }()
    

}

