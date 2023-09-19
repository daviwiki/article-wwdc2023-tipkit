
import SwiftUI
import TipKit

struct MessageView: View {
    
    @State private var input: String = ""
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var tipViewModel: TipViewModel
    let chat: Chat
    
    var body: some View {
        VStack {
            List(chat.messages.indices) { index in
                let message = chat.messages[index]
                let previous = index > 0 ? chat.messages[index - 1] : nil
                messageCell(message, previousMessage: previous)
                    .listRowSeparator(.hidden)
                    .background(.clear)
                    .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            
            bottomBar()
                .background(colorScheme == .light ?
                            Color(.systemBackground) :
                            Color(UIColor.black))
                .shadow(color: colorScheme == .light ?
                        Color.black.opacity(0.1) :
                        Color.gray.opacity(0.6)
                        , radius: 1, x: 0, y: -1)
        }
        .background(colorScheme == .light ? .white : Color(.black))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .fontWeight(.medium)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(chat.name)
                    .fontWeight(.medium)
            }
        }
        .task {
            // Donate a event each time the user enter into the MessageView
            await AudioMessageTip.enterAndNotUseAudioMessage.donate()
        }
    }
    
    @ViewBuilder
    private func messageCell(_ message: Message,
                             previousMessage: Message? = nil) -> some View {
        HStack {
            if message.sender == Message.me {
                Spacer()
            }
            
            VStack(alignment: .leading) {
                if previousMessage?.sender != message.sender {
                    Text(message.sender)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Text(message.text)
                    .padding(10)
                    .background(message.sender == Message.me ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            if message.sender != Message.me {
                Spacer()
            }
        }
        .padding(.vertical, previousMessage?.sender != message.sender ? 0 : -6)
    }
    
    @ViewBuilder
    private func bottomBar() -> some View {
        HStack {
            Button(action: {
                // todo: add image
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
            })
            .padding(.horizontal)
            
            TextField("Type a message", text: $input)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .padding(.trailing, 8)
                
            Button(action: {
                // todo: record audio
                
                // Invalidate the Tip if user find the feature and use it
                tipViewModel.audioFeatureTip.invalidate(reason: .actionPerformed)
            }, label: {
                Image(systemName: "mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
            })
            .padding(.horizontal)
            .popoverTip(tipViewModel.audioFeatureTip, arrowEdge: .bottom)
        }
        .padding()
    }
}

#Preview {
    MessageView(chat: .mock)
        .environmentObject(TipViewModel())
        .onAppear {
            Tips.showAllTipsForTesting()
        }
}
