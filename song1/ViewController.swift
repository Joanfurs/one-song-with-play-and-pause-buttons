
import UIKit;
import AVFoundation;

class ViewController: UIViewController {
	
	var player: AVAudioPlayer?;

	
	required init(coder aDecoder: NSCoder) {
	
		super.init(coder: aDecoder);


		let bundle: NSBundle? = NSBundle.mainBundle();
		if bundle == nil {
			println("could not get the main bundle");
			return;
		}
		println("bundle.bundlePath = \"\(bundle!.bundlePath)\"\n");

		//The path is the filename.
		let path: String? = bundle!.pathForResource("03", ofType: "mp3");
		if path == nil {
			println("could not find the path");
			return;
		}
		println("path = \"\(path!)\"\n");

		let url: NSURL? = NSURL(fileURLWithPath: path!, isDirectory: false);
		if url == nil {
			println("could not create url");
			return;
		}
		println("url = \"\(url!)\"\n");

		var error: NSError?;
		player = AVAudioPlayer(contentsOfURL: url!, error: &error);
		if player == nil {
			println("could not create AVAudioPlayer: \(error!)");
			return;
		}
		player!.volume = 0.5;
		player!.pan = 0.0;
		player!.numberOfLoops = 0;
		println("player.numberOfChannels = \(player!.numberOfChannels)");


	}
	
	override func loadView() {
		view = View(viewController: self);
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		//Call the updateSlider method ofthe view controller 60 times per second.
		let displayLink: CADisplayLink? = CADisplayLink(target: self, selector: "updateSlider:");
		displayLink!.frameInterval = 1;
		let loop: NSRunLoop = NSRunLoop.currentRunLoop();
		displayLink!.addToRunLoop(loop, forMode: NSDefaultRunLoopMode);
	}

	//This method is called 60 times per second by the display link.

	func updateSlider(displayLink: CADisplayLink) {
		assert(player!.duration > 0);	//Can't divide by zero.
		let v: View = view as View;
		//Move the slider's thumb to the curent location in the audio file.
		//The quotient is a fraction in the range 0 to 1 inclusive.
		v.slider.value = Float(player!.currentTime / player!.duration);
	}

	/*
	This method is called when the user slides the slider.  slider.value is a fraction
	in the range 0 to 1 inclusive.  We have to convert it from data type Float to data
	type NSTimeInterval because duration is of type NSTimeInterval.
	*/

	func valueChanged(slider: UISlider!) {
		player!.currentTime = NSTimeInterval(slider.value) * player!.duration;
	}
	
	
	func valueChanged2(slider2: UISlider!) {
		player!.volume = slider2.value
	}

	func play(button: UIButton!) {
	
		var title: String? = button.titleForState(UIControlState.Normal);
		if title == nil {
			title = "untitled";
		}
		println("play = \(title!)");
		

		if !player!.prepareToPlay() {
			println("could not prepare to play");
			return;
		}

		if !player!.play() {
			println("could not prepare to play");
	}
	}
	
	func pause(button2: UIButton!) {
	
		var title: String? = button2.titleForState(UIControlState.Normal);
		if title == nil {
			title = "untitled";
		}
		println("pause = \(title!)");

		player!.pause()
	}
	
	func stop(button3: UIButton!) {
	
		var title: String? = button3.titleForState(UIControlState.Normal);
		if title == nil {
			title = "untitled";
		}
		println("stop = \(title!)");

		player!.stop()
		player!.currentTime = 0
	}
	
	func mute(button4: UIButton!) {
	
		var title: String? = button4.titleForState(UIControlState.Normal);
		if title == nil {
			title = "untitled";
		}
		println("stop = \(title!)");

		if player!.volume > 0.0 {
		player!.volume = 0.0
	} else {
		player!.volume = 0.5
		}
	}

	override func didReceiveMemoryWarning() {
	
		super.didReceiveMemoryWarning()
		
	}


}
