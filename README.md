# StarView

StarShape, StarView, StarRatingView for SwiftUI

### Demo GIF
![](https://github.com/EnesKaraosman/StarView/blob/master/Sources/StarView/starView.gif)

## Installation

### Swift Package Manager
Add new package: 'https://github.com/EnesKaraosman/StarView'

## Usage

### StarRatingView

```swift
StarRatingView(starCount: 5, totalPercentage: totalPercentage, style: .init())
    .frame(width: 300, height: 60)
```

`StarRatingView` Parameters

+ `starCount` (optional, default = 5) 
+ `totalPercentage`  between: 0 - 100 (ex: 60, fills 3/5 star) 
+ `style` (optional)   

### StarView

In case you want to use single StarView

```swift
StarView(percentage: 50)
    .frame(width: 60, height: 50)
```

`StarView` Parameters

+ `percentage` between: 0 - 100
+ `style` (optional)

### Styling

Pass `style` parameter in constructor.
```swift
let fillColor: Color
let borderWidth: CGFloat
let borderColor: Color
let spacing: CGFloat // For StarRatingView
```

### Extra

You can also add DragGesture to `StarRatingView` to take user's feedback. 

```swift
GeometryReader { geometry in 
    StarRatingView(starCount: 5, totalPercentage: self.fillPercentage)
        .frame(height: 60)
        .padding()
        .gesture(
            DragGesture().onChanged({ (value) in
                let width = geometry.size.width
                let currentX = value.location.x
                let newPerc = 100 * currentX / width
                self.fillPercentage = newPerc
            })
        )
}
```
Note: Lower & Upperbounds might be a bit tricky, due to paddings

![](https://github.com/EnesKaraosman/StarView/blob/master/Sources/StarView/with-drag-gesture.gif)

### Full example
```swift

@State private var totalPercentage: CGFloat = 20

var body: some View {
    VStack(alignment: .leading) {

        Spacer()
        Text("Individual Star View").font(.title)
        
        StarView(percentage: 50, style: .init())
            .frame(width: 60, height: 50)
        
        Spacer()
        Divider().padding()
        Spacer()
        
        Text("Rating View").font(.title)

        StarRatingView(starCount: 5, totalPercentage: totalPercentage)
            .frame(height: 60)
        
        Slider(value: $fillPercentage, in: 0...100) {
            Text("Fill Percantage")
        }.padding(.top, 24)
        
        Spacer()
        
    }
    .padding()
}

```
