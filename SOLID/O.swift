/// **Open Closed Principle - принцип открытости/закрытости
/* Программные сущности должны быть открыты для расширения, но закрыты для модификации,
т.е. новый функционал вводится путем добавления нового кода, а не изменением старого,
уже работающего. */

import Foundation

protocol Deeplink {
    // Чтобы не вызывать из каждого класса метод, например executeHome,
    // тем самым модифицируя класс Router, мы можем просто создать протокол
    // и подписать под него наши Deeplink сущности, а затем, без изменения
    // какой-либо логики, мы можем вызвать у нашей сущности execute().
    // Нам не важно какой это Deeplink, так как все подписаны под протокол
    // и имеют метод execute()
    func execute()
}

// MARK: - HomeDeeplink -

final class HomeDeeplink: Deeplink {
    func execute() {
        // Показывает главный экран
    }
}

// MARK: - ProfileDeeplink -

final class ProfileDeeplink: Deeplink {
    func execute() {
        // Показывает экран профиля
    }
}

// MARK: - SettingsDeeplink -

final class SettingsDeeplink: Deeplink {
    func execute() {
        // Показать экран настроек
    }
}

// MARK: - Router -

final class Router {
    func execute(_ deeplink: Deeplink) {
        deeplink.execute()
    }
}

func executeDeeplink() {
    let router = Router()
    let deeplink: Deeplink = HomeDeeplink()
    router.execute(deeplink)
}
