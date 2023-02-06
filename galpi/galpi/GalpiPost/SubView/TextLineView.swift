//
//  TextLineView.swift
//  galpi
//
//  Created by Ellen J on 2023/01/31.
//

import SwiftUI

struct TextLineView: View {
    var body: some View {
        VStack(alignment: .center) {
            Rectangle()
                .frame(width: AppConstraints.width, height: 1, alignment: .center)
                .foregroundColor(Color(UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)))
            Spacer(minLength: 40)
            Rectangle()
                .frame(width: AppConstraints.width, height: 1, alignment: .center)
                .foregroundColor(Color(UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)))
            Spacer(minLength: 40)
            Rectangle()
                .frame(width: AppConstraints.width, height: 1, alignment: .center)
                .foregroundColor(Color(UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)))
            Spacer(minLength: 40)
            Rectangle()
                .frame(width: AppConstraints.width, height: 1, alignment: .center)
                .foregroundColor(Color(UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)))
        }
    }
}
