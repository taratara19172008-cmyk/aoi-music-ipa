import Foundation
import Capacitor
import MediaPlayer
import AVFoundation

@objc(VolumeControlPlugin)
public class VolumeControlPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "VolumeControlPlugin"
    public let jsName = "VolumeControl"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "setVolume", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getVolume", returnType: CAPPluginReturnPromise)
    ]

    private var volumeView: MPVolumeView?
    private var volumeSlider: UISlider?

    private func ensureVolumeView() {
        if volumeView != nil { return }
        let view = MPVolumeView(frame: CGRect(x: -3000, y: -3000, width: 1, height: 1))
        view.showsRouteButton = false
        view.isHidden = false
        view.alpha = 0.01
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.addSubview(view)
        }
        volumeView = view
        for sub in view.subviews {
            if let slider = sub as? UISlider {
                volumeSlider = slider
                break
            }
        }
    }

    @objc func setVolume(_ call: CAPPluginCall) {
        let value = call.getFloat("value") ?? 0
        DispatchQueue.main.async {
            do {
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {}
            self.ensureVolumeView()
            self.volumeSlider?.value = Float(value)
            self.volumeSlider?.sendActions(for: .touchUpInside)
            call.resolve()
        }
    }

    @objc func getVolume(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            do {
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {}
            let current = AVAudioSession.sharedInstance().outputVolume
            call.resolve(["value": Double(current)])
        }
    }
}
