import SwiftUI

struct InputView: View {
    let placeHolder: String
    @Binding var stateVar: String
    let title: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .foregroundColor(Color(red: 0.70, green: 0.70, blue: 0.70))
                .font(Font.custom("Lato-Regular", size: 15))
            
            let field = isSecureField ?
                AnyView(secureInputField()) :
                AnyView(regularInputField())
            
            field
                .padding(.all, 10)
                .background(.clear)
                .cornerRadius(20.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white, lineWidth: 1)
                )
                .foregroundColor(.white)
        }
    }
    
    private func secureInputField() -> some View {
        SecureField(text: $stateVar, prompt: Text("").foregroundColor(.white)) {}
    }
    
    private func regularInputField() -> some View {
        TextField(text: $stateVar, prompt: Text("").foregroundColor(.white)) {}
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(red: 0.30, green: 0.30, blue: 0.30)
            
            InputView(placeHolder: "Sign in",
                      stateVar: .constant(""),
                      title: "Username")
        }
        
    }
}
