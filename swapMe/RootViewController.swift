//
//  RootViewController.swift
//  swapMe
//
//  Created by Saif Jilani on 8/15/15.
//  Copyright (c) 2015 saifjilani. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate
{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Parse Login
    //If no user logged in then parse login view opens
    func loginSetup()
    {
        if (PFUser.currentUser() == nil)
        {
            var loginViewController = PFLogInViewController()
            loginViewController.delegate = self
            
            var signupViewController = PFSignUpViewController()
            signupViewController.delegate = self
            
            loginViewController.signUpController = signupViewController
            loginViewController.fields = PFLogInFields.LogInButton | PFLogInFields.Facebook | PFLogInFields.Twitter | PFLogInFields.SignUpButton | PFLogInFields.UsernameAndPassword | PFLogInFields.PasswordForgotten | PFLogInFields.DismissButton
            
            var loginTitle = UILabel()
            loginTitle.text = "Barter"
            var signupTitle = UILabel()
            signupTitle.text = "Barter Signup"
            
            loginViewController.logInView?.logo = loginTitle
            signupViewController.signUpView?.logo = signupTitle
            
            
            self.presentViewController(loginViewController, animated: true, completion: nil)
        }
    }
    
    //Checks if username and password are empty
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool
    {
        if (!username.isEmpty || !password.isEmpty)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    //Closes login view after user logs in
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Checks for login error
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?)
    {
        println("Failed to login....")
    }
    
    //MARK: Parse SignUp
    
    //Closes signup view after user signs in
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Checks for signup error
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?)
    {
        println("Failed to signup")
    }
    
    //Checks if user cancelled signup
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController)
    {
        println("User dismissed signup")
    }
    
    //Logs out user
    func logoutAction()
    {
        println("logging out")
        PFUser.logOut()
        self.loginSetup()
    }

}
