function transform(line) {
var values = line.split(',');

var obj = new Object();
obj.timestamp = values[0];
obj.location = values[1];
obj.product = values[2];
obj.condition = values[3];
obj.age = values[4];
obj.start_weight = values[5];
obj.end_weight = values[6];
var jsonString = JSON.stringify(obj);

return jsonString;
}