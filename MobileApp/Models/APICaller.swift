//
//  APICaller.swift
//  MobileApp
//
//  Created by Mo Aljuboori on 6/8/23.
//
import OpenAISwift
import Foundation


final class APICaller: ObservableObject {
    init() {}
    private let API_KEY = "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"
    private var client: OpenAISwift?
    
    
    
    func setup() {
        self.client = OpenAISwift(authToken: API_KEY) // Instantiate Client
    }
    
    func send(text: String,
              completion: @escaping (String) -> Void) {
        client?.sendCompletion(with: text,
                               maxTokens: 500,
                               completionHandler: { result in
            switch result {
                case .success(let model):
                    let output = model.choices?.first?.text ?? ""
//                let output = model.choices?.first?.text
                    completion(output)
                    print("Output is: " + output)
    //                print(text)
                    
                case .failure:
                    print("Error")
                    break // TODO: handle error
            }
        })
        
    }
}
