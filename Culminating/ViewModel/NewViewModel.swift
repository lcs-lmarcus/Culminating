//
//  AddFolderViewModel.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-20.
//
import Foundation
@Observable
class NewViewModel: Observable {
    
    var GuideName: String = ""
    var GuideDate: String = ""
    var GuideAdress: String = ""
    var GuideImage: String = ""
    var GuideCaption: String = ""
    
    
    var SaveGuide: [TourGuide] = []
    
    //// MARK: Functions
    //let SaveGuide = TourGuide(
    //    name: GuideName,
    //    date: <#T##String#>,
    //    address: GuideAdress,
    //    folder: <#T##String#>,
    //    image: <#T##String#>,
    //    rating: <#T##Double#>,
    //    caption: GuideCaption
    //)
    
    // MARK: Functions
    func add(newGuide: TourGuide) {
        self.SaveGuide.append(newGuide)
    }
}
