import Foundation

struct ChuckModel: Decodable {
        var icon_url: String
        var id: String
        var value: String
    
    static func getChuck(onCompletion: @escaping (Result<ChuckModel, Error>) -> Void)  {
           
           _ = Task.detached {
               await ApiService.shared.chuck.getChuck() { result in
                   switch result {
                   
                   case let .success(chuckModel):
                       onCompletion(.success(chuckModel))
                       
                   case let .failure(error):
                       onCompletion(.failure(error))
                   }
               }
           }
       }
    
}
