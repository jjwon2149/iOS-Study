//
//  ContentView.swift
//  MemoWithBae
//
//  Created by 정종원 on 4/23/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var showSheet = false
    
    @Query var memos: [Memo]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List (memos) { memo in
                //list item
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(memo.text)")
                            .font(.title)
                        Text("\(memo.createdString)")
                            .font(.body)
                            .padding(.top)
                    }
                    Spacer()
                }
                .padding()
                .foregroundStyle(.white)
                .background(memo.color)
                .shadow(radius: 3)
                .padding()
                .contextMenu {
                    //longpress 했을때 공유 기능
                    ShareLink(item: memo.text)
                    
                    //longpress 했을때 삭제
                    Button {
//                        memoStore.removeMemo(memo)
                        modelContext.delete(memo)
                    } label: {
                        Image(systemName: "trash")
                        Text("삭제")
                    }
                } //contextMenu
            }
            .listStyle(.plain)
            .navigationTitle("Mememo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        //TODO: 메모 추가 엑션
                        showSheet = true
                    } label: {
                        Text("추가")
                    }
                }
            }// toolbar
            .sheet(isPresented: $showSheet) {
                //content
                MemoAddView(showSheet: $showSheet)
            }// sheet
        }// NavigationStack
    }

}

struct MemoAddView: View {
    
    @Environment(\.modelContext) var modelContext

    @State var memoColor: Color = .blue
    @State var memoText: String = ""
    
    @Binding var showSheet: Bool
    
    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo]
    
    var body: some View {
        VStack {
            HStack {
                //HIG 왼쪽이 취소 오른쪽이 완료
                Spacer()
                Button {
                    showSheet = false
                } label: {
                    Text("취소")
                }
                Spacer()
                Button {
                    //Add Memo
                    addMemo(memoText, color: memoColor)
                    showSheet = false
                } label: {
                    Text("완료")
                }
                .disabled(memoText.isEmpty) //특정 기능이 완료됐을때 false로 버튼 활성화 (메모 입력 했을때)
                Spacer()
            }// HStack
            .padding()
            
            HStack {
                ForEach(colors, id: \.self) { color in
                    Button {
                        //TODO: Color select
                        memoColor = color
                    } label: {
                        HStack {
                            Spacer()
                            //컬러 선택시
                            if color == memoColor {
                                Image(systemName: "checkmark.circke")
                            }
                            Spacer()
                        } // HStack
                        .frame(height: 50)
                        .background(color)
                        .foregroundStyle(.white)
                        .shadow(radius: color == memoColor ? 8 : 0 )
                        
                    } // Button
                    
                } // ForEach
                
            } // HStack
            .padding()
            
            Divider()
                .padding()
            
            TextField("메모를 입력하세요", text: $memoText, axis: .vertical)
                .padding()
                .foregroundStyle(.white)
                .background(memoColor)
                .shadow(radius: 3)
        } // VStack
        .padding()
        
        Spacer()
    }
    
    func addMemo(_ text: String, color: Color) {
        let memo = Memo(text: text, color: color, created: Date())
        modelContext.insert(memo)
    }
}

#Preview {
//    MemoAddView(showSheet: .constant(true))
    ContentView()
        .modelContainer(for: Memo.self)
}
