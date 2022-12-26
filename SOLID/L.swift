/// **Liskov Substitution Principle - принцип подстановки Барбары Лисков
/* говорит о том, что объекты могут заменяться на экземпляры их подтипов,
сохраняя работоспособность программы. */

import Foundation

protocol AnimalProtocol {
    var name: String { get set }
    func makeSound()
}

// MARK: - Animal -

class Animal: AnimalProtocol {
    
    // MARK: - Private properties
    var name: String = ""
    
    // MARK: - Public methods
    func makeSound() {
        getScared()
    }
    
    // MARK: - Private methods
    private func getScared() {
        print("\(name) was scared")
    }
}

// MARK: - Cat -

final class Cat: Animal {
    
    // MARK: - Override properties
    override var name: String {
        get {
            return "Cat"
        }
        set {
            super.name = newValue
        }
    }
    
    // MARK: - Override methods
    override func makeSound() {
        super.makeSound()
        print("Mew")
    }
}

// MARK: - Dog -

final class Dog: Animal {
    
    // MARK: - Override properties
    override var name: String {
        get {
            return "Dog"
        }
        set {
            super.name = newValue
        }
    }
    
    // MARK: - Override methods
    override func makeSound() {
        super.makeSound()
        print("Gaw")
    }
}

func makeSounds() {
    let animals: [Animal] = [Cat(), Dog()]
    animals.forEach {
        $0.makeSound()
    }
}
