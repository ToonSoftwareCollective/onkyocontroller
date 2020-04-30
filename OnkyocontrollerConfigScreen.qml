import QtQuick 2.1
import qb.components 1.0
import BasicUIControls 1.0;

Screen {
	id: onkyocontrollerConfigScreen
	screenTitle: "Onkyocontroller app Setup"

	function saveDomoticzURL1(text) {
		if (text) {
			app.domoticzURL1 = text;
		}
	}

	function saveidxOnOff(text) {
		if (text) {
			app.idxOnOff = text;
		}
	}

	function saveidxMS(text) {
		if (text) {
			app.idxMS = text;
		}
	}

	function saveidxCOM(text) {
		if (text) {
			app.idxCOM = text;
		}
	}

	function saveidxTitle(text) {
		if (text) {
			app.idxTitle = text;
		}
	}

	function saveidxPT(text) {
		if (text) {
			app.idxPT = text;
		}
	}

	function saveidxArtist(text) {
		if (text) {
			app.idxArtist = text;
		}
	}

	function saveradioStation1(text) {
		if (text) {
			app.radioStation1 = text;
		}
	}

	function saveradioStation2(text) {
		if (text) {
			app.radioStation2 = text;
		}
	}

	function saveradioStation3(text) {
		if (text) {
			app.radioStation3 = text;
		}
	}

	function saveradioStation4(text) {
		if (text) {
			app.radioStation4 = text;
		}
	}

	onShown: {
		domoticzURL1.inputText = app.domoticzURL1;
		idxOnOff.inputText = app.idxOnOff;
		idxMS.inputText = app.idxMS;
		idxCOM.inputText = app.idxCOM;
		idxTitle.inputText = app.idxTitle;
		idxPT.inputText = app.idxPT;
		idxArtist.inputText = app.idxArtist;

		radioStation1.inputText = app.radioStation1;
		radioStation2.inputText = app.radioStation2;
		radioStation3.inputText = app.radioStation3;
		radioStation4.inputText = app.radioStation4;

		enableSleepToggle.isSwitchedOn = app.enableSleep;

		addCustomTopRightButton("Save");
	}

	onCustomButtonClicked: {
		app.saveSettings();
		hide();
	}

	Text {
		id: myLabel
		text: "URL to Domoticz (example: http://192.168.10.185:8080)"
		anchors {
			left: parent.left
			top: parent.top			
			leftMargin: 20
			topMargin: 10
		}
	}

	EditTextLabel4421 {
		id: domoticzURL1
		width: parent.width - 40
		height: 35
		leftTextAvailableWidth: 300
		leftText: "Domoticz URL"

		anchors {
			left: parent.left
			top: myLabel.bottom
			leftMargin: 20
			topMargin: 10
		}

		onClicked: {
			qkeyboard.open("URL to Domoticz incl. Port", domoticzURL1.inputText, saveDomoticzURL1)
		}
	}


	Text {
		id: myLabel2
		text: "IDX from Domoticz (Devices Tab) :"
		anchors {
			left: parent.left
			top: domoticzURL1.bottom
			leftMargin: 20
			topMargin: 30
		}
	}

	EditTextLabel4421 {
		id: idxOnOff
		width: (parent.width/2) - 40
		height: 35
		leftTextAvailableWidth: 200
		leftText: "Master power"

		anchors {
			left: parent.left
			top: myLabel2.bottom
			leftMargin: 20
			topMargin: 6
		}

		onClicked: {
			qkeyboard.open("Master Power", idxOnOff.inputText, saveidxOnOff)
		}
	}


	EditTextLabel4421 {
		id: idxMS
		width: (parent.width/2) - 40
		height: 35
		leftTextAvailableWidth: 200
		leftText: "Master selector"

		anchors {
			left: parent.left
			top: idxOnOff.bottom
			leftMargin: 20
			topMargin: 6
		}

		onClicked: {
			qkeyboard.open("Master selector", idxMS.inputText, saveidxMS)
		}
	}

	EditTextLabel4421 {
		id: idxCOM
		width: (parent.width/2) - 40
		height: 35
		leftTextAvailableWidth: 200
		leftText: "Master Volume"

		anchors {
			left: parent.left
			top: idxMS.bottom
			leftMargin: 20
			topMargin: 6
		}

		onClicked: {
			qkeyboard.open("Master Volume", idxCOM.inputText, saveidxCOM)
		}
	}

	EditTextLabel4421 {
		id: idxTitle
		width: (parent.width/2) - 40
		height: 35
		leftTextAvailableWidth: 200
		leftText: "Onkyo Title Name"

		anchors {
			left: parent.left
			top: idxCOM.bottom
			leftMargin: 20
			topMargin: 6
		}

		onClicked: {
			qkeyboard.open("Onkyo Title Name", idxTitle.inputText, saveidxTitle)
		}
	}

	EditTextLabel4421 {
		id: idxPT
		width: (parent.width/2) - 40
		height: 35
		leftTextAvailableWidth: 200
		leftText: "Playback time"

		anchors {
			left: parent.left
			top: idxTitle.bottom
			leftMargin: 20
			topMargin: 6
		}

		onClicked: {
			qkeyboard.open("Playback time", idxPT.inputText, saveidxPT)
		}
	}

	EditTextLabel4421 {
		id: idxArtist
		width: (parent.width/2) - 40
		height: 35
		leftTextAvailableWidth: 200
		leftText: "Onkyo Artist"

		anchors {
			left: parent.left
			top: idxPT.bottom
			leftMargin: 20
			topMargin: 10
		}

		onClicked: {
			qkeyboard.open("Onkyo Artist", idxArtist.inputText, saveidxArtist)
		}
	}

	Text {
		id: myLabel22
		text: "Radio Station Names :"
		anchors {
			left: idxArtist.right
			top: domoticzURL1.bottom
			leftMargin: 20
			topMargin: 30
		}
	}

	EditTextLabel4421 {
		id: radioStation1
		width: (parent.width/2) - 40
		height: 35
		leftTextAvailableWidth: 200
		leftText: "Radiostation 1 Name"

		anchors {
			left: idxArtist.right
			top: myLabel2.bottom
			leftMargin: 20
			topMargin: 6
		}

		onClicked: {
			qkeyboard.open("Radiostation 1 Name (3 Letter)", radioStation1.inputText, saveradioStation1)
		}
	}

	EditTextLabel4421 {
		id: radioStation2
		width: (parent.width/2) - 40
		height: 35
		leftTextAvailableWidth: 200
		leftText: "Radiostation 2 Name"

		anchors {
			left: idxArtist.right
			top: radioStation1.bottom
			leftMargin: 20
			topMargin: 6
		}

		onClicked: {
			qkeyboard.open("Radiostation 2 Name (3 Letter)", radioStation2.inputText, saveradioStation2)
		}
	}

	EditTextLabel4421 {
		id: radioStation3
		width: (parent.width/2) - 40
		height: 35
		leftTextAvailableWidth: 200
		leftText: "Radiostation 3 Name"

		anchors {
			left: idxArtist.right
			top: radioStation2.bottom
			leftMargin: 20
			topMargin: 6
		}

		onClicked: {
			qkeyboard.open("Radiostation 3 Name (3 Letter)", radioStation3.inputText, saveradioStation3)
		}
	}


	EditTextLabel4421 {
		id: radioStation4
		width: (parent.width/2) - 40
		height: 35
		leftTextAvailableWidth: 200
		leftText: "Radiostation 4 Name"

		anchors {
			left: idxArtist.right
			top: radioStation3.bottom
			leftMargin: 20
			topMargin: 6
		}

		onClicked: {
			qkeyboard.open("Radiostation 4 Name (3 Letter)", radioStation4.inputText, saveradioStation4)
		}
	}

	Text {
		id: showInSleep
		width:  160
		text: "Show in Sleepmode"
		anchors {
			left: idxArtist.right
			top: radioStation4.bottom
			leftMargin: 20
			topMargin: 30
		}
	}

	OnOffToggle {
		id: enableSleepToggle
		height:  30
		anchors.left: showInSleep.right
		anchors.leftMargin: 10
		anchors.top: showInSleep.top
		leftIsSwitchedOn: false
		onSelectedChangedByUser: {
			if (isSwitchedOn) {
				app.enableSleep = true;
			} else {
				app.enableSleep = false;
			}
		}
	}


}

