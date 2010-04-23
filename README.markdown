This is a demo iPhone REST Client app that interacts with the [Ruby on Rails on App Engine project](http://github.com/freshblocks/iPhone-JSON "Ruby on Rails on App Engine project").

It uses [httpriot](http://labratrevenge.com/httpriot/ "httpriot") library for REST calls and integrated JSON Framework.

Notes:
This app is using a Singleton for the Contacts Array to minimize GET update calls to the server. This is not recommended for production apps and is only being used since this demo app does not follow the regular Navigation path for iPhone Apps. This is done on purpose to demonstrate the different CRUD methods of REST.

TODO:
1. Currently only supporting JSON. Plans to add format swapping to XML.
