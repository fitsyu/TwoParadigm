
protocol Story {
    func begin()
}

protocol StoryDelegate {
    func end()
}


//
//// Data
//struct Product {
//    let name: String
//    let price: Int
//}
//
//struct SearchInquiry {
//    let term: String
//}
//
//struct Criteria {
//    let minimumPrice: Int
//    let maximumPrice: Int
//    let isWholeSaled: Bool
//    let shopTypes: [String]
//}
//
//
//
//func VIEW(products: [Product]) {
//    
//    // oop can play here
//    
//    let productViewer: ProductViewer = DefaultProductViewer()
//    productViewer.data = products
//    productViewer.view()
//}
//
//
//protocol ProductViewer {
//    var data: [Product] { get set }
//    func view()
//}
//
//
//class DefaultProductViewer: ProductViewer {
//    
//    var data: [Product] = []
//    
//    public func view() {
//        
//        print("the products:")
//        
//        for product in data {
//            print(" -", product)
//        }
//        
//        print("---")
//    }
//}
//
//
//
//func SEARCH(for inquiry: SearchInquiry) -> [Product]{
//    
//}
