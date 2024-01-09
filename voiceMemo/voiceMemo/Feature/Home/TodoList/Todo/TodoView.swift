//
//  TodoView.swift
//  voiceMemo
//

import SwiftUI

struct TodoView: View {
    @EnvironmentObject private var pathModel: PathModel
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    @StateObject private var todoViewModel = TodoViewModel()
    
    var body: some View {
        VStack {
            CustomNavigationBar(
                leftBtnAction: {
                    pathModel.paths.removeLast()
                },
                rightBtnAction: {
                    todoListViewModel.addTodo(
                        .init(
                            title: todoViewModel.title,
                            time: todoViewModel.time,
                            day: todoViewModel.day,
                            selected: false
                        )
                    )
                    pathModel.paths.removeLast()
                }
                rightBtntype: .create
            )
            
            
            // 타이틀 뷰
            
            // 투투 타이블 뷰 (텍스트 필드)
            
            // 시간 선택
            
            // 날짜 선택
        }
    }
}

// MARK: - 타이틀 뷰
private struct TitleView: View {
    fileprivate var body: some View {
        HStack {
            Text("To do list\n추가해 보세요.")
            
            Spacer()
        }
        .font(.system(size: 30, weight: .bold))
        .padding(.leading, 20)
    }
}

// MARK: - 투두 타이블 뷰 (제목 입력 뷰)
private struct TodoTitleView: View {
    @ObservableObject private var todoViewModel: TodoViewModel
    
    
}



struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
