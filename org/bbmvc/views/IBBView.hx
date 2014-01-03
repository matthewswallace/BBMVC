package org.bbmvc.views;

interface IBBView 
{
	var name:String;
	var viewId:String;
	function destroy():Void;
	function update(?updateType:String="", ?data:Dynamic=null):Void;
}