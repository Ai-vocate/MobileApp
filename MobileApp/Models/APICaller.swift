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
    
    //Mo: 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
    //Steffi: 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
    
    
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
