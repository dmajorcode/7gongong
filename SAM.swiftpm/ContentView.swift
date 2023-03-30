import SwiftUI
import SpriteKit


struct ContentView: View {

    //왜지워도 나올까??
    init() {
        UITabBar.appearance().backgroundColor = UIColor.clear
    }
    @State var toggleForBookCover : Bool = true
    
    
    var body: some View {
        if toggleForBookCover{
            Image("bookCover")
                .resizable()
                .renderingMode(.original)
                .ignoresSafeArea()
                .onTapGesture {
                    toggleForBookCover.toggle()
                }
        }else{
            TabView() {
                OnBoardingPage()
                    .tabItem({
                        Image(systemName: "1.circle")
                    })
                    .tag(0)
                
                StoryScene1()
                    .tabItem({
                        Image(systemName: "2.circle")
                    })
                    .tag(1)
                
                StoryScene2()
                    .tabItem({
                        Image(systemName: "3.circle")
                    })
                    .tag(2)
                
                StoryScene3()
                    .tabItem({
                        Image(systemName: "4.circle")
                    })
                    .tag(3)
                
                StoryScene4()
                    .tabItem({
                        Image(systemName: "5.circle")
                    })
                    .tag(4)
            }
        }
    }
}
