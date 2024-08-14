import Supabase
import SwiftUI

let uploadData: Data = {
  if let url = Bundle.main.url(forResource: "sample", withExtension: "jpg"),
     let data = try? Data(contentsOf: url) {
    return data
  }

  return Data()
}()

struct UploadFileView: View {
  @State var status = ""

  var body: some View {
    VStack {
      Button("Upload file") {
        uploadFile()
      }

      Text(status)
    }
  }

  func uploadFile() {
    Task {
      do {
        status = "Uploading..."
        try await supabase.storage.from("images")
          .upload(path: "sample.jpg", file: uploadData)
        status = "Uploaded!"
      } catch {
        status = "Failure: \(error.localizedDescription)"
      }
    }
  }
}
