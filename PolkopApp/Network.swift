//
//  Network.swift
//
//  Created by Maciej Matuszewski on 13.09.2016.
//  Copyright © 2016 Codeaddict. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import KeychainAccess
import Firebase

// Networking

enum Network {
    case Login(email: String, password: String)
    case LoginFacebook(facebookToken: String)
    case LoginGoogle(accessToken: String, tokenType: String, expiresIn: Int, idToken: String, created: Int)
    case Register(email: String, userName: String, password: String)
    case ResetPassword(email: String)
    case GetMe()
    
    //MARK:- Private
    private var method: HTTPMethod{
        
        switch self {
        case .Login, .Register, .ResetPassword, .LoginFacebook, .LoginGoogle:
            return HTTPMethod.post
            
        case .GetMe:
            return HTTPMethod.get
            
//        case :
//            return HTTPMethod.delete
//        
//        case :
//            return HTTPMethod.put
        }
    }
    
    var url: String {
        return Constants.kServerURL + self.urlEnd
        
    }
    
    private var headers: HTTPHeaders{
        return [
            "Authorization": Configuration.getAuthorization() ?? "",
            "Accept": "application/json",
            "Accept-Language": "en".localized
        ]
    }
    
    private var urlEnd: String {
        switch self {
        case .Login: return "me/login"
        case .Register: return "me/register"
        case .ResetPassword: return "me/password/reset"
        case .GetMe: return "me"
        case .LoginFacebook: return "me/login/facebook"
        case .LoginGoogle: return "me/login/google"
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .GetMe:
            return [:]
        case .Login(let email, let password):
            return [
                "email": email,
                "password": password
            ]
        case .Register(let email, let userName, let password):
            return [
                "email": email,
                "password": password,
                "nick": userName
            ]
        case .ResetPassword(let email):
            return [
                "email": email
            ]
        case .LoginFacebook(let facebookToken):
            return [
                "token_facebook" : facebookToken,
                "token_firebase": InstanceID.instanceID().token() ?? "noToken"
            ]
        case .LoginGoogle(let accessToken, let tokenType, let expiresIn, let idToken, let created):
            return [
                "access_token": accessToken,
                "token_type": tokenType,
                "expires_in": expiresIn,
                "id_token": idToken,
                "created": created,
                "token_firebase": InstanceID.instanceID().token() ?? "noToken"
            ]
        }
    }
	
    //MARK:- public
	
    public func request(successCompletion: @escaping ([String: AnyObject]) -> Void, errorCompletion: ((String) -> Void)?) {
        "***START***\nRequest for JSON: \nurl:\(self.url)\nmethod:\(self.method)\nparameters:\(self.parameters)\n***END***".log()
        
        Alamofire
            .request(
                self.url,
                method: self.method,
                parameters: self.parameters,
                headers: self.headers)
            .validate()
            .responseJSON {
                (response) in
                print(response.debugDescription)
                switch response.result {
                case .success:
                    successCompletion(response.result.value as? [String: AnyObject] ?? [:])
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    guard let function = errorCompletion
                        else{
                            return
                    }
                    function(ErrorHandler.handleError(code: (error as? AFError)?.responseCode ?? 0))
                }
        }
    }
    
    func responseModel<T:Mappable>(successCompletion: @escaping (T) -> Void, errorCompletion: ((String) -> Void)?) {
        "***START***\nRequest for Model: \nurl:\(self.url)\nmethod:\(self.method)\nparameters:\(self.parameters)\n***END***".log()
        Alamofire
            .request(
                self.url,
                method: self.method,
                parameters: self.parameters,
                headers: self.headers)
            .validate()
            .responseObject {
                (response: DataResponse<T>) in
                switch response.result {
                case .success:
                    
                    guard let model = response.result.value else{
                        guard let function = errorCompletion
                            else{
                                return
                        }
                        function(ErrorHandler.handleError(code: 900))
                        return
                    }
                    
                    successCompletion(model)
                    
                case .failure(let error):
                    guard let function = errorCompletion
                        else{
                            return
                    }
                    function(ErrorHandler.handleError(code: (error as? AFError)?.responseCode ?? 0))
                }
        }
    }
    
    func responseModelArray<T:Mappable>(successCompletion: @escaping ([T]) -> Void, errorCompletion: ((String) -> Void)?) {
        
        "***START***\nRequest for Model Array: \nurl:\(self.url)\nmethod:\(self.method)\nparameters:\(self.parameters)\n***END***".log()
                
        Alamofire
            .request(
                self.url,
                method: self.method,
                parameters: self.parameters,
                headers: self.headers)
            .validate()
            .responseArray {
                (response: DataResponse<[T]>) in
                switch response.result {
                case .success:
                    
                    guard let model = response.result.value else{
                        guard let function = errorCompletion
                            else{
                                return
                        }
                        function(ErrorHandler.handleError(code: 900))
                        return
                    }
                    
                    successCompletion(model)
                    
                case .failure(let error):
                    guard let function = errorCompletion
                        else{
                            return
                    }
                    function(ErrorHandler.handleError(code: (error as? AFError)?.responseCode ?? 0))
                }
        }
    }
}
