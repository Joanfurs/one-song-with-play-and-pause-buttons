import UIKit



class View: UIView {

	init(viewController: ViewController) {
		
		
		super.init(frame: CGRectZero);
		
		backgroundColor = UIColor.blackColor();
		
		//Put the button 1

		let button: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton;
	
		button.frame = CGRectMake(100, 600, 40, 40 );

		button.backgroundColor = UIColor.blackColor();
		button.layer.borderWidth = 0.5;
		button.layer.borderColor = UIColor.whiteColor().CGColor;
		button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal);
		button.setTitle("▶︎", forState: UIControlState.Normal);

		button.addTarget(viewController,
			action: "play:",
			forControlEvents: UIControlEvents.TouchUpInside);

		addSubview(button);
		
		//Put the button 2
		
		let button2: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton;
	
		button2.frame = CGRectMake(230, 600, 40, 40 );

		button2.backgroundColor = UIColor.blackColor();
		button2.layer.borderWidth = 0.5;
		button2.layer.borderColor = UIColor.whiteColor().CGColor;
		button2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal);
		button2.setTitle("∎∎", forState: UIControlState.Normal);

		button2.addTarget(viewController,
			action: "pause:",
			forControlEvents: UIControlEvents.TouchUpInside);


		addSubview(button2);
		
	}

	required init(coder aDecoder: NSCoder) {

		super.init(coder: aDecoder)
		backgroundColor = UIColor.blackColor();

		}

	override func drawRect(rect: CGRect) {
	
		// Placing name of a song

		let s: String = "Make Me Wanna Die";

		let font: UIFont = UIFont.systemFontOfSize(36);
		let foregroundColor: UIColor = UIColor.whiteColor();
		let attributes: [NSObject: AnyObject] = [NSFontAttributeName: font,
		NSForegroundColorAttributeName: foregroundColor]; //a dictionary

		let screen: UIScreen = UIScreen.mainScreen();
		let applicationFrame: CGRect = screen.applicationFrame;
		let size: CGSize = s.sizeWithAttributes(attributes);
		let x: CGFloat = applicationFrame.origin.x + (bounds.size.width - size.width) / 2;
		let y: CGFloat = applicationFrame.origin.y ;
		let point: CGPoint = CGPointMake(x, y);

		
		s.drawAtPoint(point, withAttributes: attributes);
		

		// Placing album photo
		
		let w: CGFloat = bounds.size.width;
		let h: CGFloat = bounds.size.height;

		let image: UIImage? = UIImage(named: "pretty-reckless.png");
		if image == nil {
		println("could not find pretty-reckless.png");
		return;
		}


		let point2: CGPoint = CGPointMake(
		(w - image!.size.width) / 2,
		(h - image!.size.height) / 2);

		image!.drawAtPoint(point2);
		
		}
}