//
//  KeyboardHelper.swift
//  MadHealth
//
//  Created by Андрэй Целігузаў on 21.11.22.
//

import UIKit

extension KeyboardHelper{
    enum Animation{
        case willShow
        case willHide
    }
    
    typealias HandleBlock = (_ animation : Animation,_ keyboardSize : CGRect, _ duration : TimeInterval)->Void
}

class KeyboardHelper{
    
    private let handleBlock : HandleBlock
    private var animation : Animation = .willHide
    
    init(handleBlock: @escaping HandleBlock) {
        self.handleBlock = handleBlock
        setupNotification()
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    private func setupNotification(){
        let _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main){[weak self] notification in
            self?.animation = .willShow
            self?.handle(notification: notification)
        }
        let _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main){[weak self] notification in
            self?.animation = .willHide
            self?.handle(notification: notification)
        }
    }
    
    
    private func handle(notification : Notification){
        guard let userInfo = notification.userInfo,
              let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
              let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double)
        else{
            return
        }
        handleBlock(self.animation, keyboardSize, duration)
    }
    
}
