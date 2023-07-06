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
                               maxTokens: 250,
                               completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices?.first?.text ?? ""
                completion(output)
                
            case .failure:
                print("Error")
                break // TODO: handle error
            }
        })
        
    }
}
