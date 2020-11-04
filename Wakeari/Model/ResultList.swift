//
//  ResultList.swift
//  Wakeari
//
//  Created by Raphael on 2020/11/03.
//  Copyright © 2020 Raphael. All rights reserved.
//

import Foundation

struct ResultList: Codable {
    
    let Items :[items]
}

struct items :Codable{
    let Item :item
}

struct item: Codable {
    
    let mediumImageUrls:[Image]
    let itemCaption :String
    let itemName:String
    let itemPrice: Int
    let shopName:String
    let shopUrl:String
}

struct Image: Codable {
    let imageUrl: String
}

