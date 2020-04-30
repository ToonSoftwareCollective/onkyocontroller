//
// Onkyocontroller v1.0.0 by Oepi-Loepi
//
//domoticzURL1 : "http://192.168.10.185:8080" ,,  idxOnOff : "94" ,, idxMS : "92" ,,  idxCOM : "95" ,, idxTitle : "101"  ,, idxPT : "102"  ,, idxArtist : "104"

import QtQuick 2.1
import qb.components 1.0
import qb.base 1.0;
import ScreenStateController 1.0
import FileIO 1.0

App {
	id: onkyocontrollerApp

	property url tileUrl : "OnkyocontrollerTile.qml"
	property url thumbnailIcon: "qrc:/tsc/onkyo-resize.png"
	property url onkyocontrollerConfigScreenUrl : "OnkyocontrollerConfigScreen.qml"

	property OnkyocontrollerConfigScreen onkyocontrollerConfigScreen

	property string actualArtist
	property string actualTitle
	property string actualPlaytime
	property string actualSelector
	property string actualPower
	property string actualStation
	property bool actualArtistLong : false
	property bool actualTitleLong : false
	property bool actSelector : false
	property bool actPower : false
	property bool actRadio : false
	property bool showButtons : false
	property bool enableSleep : false

	property string domoticzURL1 : "http://192.168.10.185:8080"
	property string idxOnOff : "94"
	property string idxMS : "92"
	property string idxCOM : "95"
	property string idxTitle : "101"
	property string idxPT : "102"
	property string idxArtist : "104"
	property string radioStation1 : "R10"
	property string radioStation2 : "Q"
	property string radioStation3 : "3FM"
	property string radioStation4 : "538"
	property string tmpSleep : "No"


	// user settings from config file
	property variant onkyocontrollerSettingsJson : {
		'domoticzURL1': "",
		'idxOnOff': "",
		'idxMS': "",
		'idxCOM': "",
		'iidxTitle': "",
		'idxPT': "",
		'idxArtist': "",
		'radioStation1': "",
		'radioStation2': "",
		'radioStation3': "",
		'radioStation4': "",
		'tmpSleep': ""
	}



	FileIO {
		id: onkyocontrollerSettingsFile
		source: "file:///mnt/data/tsc/onkyocontroller_userSettings.json"
 	}


	function init() {
		registry.registerWidget("tile", tileUrl, this, null, {thumbLabel: qsTr("Onkyo"), thumbIcon: thumbnailIcon, thumbCategory: "general", thumbWeight: 30, baseTileWeight: 10, thumbIconVAlignment: "center"});
		registry.registerWidget("screen", onkyocontrollerConfigScreenUrl, this, "onkyocontrollerConfigScreen");
	}
	
	Connections {
		target: screenStateController
		onScreenStateChanged: {
			if (screenStateController.screenState == ScreenStateController.ScreenColorDimmed || screenStateController.screenState == ScreenStateController.ScreenOff) {
				onkyoPlayInfoTimer.stop();
				onkyoPlayInfoTimer.interval = 10000;
				onkyoPlayInfoTimer.start();
			} else {
				onkyoPlayInfoTimer.stop();
				onkyoPlayInfoTimer.interval = 5000;
				onkyoPlayInfoTimer.start();
			}
		}
	}


	function readOnkyoState() {

		var xmlhttp4 = new XMLHttpRequest();
		xmlhttp4.onreadystatechange=function() {
			if (xmlhttp4.readyState == XMLHttpRequest.DONE) {
				if (xmlhttp4.status == 200) {
						var JsonString4 = xmlhttp4.responseText;
        					var JsonObject4= JSON.parse(JsonString4);
						actualPower = JsonObject4.result[0].Data;
						if (actualPower == 'On') {
							actPower = true;
						}else{
							actPower = false;
							actualTitle = "";
							actualArtist = "";
						}
				}
			}
		}
		xmlhttp4.open("GET", domoticzURL1 + "/json.htm?type=devices&rid=" + idxOnOff);
		//xmlhttp4.open("GET", "http://192.168.10.185:8080/json.htm?type=devices&rid=94");
		xmlhttp4.send();

		if (actPower){
			var xmlhttp5 = new XMLHttpRequest();
			xmlhttp5.onreadystatechange=function() {
				if (xmlhttp5.readyState == XMLHttpRequest.DONE) {
					if (xmlhttp5.status == 200) {
							var JsonString5 = xmlhttp5.responseText;
        						var JsonObject5= JSON.parse(JsonString5);
							actualSelector = JsonObject5.result[0].Data;
							if ((actualSelector == 'Set Level: 120 %') || (actualSelector == 'Set Level: 130 %')) {
								actSelector = true;
								actRadio=false;
							}else{
								if (actualSelector == 'Set Level: 80 %'){
									actRadio=true;	
								}else{
									actRadio=false;
								}
								actSelector = false;
								actualTitle = "";
								actualArtist = "";							
							}
					}
				}
			}
			xmlhttp5.open("GET", domoticzURL1 + "/json.htm?type=devices&rid=" + idxMS);
			xmlhttp5.send();

			if (actSelector){
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange=function() {
					if (xmlhttp.readyState == XMLHttpRequest.DONE) {
						if (xmlhttp.status == 200) {
								var JsonString = xmlhttp.responseText;
        							var JsonObject= JSON.parse(JsonString);
        							actualTitle = JsonObject.result[0].Data;
								if (actualTitle.length > 22) {
									actualTitleLong = true;
								}else{
									actualTitleLong = false;
								}
						}
					}
				}

				xmlhttp.open("GET", domoticzURL1 + "/json.htm?type=devices&rid=" + idxTitle);
				xmlhttp.send();

				var xmlhttp2 = new XMLHttpRequest();
				xmlhttp2.onreadystatechange=function() {
					if (xmlhttp2.readyState == XMLHttpRequest.DONE) {
						if (xmlhttp2.status == 200) {
								var JsonString2 = xmlhttp2.responseText;
        							var JsonObject2= JSON.parse(JsonString2);
								actualArtist = JsonObject2.result[0].Data;
								if (actualArtist.length > 22) {
									actualArtistLong = true;
								}else{
									actualArtistLong = false;
								}
						}
					}
				}
				xmlhttp2.open("GET", domoticzURL1 + "/json.htm?type=devices&rid=" + idxArtist);
				xmlhttp2.send();

				var xmlhttp3 = new XMLHttpRequest();
				xmlhttp3.onreadystatechange=function() {
					if (xmlhttp3.readyState == XMLHttpRequest.DONE) {
						if (xmlhttp3.status == 200) {
								var JsonString3 = xmlhttp3.responseText;
        							var JsonObject3= JSON.parse(JsonString3);
								actualPlaytime = JsonObject3.result[0].Data;
						}
					}
				}
				xmlhttp3.open("GET", domoticzURL1 + "/json.htm?type=devices&rid=" + idxPT);
				xmlhttp3.send();
			}
		}
	}

	function simpleSynchronous(request) {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", request, true);
		xmlhttp.timeout = 1500;
		xmlhttp.send();
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState == 4) {
				if (xmlhttp.status == 200) {
					if (typeof(functie) !== 'undefined') {
						functie(parameter);
					}
				}
			}
		}
	}
	
	Timer {
		id: onkyoPlayInfoTimer
		interval: 5000
		triggeredOnStart: true
		running: true
		repeat: true
		onTriggered: readOnkyoState()
	}


	Component.onCompleted: {
		try {
			onkyocontrollerSettingsJson = JSON.parse(onkyocontrollerSettingsFile.read());
			if (onkyocontrollerSettingsJson['tmpSleep'] == "Yes") {
				enableSleep = true
			} else {
				enableSleep = false
			}

			domoticzURL1 = onkyocontrollerSettingsJson['domoticzURL1'];
			idxOnOff = onkyocontrollerSettingsJson['idxOnOff'];
			idxMS = onkyocontrollerSettingsJson['idxMS'];
			idxCOM = onkyocontrollerSettingsJson['idxCOM'];
			idxTitle = onkyocontrollerSettingsJson['idxTitle'];
			idxPT = onkyocontrollerSettingsJson['idxPT'];
			idxArtist = onkyocontrollerSettingsJson['idxArtist'];
			radioStation1 = onkyocontrollerSettingsJson['radioStation1'];
			radioStation2 = onkyocontrollerSettingsJson['radioStation2'];
			radioStation3 = onkyocontrollerSettingsJson['radioStation3'];
			radioStation4 = onkyocontrollerSettingsJson['radioStation4'];
		
		} catch(e) {
		}
	}


	function saveSettings() {

		if (enableSleep == true) {
			tmpSleep = "Yes";
		} else {
			tmpSleep = "No";
		}

 		var setJson = {
			"domoticzURL1" : domoticzURL1,
			"idxOnOff" : idxOnOff,
			"idxMS" : idxMS,
			"idxCOM" : idxCOM,
			"idxTitle" : idxTitle,
			"idxPT" : idxPT,
			"idxArtist" : idxArtist,
			"radioStation1" : radioStation1,
			"radioStation2" : radioStation2,
			"radioStation3" : radioStation3,
			"radioStation4" : radioStation4,
			"tmpSleep" : tmpSleep
		}
  		var doc3 = new XMLHttpRequest();
   		doc3.open("PUT", "file:////mnt/data/tsc/onkyocontroller_userSettings.json");
   		doc3.send(JSON.stringify(setJson));
	}
}
