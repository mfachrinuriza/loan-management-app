//
//  LoanService.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import RxSwift
import Alamofire

public protocol LoanServiceProtocol {
    func requestLoanList() -> Observable<[LoanData]>
//    func requestLoanDetail(id: Int) -> Observable<LoanData>
}

public class LoanService: BaseService {
    public static let sharedInstance = LoanService()
}

extension LoanService: LoanServiceProtocol {
    public func requestLoanList() -> Observable<[LoanData]> {
        return Observable.create { observer in
            let url = self.HOST_URL + API.loanList
            
            AF.request(
                url,
                method: .get,
                headers: self.getHeaders()
            ).responseDecodable(of: [LoanData].self) { response in
                self.showResponseData(data: response.data)
                switch response.result {
                case .success(let result):
                    observer.onNext(result)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }

//    public func requestLoanDetail(id: Int) -> Observable<LoanData> {
//        return Observable.create { observer in
//            var url = self.HOST_URL + API.getGames
//            url.append("/\(id)")
//
//            let queryParams = [
//                "key": self.API_KEY
//            ] as [String : Any]
//
//            AF.request(
//                url,
//                method: .get,
//                parameters: queryParams,
//                encoding: URLEncoding.default,
//                headers: self.getHeaders()
//            ).responseDecodable(of: GameData.self) { response in
//                self.showResponseData(data: response.data)
//                switch response.result {
//                case .success(let result):
//                    observer.onNext(result)
//                    observer.onCompleted()
//                case .failure(let error):
//                    observer.onError(error)
//                }
//            }
//
//            return Disposables.create()
//        }
//    }
}
