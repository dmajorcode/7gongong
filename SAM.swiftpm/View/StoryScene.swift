//
//  SwiftUIView.swift
//  
//
//  Created by 077tech on 2023/03/28.
//

import SwiftUI

struct StoryScene: View {
    let pageDataManager = PageDataManager()
    @State var pageIndex = 0
    
    var body: some View {
        VStack {
            StoryScenePage(pageData: pageDataManager.pages[pageIndex], buttonActionPrev: {prevPage()},
                buttonActionNext: {nextPage()})
            Spacer()
        }
    }
    
    func prevPage() {
        if pageIndex >= 1 {
            pageIndex -= 1
        }
    }
    
    func nextPage() {
        if pageIndex < pageDataManager.pages.count - 1 {
            pageIndex += 1
        }
    }
}

struct StoryScene_Previews: PreviewProvider {
    static var previews: some View {
        StoryScene()
    }
}
