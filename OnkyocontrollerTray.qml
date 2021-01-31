import QtQuick 2.1
import qb.components 1.0
import qb.base 1.0

SystrayIcon {
	id: onkyocontrollerSystrayIcon
	property string objectName: "onkyocontrollerTray"

	visible: app.enableSystray
	posIndex: 9000

	onClicked: {
		stage.openFullscreen(app.onkyocontrollerScreenUrl);
	}

	Image {
		id: onkyo
		anchors.centerIn: parent
		source: "OnkyoTrayIcon.png"
	}

}