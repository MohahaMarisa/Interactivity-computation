//convert hershey raw data to fit specified size
//every even index of array represents x coordinates
//every odd represents y coordinates
var whatarray = [9,21, 6,20, 4,17, 3,12, 3, 9, 4, 4, 6, 1, 9, 0,11, 0,14, 1,16,
	4,17,9,17,12,16,17,14,20,11,21, 9,21];
var totalWidth = 20;
var desiredWidth = 700;
var totalHeight = 21;
var desiredHeight = 700;
function setup(){
}
function draw(){
	noLoop();
}
function convert(){
	//(x coordinate/totalwidth x desired width) = new x coordinate
	//totalHeight-(ycoordinate/totalheight x desired height) = new y coordinate
	//why is it totalHeight-  something for y? Because the hershey data is flipped
	for(var i=0; i<whatarray.length; i++){
		var isItEven = i%2;
		if(isItEven){//if index is even, we kno it's an x coordinate
			var newX = whatarray[i]/totalWidth*desiredWidth;
			whatarray[i] = newX;
		}
		else if (!isItEven){
			var newY = totalHeight - (whatarray[i]/totalheight*desiredHeight);
			whatarray[i] = newY;
		}
	}
	print("var whatarray = ["+whatarray+"]");
}