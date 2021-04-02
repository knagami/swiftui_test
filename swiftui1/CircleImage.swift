//
//  CircleImage.swift
//  swiftui1
//
//  Created by 永見清文 on 2020/11/30.
//

import SwiftUI

struct CircleImage: View {
    var localImage: String
    var body: some View {
        GeometryReader { metrics in
        Image(localImage)
            .resizable()
            .frame(width: metrics.size.width*0.7, height: metrics.size.width*0.7, alignment: .center)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(localImage: "")
    }
}
