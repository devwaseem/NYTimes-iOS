//
//  CategorySelector.swift
//  NYTimes
//
//  Created by Waseem Akram on 28/07/20.
//  Copyright © 2020 Waseem Akram. All rights reserved.
//

import SwiftUI

struct CategorySelector: View {
    
    var categories: [Category]
    var articleViewModel: ArticleViewModel
    @State var selectedCategory: Int = 0 {
        didSet {
            articleViewModel.loadArticles(for: categories[selectedCategory])
        }
    }

    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<categories.count) { index in
                        VStack{
                            Spacer()
                            HStack {
                                Text(self.categories[index].rawValue)
                                    .foregroundColor(self.selectedCategory == index ? .white : .init(UIColor.label))
                                    .fontWeight(.medium)
                            }
                            .padding(.leading,16)
                            .padding(.trailing,16)
                            Spacer()
                        }
                        .background(self.selectedCategory == index ? Color.purple : Color("categoryBackground"))
                            .cornerRadius(10)
                            .onTapGesture {
                                self.selectedCategory = index
                        }
                    }.padding(.leading,8)
                }
            }
            .padding(.vertical,24)
            .background(Color.init(.secondarySystemBackground))
            .clipped()
            .shadow(radius: 15)
    }
        
}



struct CategorySelector_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelector(categories: [
            Category.science,
            Category.tech,
            Category.business
        ], articleViewModel: ArticleViewModel(),
                         selectedCategory: 0)
            .previewDevice(.init("iPhone X"))
            
    }
}


