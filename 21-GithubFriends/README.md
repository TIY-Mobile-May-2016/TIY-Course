# 21 -- Github Friends

## Agenda

### Daily Rituals

* Standup Meeting ~15min
* Demos - Homework

### Topics

* How to get images using NSURLSession
* Github API
* More practice with JSON and moving data to models

## Homework - GitHub Friends

You will be building an app that is *very* similar to the app we build today in class, except it will be talking to GitHub rather than iTunes.

See [this example](https://api.github.com/users/touchopia) of the data received from GH for a look at the JSON.

### Assignment Checklist
```markdown

#### Normal Mode

* [ ] Create a data model class called ```Friend```.
* [ ] In your call to the APIController, search for a friend with a particular GH username.
      Use the following line to create a URL object for the GitHub API:
      let url = NSURL(string: "https://api.github.com/users/" + username) // replace username with the user you want to search for.
* [ ] Display the name of the GitHub user(s) in a tableview.

* [ ] Create a UIViewController subclass called ```NewFriendViewController```:
  * [ ] Add to the view a textfield, a button to initiate a search, and a button to cancel.
  * [ ] Create two methods, one for the cancel button and one for the search button. Connect them to their respective buttons with the ```addTarget``` function.
  * [ ] Place the textfield and two buttons on the screen with ```setFrame```.
  * [ ] In the cancel method you create, have the view dismiss itself.
  * [ ] In the search method you create, have the view dismiss itself and initiate a search using the an APIController object for the username against the GitHub API.

* [ ] Create a UIViewController subclass called ```FriendDetailViewController```:
  * [ ] Create 4 UILabel properties: the user's name and three other properties of your choosing
  * [ ] Configure them with data from the Friend object and add them to the view

#### Hard Mode

In ```FriendDetailViewController```:
* [ ] Remove the "name" label and move the friend's name into the title of the view.
* [ ] Add a ```UIImageView``` property to the view controller and configure it to show the user's avatar. Place it on the screen somewhere. The upper right corner might be a good place, or perhaps below the other labels?

```
