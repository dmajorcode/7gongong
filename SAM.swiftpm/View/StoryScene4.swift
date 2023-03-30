//
//  StoryScene4.swift
//  SAM
//
//  Created by 077tech on 2023/03/29.
//

import SwiftUI
import SpriteKit
struct StoryScene4: View {
    @State var nextButton = false
    @State var storyImage : String = "Story6"
    @State var storyImage2 : String = "Story7"
    @State var imageToggle : Bool = true
    @State var goToGame : Int = 0
    
    var scene = FinalGameScene()
    @State private var useSpriteView = false
    
    var body: some View {
        ZStack {
            if useSpriteView {
                SpriteView(scene: scene)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
            } else {
                if imageToggle {
                    Image("\(storyImage)")
                        .resizable()
                        .renderingMode(.original)
                        .ignoresSafeArea()
                } else {
                    Image("\(storyImage2)")
                        .resizable()
                        .renderingMode(.original)
                        .ignoresSafeArea()
            }    
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Button(action: {
                            if goToGame == 0 {
                                nextButton = true
                                imageToggle = false
                                if imageToggle == false {
                                    goToGame = 1
                                }
                            } else {
                                self.useSpriteView.toggle()
                            }
                        }) {
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 30, height: 40)
                        }
                        .padding(10)
                        .foregroundColor(.black)
                        Spacer()
                    }
                }
            }
        }
    }
}
