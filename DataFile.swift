//
//  DataFile.swift
//  slider
//
//  Created by 二渡和輝 on 2020/03/13.
//  Copyright © 2020 二渡和輝. All rights reserved.
//

import Foundation

var favoriteColor: [FavoriteColor] = []

struct FavoriteColor: Identifiable {
    var id = UUID()
    var Red: Double
    var Green: Double
    var Blue: Double
}

func makeFavoriteColor(favoriteRed: Double, favoriteGreen: Double, favoriteBlue: Double)->[FavoriteColor]{
    var dataArray:[FavoriteColor] = []
    
    dataArray.append(FavoriteColor(Red: favoriteRed, Green: favoriteGreen, Blue: favoriteBlue))
    
    return dataArray
}

