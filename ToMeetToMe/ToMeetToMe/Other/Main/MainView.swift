//
//  MainView.swift
//  ToMeetToMe
//
//  Created by 조유진 on 2023/10/11.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(spacing: 2){
            FriendGridView()
            CalendarView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}