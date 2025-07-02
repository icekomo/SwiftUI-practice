//
//  CardView.swift
//  Hike
//
//  Created by Josh Gdovin on 7/1/25.
//

import SwiftUI

struct CardView: View {
    
    //MARK: - Properties
    @State private var imageNumber: Int = 1
    @State private var randonNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    //MARK: - Functions
    func randomImage() {
        print("-- Button Pressed ---")
        print("Status: Old Image Number = \(imageNumber)")
        repeat {
            randonNumber = Int.random(in: 1...5)
            print("Action: Random Number Generated = \(randonNumber)")
        }while randonNumber == imageNumber
        
        imageNumber = randonNumber
        
        print("Result: New Image Number = \(imageNumber)")
        print("--- End ---")
    }
    
    var body: some View {
        //Mark: - Card
        ZStack {
            CustomBackgroundView()
            
            VStack {
                //MARK: - Header
                
                VStack (alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayLight, .customGrayMedium  ],
                                    startPoint: .top,
                                    endPoint: .bottom)
                            )
                        
                        Spacer()
                        
                        Button {
                            // Action: Show a sheet
                            print("The button was pressed")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and family")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }//: Header
                .padding(.horizontal, 30)
                
                //MARK: - Main Content
                ZStack {
                    
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 0.25), value: imageNumber)
                }
                //MARK: - Footer
                
                Button{
                    // Action: Generate a random number
                    //print("The button is pressed")
                    randomImage()
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .colorGreenLight,
                                    .colorGreenMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x:1, y: 2)
                }
                
                .buttonStyle(GradientButtonStyle())
                
                } //: ZSTACK
        } //: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
