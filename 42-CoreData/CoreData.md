

1. Step 1 add the DataController.swift file to your project.

2. Create a new data model file. (File -> New -> Core Data)

3. Rename the DataController name of the new data to model.

4. Make sure the App runs without crashing once this is setup.

5. Create a constant for the managed object context (moc)

```
  let moc = DataController().managedObjectContext
```

6. Save the Entity

```
let entity = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: moc) as! Person

entity.setValue(name, forKey: "name")

do {
    try moc.save()

} catch {

    fatalError("failure to save context \(error)")
}
```

7. Fetching the Data

```
let fetchPerson = NSFetchRequest(entityName: "Person")

        do {
            let personsArray = try moc.executeFetchRequest(fetchPerson) as! [Person]
        } catch {
            fatalError("failure to fetch person \(error)")
      }
```
