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
        return ["楽天市場", "楽天市場", "ポンパレモール","アマゾン"]
    }
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        
        switch index {
        case 0:
            return TableViewController1()
        case 1:
            return TableViewController2()
//        case 2:
//            return TableViewController3()
//        case 3:
//            return TableViewController4()
//        case 4:
//            return TableViewController5()
//        case 5:
//            return TableViewController6()
//        case 6:
//            return TableViewController7()
//        case 7:
//            return TableViewController8()
//        case 8:
//            return TableViewController9()
//        case 9:
//            return TableViewController10()
        default:
            return TableViewController1()
        }
    }
    
    
}

