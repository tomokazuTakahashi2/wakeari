//
//  ViewController.swift
//  Wakeari
//
//  Created by Raphael on 2020/11/02.
//  Copyright © 2020 Raphael. All rights reserved.
//

import UIKit
import SegementSlide

class ViewController: SegementSlideDefaultViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        defaultSelectedIndex = 0
        reloadData()
        
    }
    //ヘッダー
    override func segementSlideHeaderView() -> UIView? {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.heightAnchor.constraint(equalToConstant: view.bounds.height/5).isActive = true
        return headerView
    }
    //タブの名前
    override var titlesInSwitcher: [String] {
        return ["Amazon", "楽天市場", "ポンパレモール","アマゾン"]
    }
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        return TableViewController1()
    }
    
    
}

