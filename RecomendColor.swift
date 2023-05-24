//
//  RecomendColor.swift
//  slider
//
//  Created by 二渡和輝 on 2020/06/29.
//  Copyright © 2020 二渡和輝. All rights reserved.
//

import Foundation

struct recomendColorRGB: Identifiable {
    var id = UUID()
    let R: Double
    let G: Double
    let B: Double
}

//初期の色
let firstRecomendColors1:[recomendColorRGB] = [
    .init(R: 153, G: 255, B: 153),
    .init(R: 255, G: 153, B: 204),
    .init(R: 68, G: 153, B: 221),
    .init(R: 255, G: 153, B: 0),
    .init(R: 204, G: 204, B: 102),
    .init(R: 204, G: 51, B: 153),
    .init(R: 102, G: 255, B: 204)
]
let firstRecomendColors2:[recomendColorRGB] = [
    .init(R: 102, G: 255, B: 102),
    .init(R: 255, G: 102, B: 153),
    .init(R: 204, G: 102, B: 204),
    .init(R: 255, G: 255, B: 204),
    .init(R: 255, G: 187, B: 187),
    .init(R: 102, G: 221, B: 255),
    .init(R: 51, G: 170, B: 170)
]

//7月アップデート
let julyRecomend1:[recomendColorRGB] = [
    .init(R: 238, G: 238, B: 221),
    .init(R: 221, G: 238, B: 238),
    .init(R: 221, G: 221, B: 238),
    .init(R: 153, G: 187, B: 238),
    .init(R: 153, G: 221, B: 238),
    .init(R: 102, G: 119, B: 221),
    .init(R: 34, G: 102, B: 187)
]
let julyRecomend2:[recomendColorRGB] = [
    .init(R: 238, G: 221, B: 238),
    .init(R: 238, G: 187, B: 204),
    .init(R: 221, G: 170, B: 221),
    .init(R: 153, G: 153, B: 187),
    .init(R: 255, G: 136, B: 187),
    .init(R: 255, G: 221, B: 119),
    .init(R: 221, G: 0, B: 51),
]
