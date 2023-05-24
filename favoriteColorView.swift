//
//  favoriteColorView.swift
//  slider
//
//  Created by 二渡和輝 on 2020/03/13.
//  Copyright © 2020 二渡和輝. All rights reserved.
//

import SwiftUI

struct favoriteColorView: View {
    
    
    
    @State var red: Double
    @State var green: Double
    @State var blue: Double
    
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 12)
                .frame(width: screenWidth*0.8, height: screenWidth/6)
                .foregroundColor(Color("systemWhite"))
//                .colorInvert()
                .shadow(color: Color(red: self.red / 300, green: self.green / 300, blue: self.blue / 300), radius: 5, x: 5, y: 3)
                .shadow(color: Color(.systemGray5), radius: 5, x: -3, y: -3)
                .padding(.horizontal).padding(.vertical, 5)
            
            HStack (spacing: screenWidth/5){
                
                Text(makeColorCode(red: Int(red), green: Int(green), blue: Int(blue)))
                    .font(.system(size: screenWidth / 14))
                    .frame(width: screenWidth / 3)
                
                Image(systemName: "star.fill")
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(width: screenWidth/12)
                    .foregroundColor(Color(red: red/255, green: green/255, blue: blue/255))
                    .background(Circle()
                        .stroke(Color(red: red/255, green: green/255, blue: blue/255), lineWidth: 4)
                        .frame(width: screenWidth/8, height: screenWidth/8))
            }
        }
    }
    func makeColorCode(red: Int, green: Int, blue: Int) -> String{
        
        var colorCode: String = ""
        
        let Red = String(format: "%02x", red)
        let Green = String(format: "%02x", green)
        let Blue = String(format: "%02x", blue)
        
        colorCode = "#\(Red)\(Green)\(Blue)"
        
        return colorCode
    }
}

struct favoriteColorView_Previews: PreviewProvider {
    static var previews: some View {
        favoriteColorView(red: 105, green: 105, blue: 105)
    }
}
