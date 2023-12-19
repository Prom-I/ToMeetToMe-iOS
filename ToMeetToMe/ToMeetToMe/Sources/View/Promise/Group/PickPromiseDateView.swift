//
//  PickDateView.swift
//  ToMeetToMe
//
//  Created by 이자민 on 2023/11/05.
//

import SwiftUI

struct PickPromiseDateView: View {
    @State private var date = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(hour: 22, minute: 59, second: 59)
        let endComponents = DateComponents(hour: 23, minute: 00, second: 00)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    @State private var vibrateOnRing = true
    
    var body: some View {
        
        
        NavigationView{
            
            VStack(){
                Text("약속을 생성할 기간을\n선택해주세요 :)")
                    .font(Font.custom("Pretendard", size: 16))
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading) // 좌측 정렬
                
                Spacer()
              
                Toggle("하루종일", isOn: $vibrateOnRing)
                    .toggleStyle(SwitchToggleStyle(tint: Color.primaryColor))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 220))
    
                
                if !vibrateOnRing { // Toggle이 true일 때만 DatePicker를 표시
                                    Text("약속 시간대를 선택해주세요 !")
                                        .font(Font.custom("Pretendard", size: 16))
                                        .foregroundColor(Color.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                                    HStack {
                                        DatePicker("", selection: $date, in: dateRange, displayedComponents: [.hourAndMinute])
                                        DatePicker("", selection: $date, in: dateRange, displayedComponents: [.hourAndMinute])
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 140))
                                        Spacer()
                                    }
                                }
                

                
            }
            .padding(.horizontal, 024)
            .navigationTitle("약속 생성")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Text("확인"))
            
        }
        
    }
    

}
struct PickPromiseDateView_Previews: PreviewProvider {
    static var previews: some View {
        PickPromiseDateView()
    }
}
