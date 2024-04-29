//
//  ContentView.swift
//  SwiftUI_OXQuiz
//
//  Created by 정종원 on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var number1: Int = 4
    @State var number2: Int = 2
    @State var resultNumber: Int = 9
    @State var shownNumber: Int = 9
    @State var resultOperator = ["-", "+", "x"]
    
    @State var countCorrect: Int = 0
    @State var countWrong: Int = 0
    
    var body: some View {
        //UI 구성 및 로직 작성 부분
        VStack {
            
            Text("다음 수식은 맞을까요?")
                .padding(30)
            
            Spacer()
            
            Text("\($number1.wrappedValue) \(resultOperator.first!) \($number2.wrappedValue) = \($shownNumber.wrappedValue)")
                .padding()
            
            Spacer()
            
            HStack {
                Button {
                    selectCorrect()
                } label: {
                    Text("\(Image(systemName: "checkmark.diamond.fill")) 맞음")
                }
                .foregroundStyle(.green)
                .padding()
                                                
                Button {
                    selectWrong()
                } label: {
                    Text("\(Image(systemName: "xmark.diamond")) 틀림")
                }
                .foregroundStyle(.red)
                .padding()
            }
            
            Spacer()
            
            HStack {
                Text("\($countCorrect.wrappedValue)개 맞춤")
                    .padding()
                
                Text("\($countWrong.wrappedValue)개 틀림")
                    .padding()
            }
            
            Spacer()
            
            Button {
                countWrong = 0
                countCorrect = 0
                reloadGame()
            } label: {
                Text("카운트 초기화")
            }
            .padding(50)
           
        }
        .font(.largeTitle)
        .onAppear() {
            reloadGame()
        }
    }
    
    //게임 재시작 로직
    func reloadGame() {
        number1 = Int.random(in: 1...9)
        number2 = Int.random(in: 1...9)
        resultOperator.shuffle()
        
        if Bool.random() {
            switch resultOperator.first! {
            case "-":
                resultNumber = number1 - number2
                shownNumber = resultNumber
                
            case "+":
                resultNumber = number1 + number2
                shownNumber = resultNumber

            case "x":
                resultNumber = number1 * number2
                shownNumber = resultNumber

            default:
                break
            }
        } else {
            switch resultOperator.first! {
            case "-":
                shownNumber = Int.random(in: min(number1, number2)...max(number1, number2))
                resultNumber = number1 - number2
                
            case "+":
                shownNumber = Int.random(in: (number1 + number2 - 10)...(number1 + number2 + 10))
                resultNumber = number1 + number2
                
            case "x":
                shownNumber = Int.random(in: -10...(number1 * number2))
                resultNumber = number1 * number2
                
            default:
                break
            }
        }
        
        
        
    }
    
    //정답 선택시 로직
    func selectCorrect() {
        if shownNumber == resultNumber {
            countCorrect += 1
            reloadGame()
        } else {
            countWrong += 1
            reloadGame()
        }
    }
    
    //오답 선택시 로직
    func selectWrong() {
        if shownNumber != resultNumber {
            countCorrect += 1
            reloadGame()
        } else {
            countWrong += 1
            reloadGame()
        }
    }
}

#Preview {
    ContentView()
}
