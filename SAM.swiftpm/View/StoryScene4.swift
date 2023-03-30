//
//  StoryScene4.swift
//  SAM
//
//  Created by 077tech on 2023/03/29.
//

import SwiftUI
import SpriteKit

struct StoryScene4: View {
//    var nextStory = StoryScene5()
    //    var scene = FinalGameScene()
    @State var nextButton = false
    @State var storyImage : String = "daaanImage1"
    @State var storyImage2 : String = "maltyChadStory"
    @State var imageToggle : Bool = true
    @State var goToGame : Int = 0
    
    var scene = FinalGameScene()
    @State private var useSpriteView = false
    
    var body: some View {
        ZStack{
            if imageToggle{
                Image("\(storyImage)")
                    .resizable()
                    .renderingMode(.original)
                    .ignoresSafeArea()
            }else{
                Image("\(storyImage2)")
                    .resizable()
                    .renderingMode(.original)
                    .ignoresSafeArea()
            }

            HStack {
                Spacer()
                ZStack{
                    if goToGame == 0{
                        //
                        Button(action: {
                            nextButton = true
                            imageToggle = false
                            if imageToggle == false{
                                goToGame = 1
                            }
                        }) {
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .frame(width: 30, height: 40)
                        }
                        .padding(10)
                        .foregroundColor(.black)
                        //
                    }else{
                        if useSpriteView {
                            SpriteView(scene: scene)
                                .frame(width: 440, height: nil)
                                .ignoresSafeArea()
                                
                        }else{
                            Button(action: {
                                self.useSpriteView.toggle()
                            }) {
                                Image(systemName: "arrowshape.right.fill")
                                    .resizable()
                                    .frame(width: 30, height: 40)
                            }
                            .padding(10)
                            .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}
