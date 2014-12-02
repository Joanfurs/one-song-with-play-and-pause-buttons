
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

		
	}
	
	override func loadView() {
	
		view = View(viewController: self);
	}
	
	override func viewDidLoad() {
	
		super.viewDidLoad()
	
	}

	func play(button: UIButton!) {
	
		var title: String? = button.titleForState(UIControlState.Normal);
		if title == nil {
			title = "untitled";
		}
		println("play = \(title!)");
		
		player!.volume = 1.0;
		player!.pan = 0.0;
		player!.numberOfLoops = 0;
		println("player.numberOfChannels = \(player!.numberOfChannels)");

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
	

	override func didReceiveMemoryWarning() {
	
		super.didReceiveMemoryWarning()
		
	}


}
