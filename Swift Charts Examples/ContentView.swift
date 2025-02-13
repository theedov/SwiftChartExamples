//
// Copyright © 2022 Swift Charts Examples.
// Open Source - MIT License

import SwiftUI

struct ContentView: View {
    
    @State private var selectedChartType: ChartType?
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedChartType) {
                ForEach(ChartCategory.allCases) { category in
                    Section {
                        ForEach(ChartType.allCases.filter { $0.category == category }) { chart in
                            NavigationLink(value: chart) {
                                chart.view
                            }
                        }
                    } header: {
                        Text("\(category.rawValue)")
                    }
                }
//                ForEach(ChartType.allCases) { chart in
//                    Section {
//                    } header: {
//                        Text("")
//                    }
//                }
            }
            .navigationTitle("Swift Charts Examples")
        } detail: {
            NavigationStack {
                switch selectedChartType {
                case .none:
                    Text("Select a chart to view")
                case .singleLine:
                    LineChartSimpleDetailView()
                case .singleBar:
                    SingleBarDetailView()
                case .twoBars:
                    TwoBarsSimpleDetailView()
                case .areaSimple:
                    AreaChartSimpleDetailView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
