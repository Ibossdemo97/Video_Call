//
//  FacetimeViewController.swift
//  FakeFacetime
//
//  Created by Nhấc tay khỏi Mac của tao on 21/5/24.
//

import UIKit
import Combine
import StreamVideo
import StreamVideoUIKit
import StreamVideoSwiftUI


class FacetimeViewController: UIViewController {
    
    @IBOutlet weak var listCallTableView: UITableView!
    
    private var activeCallView: UIView!

    private var subcription = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
//        listenInComingCall()
    }
    
    private func setupUI() {
        title = "VideoCall"
    }

    
    @IBAction func joinCall() {
        guard let callViewModel = CallManager.shared.callViewModel else {
            return
        }
        callViewModel.joinCall(callType: .default, callId: "default_c4589f8a-05d1-4cca-b14c-03d66d61819d")
//        callViewModel.startCall(callType: .default, callId: UUID().uuidString, members: [])
        showCallUI()
    }
    
    @IBAction func outCall() {
//        AuthManager.shared.signOut()
        let vc = SIgnInViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
    private func listenInComingCall() {
        guard let callViewModel = CallManager.shared.callViewModel else {
            return
        }
        callViewModel.$callingState.sink { [weak self] newState in
            switch newState {
            case .idle: // Không có cuộc gọi nào
                DispatchQueue.main.async {
                    self?.hideCallUI()
                }
                print("🥶idle")
            case .lobby(_):
                print("lobby")
            case .incoming(_): // Đang có cuộc gọi
                DispatchQueue.main.async {
                    self?.showCallUI()
                }
                print("🥶incoming")
            case .outgoing:
                print("outgoing")
            case .joining:
                print("joining")
            case .inCall:
                print("inCall")
            case .reconnecting:
                print("reconnecting")
            }
        }.store(in: &subcription)
    }
    
    private func showCallUI() {
        guard let callViewModel = CallManager.shared.callViewModel else {
            return
        }
        let callVC = CallViewController.make(with: callViewModel)
        view.addSubview(callVC.view)
        callVC.view.bounds = UIScreen.main.bounds
        activeCallView = callVC.view
    }
    
    private func hideCallUI() {
        activeCallView.removeFromSuperview()
        
    }
}
