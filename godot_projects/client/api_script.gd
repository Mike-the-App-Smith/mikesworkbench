extends Node

# copy into index.gd

func _get_api_data():
	$HTTTPRequest.request("https://jsonplaceholder.typicode.com/todos/1")
	pass

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	# XML.parse ? other formats?
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result)
	var data = json.result
	pass
	
	# str(data.key name) prints out the value

func putDataOnAPI():
	var jsonObj = {
		"key": "value",
		"Kewt": {
			"inner json": "inner values"
		}
	}
	var query = JSON.print(jsonObj)
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request("https://jsonplaceholder.typicode.com/todos",headers,true,HTTPClient.METHOD_POST,query) # data using put method to add to server
	pass
