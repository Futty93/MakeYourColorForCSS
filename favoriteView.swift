//
//  favoriteView.swift
//  slider
//
//  Created by 二渡和輝 on 2020/03/12.
//  Copyright © 2020 二渡和輝. All rights reserved.
//

import SwiftUI

struct favoriteView: View {
    
    
    @State var isAlert: Bool = false
    
    @State var favoriteColors: [[Double]] = []
    
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        
        
        ZStack {
            
            VStack {
                
                HStack {
                    Text("currentDisplay")
                        .font(.system(size: screenWidth / 12))
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        var canAppend: Int = 0
                        for count in 0 ..< (self.favoriteColors.count) {
                            if self.favoriteColors[count][0] == self.red && self.favoriteColors[count][1] == self.green && self.favoriteColors[count][2] == self.blue {
                                canAppend += 1
                            }
                        }
                        if canAppend == 0 {
                            self.favoriteColors.append([self.red, self.green, self.blue])
                        } else {
                            self.isAlert.toggle()
                        }
                        canAppend = 0
                        UserDefaults.standard.set(self.favoriteColors, forKey: "newFavoriteColor")
                    }) {
                        HStack {
                            
                            Text("addFavorite")
                                .font(.system(size: screenWidth/24))
                                .foregroundColor(.secondary)
                            
                            Image(systemName: "star.fill")
                                .resizable().aspectRatio(contentMode: .fit)
                                .frame(width: screenWidth / 24)
                                .foregroundColor(Color(.systemOrange))
                            
                        }.padding(10)
                            .background(RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color(.systemYellow)))
                        
                    }.padding(.trailing)
                    
                }
                
                favoriteColorView(red: red, green: green, blue: blue)
                
                HStack {
                    Text("favorite")
                        .font(.system(size: screenWidth / 12))
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    Spacer()
                    
                    EditButton().padding(.trailing)
                    
                }
                if favoriteColors.count == 0 {
                    VStack {
                        Text("noFavoriteColor")
                            .foregroundColor(.primary)
                            .padding()
                        
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(favoriteColors, id: \.self) { item in
                            
                            Button(action: {
                                self.red = item[0]
                                self.green = item[1]
                                self.blue = item[2]
                            }) {
                                favoriteColorView(red: item[0], green: item[1], blue: item[2])
                                    .foregroundColor(.primary)
                            }
                            
                        }.onDelete(perform: self.delete)
                            .onMove(perform: move)
                    }
                }
            }
        }.alert(isPresented: self.$isAlert) {
            Alert(title: Text("alert"), dismissButton: .default(Text("OK")))
        }.onAppear() {
            self.favoriteColors = []
            guard let defaultItems = UserDefaults.standard.array(forKey: "newFavoriteColor") as? [[Double]] else {return}
            for number in defaultItems {
                self.favoriteColors.append(number)
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
    func delete(at offsets: IndexSet) {
        self.favoriteColors.remove(atOffsets: offsets)
        UserDefaults.standard.set(self.favoriteColors, forKey: "newFavoriteColor")
    }
    func move(from source: IndexSet, to destination: Int){
        self.favoriteColors.move(fromOffsets: source, toOffset: destination)
        UserDefaults.standard.set(self.favoriteColors, forKey: "newFavoriteColor")
    }
}

struct favoriteView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            favoriteView(red: .constant(170.0), green: .constant(255.0), blue: .constant(238.0))
            favoriteView(red: .constant(170.0), green: .constant(255.0), blue: .constant(238.0)).previewDevice("iPhone 11")
        }
    }
}
