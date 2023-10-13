
import UIKit
import RiveRuntime
import SnapKit


//MARK: - Properties & Deinit
class LoginViewController: UIViewController {
    
    // UI Elements
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "찾아줄개"
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    private lazy var kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오 로그인", for: .normal)
        button.addTarget(self, action: #selector(kakoLoginTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var appleLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("애플 로그인", for: .normal)
        button.addTarget(self, action: #selector(appleLoginTapped), for: .touchUpInside)
        return button
    }()
    
    // Rive Properties
    private var viewModel = RiveViewModel(fileName: "background")
    private lazy var riveView: RiveView = {
        let view = RiveView()
        view.frame = UIScreen.main.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewModel.setView(view)
        return view
    }()
    
    
}

//MARK: - View Cycle
extension LoginViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
}



//MARK: - Setup UI

extension LoginViewController {
    
    func setupUI() {
        
        [kakaoLoginButton, appleLoginButton].forEach {
            $0.backgroundColor = .yellow
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 20
        }
        
        [emailTextField, passwordTextField].forEach {
            $0.borderStyle = .roundedRect
            
        }
        
        view.addSubview(riveView)
        
        // Add the blur effect
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = riveView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        riveView.addSubview(blurEffectView)
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(titleLabel)
        view.addSubview(kakaoLoginButton)
        view.addSubview(appleLoginButton)
        setupConstraints()
    }
    
    
    
    func setupConstraints() {
        riveView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.centerX.equalToSuperview()
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(80)
            $0.width.equalTo(150)
            $0.height.equalTo(40)
        }
        
        appleLoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(kakaoLoginButton.snp.bottom).offset(30)
            $0.width.equalTo(150)
            $0.height.equalTo(40)
        }
        
        emailTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(appleLoginButton.snp.bottom).offset(40)
            $0.width.equalTo(250)
            $0.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.width.equalTo(emailTextField)
            $0.height.equalTo(40)
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.width.equalTo(150)
            $0.height.equalTo(40)
        }
        
    }
}

//MARK: - Button Action
extension LoginViewController {
    @objc func kakoLoginTapped() {
        
        
    }
    
    @objc func appleLoginTapped() {
        
    }
    
    @objc func loginButtonTapped() {
        
        
    }
    
}
