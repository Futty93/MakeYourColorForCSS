//
//  testView.swift
//  slider
//
//  Created by 二渡和輝 on 2020/03/05.
//  Copyright © 2020 二渡和輝. All rights reserved.
//

import SwiftUI

struct mainView: View {
    
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    @State var gray = 0.0 //Gray化に使用
    @State var complementaryColor = 0.0 //補色計算に使用
    @State var max = 0.0 //補色計算に使用
    @State var min = 0.0 //補色計算に使用
    
    let recomendColorsRow1:[recomendColorRGB] = [
        .init(R: 238, G: 238, B: 221),
        .init(R: 221, G: 238, B: 238),
        .init(R: 221, G: 221, B: 238),
        .init(R: 153, G: 187, B: 238),
        .init(R: 153, G: 221, B: 238),
        .init(R: 102, G: 119, B: 221),
        .init(R: 34, G: 102, B: 187),
    ]
    let recomendColorsRow2:[recomendColorRGB] = [
        .init(R: 238, G: 221, B: 238),
        .init(R: 238, G: 187, B: 204),
        .init(R: 221, G: 170, B: 221),
        .init(R: 153, G: 153, B: 187),
        .init(R: 255, G: 136, B: 187),
        .init(R: 255, G: 221, B: 119),
        .init(R: 221, G: 0, B: 51),
    ]
    
    struct recomendColorRGB: Identifiable {
        var id = UUID()
        let R: Double
        let G: Double
        let B: Double
    }
    
    var body: some View {
        VStack{
            
            Spacer()
            
            HStack (spacing: screenWidth / 24) {
                
                Button(action: {
                    self.gray = (self.red + self.green + self.blue) / 3
                    self.red = self.gray
                    self.green = self.gray
                    self.blue = self.gray
                }) {
                    Text("gray")
                        .frame(width: screenWidth > 420 ? 190 : screenWidth / 6, height: screenWidth > 420 ? 60 : screenWidth / 10)
                        .foregroundColor(.primary)
                        .padding(.horizontal, 15)
                        .background(RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color(.systemGray6)))
                            
                }
                
                Button(action: {
                    
                    if self.red >= self.green {
                        self.max = self.red
                    }else{
                        self.max = self.green
                    }
                    if self.max <= self.blue {
                        self.max = self.blue
                    }
                    
                    if self.red <= self.green {
                        self.min = self.red
                    }else{
                        self.min = self.green
                    }
                    if self.min >= self.blue {
                        self.min = self.blue
                    }
                    
                    self.complementaryColor = self.max + self.min
                    
                    self.red = self.complementaryColor - self.red
                    self.green = self.complementaryColor - self.green
                    self.blue = self.complementaryColor - self.blue
                    
                }) {
                    Text("complement")
                        .frame(width: screenWidth > 420 ? 190 : screenWidth / 6, height: screenWidth > 420 ? 60 : screenWidth / 10)
                        .foregroundColor(.primary)
                        .padding(.horizontal, 15)
                        .background(RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color(.systemGray6)))
                }
                
                Button(action: {
                    self.red = 255.0 - self.red
                    self.green = 255.0 - self.green
                    self.blue = 255.0 - self.blue
                }) {
                    Text("invert")
                        .frame(width: screenWidth > 420 ? 190 : screenWidth / 6, height: screenWidth > 420 ? 60 : screenWidth / 10)
                        .foregroundColor(.primary)
                        .padding(.horizontal, 15)
                        .background(RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color(.systemGray6)))
                }
            }
            
            Spacer()
            
            VStack {
                HStack {
                    
                    Text("Red: \(Int(red))").foregroundColor(.primary)
                    
                    Text("Green: \(Int(green))").foregroundColor(.primary)
                    
                    Text("Blue: \(Int(blue))").foregroundColor(.primary)
                    
                }.font(.system(size: screenWidth / 16))
                
                Text(makeColorCode(red: Int(red), green: Int(green), blue: Int(blue)))
                    .foregroundColor(.primary)
                    .font(.system(size: screenWidth / 16))
                
            }
            
            Circle()
                .frame(width: screenWidth > 420 ? 420 : screenWidth * 3/5, height: screenWidth > 420 ? 420 : screenWidth * 3/5)
                .foregroundColor(Color(red: self.red/255, green: self.green/255, blue: self.blue/255))
            
//Slider
            VStack (alignment: .trailing){
                HStack {
                    
                    Text("Red").foregroundColor(Color.red).frame(width: screenWidth / 6)
                    
                    RedSliderView(red: self.$red, green: self.$green, blue: self.$blue)
                }
                
                HStack {
                    
                    Text("Green").foregroundColor(Color.green).frame(width: screenWidth / 6)
                    
                    GreenSliderView(red: self.$red, green: self.$green, blue: self.$blue)
                }
                
                HStack {
                    
                    Text("Blue").foregroundColor(Color.blue).frame(width: screenWidth / 6)
                    
                    BlueSliderView(red: self.$red, green: self.$green, blue: self.$blue)
                }
            }
            
            Spacer()
            
            
//Recomend Color Button
            VStack {
                HStack {
                    ForEach(recomendColorsRow1) { colors in
                        RecomandColorButton(red: self.$red, green: self.$green, blue: self.$blue, recomendRed: colors.R, recomendGreen: colors.G, recomendBlue: colors.B)
                    }
                }
                
                HStack {
                    ForEach(recomendColorsRow2) { colors in
                        RecomandColorButton(red: self.$red, green: self.$green, blue: self.$blue, recomendRed: colors.R, recomendGreen: colors.G, recomendBlue: colors.B)
                    }
                }
            }
            Spacer()
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

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            mainView(red: .constant(204), green: .constant(255), blue: .constant(153))
            
//            mainView(red: .constant(204), green: .constant(255), blue: .constant(153))
//            mainView(red: .constant(204), green: .constant(255), blue: .constant(153)).previewDevice("iPhone 11")
        }
    }
}


struct RedSliderView: View {
    
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        ZStack (alignment: .leading) {
            Capsule().fill(LinearGradient(gradient: Gradient(colors:
                [Color(red: 0, green: self.green / 255.0, blue: self.blue / 255.0),
                 Color(red: 1, green: self.green / 255.0, blue: self.blue / 255.0)
            ]),
                                          startPoint: .leading, endPoint: .trailing))
                .frame(width: screenWidth * 3/5, height: 10).padding(0)
            
            ZStack(alignment: .center) {
                Circle().frame(width: 28, height: 28)
                    .foregroundColor(Color("systemWhite"))
                    .offset(x: CGFloat(-14))
                    .shadow(color: Color(.systemGray4), radius: 2, x: 2, y: 2)
                
                Circle().frame(width: 22, height: 22)
                    .foregroundColor(.red)
                    .offset(x: CGFloat(-14))
                
                Circle().frame(width: 18, height: 18)
                    .foregroundColor(Color("systemWhite"))
                    .offset(x: CGFloat(-14))
                
            }.offset(x: CGFloat((CGFloat(self.red) * screenWidth * 3/5))/255)
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            if value.location.x >= 0 && value.location.x <= (screenWidth * 3/5) {
                                self.red = sliderValue(sValue: Double((value.location.x / (screenWidth * 3/5)) * 255))
                            }
                        })
            )
        }
    }
}

struct GreenSliderView: View {
    
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        ZStack (alignment: .leading) {
            Capsule().fill(LinearGradient(gradient: Gradient(colors:
                [Color(red: self.red / 255.0, green: 0, blue: self.blue / 255.0),
                 Color(red: self.red / 255.0, green: 1, blue: self.blue / 255.0)
            ]),
                                          startPoint: .leading, endPoint: .trailing))
                .frame(width: screenWidth * 3/5, height: 10).padding(0)
            
            ZStack(alignment: .center) {
                Circle().frame(width: 28, height: 28)
                    .foregroundColor(Color("systemWhite"))
                    .offset(x: CGFloat(-14))
                    .shadow(color: Color(.systemGray4), radius: 2, x: 2, y: 2)
                
                Circle().frame(width: 22, height: 22)
                    .foregroundColor(.green)
                    .offset(x: CGFloat(-14))
                
                Circle().frame(width: 18, height: 18)
                    .foregroundColor(Color("systemWhite"))
                    .offset(x: CGFloat(-14))
                
            }.offset(x: CGFloat((CGFloat(self.green) * screenWidth * 3/5))/255)
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            if value.location.x >= 0 && value.location.x <= (screenWidth * 3/5) {
                                self.green = sliderValue(sValue: Double((value.location.x / (screenWidth * 3/5)) * 255))
                            }
                        })
            )
        }
    }
}

struct BlueSliderView: View {
    
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        ZStack (alignment: .leading) {
            Capsule().fill(LinearGradient(gradient: Gradient(colors:
                [Color(red: self.red / 255.0, green: self.green / 255.0, blue: 0),
                 Color(red: self.red / 255.0, green: self.green / 255.0, blue: 1)
            ]),
                                          startPoint: .leading, endPoint: .trailing))
                .frame(width: screenWidth * 3/5, height: 10).padding(0)
            
            ZStack(alignment: .center) {
                Circle()
                    .frame(width: 28, height: 28)
                    .foregroundColor(Color("systemWhite"))
                    .offset(x: CGFloat(-14))
                    .shadow(color: Color(.systemGray4), radius: 2, x: 2, y: 2)
                
                Circle()
                    .frame(width: 22, height: 22)
                    .foregroundColor(.blue)
                    .offset(x: CGFloat(-14))
                
                Circle()
                    .frame(width: 18, height: 18)
                    .foregroundColor(Color("systemWhite"))
                    .offset(x: CGFloat(-14))
                
            }.offset(x: CGFloat((CGFloat(self.blue) * screenWidth * 3/5))/255)
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            if value.location.x >= 0 && value.location.x <= (screenWidth * 3/5) {
                                self.blue = sliderValue(sValue: Double((value.location.x / (screenWidth * 3/5)) * 255))
                            }
                        })
            )
        }
    }
}

struct RecomandColorButton: View {
    
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    @State var recomendRed: Double
    @State var recomendGreen: Double
    @State var recomendBlue: Double
    
    var body: some View {
        Button(action: {
            self.red = self.recomendRed
            self.green = self.recomendGreen
            self.blue = self.recomendBlue
        }) {
            RoundedRectangle(cornerRadius: screenWidth / CGFloat(50))
                .frame(width: screenWidth / CGFloat(10), height: screenWidth / CGFloat(10))
                .foregroundColor(Color(red: self.recomendRed/255.0,
                                       green: self.recomendGreen/255.0,
                                       blue: self.recomendBlue/255.0))
        }
    }
}

func sliderValue(sValue: Double) -> Double {
    if sValue >= 0 && sValue <= 254.5 {
        return sValue
    } else {
        return 255.0
    }
}
