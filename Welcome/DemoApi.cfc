component rest="true"   restpath="Demo" {
	
	string function sayHello(required string name restargsource="query") access = "remote"  httpmethod="GET" produces="text/plain" restpath="hello" {
		
		return "Hello "&name&", Welcome to CFSummit 2016 !!!";
	}
}

