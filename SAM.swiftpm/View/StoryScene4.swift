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
        VStack {
            Button("Next"){
                nextButton = true
            }
            .fullScreenCover(isPresented: $nextButton) {
                StoryScene5()
            }
        }
    }
}
