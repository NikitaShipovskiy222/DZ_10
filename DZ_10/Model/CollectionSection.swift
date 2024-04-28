//
//  CollectionSection .swift
//  DZ_10
//
//  Created by Nikita Shipovskiy on 28/04/2024.
//

import Foundation


struct CollectionSection: Identifiable {
    var id = UUID().uuidString

    var items: [CollectionItem]
    
    
    static func mockData() -> [CollectionSection] {
        let firstSection = [
        CollectionItem(img: "img1", name: "name1"),
        CollectionItem(img: "img2", name: "name2"),
        CollectionItem(img: "img3", name: "name3"),
        CollectionItem(img: "img4", name: "name4"),
        CollectionItem(img: "img5", name: "name5")
        ]
        
        let secondSection = [
        CollectionItem(img: "img6", textMain: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        CollectionItem(img: "img7", textMain: "It is a long established fact that a reader will be distracted by the readable."),
        CollectionItem(img: "img8", textMain: "Contrary to popular belief, Lorem Ipsum is not simply random text."),
        CollectionItem(img: "img1", textMain: "There are many variations of passages of Lorem Ipsum available.")
        ]
        
        
    let thirdSection = [
        CollectionItem(img: "img2", textMain: "There are many variations of passages of Lorem Ipsum available.", titleText: "Title1"),
        CollectionItem(img: "img3", textMain: "Contrary to popular belief, Lorem Ipsum is not simply random text.", titleText: "Title2"),
        CollectionItem(img: "img4", textMain: "It is a long established fact that a reader will be distracted by the readable.", titleText: "Title3"),
        CollectionItem(img: "img5", textMain: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", titleText: "Title4")

        ]
        
        let fourthSection = [
        CollectionItem(img: "img6"),
        CollectionItem(img: "img1"),
        CollectionItem(img: "img2"),
        CollectionItem(img: "img3")
        ]
        
        
        let storySection = CollectionSection(items: firstSection)
        let messengeSection = CollectionSection(items: secondSection)
        let newSection = CollectionSection(items: thirdSection)
        let bannerSection = CollectionSection(items: fourthSection)
        
        return [storySection, messengeSection, newSection, bannerSection]
        
    }
    
}
