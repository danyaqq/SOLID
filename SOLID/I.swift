/// **Interface Segregation Principle - принцип разделения интерфейсов
/* говорит о том, что слишком «толстые» интерфейсы
необходимо разделять на меньшие и специфические,
чтобы программные сущности меньших интерфейсов знали только о методах,
которые необходимы им в работе. */
/// Простыми словами: принцип разделения интерфейсов говорит о том, что необходимо
/// разделять ваши интерфейсы, так как не все свойства и методы могут понадобиться
/// определенным сущностям, подписанным на этот протокол

import Foundation

protocol ElectronicEquipment {
    func turnOn()
    func turnOff()
}

protocol Phone: ElectronicEquipment {
    func call()
}

protocol Radio: ElectronicEquipment {
    func startPlay()
    func stopPlay()
}

final class SmartPhone: Phone {
    func call() {
        // Звонит
    }
    
    func turnOn() {
        // Включает телефон
    }
    
    func turnOff() {
        // Выключает телефон
    }
}

final class InternetRadio: Radio {
    func startPlay() {
        // Начинает проигрывать радио
    }
    
    func stopPlay() {
        // Останавливает радио
    }
    
    func turnOn() {
        // Включает радио
    }
    
    func turnOff() {
        // Выключает радио
    }
}

func turnOnElectronicEquipments() {
    let electronicEquipments: [ElectronicEquipment] = [SmartPhone(), InternetRadio()]
    electronicEquipments.forEach {
        $0.turnOn()
    }
}
