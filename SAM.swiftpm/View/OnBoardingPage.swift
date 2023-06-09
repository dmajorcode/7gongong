//
//  SwiftUIView.swift
//  
//
//  Created by 077tech on 2023/03/28.
//

import SwiftUI
import SpriteKit

struct OnBoardingPage: View {
    
    @State var nextButton = false
    @State var storyImage : String = "Story1"
    @State var storyImage2 : String = "Story2"
    @State var storyImage3 : String = "Story3"
    @State var imageToggle : Bool = true
    @State var goToGame : Int = 0
    
    @State var storyIndex : Int = 0
    
    var scene = GameScene1()
    @State private var useSpriteView = false

    
    var body: some View {
            if !useSpriteView {
                ZStack{
                    if storyIndex == 0{
                        Image("\(storyImage)")
                            .resizable()
                            .renderingMode(.original)
                            .ignoresSafeArea()
                    }else if storyIndex == 1{
                        Image("\(storyImage2)")
                            .resizable()
                            .renderingMode(.original)
                            .ignoresSafeArea()
                    }else{
                        Image("\(storyImage3)")
                            .resizable()
                            .renderingMode(.original)
                            .ignoresSafeArea()
                    }
                    
//                    if imageToggle{
//                        Image("\(storyImage)")
//                            .resizable()
//                            .renderingMode(.original)
//                            .ignoresSafeArea()
//                    } else {
//                        Image("\(storyImage2)")
//                            .resizable()
//                            .renderingMode(.original)
//                            .ignoresSafeArea()
//                    }

                    HStack {
                        Spacer()
                        ZStack{
                            if storyIndex == 0 {
                                Button(action: {
                                    nextButton = true
                                    imageToggle = false
                                    if imageToggle == false {
                                        storyIndex = 1
                                    }
                                }) {
                                    Image(systemName: "arrowshape.right.fill")
                                        .resizable()
                                        .frame(width: 30, height: 40)
                                }
                                .padding(10)
                                .foregroundColor(.black)
                            }else if storyIndex == 1{
                                Button(action: {
                                    nextButton = true
                                    imageToggle = false
                                    if imageToggle == false {
                                        storyIndex = 2
                                    }
                                }) {
                                    Image(systemName: "arrowshape.right.fill")
                                        .resizable()
                                        .frame(width: 30, height: 40)
                                }
                                .padding(10)
                                .foregroundColor(.black)
                            }else {
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
            } else {
                SpriteView(scene: scene)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
            }
        }
    }
//    var scene = GameScene1()
//    @State private var useSpriteView = false
//
//var body: some View {
//    ZStack{
//            if useSpriteView {
//                SpriteView(scene: scene).ignoresSafeArea()
//            } else {
//                Image("jikuStory")
//                    .resizable()
//                    .frame(width: 400, height: 775)
//                    .ignoresSafeArea()
//                HStack{
//                    Spacer()
//                    VStack{
//                        Spacer()
//                        Button(action: {
//                            self.useSpriteView.toggle()
//                        }) {
//                            Image(systemName: "arrowshape.right.fill")
//                                .resizable()
//                                .frame(width: 30, height: 40)
//                        }
//                        Spacer()
//                    }
//                    .padding(10)
//                    .foregroundColor(.black)
//                }
//            }
//        }
//    }
