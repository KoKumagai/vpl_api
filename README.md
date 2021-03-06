# VPL API

VPL API is a unofficial Vancouver Public Library Web API.

## Usage
### Search

#### Format:

|URL  | Input |Output|
|:---|:---|:---|
|https://vplapi.herokuapp.com/v1/search.json|keyword :  *required<br>category : [keyword, title, author, series, subject, tag]<br>page|status<br>title<br>author<br>rating<br>format<br>callNumber<br> availability|

#### Example:
    https://vplapi.herokuapp.com/v1/search.json?keyword=head%20first&category=keyword&page=1

#### Output:
```json
{
   "status":"OK",
   "info":[
      {
         "title":"Head First",
         "author":"Goldfrapp (Musical group)",
         "rating":3.5,
         "format":"MusicCD-2010",
         "callNumber":"YA784.5 G6183h",
         "availability":"Available"
      },
      {
         "title":"Head First",
         "author":"Buzan, Tony",
         "rating":4.5,
         "format":"Book-2000",
         "callNumber":"153 B99h",
         "availability":"Available"
      },
      {
         "title":"Head First",
         "author":"Cousins, Norman",
         "rating":null,
         "format":"Book-1989",
         "callNumber":"616.08 C86h",
         "availability":"Available"
      },
      {
         "title":"Head First Android Development",
         "author":"Griffiths, Dawn",
         "rating":5,
         "format":"Book-2015",
         "callNumber":"005.44 A5G8h",
         "availability":"All copies in use."
      },
      {
         "title":"Head First Ruby",
         "author":"McGavren, Jay",
         "rating":null,
         "format":"Book-2015",
         "callNumber":"005.133 R8M1h",
         "availability":"All copies in use."
      },
      {
         "title":"Head First C#",
         "author":"Stellman, Andrew",
         "rating":2.5,
         "format":"Book-2013",
         "callNumber":"005.133 C1S8h1",
         "availability":"Available"
      },
      {
         "title":"Head First PHP \u0026 MySQL",
         "author":"Beighley, Lynn",
         "rating":5,
         "format":"Book-2009",
         "callNumber":"005.133 P11B42h",
         "availability":"All copies in use."
      },
      {
         "title":"Head First Rails",
         "author":"Griffiths, David",
         "rating":3,
         "format":"Book-2009",
         "callNumber":"005.133 R8G8h",
         "availability":"All copies in use."
      },
      {
         "title":"Head First Networking",
         "author":"Anderson, Al",
         "rating":4.5,
         "format":"Book-2009",
         "callNumber":"004.6 A54h",
         "availability":"All copies in use."
      },
      {
         "title":"Head First PMP",
         "author":"Greene, Jennifer",
         "rating":null,
         "format":"Book-2013",
         "callNumber":"658.404076 G79h 2013",
         "availability":"All copies in use."
      },
      {
         "title":"Head First HTML and CSS",
         "author":"Robson, Elisabeth",
         "rating":4.5,
         "format":"Book-2012",
         "callNumber":"005.75 H11R6h",
         "availability":"All copies in use."
      },
      {
         "title":"Head First Design Patterns",
         "author":"",
         "rating":4.5,
         "format":"Book-2004",
         "callNumber":"005.1 H43f",
         "availability":"All copies in use."
      },
      {
         "title":"Head First HTML5 Programming",
         "author":"Freeman, Eric",
         "rating":3.5,
         "format":"Book-2011",
         "callNumber":"005.75 H11F8h",
         "availability":"Available"
      },
      {
         "title":"Head First 2D Geometry",
         "author":"Fallow, Lindsey",
         "rating":2,
         "format":"Book-2010",
         "callNumber":"516.9 F19h",
         "availability":"Available"
      },
      {
         "title":"Head First Algebra",
         "author":"Pilone, Tracey",
         "rating":3,
         "format":"Book-2009",
         "callNumber":"512 P64h",
         "availability":"Available"
      },
      {
         "title":"Head First Statistics",
         "author":"Griffiths, Dawn",
         "rating":4,
         "format":"Book-2009",
         "callNumber":"519.5 G85h",
         "availability":"Available"
      },
      {
         "title":"Head First Software Development",
         "author":"Pilone, Dan",
         "rating":4,
         "format":"Book-2008",
         "callNumber":"005.1 P64h",
         "availability":"Available"
      },
      {
         "title":"Head First Object-oriented Analysis and Design",
         "author":"McLaughlin, Brett",
         "rating":2,
         "format":"Book-2007",
         "callNumber":"005.117 M16h",
         "availability":"Available"
      },
      {
         "title":"Head First JavaScript Programming",
         "author":"Freeman, Eric",
         "rating":4.5,
         "format":"Book-2014",
         "callNumber":"005.133 J41F85h",
         "availability":"Available"
      },
      {
         "title":"HOLST, G.: Hymn of Jesus (The) / First Choral Symphony / The Wandering Scholar / At the Boar's Head (Atherton, Bedford, Boult, Groves)",
         "author":"",
         "rating":null,
         "format":"StreamingMusic-2009",
         "callNumber":"",
         "availability":""
      },
      {
         "title":"HEAD FIRST PHP \u0026 MYSQL",
         "author":"Beighley, Lynn",
         "rating":null,
         "format":"Book",
         "callNumber":"ON ORDER",
         "availability":"On order"
      },
      {
         "title":"First Nations Head Start Standards Guide",
         "author":"Canada",
         "rating":null,
         "format":"WebsiteorOnlineData-2001?",
         "callNumber":"362.71 C2123f",
         "availability":""
      },
      {
         "title":"First You Shave your Head",
         "author":"Larkin, Geri",
         "rating":null,
         "format":"Book-2001",
         "callNumber":"294.34 L32f",
         "availability":"Available"
      },
      {
         "title":"First Nations Head Start",
         "author":"",
         "rating":null,
         "format":"Book-2001",
         "callNumber":"362.71025 F52h",
         "availability":""
      },
      {
         "title":"Head-first Acting",
         "author":"Miller, Bruce J.",
         "rating":null,
         "format":"Book-2001",
         "callNumber":"792.028 M647h",
         "availability":"Available"
      }
   ]
}
```
