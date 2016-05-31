# Star Wars - TableView Edition

Build a tableview-based app that shows a list of characters and their images. Once you tap on one of the characters, open a "Profile" view of the character - with details about them. For example, an UIImageView with their large profile picture, their name and what ship they pilot.

### Objectives

After completing this assignment, you should…

* Know how to use a UITableView to display a list of related data
* Be able to create a model class to store information and easily transport this info around the app.
* Have more practice with Auto Layout.


### Assignment Checklist
```markdown
### Normal Mode

* [ ] Create a new Single View Application.
* [ ] Drag a UITableView into the Storyboard Canvas.
* [ ] Set the Auto Layout constraints of the UITableView.
* [ ] Add 1 Prototype Cell to the UITableView (Dynamic Prototypes)
* [ ] Set the Resuse Identifier to "StarWarsCell"
* [ ] Create an IBOutlet to the tableView.
* [ ] Embed the ViewController in a UINavigationController
* [ ] Add a new subclass of ViewController called CharacterDetailViewController
* [ ] Add a segue between the ViewController and the CharacterDetailViewController
* [ ] Name the segue "SegueToInfo"
* [ ] IMPORTANT: Set the delegate and data source properties to your ViewController.
* [] IMPORTANT: Set the tableView resuse identifier to "Cell" in the Storybaord
* [ ] Add a New File StarWarsCharacter subclass of NSObject
* [ ] Add the line #import "StarWarsCharacter.h" at the top of ViewController.m
* [ ] Add a property called name of type NSString
* [ ] Add a property called spaceship of type NSString
* [ ] Add the UITableViewDelegate and UITableViewDataSource in angle brackets to implement the protocol
* [ ] Adding a propery of type NSMutableArray called charactersArray
* [ ] Initialize the charactersArray in the viewDidLoad method
* [ ] Implement the numberOfRowsInSection returning [self.charactersArray count];
* [ ] Implement the cellForRowAtIndexPath method

```

### Source Code

```
UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
// Temporary pointer to one character in the array
StarWarsCharacter *theCharacter = [self.charactersArray objectAtIndex:indexPath.row];

// UILabel called textLabel that displays in the TableViewCell
cell.textLabel.text = theCharacter.name;
    
// returns the actual tableViewCell
return cell;

```

```

* [ ] Implement the didSelectRowAtIndexPath method
* [ ] Add the following line to the above method

```

```
    [self performSegueWithIdentifier:@"SegueToInfo" sender:nil];
```

```
* [ ] Import at the top of the ViewController the following line

```

```
#import "ProfileViewController.h"

```

```
* [ ] Implement the prepareForSegue method

```

```

```
```
@property (strong, nonatomic) StarWarsCharacter *currentCharacter;
```