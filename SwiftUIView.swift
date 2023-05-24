//
//  SwiftUIView.swift
//  slider
//
//  Created by 二渡和輝 on 2020/06/29.
//  Copyright © 2020 二渡和輝. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            Text("\(screenWidth)")
            
            Rectangle().frame(width: 400, height: 400)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
