import UIKit

struct MyRect {
    var myX = Int()
    var myY = Int()
    var myWidth = Int()
    var myHeight = Int()
}

class Figure: UIView {
    
    var myWidth: Int!
    var myHeight: Int!
    var myX: Int!
    var myY: Int!
    
    init(myRect: MyRect) {
        super.init(frame: CGRect())
        
        self.myWidth = myRect.myWidth
        self.myHeight = myRect.myHeight
        self.myX = myRect.myX
        self.myY = myRect.myY
        
        self.backgroundColor = .red
        self.frame = CGRect(x: myX, y: myY, width: myWidth, height: myHeight)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class Circle: Figure {
    
    var myRadius: Int!
    var centerX: Int!
    var centerY: Int!
    
    init(centerX: Int, centerY: Int, myRadius: Int) {
        super.init(myRect: MyRect())
        self.myRadius = myRadius
        self.centerX = centerX
        self.centerY = centerY
        
        self.backgroundColor = .green
        
        self.layer.cornerRadius = CGFloat(myRadius/2)
        self.frame = CGRect(x: centerX - myRadius, y: centerY - myRadius, width: myRadius, height: myRadius)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
