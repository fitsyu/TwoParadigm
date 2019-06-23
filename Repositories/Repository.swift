import Promises

protocol Repository {
    associatedtype T
    func fetch() -> Promise<[T]>
}

enum RepositoryError: Error {
    case Unknown(hint: String)
}

