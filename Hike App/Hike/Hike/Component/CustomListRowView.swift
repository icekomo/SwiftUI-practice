//
//  CustomListRowView.swift
//  Hike
//
//  Created by Josh Gdovin on 7/2/25.
//

import SwiftUI

struct CustomListRowView: View {
    
    //MARK: - PROPERTIES
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinklable: String? = nil
    @State var rowLinkDesination: String? = nil
    
    var body: some View {
        LabeledContent{
            //Conent
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            }else if (rowLinklable != nil && rowLinkDesination != nil) {
                Link(rowLinklable!, destination: URL(string: rowLinkDesination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label: {
            // Label
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
            rowLinklable: "GdovinDesigns",
            rowLinkDesination: "https://www.gdovindesigns.com"
        )
    }
}
