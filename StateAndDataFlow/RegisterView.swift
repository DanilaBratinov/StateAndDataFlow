import SwiftUI

struct RegisterView: View {
    @State private var buttonColor: Color = .gray
    @State private var rightTitleColor: Color = .red
    
    @State private var name = ""
    @State private var buttonType = true
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name.projectedValue)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { countTitle in
                        changeColor(countTitle.count)
                    }
                
                Text(name.count.formatted())
                    .padding(.trailing)
                    .foregroundColor(rightTitleColor)
            }
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .foregroundColor(buttonColor)
            }
            .disabled(buttonType)
        }
    }
    
    private func registerUser() {
        userManager.name = name
        userManager.isRegistered.toggle()
    }
    
    private func changeColor(_ characters: Int) {
        if characters >= 3 {
            buttonColor = .blue
            rightTitleColor = .green
            buttonType = false
        } else {
            buttonColor = .gray
            rightTitleColor = .red
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
