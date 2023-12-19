//
//  PhotoPicker.swift
//  ToMeetToMe
//
//  Created by 이자민 on 12/19/23.
//

import SwiftUI
import PhotosUI

@MainActor
final class PhotoPicker: ObservableObject {
    @Published private(set) var selectedImage: UIImage? = UIImage(named: "1")
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet {
            setImage(from: imageSelection)
        }
    }
    
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection = selection else { return }
        
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                    return
                }
            }
        }
    }
}

