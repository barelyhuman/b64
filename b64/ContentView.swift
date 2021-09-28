//
//  ContentView.swift
//  Test
//
//  Created by Reaper on 28/09/21.
//

import SwiftUI

struct ContentView: View {
    @State var original: String = ""
    @State var output: String = ""
    var body: some View {
        VStack{
            HStack{
                TextField("Text to convert", text: $original).padding(2)
                Button("Encode", action:handleEncodePress).padding(1)
                Button("Decode", action:handleDecodePress).padding(1)
            }.padding([.top, .leading, .trailing], 10)
            HStack(spacing: 0.0){
                Text(output).padding(4).frame(maxWidth:.infinity)
                Button(action:copyOutput) {
                            Image(systemName: "doc.on.doc")
                }.disabled(output.count <= 0)
            }.frame(maxWidth:.infinity).padding([.leading, .bottom, .trailing], 10)
        }.frame(minWidth: 300,minHeight: 100,maxHeight: .infinity,alignment: .topLeading)
    }
    
    func handleEncodePress(){
        output = encodeBase64(toEncode:original)
    }
    
    func handleDecodePress(){
        output = decodeBase64(toDecode: original)
    }
    

    private func copyToClipBoard(textToCopy: String) {
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        pasteBoard.setString(textToCopy, forType: .string)
    }
    
    func copyOutput(){
        copyToClipBoard(textToCopy:output)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
