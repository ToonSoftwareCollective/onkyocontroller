//
// Onkyo app by Oepi-Loepi
//

import QtQuick 2.1
import BasicUIControls 1.0
import qb.components 1.0

Tile {
	id: onkyocontrollerTile

	property bool dimState: screenStateController.dimmedColors

	
	Rectangle {
     		id: simplebutton
     		color: "grey"
     		width: isNxt ? 280 : 220; height: isNxt ? 25 : 20
		
		radius: 4
     		Text{
         		id: buttonLabel
         		anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
         		text: "POWER ON"
     		}

		anchors {
			top: parent.top
			topMargin: 2
			horizontalCenter: parent.horizontalCenter	 		
		}

    		MouseArea{
         		id: buttonMouseArea
         		anchors.fill: parent 
         		onClicked: {app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=PWR01");}
     		}
    		visible: !dimState && !app.actPower
	}

	Rectangle {
     		id: simplebutton2
     		color: "grey"
     		width: isNxt ? 275 : 220; height: isNxt ? 25 : 20
		radius: 4
     		Text{
         		id: buttonLabel2
         		anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
         		text: "POWER OFF"
     		}
		anchors {
			top: parent.top
			topMargin: 2
			horizontalCenter: parent.horizontalCenter		
		}

    		MouseArea{
         		id: buttonMouseArea2
         		anchors.fill: parent 
         		onClicked: {app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=PWR00");}
     		}
    		visible: !dimState&&app.actPower
	}

	Rectangle {
     		id: simplebutton3
     		color: "blue"
		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42
		radius: 4    		
		Text{
         		id: buttonLabel3
         		anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name

         		text: "RADIO"
     		}
		anchors {
			top: simplebutton2.bottom
			topMargin: 3
			left: parent.left
			leftMargin:  isNxt ? 8 : 5 		
		}

    		MouseArea{
         		id: buttonMouseArea3
         		anchors.fill: parent 
         		onClicked: {app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=SLI24");app.showButtons=false;app.actRadio=true}
     		}
    		visible: !dimState && app.actPower && app.showButtons
	}

	Rectangle {
     		id: simplebutton4
     		color: "green"
     		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42
		radius: 4    		     		
		Text{
         		id: buttonLabel4
         		anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name

         		text: "TV"
     		}
		anchors {
			top: simplebutton2.bottom
			topMargin: 3
			left: simplebutton3.right
			leftMargin:  isNxt ? 3 : 2 		
		}

    		MouseArea{
         		id: buttonMouseArea4
         		anchors.fill: parent 
         		onClicked: {app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=SLI12");app.showButtons=false}
     		}
    		visible: !dimState  && app.actPower && app.showButtons

	}

	Rectangle {
     		id: simplebutton5
     		color: "magenta"
     		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42
		radius: 4    		     		
		Text{
         		id: buttonLabel5
         		anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
         		text: "NET"
     		}
		anchors {
			top: simplebutton2.bottom
			topMargin: 3
			left: simplebutton4.right
			leftMargin:  isNxt ? 3 : 2 		
		}

    		MouseArea{
         		id: buttonMouseArea5
         		anchors.fill: parent 
         		onClicked: {app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=SLI2b");app.showButtons=false}
     		}
    		visible: !dimState  && app.actPower && app.showButtons
	}

	Rectangle {
     		id: simplebutton6
     		color: "cyan"
     		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42
		radius: 4    		     		
		Text{
         		id: buttonLabel6
         		anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name

         		text: "BT"
     		}
		anchors {
			top: simplebutton2.bottom
			topMargin: 3
			left: simplebutton5.right
			leftMargin:  isNxt ? 3 : 2 		
		}

    		MouseArea{
         		id: buttonMouseArea6
         		anchors.fill: parent 
         		onClicked: {app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=SLI2e");app.showButtons=false}
     		}
    		visible: !dimState  && app.actPower && app.showButtons
	}

	Rectangle {
     		id: simplebutton61
     		color: "grey"
     		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42 
		radius: 4    		     		
		Text{
         		id: buttonLabel61
         		anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name

         		text: "<>"
     		}
		anchors {
			top: simplebutton2.bottom
			topMargin: 3
			left: simplebutton5.right
			leftMargin:  isNxt ? 3 : 2 		
		}

    		MouseArea{
         		id: buttonMouseArea61
         		anchors.fill: parent 
         		onClicked: {app.showButtons = true;}
     		}
    		visible: !dimState  && app.actPower && !app.showButtons
	}


	Rectangle {
     		id: simplebutton7
     		color: "grey"
     		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42 
		radius: 4    		     		
		Text{
         		id: buttonLabel7
         		anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name

         		text: app.radioStation1
     		}
		anchors {
			top: simplebutton3.bottom
			topMargin: 3
			left: parent.left
			leftMargin:  isNxt ? 8 : 5 		
		}

    		MouseArea{
         		id: buttonMouseArea7
         		anchors.fill: parent 
         		onClicked: {app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=PRS" + app.radioStation1nr);}
     		}
    		visible: !dimState && !app.actSelector && app.actPower && app.actRadio 
	}

	Rectangle {
     		id: simplebutton8
     		color: "grey"
     		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42 
		radius: 4    		     		
		Text{
         		id: buttonLabel8
         		anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
         		text: app.radioStation2
     		}
		anchors {
			top: simplebutton3.bottom
			topMargin: 3
			left: simplebutton7.right
			leftMargin:  isNxt ? 3 : 2 		
		}

    		MouseArea{
         		id: buttonMouseArea8
         		anchors.fill: parent 
         		onClicked: {app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=PRS" + app.radioStation2nr);}
     		}
    		visible: !dimState && !app.actSelector && app.actPower && app.actRadio 
	}

	Rectangle {
     		id: simplebutton9
     		color: "grey"
     		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42 
		radius: 4    		     		
		Text{
         		id: buttonLabel9
         		anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
         		text: app.radioStation3
     		}
		anchors {
			top: simplebutton3.bottom
			topMargin: 3
			left: simplebutton8.right
			leftMargin:  isNxt ? 3 : 2 		
		}

    		MouseArea{
         		id: buttonMouseArea9
         		anchors.fill: parent 
         		onClicked: {app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=PRS"  + app.radioStation3nr);}
     		}
    		visible: !dimState && !app.actSelector && app.actPower && app.actRadio

	}

	Rectangle {
     		id: simplebutton10
     		color: "grey"
     		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42 
		radius: 4    		     		
		Text{
         		id: buttonLabel10
         		anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
         		text: app.radioStation4
     		}
		anchors {
			top: simplebutton3.bottom
			topMargin: 3
			left: simplebutton9.right
			leftMargin:  isNxt ? 3 : 2 		
		}

    		MouseArea{
         		id: buttonMouseArea10
         		anchors.fill: parent 
         		onClicked: {app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=PRS"  + app.radioStation4nr);}
     		}
    		visible: !dimState && !app.actSelector && app.actPower && app.actRadio
	}

	Rectangle {
     		id: itemText
     		color: "transparent"
		width: isNxt ? 200 : 160; height: isNxt ? 53 : 42
		Text{
         		id: iText
         		width: parent.width
			//font.pixelSize: app.actualArtistLong||!dimState? 12 : 22
			font.pixelSize: ((app.actualTitleLong||!dimState) && !isNxt)? 12 : 22

			wrapMode: Text.WordWrap
         		text: app.actualArtist
			font.family: qfont.regular.name
			font.bold: true
			color: !dimState? "black" : "white"
     		}
		anchors {
			top: app.showButtons? simplebutton6.bottom : simplebutton.bottom
			topMargin: 3
			left: parent.left
			leftMargin:  isNxt ? 3 : 2		
		}
    		visible: app.actSelector && app.actPower && !app.showButtons && (app.enableSleep||!dimState)

	}

	Rectangle {
     		id: titleText
     		color: "transparent"
     		width: isNxt ? 200 : 160; height: isNxt ? 53 : 42     		
		Text{
         		id: tText
         		width: parent.width
			//font.pixelSize: app.actualTitleLong||!isNxt||!dimState?app.actualTitleLong||isNxt||!dimState?  12 : 22 : 22
			font.pixelSize: ((app.actualTitleLong||!dimState) && !isNxt)? 12 : 22 

			wrapMode: Text.WordWrap
         		text: app.actualTitle
			font.family: qfont.regular.name
			font.bold: true
			color: !dimState? "black" : "white"
     		}
		anchors {
			top: itemText.bottom
			topMargin: 2
			left: parent.left
			leftMargin:  isNxt ? 3 : 2		
		}
    		visible: app.actSelector && app.actPower && !app.showButtons && (app.enableSleep||!dimState)
	}

	Text {
		id:timeText

		text: app.actualPlaytime
		font.pixelSize:  isNxt ? 15 :12
		font.family: qfont.regular.name
		font.bold: false
		color: colors.clockTileColor
		wrapMode: Text.WordWrap
		anchors {
			right: parent.right
			rightMargin: 2
			bottom: parent.bottom
			bottomMargin: 1
		}
		visible:  app.actSelector && dimState && app.actPower && (app.enableSleep||!dimState)
	}

	//volume control session start here, first you'll find the first button.
	IconButton {
		id: volumeDown
		anchors {
			bottom: parent.bottom
			bottomMargin: 5
			left: parent.left
			leftMargin:  isNxt ? 6 : 2  		
		}

		iconSource: "qrc:/tsc/volume_down_small.png"
		onClicked: {
			app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=MVLDOWN1");
		}
		visible: !dimState && app.actPower
	}

	IconButton {
		id: prevButton
		anchors {
			left: volumeDown.right
			leftMargin:  isNxt ? 3 : 2 
			bottom: parent.bottom
			bottomMargin: 5
		}

		iconSource: "qrc:/tsc/left.png"
		onClicked: {
			app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=NTCTRDN");
		}
		visible:  !dimState && app.actSelector && app.actPower	
	}

	IconButton {
		id: playButton
		anchors {
			left: prevButton.right
			leftMargin:  isNxt ? 3 : 2 
			bottom: parent.bottom
			bottomMargin: 5
		}

		iconSource: "qrc:/tsc/play.png"
		onClicked: {
			app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=NTCPAUSE");
		}
		visible: !dimState && app.actSelector && app.actPower	
	}

	IconButton {
		id: shuffleOnButton
		anchors {
			left: playButton.right
			leftMargin:  isNxt ? 3 : 2 
			bottom: parent.bottom
			bottomMargin: 5
		}

		iconSource: "qrc:/tsc/shuffle.png"
		onClicked: {
			app.shuffleButtonVisible = false;
			app.shuffleOnButtonVisible = false;
			app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=NTCRANDOM");
		}
		visible: !dimState && app.actSelector && app.actPower		
	}
		
	IconButton {
		id: nextButton
		anchors {
			left: shuffleOnButton.right
			leftMargin:  isNxt ? 3 : 2 
			bottom: parent.bottom
			bottomMargin: 5

		}

		iconSource: "qrc:/tsc/right.png"
		onClicked: {
			app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=NTCTRUP");
		}
		visible: !dimState && app.actSelector && app.actPower	
	}	
	
	IconButton {
		id: volumeUp
		anchors {
			left: nextButton.right
			leftMargin: isNxt ? 3 : 2
			bottom: parent.bottom
			bottomMargin: 5
		}

		iconSource: "qrc:/tsc/volume_up_small.png"
		onClicked: {
			app.simpleSynchronous(app.domoticzURL1 + "/json.htm?type=command&param=onkyoeiscpcommand&idx=" + app.idxCOM +"&action=MVLUP1");		
		}
		visible: !dimState && app.actPower
	}

	Rectangle {
     		id: simplebutton11
     		color: "grey"
		width: isNxt ? 65 : 50; height: isNxt ? 25 : 20
		radius: 4    		     		
		Text{
         		id: buttonLabel11
         		anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
         		text: "Setup"
     		}
		anchors {
			//left: nextButton.left
			//left: volumeUp.left
			right:parent.right
			rightMargin: 2

			bottom: parent.bottom
			bottomMargin: 5
		}

    		MouseArea{
         		id: buttonMouseArea11
         		anchors.fill: parent 
         		onClicked: {app.onkyocontrollerConfigScreen.show();}
     		}
    		visible: !dimState  && !app.actPower

	}

}
