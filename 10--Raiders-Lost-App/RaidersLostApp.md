# Homework - Raiders of the Lost App

### Normal Mode

Create a single view application that shows at least 10 characters from the [Indiana Jones movies](https://en.wikipedia.org/wiki/List_of_Indiana_Jones_characters) in a tableview. Create a model class called _IndyCharacter_ that can model three attributes as properties. Build this app in the same manner that we've used so far in class. So start with the most trivial implementation of the tableview and build from there, one step at a time.

[Info on JSON syntax](https://en.wikipedia.org/wiki/JSON#Data_types.2C_syntax_and_example). Contains an example as well.

### Hard Mode

Once you have an application that can display each site in a tableviewcell and show one of the attributes from the model object, create a custom cell class and  set it up to display the name and the three properties from the model.

### Objectives

After completing this assignment, you should…

* have additional practice with model classes, creating JSON files and reading from them, and showing a tableview of data in a straightforward way to the user.

### Assignment Checklist
```markdown

#### Normal Mode

* [ ] Create a model class and add appropriate attributes
* [ ] Create a JSON file to use for your input data
* [ ] Read in the JSON file in the view controller and create a model object for each record.
* [ ] Display the name and one of the attributes in the cell
* [ ] Create a second view controller that will display all the site data when a cell is tapped.

#### Hard Mode

* [ ] Create a custom cell class and add UI elements to display the various properties from the model
* [ ] Modify the view controller to use the custom cell
```