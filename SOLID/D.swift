/// **Dependency Inversion Principle - принцип инверсии зависимостей
/* Модули верхний уровней не должны зависеть от модулей нижних уровней.
Оба типа модулей должны зависеть от абстракций.
Абстракции не должны зависеть от деталей, детали должны зависеть от абстракций. */

import Foundation

protocol FileProtocol {
    var name: String { get set }
}

struct File: FileProtocol {
    var name: String
}

protocol Storage {
    func save(_ file: FileProtocol)
}

final class LocalStorage: Storage {
    func save(_ file: FileProtocol) {
        // Связываемся с локальной бд
        // сохраняем файл
    }
}

final class CloudStorage: Storage {
    func save(_ file: FileProtocol) {
        // Связываемся с облачной бд
        // сохраняем файл
    }
}

final class StorageHandler {
    
    // MARK: - Private properties
    private let storage: Storage
    
    // MARK: - Init
    init(storage: Storage) {
        self.storage = storage
    }
    
    // MARK: - Public methods
    func handle(_ file: FileProtocol) {
        storage.save(file)
    }
}

func saveSomeFile() {
    let file: FileProtocol = File(name: "file")
    let localStorage: Storage = LocalStorage()
    let handler = StorageHandler(storage: localStorage)
    handler.handle(file)
}
