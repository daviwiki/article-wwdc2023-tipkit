
import Foundation
import SwiftUI
import TipKit

class TipViewModel: ObservableObject {
    
    var audioFeatureTip: AudioMessageTip = AudioMessageTip()
    
}

struct AudioMessageTip: Tip {
    
    static let enterAndNotUseAudioMessage: Tips.Event = Tips.Event(id: "enter-message-view")
    
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
      
    // Include the rule that defines how many donations we need to display
    // the tip
    var rules: [Rule] {
        #Rule(Self.enterAndNotUseAudioMessage) { event in event.donations.count > 3 }
    }
    
}
