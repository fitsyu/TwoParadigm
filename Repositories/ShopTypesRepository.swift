
import Promises

class ShopTypesRepository: Repository {
    typealias T = ShopType
    
    private var memory: [ShopType] = []
    
    /**
     fetch first from memory if fails then
     it will try to fetch from Data.plist file
     */
    func fetch() -> Promise<[ShopType]> {
        
        let promise: Promise<[ShopType]> = Promise {
            resolve, reject in
            
            if self.memory.isEmpty {
                
                // load from disk
                guard let plist = Bundle.main.url(forResource: "Data", withExtension: "plist") else {
                    let hint = "failed to open Data.plist"
                    reject(RepositoryError.Unknown(hint: hint))
                    return
                }
                
                guard let dict  = NSDictionary(contentsOf: plist) else {
                    let hint = "failed to load from \(plist)"
                    reject(RepositoryError.Unknown(hint: hint))
                    return
                }
                
                guard let objs = dict.object(forKey: "ShopTypes") as? [String] else {
                    let hint = "failed to load ShopTypes array"
                    reject(RepositoryError.Unknown(hint: hint))
                    return
                }
                
                
                // encoded. hehe manually
                let shopTypes = objs.map { ShopType(name: $0) }
                
                // cache to memory
                self.memory = shopTypes
                
                // done
                resolve(shopTypes)
                
            } else {
                
                // done
                resolve(self.memory)
            }
            
        }
        
        
        return promise
    }
    
    private init() {}
    private static var _instance: ShopTypesRepository!
    public static var shared: ShopTypesRepository {
        if _instance == nil { _instance = ShopTypesRepository() }
        return _instance
    }
}

