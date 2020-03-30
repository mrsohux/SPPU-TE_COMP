var app=angular.module("simpleApp",[]);
app.controller("simpleController",function($scope)
{
   $scope.collection=[
	{name:"Amit",age:22,city:"Pune"},
	{name:"Neha",age:21,city:"Nashik"}];
   $scope.addEntry=function()
{ 
	$scope.collection.push($scope.newData); 
	$scope.newData='';
};
});
		
