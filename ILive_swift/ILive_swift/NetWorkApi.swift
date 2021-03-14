//
//  NetWorkApi.swift
//  ILive_swift
//
//  Created by 王朋 on 2021/3/12.
//

import Foundation

class NetworkAPI {
    static func FrontPageList(completion: @escaping (Result<String, Error>) -> Void) {
        NetworkManager.shared.requestGet(path: "?m=vod-type-id-1.html", parameters: nil) { result in
            switch result {
            case let .success(data):
                let parseResult: Result<String, Error> = self.parseData(data)
                completion(parseResult)
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    private static func parseData<T: Decodable>(_ data: Data) -> Result<T, Error> {
        guard let decodedData = String(data:data,encoding:.utf8) else {
            let error = NSError(domain: "NetworkAPIError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Can not parse data"])
            return .failure(error)
        }
        return .success(decodedData as! T)
    }
}

//class NetworkAPI {
//    static func recommendPostList(completion: @escaping (Result<PostList, Error>) -> Void) {
//        NetworkManager.shared.requestGet(path: "PostListData_recommend_1.json", parameters: nil) { result in
//            switch result {
//            case let .success(data):
//                let parseResult: Result<PostList, Error> = self.parseData(data)
//                completion(parseResult)
//            case let .failure(error):
//                completion(.failure(error))
//            }
//        }
//    }
//    
//    static func hotPostList(completion: @escaping (Result<PostList, Error>) -> Void) {
//        NetworkManager.shared.requestGet(path: "PostListData_hot_1.json", parameters: nil) { result in
//            switch result {
//            case let .success(data):
//                let parseResult: Result<PostList, Error> = self.parseData(data)
//                completion(parseResult)
//            case let .failure(error):
//                completion(.failure(error))
//            }
//        }
//    }
//    
//    static func createPost(text: String, completion: @escaping (Result<Post, Error>) -> Void) {
//        NetworkManager.shared.requestPost(path: "createpost", parameters: ["text": text]) { result in
//            switch result {
//            case let .success(data):
//                let parseResult: Result<Post, Error> = self.parseData(data)
//                completion(parseResult)
//            case let .failure(error):
//                completion(.failure(error))
//            }
//        }
//    }
//    
//    private static func parseData<T: Decodable>(_ data: Data) -> Result<T, Error> {
//        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
//            let error = NSError(domain: "NetworkAPIError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Can not parse data"])
//            return .failure(error)
//        }
//        return .success(decodedData)
//    }
//}
