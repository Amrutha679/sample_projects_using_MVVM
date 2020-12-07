//
//  Authentication.swift
//  sample_MVVM
//
//  Created by amrutha on 07/12/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import Foundation

class AuthenticationVM: NSObject {
    
    var user: User!
    
    typealias loginCallBack = (_ status:Bool, _ message:String) -> Void
    var callBack : loginCallBack?
    
    func authenticateUserWith(_ username:String, _ password:String) {
        
        if username.count != 0 {
            if password.count != 0 {
                verifyUserWith(username,password)
            } else {
                self.callBack?(false,"pwd should not be empty")
            }
        } else {
            self.callBack?(false,"username should not be empty")
        }
    }
    
    fileprivate func verifyUserWith(_ username:String, _ password:String) {
        
        if username == "test" && password == "123456"{
            _ = User(username:username,email:"\(username)@testmail.com")
        } else {
            self.callBack?(false,"enter valid credentials")
        }
    }
    
    func loginCompletionHandler(callback : @escaping loginCallBack) {
        
        self.callBack = callback
    }
}
