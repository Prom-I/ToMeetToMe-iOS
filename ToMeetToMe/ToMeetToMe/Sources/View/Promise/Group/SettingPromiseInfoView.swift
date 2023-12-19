//
//  PromiseInfoView.swift
//  ToMeetToMe
//
//  Created by 이자민 on 2023/11/26.
//

import SwiftUI

struct SettingPromiseInfoView: View {
    @State private var selectedDuration: String = ""
    @State private var inputDuration: String = ""
    @State private var selectedWeekdays: [String] = []
    @State private var promisePlace: String = ""
    
    let durations = ["1시간 이내", "1~3 시간", "3~6 시간"]
    let weekdays = ["월", "화", "수", "목", "금", "토", "일"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("약속 소요시간을 \n선택해주세요 :)")
                .padding(.top, 33)
            
            HStack() {
                ForEach(durations, id: \.self) { duration in
                    Button(action: {
                        print("\(duration) 선택")
                        selectedDuration = duration
                    }, label: {
                        Text(duration)
                            .fontWeight(.semibold)
                            .font(Font.system(size: 14))
                            .foregroundColor(selectedDuration == duration ? .white : .black)
                            .frame(width: 82, height: 60) // 버튼의 가로, 세로 크기 지정
                            .background(selectedDuration == duration ? Color.mint : Color.lightGray)
                            .cornerRadius(8)
                        
                    })
                    
                }
                TextField(
                    "직접입력",
                    text: $inputDuration
                    
                )
                .padding()
                .frame(width: 82, height: 60)
                .multilineTextAlignment(.center)
                .font(Font.system(size: 14))
                .onTapGesture {
                    selectedDuration = inputDuration // 텍스트 필드를 탭하면 선택된 버튼을 취소
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
            
            Text("선호 요일을 \n선택해주세요 :)")
                .padding(.top, 52)
            
            HStack() {
                ForEach(weekdays, id: \.self) { day in
                    Button(action: {
                        print("\(day) 선택")
                        
                        if selectedWeekdays.contains(day) {
                            selectedWeekdays.removeAll { $0 == day }
                        } else {
                            selectedWeekdays.append(day)
                        }
                        print("\(selectedWeekdays)")
                    }, label: {
                        Text(day)
                            .fontWeight(.semibold)
                            .foregroundColor(selectedWeekdays.contains(day) ? .white : .black)
                            .frame(width: 42, height: 54) // 버튼의 가로, 세로 크기 지정
                            .background(selectedWeekdays.contains(day) ? Color.mint : Color.lightGray)
                            .cornerRadius(8)
                        
                    })
                    
                }
            }
            Text("약속 장소를\n적어주세요 :)")
                .padding(.top, 52)
            
            TextField(
                "구체적인 약속장소를 입력해주세요.",
                text: $promisePlace
                
            )
            .padding()
            .font(Font.system(size: 14))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            
            Spacer()
        }
        .padding(.horizontal, 24)
        
    }
    
}


struct SettingPromiseInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SettingPromiseInfoView()
    }
}
