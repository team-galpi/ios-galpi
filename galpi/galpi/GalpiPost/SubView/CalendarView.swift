//
//  SwiftUIView.swift
//  galpi
//
//  Created by Ellen J on 2023/02/06.
//

import SwiftUI

struct CalendarView: View {
    
    @Binding var date: Date
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Button {
                isPresented.toggle()
            } label: {
                Rectangle()
                    .foregroundColor(Color(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)))
                    .ignoresSafeArea()
            }

            RoundedRectangle(cornerRadius: 15)
                .frame(width: AppConstraints.width + 10, height: AppConstraints.width + 10)
                .foregroundColor(.white)
            
            DatePicker("", selection: $date, displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .tint(Color(UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)))
                .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
                .backgroundStyle(.white)
        }
        Spacer()
    }
    
}
