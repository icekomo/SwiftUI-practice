//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Josh Gdovin on 7/1/25.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // Mark: - 3: Depth
            
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            // Mark: - 2. Light
            
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            //Mark: - 1. Surface
            
            LinearGradient(colors: [
                Color.customGreenLight,
                Color.customGreenMedium],
                           startPoint: .top,
                           endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
