//
//  StoryScene4.swift
//  SAM
//
//  Created by 077tech on 2023/03/29.
//

import SwiftUI
import SpriteKit

struct StoryScene4: View {
    var nextStory = StoryScene5()
    //    var scene = FinalGameScene()
    @State var nextButton = false
    
    var body: some View {
        ZStack{
            Image("daaanImage1")
                .resizable()
                .renderingMode(.original)
                .ignoresSafeArea()
            HStack {
                Spacer()
                Button(action: {
                    nextButton = true
                }) {
                    Image(systemName: "arrowshape.right.fill")
                        .resizable()
                        .frame(width: 30, height: 40)
                }
                .padding(10)
                .foregroundColor(.black)
                .fullScreenCover(isPresented: $nextButton) {
                    StoryScene5()
                }
            }
        }

    }
}
