

if let user = FIRAuth.auth()?.currentUser {
  // User is signed in.
} else {
  // No user is signed in.
}

FIRAuth.auth()?.addAuthStateDidChangeListener {
  (auth, user) in
    if let user = user {
      // User is signed in.
    } else {
      // No user is signed in.
    }
}

if let user = FIRAuth.auth()?.currentUser {
  let name = user.displayName
  let email = user.email
  let photoUrl = user.photoURL
  let uid = user.uid;  // The user's ID, unique to the Firebase project.
                       // Do NOT use this value to authenticate with
                       // your backend server, if you have one. Use
                       // getTokenWithCompletion:completion: instead.
} else {
  // No user is signed in.
}

if let user = FIRAuth.auth()?.currentUser {
  for profile in user.providerData {
    let providerID = profile.providerID
    let uid = profile.uid;  // Provider-specific UID
    let name = profile.displayName
    let email = profile.email
    let photoURL = profile.photoURL
  }
} else {
  // No user is signed in.
}

let user = FIRAuth.auth()?.currentUser
if let user = user {
  let changeRequest = user.profileChangeRequest()

  changeRequest.displayName = "Jane Q. User"
  changeRequest.photoURL =
      NSURL(string: "https://example.com/jane-q-user/profile.jpg")
  changeRequest.commitChangesWithCompletion { error in
    if let error = error {
      // An error happened.
    } else {
      // Profile updated.
    }
  }
}


let user = FIRAuth.auth()?.currentUser

user?.updateEmail("user@example.com") { error in
  if let error = error {
    // An error happened.
  } else {
    // Email updated.
  }
}


let user = FIRAuth.auth()?.currentUser
let newPassword = getRandomSecurePassword()

user?.updatePassword(newPassword) { error in
  if let error = error {
    // An error happened.
  } else {
    // Password updated.
  }
}

let email = "user@example.com"

FIRAuth.auth()?.sendPasswordResetWithEmail(email) { error in
  if let error = error {
    // An error happened.
  } else {
    // Password reset email sent.
  }
}

let user = FIRAuth.auth()?.currentUser

user?.deleteWithCompletion { error in
  if let error = error {
    // An error happened.
  } else {
    // Account deleted.
  }
}

let user = FIRAuth.auth()?.currentUser
var credential: FIRAuthCredential

// Prompt the user to re-provide their sign-in credentials

user?.reauthenticateWithCredential(credential) { error in
  if let error = error {
    // An error happened.
  } else {
    // User re-authenticated.
  }
}

try! FIRAuth.auth()!.signOut()
