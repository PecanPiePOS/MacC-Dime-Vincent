//
//  Mocks.swift
//  Vincent
//
//  Created by COBY_PRO on 2022/10/09.
//

import Foundation

func getChannelMocks() -> [Channel] {
    return (0...3).map { Channel(id: String($0), name: "채팅방 " + String($0)) }
}

func getMessagesMock() -> [Message] {
    return (0...3).map { Message(content: "message content \($0)") }
}
