class APIController: NSObject {

    func parseJSON(data: NSData?) -> JSONDictionary? {

        var theDictionary : JSONDictionary? = nil

        if let data = data {
            do {

                if let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {

                    theDictionary = jsonDictionary
                    //print(jsonDictionary)

                } else {
                    print("Could not parse jsonDictionary")
                }
            } catch {
            }
        } else {
            print("Could not unwrap data")
        }
        return theDictionary
    }
}
