package ua.utils;

import haxe.ds.StringMap;
import haxe.rtti.Meta;

class QueryString {

	var parametersMap:StringMap<String>;
	
	public function new(?paramsObj:Dynamic) {
		parametersMap = new StringMap<String>();

		if(paramsObj!=null)
			addParamsObj(paramsObj);
	}

	public function addParamsObj(paramsObj:Dynamic):Void {
		var t = Type.getClass(paramsObj); //Get class object
		//var classMeta = Meta.getType(t); //Get class meta data

		while(t!=null) {
			var propertiesMeta = Meta.getFields(t); //Get fields meta data

			for(propertyName in Reflect.fields(propertiesMeta)) {
				var propertyMeta = Reflect.field(propertiesMeta, propertyName);
				if(Reflect.hasField(propertyMeta, "param")) {
					if(Reflect.getProperty(paramsObj, propertyName)!=null) { //Add non-null params only
						parametersMap.set(propertyMeta.param[0], Reflect.getProperty(paramsObj, propertyName));
					}
				}
			}

			t = Type.getSuperClass(t);
		}
	}

	public function toString():String {
		var queryString = "";

		for(paramName in parametersMap.keys()) {
			if(queryString.length != 0)
				queryString += "&";
			queryString += StringTools.urlEncode(paramName)+"="+StringTools.urlEncode(parametersMap.get(paramName));
		}

		return queryString;
	}
}