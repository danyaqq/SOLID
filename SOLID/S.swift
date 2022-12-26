/// **Single Responsibility Principle - принцип единой ответственности
/* Каждый объект должен иметь одну обязанность и эта обязанность должна быть полностью инкапсулирована в класс.
Все его сервисы должны быть направлены исключительно на обеспечение этой обязанности.
Существует лишь одна причина, приводящая к изменению всего класса.
Один класс решает лишь одну конкретную задачу.
Все свойства и методы данного класса должны служить одной и только одной цели. */

import Foundation

// MARK: - Handler -

protocol HandlerProtocol {
    func handle()
}

final class Handler: HandlerProtocol {
    
    // MARK: - Private properties
    private let networkHandler: NetworkHandlerProtocol
    private let databaseHandler: DatabaseHandlerProtocol
    
    // MARK: - Init
    init(networkHandler: NetworkHandlerProtocol, databaseHandler: DatabaseHandlerProtocol) {
        self.networkHandler = networkHandler
        self.databaseHandler = databaseHandler
    }
    
    // MARK: - Public methods
    func handle() {
        let data = networkHandler.fetchData()
        databaseHandler.save(data)
    }
}

// MARK: - NetworkHandler -

protocol NetworkHandlerProtocol {
    func fetchData() -> Data
}

final class NetworkHandler: NetworkHandlerProtocol {
    
    // MARK: - Public methods
    func fetchData() -> Data {
        // Network request and wait the response
        return Data()
    }
}

// MARK: - DatabaseHandler -

protocol DatabaseHandlerProtocol {
    func save<T>(_ data: T)
}

final class DatabaseHandler: DatabaseHandlerProtocol {
    
    // MARK: - Public methods
    func save<T>(_ data: T) {
        // Save data into database
    }
}

func handle() {
    let networkHandler = NetworkHandler()
    let databaseHandler = DatabaseHandler()
    let handler = Handler(networkHandler: networkHandler, databaseHandler: databaseHandler)
    handler.handle()
}
