import UIKit



class View: UIView {

		let slider: UISlider = UISlider();
		let slider2: UISlider = UISlider();

	init(viewController: ViewController) {
		
		super.init(frame: CGRectZero);
		
		backgroundColor = UIColor.blackColor();
		
		//Put the button 1

		let button: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton;
	
		button.frame = CGRectMake(30, 600, 40, 40 );

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
	
		button2.frame = CGRectMake(80, 600, 40, 40 );

		button2.backgroundColor = UIColor.blackColor();
		button2.layer.borderWidth = 0.5;
		button2.layer.borderColor = UIColor.whiteColor().CGColor;
		button2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal);
		button2.setTitle("∎∎", forState: UIControlState.Normal);

		button2.addTarget(viewController,
			action: "pause:",
			forControlEvents: UIControlEvents.TouchUpInside);


		addSubview(button2);
		
		//Put the button 3
		
		let button3: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton;
	
		button3.frame = CGRectMake(130, 600, 40, 40 );

		button3.backgroundColor = UIColor.blackColor();
		button3.layer.borderWidth = 0.5;
		button3.layer.borderColor = UIColor.whiteColor().CGColor;
		button3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal);
		button3.setTitle("◼︎", forState: UIControlState.Normal);

		button3.addTarget(viewController,
			action: "stop:",
			forControlEvents: UIControlEvents.TouchUpInside);


		addSubview(button3);
		
		//Put the button 4
		
		let button4: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton;
	
		button4.frame = CGRectMake(180, 600, 40, 40 );

		button4.backgroundColor = UIColor.blackColor();
		button4.layer.borderWidth = 0.5;
		button4.layer.borderColor = UIColor.whiteColor().CGColor;
		button4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal);
		button4.setTitle("🔇", forState: UIControlState.Normal);

		button4.addTarget(viewController,
			action: "mute:",
			forControlEvents: UIControlEvents.TouchUpInside);


		addSubview(button4);
		
		// Put duration slider
		
		slider.frame = CGRectMake(10, 70, 350, 1)

		slider.minimumValue = 0;
		slider.maximumValue = 1;

		slider.addTarget(viewController,
			action: "valueChanged:",
			forControlEvents: UIControlEvents.ValueChanged);

		addSubview(slider);
		
		// Put volume slider
		
		slider2.frame = CGRectMake(250, 620, 100 , 1)

		slider2.minimumValue = 0;
		slider2.maximumValue = 1;

		slider2.addTarget(viewController,
			action: "valueChanged2:",
			forControlEvents: UIControlEvents.ValueChanged);

		addSubview(slider2);
		
	}

	required init(coder aDecoder: NSCoder) {

		super.init(coder: aDecoder)
		backgroundColor = UIColor.blackColor();

		}

	override func drawRect(rect: CGRect) {
	
		// Placing name of a song

		let s: String = "Make Me Wanna Die";

		let font: UIFont = UIFont.systemFontOfSize(30);
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