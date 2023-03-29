//
//  SwiftUIView.swift
//  SAM
//
//  Created by 077tech on 2023/03/28.
//

import SwiftUI

struct PageData {
    let title: String
    let imageName: String
    let body: String
    let buttonText_prev: String
    let buttonText_next: String
}

struct StoryScenePage: View {
    let pageData: PageData
    let buttonActionPrev: () -> Void
    let buttonActionNext: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text(pageData.title)
                .font(.title)
                .bold()
            
            // 이미지
            VStack {
                Image(pageData.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(height: 300)
            .padding(.horizontal)
            
            // 스토리 
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.mint)
                Text(pageData.body)
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
            .frame(height: 300)
            .padding(.horizontal)
            
            // 버튼
            HStack (alignment: .center) {
                Button(action: buttonActionPrev) {
                    Text(pageData.buttonText_prev)
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                
                Button(action: buttonActionNext) {
                    Text(pageData.buttonText_next)
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                
            }.padding(.horizontal)
        }
    }
}

class PageDataManager {
    let pages = [
        PageData(
            title: "Page 1",
            imageName: "click",
            body: "오래 전부터 아이-폰에 safe area라는 것이 전해져내려오고 있었다.",
            buttonText_prev: "Prev",
            buttonText_next: "Next"
        ),
        PageData(
            title: "Page 2",
            imageName: "click",
            body: "먼 옛날 MK, Diane, Malty, Chad, Pepe, Daaan으로 이루어진 탐험대 700은 safe area, 즉 안전 지대를 넓히기 위한 긴 모험을 떠났습니다.그들은 몇 주 동안 계획을 세워 들뜬 마음으로 길을 나섰습니다.",
            buttonText_prev: "Prev",
            buttonText_next: "Next"
        ),
        PageData(
            title: "Page 3",
            imageName: "click",
            body: "신나게 길을 나선 그들은 어느날 요정 Jiku를 만납니다.\n마음씨 착하고 친절한 요정 Jiku는 탐험대가 잘못된 방향으로 가고 있다고 귀띔해주었습니다.\n탐험대는 왔던 길을 되돌아가야함에 잠시 좌절했지만, 이내 마음을 가다듬고 올바른 길을 향해 모험을 다시 시작했습니다.",
            buttonText_prev: "Prev",
            buttonText_next: "Next"
        ),
        PageData(
            title: "Page 4",
            imageName: "click",
            body: "그렇게 며칠간 산을 오르내리던 어느 날, Chad와 Malty는 불길한 기운을 느꼈습니다.\n조심한다고 노력하였으나 결국 역병에 걸리고 만 것이었습니다.\n탐험대는 Chad와 Malty를 정성으로 보살폈고 1주일 뒤 그들은 건강을 되찾을 수 있었습니다.",
            buttonText_prev: "Prev",
            buttonText_next: "Next"
        ),
        PageData(
            title: "Page 5",
            imageName: "click",
            body: "탐험대 700이 한창 안전 지대를 넓혀나가던 중, Daaan이 군대로부터 긴급한 전갈을 받았습니다.\n마을을 지키기 위해 잠시 고향으로 돌아가야했던 것입니다.\n떠나는 Daaan을 바라보며 그들은 슬픈 마음을 감출 수 없었으나,\n며칠 뒤 건강하게 돌아온 Daaan을 보며 다시 함께할 수 있음에 감사했습니다.",
            buttonText_prev: "Prev",
            buttonText_next: "Next"
        ),
        PageData(
            title: "Page 6",
            imageName: "click",
            body: "최종 목적지를 며칠 앞둔 어느 날 밤이었습니다.\n탐험대 700은 모닥불 주위에 둘러앉아 지난 여정을 돌아보며 진솔한 이야기를 나누었습니다.\n그들은 안전하게 여정이 마무리되어감을 감사하며 그동안의 느낌을 공유했습니다.\n(마음씨 여린 Chad는 훌쩍훌쩍 눈물을 흘리기도 했습니다.)\n저마다 자신의 생각을 솔직하게 나누었고, 그들의 사이는 한층 더 돈독해졌습니다.",
            buttonText_prev: "Prev",
            buttonText_next: "Next"
        ),
        PageData(
            title: "Page 7",
            imageName: "click",
            body: "탐험대 700은 마침내 목적지에 도착했습니다.\n그들은 서로를 믿고 의지한 덕에 지난날의 모험들을 안전하게 헤쳐나갈 수 있었음에 감사했습니다.\n넘어져도 자신을 일으켜줄 든든한 팀원이 있기에 그들은 새로운 길을 나설 용기를 얻을 수 있었고, 돌아보니 그들의 안전 지대도 모험 전보다 한층 더 넓어져있었습니다.",
            buttonText_prev: "Prev",
            buttonText_next: "Finish"
        ),
    ]
}

