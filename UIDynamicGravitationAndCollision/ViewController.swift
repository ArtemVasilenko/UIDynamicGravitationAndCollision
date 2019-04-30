
import UIKit

enum Angle {
    case up
    case down
    case left
    case right
    case upLeft
    case upRight
    case downLeft
    case downRight
}

class ViewController: UIViewController {
    
    var sqare: UIView!
    var animator: UIDynamicAnimator!
    var brovya: UIView!
    var pyatka: UIView!
    var myKubik: Figure!
    

    
    override func viewWillAppear(_ animated: Bool) {
        sqare = UIView(frame: CGRect(x: self.view.center.x, y: self.view.center.y, width: 50, height: 50))
        //        sqare.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: 50, height: 50)
        sqare.center = view.center
        
        sqare.backgroundColor = .red
        self.view.addSubview(sqare)
        
        brovya = UIView(frame: CGRect(x: 0, y: 30, width: view.frame.width, height: 3))
        brovya.backgroundColor = .green
        self.view.addSubview(brovya)
        
        pyatka = UIView(frame: CGRect(x: 0, y: view.frame.height - 100, width: view.frame.width, height: 30))
        pyatka.backgroundColor = .red
        self.view.addSubview(pyatka)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        
        pyatka.addGestureRecognizer(gesture)
        pyatka.isUserInteractionEnabled = true
        
        let gravity = UIGravityBehavior(items: [sqare])
        gravity.magnitude = 0.2
        gravity.angle = CGFloat(Float.getAngle(.down))
        animator.addBehavior(gravity)
        
        let collusion = UICollisionBehavior(items: [sqare, pyatka])
        collusion.translatesReferenceBoundsIntoBoundary = true
        collusion.addBoundary(withIdentifier: "brovya" as NSCopying, from: CGPoint(x: 0, y: 30), to: CGPoint(x: view.frame.width, y: 30))
        
        collusion.addBoundary(withIdentifier: "pyatka" as NSCopying, from: CGPoint(x: 0, y: view.frame.height - 50), to: CGPoint(x: view.frame.width, y: view.frame.height - 50))
        animator.addBehavior(collusion)
    }
    
    @objc func panGesture(param: UIPanGestureRecognizer) {
        
        switch param.state {
        case .changed:
            let moved = param.translation(in: self.view)
            pyatka.center = CGPoint(x: pyatka.center.x + moved.x, y: pyatka.center.y + moved.y)
            param.setTranslation(.zero, in: self.view)

        
        default: ()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myKubik = Figure(myRect: MyRect(myX: 50, myY: 50, myWidth: 30, myHeight: 30))
        self.view.addSubview(myKubik)
        
        let myKrug = Circle(centerX: 150, centerY: 150, myRadius: 30)
        self.view.addSubview(myKrug)
        
    }
    
    
}

extension Float {
    
    static func getAngle(_ enumAngle: Angle) -> Float {
        
        switch enumAngle {
        case .up: return -pi/2
        case .down: return pi/2
        case .left: return pi
        case .right: return pi*2
        case .upLeft: return -pi/4 - pi/2
        case .downLeft: return pi/4 + pi/2
        case .upRight: return -pi/4
        case .downRight: return pi/4
        }
    }
    
}

