//
//  MockCenter.swift
//  galpi
//
//  Created by minsson on 2023/02/01.
//

import Foundation

var dummyGalpis: [Galpi] {
    let dummyGalpis = [
        Galpi(title: "첫 번째 책 제목", image: "test-bookcover", date: Date.now, author: "저자명", publisher: "출판사명", quotes: "첫 번째 갈피의 인용구로, 여러 줄이 될 수 있습니다.", opinion: "첫 번째 갈피에 대한 의견을 정리합니다. 여러 줄이 될 수 있습니다."),
        Galpi(title: "두 번째 책 제목", image: "test-bookcover2", date: Date.now, author: "저자명2", publisher: "출판사명", quotes: "두 번째 갈피의 인용구로, 여러 줄이 될 수 있습니다.", opinion: "두 번째 갈피에 대한 의견을 정리합니다. 여러 줄이 될 수 있습니다."),
        Galpi(title: "세 번째 책 제목", image: "test-bookcover3", date: Date.now, author: "저자명3", publisher: "출판사명", quotes: "세 번째 갈피의 인용구로, 여러 줄이 될 수 있습니다.", opinion: "세 번째 갈피에 대한 의견을 정리합니다. 여러 줄이 될 수 있습니다."),
        Galpi(title: "네 번째 책 제목", image: "test-bookcover4", date: Date.now, author: "저자명4", publisher: "출판사명", quotes: "네 번째 갈피의 인용구로, 여러 줄이 될 수 있습니다.", opinion: "네 번째 갈피에 대한 의견을 정리합니다. 여러 줄이 될 수 있습니다."),
        Galpi(title: "다섯 번째 책 제목", image: "test-bookcover5", date: Date.now, author: "저자명4", publisher: "출판사명", quotes: "네 번째 갈피의 인용구로, 여러 줄이 될 수 있습니다.", opinion: "네 번째 갈피에 대한 의견을 정리합니다. 여러 줄이 될 수 있습니다.")
    ]
    
    return dummyGalpis
}
