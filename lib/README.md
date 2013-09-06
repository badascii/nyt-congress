API Transformation Code Challenge
========================

Your challenge, should you accept it, is to create a script that consumes an API and transforms it into something more useful. This is something we do all the time, especially for those in the middle-end JSMVC camp. Taking an XML feed and turning it into JSON is of particular interest, but taking a poorly formatted JSON feed and turning it into something Angular can handle is very helpful.

Bonus points will be awarded to:

* Most elegant and readable solution
* Best named project
* Best test suite
* People who actually present their solutions :)

## Stage 1

* Create a class that consumes the XML feed from the [NYT Congressional API](http://developer.nytimes.com/docs/congress_api) and stores the parsed xml object in an instance variable.
* In particular, obtain a list of all the most recent bills, their title, and their most recent major action.
* Make a method that returns a json object with just those three items.

## Stage 2

Do one of the following:

* Take that response and serve it from Sinatra.
* Wrap the class in a gem and make it available for others to use via Sinatra.

API URIs:
/nominees/{nomination-category}[.response-format]?api-key={your-API-key}

MEMBERS
=======
/{congress-number}/{chamber}/members[.response-format]?[optional-params]&api-key={your-API-key}
/members/{member-id}[.response-format]?api-key={your-API-key}
/members/new[.response-format]?api-key={your-API-key}
/members/{chamber}/{state}/{district*}/current[.response-format]?api-key={your-API-key}
/{congress-number}/{chamber}/members/leaving[.response-format]?api-key={your-API-key}
/members/{member-id}/votes[.response-format]?api-key={your-API-key}
/members/{first-member-id}/votes/{second-member-id}/{congress-number}/{chamber}[.response-format]?api-key={your-API-key}
/members/{member-id}/bills/{type}[.response-format]?api-key={your-API-key}
/members/{member-id-1}/bills/{member-id-2}/{congress-number}/{chamber}[.response-format]?api-key={your-API-key}
/members/{member-id}/floor_appearances[.response-format]?api-key={your-API-key}

VOTES
=====
/{congress-number}/{chamber}/sessions/{session-number}/votes/{roll-call-number}[.response-format]?api-key={your-API-key}
/{congress-number}/{chamber}/votes/{vote-type}[.response-format]?api-key={your-API-key}
/{chamber}/votes/{year}/{month}[.response-format]?api-key={your-API-key}
/{chamber}/votes/{start-date}/{end-date}[.response-format]?api-key={your-API-key}
/{congress-number}/nominations[.response-format]?api-key={your-API-key}

BILLS
=====
/{congress-number}/{chamber}/bills/{type}[.response-format]?api-key={your-API-key}
/members/{member-id}/bills/{type}[.response-format]?api-key={your-API-key}
/{congress-number}/bills/{bill-id}[.response-format]?api-key={your-API-key}
/{congress-number}/bills/{bill-id}/{resource}[.response-format]?api-key={your-API-key}
/{congress-number}/bills/{bill-id}/cosponsors[.response-format]?api-key={your-API-key}

NOMINEES
========
/{congress-number}/nominees/{nomination-category}[.response-format]?api-key={your-API-key}
/{congress-number}/nominees/{nominee-ID}[.response-format]?api-key={your-API-key}
/{congress-number}/nominees/state/{state}[.response-format]?api-key={your-API-key}

OTHER
=====
/states/members/party[.response-format]?api-key={your-API-key}
/{congress-number}/{chamber}/committees[/committee-id][.response-format]?api-key={your-API-key}
/{chamber}/schedule[.response-format]?api-key={your-API-key}



