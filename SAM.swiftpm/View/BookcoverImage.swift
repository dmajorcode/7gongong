//
//  BookcoverImage.swift
//  SAM
//
//  Created by 077tech on 2023/03/30.
//

import SwiftUI

struct BookcoverImage: View {
    
    @State private var showingDetail = false
    
    var body: some View {
        Image("bookCover")
            .resizable()
            .renderingMode(.original)
            .ignoresSafeArea()
            .onTapGesture {
                showingDetail.toggle()
            }
            .fullScreenCover(isPresented: $showingDetail) {
                ContentView()
            }
    }
}

struct BookcoverImage_Previews: PreviewProvider {
    static var previews: some View {
        BookcoverImage()
    }
}

