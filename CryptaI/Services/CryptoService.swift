//
//  CryptoService.swift
//  CryptaI
//
//  Created by FFK on 4.05.2024.
//

import Foundation
import Alamofire

final class CryptoService {
    
    static let shared = CryptoService()
    
    func fetchCryptoData(completion: @escaping (Result<CryptoModel, Error>) -> Void) {
        AF.request("https://psp-merchantpanel-service-sandbox.ozanodeme.com.tr/api/v1/dummy/coins").responseDecodable(of: CryptoModel.self) { response in
            switch response.result {
            case .success(let cryptoModel):
                completion(.success(cryptoModel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
