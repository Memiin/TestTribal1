import Foundation

final class ApiChuck{
    
    
    func getChuck(onCompletion: @escaping (Result<ChuckModel, Error>) -> Void) async {
        do{
            try await ApiService.shared.get(completion: onCompletion)
        }
        catch {}
    }
    
}
