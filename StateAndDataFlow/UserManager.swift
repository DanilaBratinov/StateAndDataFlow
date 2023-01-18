import Foundation
import SwiftUI

class UserManager: ObservableObject {
    @AppStorage("Login") var isRegistered = false
    @AppStorage("Name") var name = ""
}
