
import Foundation
import SwiftUI
import TipKit

class TipViewModel: ObservableObject {
    
    var audioFeatureTip: AudioMessageTip = AudioMessageTip()
    
}

struct AudioMessageTip: Tip {
    
//    Step 3:
//    static let enterAndNotUseAudioMessage: Tips.Event = Tips.Event(id: "enter-message-view")
    
    var title: Text {
        Text("Enviar un audio")
    }
    
    var message: Text? {
        Text("¡Mantén pulsado el icono del micrófono para enviar un audio a tus amigos!")
    }
    
    var image: Image? {
        Image(systemName: "waveform")
    }
    
    var actions: [Tips.Action] {
        [       
            .init(id: "learn-more", title: "Saber más")
        ]
    }
    
//    Add new options to our Tip. This tip will be displayed
//    five times (max).
    var options: [TipOption] {
        [
            MaxDisplayCount(5)
        ]
    }
//    
//    Step 3
//    var rules: [Rule] {
//        #Rule(Self.enterAndNotUseAudioMessage) { event in event.donations.count > 3 }
//    }
    
}
