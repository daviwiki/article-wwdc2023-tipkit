
import SwiftUI

struct ChatView: View {
    
    @State private var chats: [Chat] = .mock
    
    var body: some View {
        NavigationView {
            chatsArea
            .navigationTitle("Chats")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Editar") {
                        
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "pencil.circle")
                    })
                }
            })
        }
    }
    
    private var chatsArea: some View {
        List(chats) { chat in
            NavigationLink(destination: MessageView(chat: chat)) {
                Text(chat.name)
            }
        }
        .listStyle(.inset)
    }
}


#Preview {
    ChatView()
}
