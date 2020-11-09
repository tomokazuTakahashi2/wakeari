//
//  AmazonModel.swift
//  Wakeari
//
//  Created by Raphael on 2020/11/05.
//  Copyright © 2020 Raphael. All rights reserved.
//

import Foundation

struct AmazonItem: Codable {
    let B0714BNRWC: Item1
    let B07TKNPPDL: Item2
    let B086CX5XFV: Item3
}

struct Item1: Codable {
    let title: String
    let price: String
    let prime: String
    let image: String
}

struct Item2: Codable {
    let title: String
    let price: String
    let prime: String
    let image: String
}

struct Item3: Codable {
    let title: String
    let price: String
    let prime: String
    let image: String
}
