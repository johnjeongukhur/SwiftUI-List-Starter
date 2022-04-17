//
//  VideoListView.swift
//  SwiftUI-List-Starter
//
//  Created by John Hur on 2022/04/16.
//

import SwiftUI

struct VideoListView: View {
    
    var videos: [Video] = VideoList.topTen
    
    var body: some View {
        
        NavigationView {
            List(videos, id: \.id) { video in
                NavigationLink(destination: VideoDetailView(video: video), label: {
                    VideoCell(video: video)
                })
            }
            .navigationTitle("Sean's Top 10")
            .listStyle(PlainListStyle())
        }
    }
}

struct VideoCell: View {
    
    var video: Video
    
    var body: some View {
        HStack {
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                // 나머지를 제한하지 않으면 크기 기준 비율로 적용
                .frame(height: 70)
                .cornerRadius(4)
                // 위, 아래 수직 마진 값을 4씩 줌
                .padding(.vertical, 4)
            
            VStack(alignment: .leading, spacing: 5) {
                // UIKit은 Cell에서 각각 지정해줘야 했지만 간단하게 구현 가능
                Text(video.title)
                    // 폰트 크기
                    .fontWeight(.semibold)
                    // 줄 수 제한
                    .lineLimit(2)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
    }
}

    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
