import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            
            ButtonView(
                action: timer.startTimer,
                title: timer.buttonTitle,
                color: .red
            )
            
            ButtonView(
                action: {showingAlert = true},
                title: "Exit",
                color: .blue)
                .alert("Are you sure you want to go out?", isPresented: $showingAlert) {
                    Button("Yes", role: .destructive) {
                        userManager.isRegistered.toggle()
                        userManager.name = ""
                    }
                }
                .padding(.top, 75)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}


struct ButtonView: View {
    var action: () -> Void
    var title: String
    var color: Color
    
    var body: some View {
        
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(.black, lineWidth: 4))
    }
}
