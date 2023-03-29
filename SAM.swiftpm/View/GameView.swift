//
//  SwiftUIView.swift
//  
//
//  Created by kimpepe on 2023/03/29.
//

import SwiftUI

struct GameView: View {
    @State private var isGameOver: Bool = false
    @State private var isStageClear: Bool = false
    
    var body: some View {
        ZStack {
            // Your main game view
            Text("Game View Here")
            
            // Game Over Modal
            if isGameOver {
                gameOverModal
            }
            
            // Stage Clear Modal
            if isStageClear {
                stageClearModal
            }
        }
    }
    
    var gameOverModal: some View {
        VStack {
            Text("Game Over")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button(action: {
                isGameOver = false
            }) {
                Text("Restart")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
    
    var stageClearModal: some View {
        VStack {
            Text("Stage Clear")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button(action: {
                isStageClear = false
                // Move to the next SwiftUI View page
                // You will need to implement the navigation to the next stage
            }) {
                Text("Next Stage")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
    
    func gameOver() {
        isGameOver = true
    }
    
    func stageClear() {
        isStageClear = true
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
