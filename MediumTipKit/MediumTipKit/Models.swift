
import Foundation

struct Chat: Identifiable {
    let id = UUID()
    let name: String
    let messages: [Message]
}

struct Message: Identifiable {
    let id = UUID()
    let sender: String
    let text: String
}

extension Message {
    static let me: String = "David"
}

extension Array where Element == Chat {
    
    static let mock: [Chat] = [
        .init(name: "Party Viernes", messages: [
            .init(sender: "Victor", text: "Tenía que haber pasado a desayunar por plaza España"),
            .init(sender: "Guillermo", text: "No no"),
            .init(sender: "Guillermo", text: "Esto lo hizo david en su día"),
            .init(sender: "Guillermo", text: "Quiero probarlo"),
            .init(sender: "Victor", text: "Ah"),
        ]),
        .init(name: "Celia", messages: [
            .init(sender: "Celia", text: "Jajajaja somos iguales entonces"),
            .init(sender: Message.me, text: "No esperaba menos"),
            .init(sender: Message.me, text: "Para que no te desprecie mas que nada"),
            .init(sender: Message.me, text: "🤣✌️"),
        ]),
        .init(name: "Beatriz", messages: [
            .init(sender: Message.me, text: "Pero no se si serán esos"),
            .init(sender: "Beatriz", text: "Si si los del"),
            .init(sender: "Beatriz", text: "Dell*")
        ]),
        .init(name: "Javier", messages: [
            .init(sender: Message.me, text: "¿Quédamos a las 20:30 allí?"),
            .init(sender: "Javier", text: "Ok"),
            .init(sender: Message.me, text: "Salgo ahora, llego tarde"),
            .init(sender: Message.me, text: "🤣")
        ]),
    ]
}

extension Chat {
    
    static let mock: Chat = .init(name: "Party Viernes", messages: [
        .init(sender: "Victor", text: "Tenía que haber pasado a desayunar por plaza España"),
        .init(sender: "Guillermo", text: "No no"),
        .init(sender: "Guillermo", text: "Esto lo hizo david en su día"),
        .init(sender: Message.me, text: "Quiero probarlo"),
        .init(sender: "Victor", text: "Ah"),
    ])
}
