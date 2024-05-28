//
//  CallManager.swift
//  FakeFacetime
//
//  Created by Nhấc tay khỏi Mac của tao on 21/5/24.
//

import Foundation
import StreamVideo
import StreamVideoUIKit
import StreamVideoSwiftUI

class CallManager {
    
    static let shared = CallManager()
    
    struct Constants {
        static let keyAPI = "e8busj37dv6a"
        static let userToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiSmFyYWVsIiwiaXNzIjoiaHR0cHM6Ly9wcm9udG8uZ2V0c3RyZWFtLmlvIiwic3ViIjoidXNlci9KYXJhZWwiLCJpYXQiOjE3MTYyNjExMjUsImV4cCI6MTcxNjg2NTkzMH0.RR1_SM-XPVtbOAdSEZCuV-UPDROfesxQVt7_zu6FZ6A"
    }
    
    private var video: StreamVideo?
    private var videoUI: StreamVideoUI?
    public var callViewModel: CallViewModel?
    
    
    struct UserCredentials {
        let user: User
        let token: UserToken
    }
    
    func setup(email: String) {
        setupCallViewModel()
        let emailString = email.replacingOccurrences(of: "@", with: "_").replacingOccurrences(of: ".", with: "_")
        let credential = UserCredentials(user: .guest(emailString),
                                         token: UserToken(rawValue: Constants.userToken))
        
        let videoStream = StreamVideo(apiKey: Constants.keyAPI,
                                      user: credential.user,
                                      token: credential.token) { result in
            result(.success(credential.token))
        }
        
        let videoUI = StreamVideoUI(streamVideo: videoStream)
    
        self.video = videoStream
        self.videoUI = videoUI
        
    }
    
    func createCall() {
    }
    
    func acceptCall() {
        
    }
    
    private func setupCallViewModel() {
        guard callViewModel == nil else {
            return
        }
        DispatchQueue.main.async {
            self.callViewModel = CallViewModel()
        }
    }
}
