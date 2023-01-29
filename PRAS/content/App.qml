/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Studio Components.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick  
import QtQuick.Layouts
import QtQuick.Window  

Window {
    id: root
    property var divs: [];
    width: Constants.width
    height: Constants.height
    visibility: "FullScreen"
    visible: true
    title: "HAS"



    Rectangle{
        anchors.fill: parent
        color: "#1a1f25"
    }

//    SettingBar{
//        id: settings
//        x: 0
//        y: 0
//    }

    // div 1
    Div{
        property bool isBackward: false
        id: div1
        x : Backend.getGridLayoutPositionX(0,4,Constants.width)
        y : Backend.getGridLayoutPositionY(0,2,Backend.mainAreaHeight,isBackward,divHeigth) + Constants.topBarClosedHeigth
        divHeigth: Backend.mainAreaHeight / 2
        divWidth: Constants.width / 4
        divText: "Web Browsing"
        divColorStart: Colors.color1Light
        divColorEnd: Colors.color1Dark
        divIcon: "images/web_browsing.svg"
        Component.onCompleted: root.divs.push(this)
        onDivClicked: handleDivClick(this)
    }
    // div 2
    Div{
        property bool isBackward: false
        id: div2
        x : Backend.getGridLayoutPositionX(1,4,Constants.width)
        y : Backend.getGridLayoutPositionY(0,2,Backend.mainAreaHeight,isBackward,divHeigth) + Constants.topBarClosedHeigth
        divHeigth: Backend.mainAreaHeight / 2
        divWidth: Constants.width / 4
        divText: "Entertainment"
        divColorStart: Colors.color2Light
        divColorEnd: Colors.color2Dark
        divIcon: "images/entertainment.svg"
        Component.onCompleted: root.divs.push(this)
        onDivClicked: handleDivClick(this)
    }
    // div 3
    Div{
        property bool isBackward: false
        id: div3
        x : Backend.getGridLayoutPositionX(2,4,Constants.width)
        y : Backend.getGridLayoutPositionY(0,2,Backend.mainAreaHeight,isBackward,divHeigth) + Constants.topBarClosedHeigth
        divHeigth: Backend.mainAreaHeight / 2
        divWidth: Constants.width / 4
        divText: "TV"
        divColorStart: Colors.color3Light
        divColorEnd: Colors.color3Dark
        divIcon: "images/tv.svg"
        Component.onCompleted: root.divs.push(this)
        onDivClicked: handleDivClick(this)
    }
    // div 4
    Div{
        property bool isBackward: false
        id: div4
        x : Backend.getGridLayoutPositionX(3,4,Constants.width)
        y : Backend.getGridLayoutPositionY(0,2,Backend.mainAreaHeight,isBackward,divHeigth) + Constants.topBarClosedHeigth
        divHeigth: Backend.mainAreaHeight / 2
        divWidth: Constants.width / 4
        divText: "Food & Drink"
        divColorStart: Colors.color4Light
        divColorEnd: Colors.color4Dark
        divIcon: "images/food_drink.svg"
        Component.onCompleted: root.divs.push(this)
        onDivClicked: handleDivClick(this)
    }
    // div 5
    Div{
        property bool isBackward: true
        id: div5
        x : Backend.getGridLayoutPositionX(0,4,Constants.width)
        y : Backend.getGridLayoutPositionY(1,2,Backend.mainAreaHeight,isBackward,divHeigth) + Constants.topBarClosedHeigth
        divHeigth: Backend.mainAreaHeight / 2
        divWidth: Constants.width / 4
        divText: "Lighting"
        divColorStart: Colors.color5Light
        divColorEnd: Colors.color5Dark
        divIcon: "images/lighting.svg"
        Component.onCompleted: root.divs.push(this)
        onDivClicked: handleDivClick(this)
    }
    // div 6
    Div{
        property bool isBackward: true
        id: div6
        x : Backend.getGridLayoutPositionX(1,4,Constants.width)
        y : Backend.getGridLayoutPositionY(1,2,Backend.mainAreaHeight,isBackward,divHeigth) + Constants.topBarClosedHeigth
        divHeigth: Backend.mainAreaHeight / 2
        divWidth: Constants.width / 4
        divText: "HIS"
        divColorStart: Colors.color6Light
        divColorEnd: Colors.color6Dark
        divIcon: "images/his.svg"
        Component.onCompleted: root.divs.push(this)
        onDivClicked: handleDivClick(this)
    }
    // div 7
    Div{
        property bool isBackward: true
        id: div7
        x : Backend.getGridLayoutPositionX(2,4,Constants.width)
        y : Backend.getGridLayoutPositionY(1,2,Backend.mainAreaHeight,isBackward,divHeigth) + Constants.topBarClosedHeigth
        divHeigth: Backend.mainAreaHeight / 2
        divWidth: Constants.width / 4
        divText: "Nurse Call"
        divColorStart: Colors.color7Light
        divColorEnd: Colors.color7Dark
        divIcon: "images/nurse_call.svg"
        Component.onCompleted: root.divs.push(this)
        onDivClicked: handleDivClick(this)
    }
    // div 8
    Div{
        property bool isBackward: true
        id: div8
        x : Backend.getGridLayoutPositionX(3,4,Constants.width)
        y : Backend.getGridLayoutPositionY(1,2,Backend.mainAreaHeight,isBackward,divHeigth) + Constants.topBarClosedHeigth
        divHeigth: Backend.mainAreaHeight / 2
        divWidth: Constants.width / 4
        divText: "Card Reader"
        divColorStart: Colors.color8Light
        divColorEnd: Colors.color8Dark
        divIcon: "images/card_reader.svg"
        Component.onCompleted: root.divs.push(this)
        onDivClicked: handleDivClick(this)
    }

    Lighting{
        x:0
        y: Constants.topBarClosedHeigth + Constants.collapseDivSive
        mWidth: Constants.width
        mHeight: Constants.height - Constants.topBarClosedHeigth - Constants.activeDivSive -  Constants.collapseDivSive
        id:lighing
        visible: false
        opacity: 0
    }
    Browser{
        x:0
        y: Constants.topBarClosedHeigth + Constants.activeDivSive
        id:browser
        mWidth: Constants.width
        mHeight: Constants.height - Constants.topBarClosedHeigth - Constants.activeDivSive -  Constants.collapseDivSive
        visible: false
        opacity: 0
    }


    NumberAnimation {
        id: animOpenLighting
        target: lighing
        property: "opacity"
        onFinished: animOpenLighting.running = false
        duration: 400
        easing.type: Easing.InOutQuad
        to: 100
        running: false
    }

    NumberAnimation {
        id: animCloseLighting
        target: lighing
        property: "opacity"
        onFinished: animCloseLighting.running = false
        duration: 400
        easing.type: Easing.InOutQuad
        to: 0
        running: false
    }

    NumberAnimation {
        id: animOpenBrowser
        target: browser
        property: "opacity"
        onFinished: animOpenLighting.running = false
        duration: 400
        easing.type: Easing.InOutQuad
        to: 100
        running: false
    }

    NumberAnimation {
        id: animCloseBrowser
        target: browser
        property: "opacity"
        onFinished: animCloseLighting.running = false
        duration: 400
        easing.type: Easing.InOutQuad
        to: 0
        running: false
    }


    function handleDivClick(target){
        let goingDashboard =  false;
        if(target.divState === "active")
        {
            goingDashboard = true;
            for(var i = 0; i < root.divs.length; i++){

                root.divs[i].divState = "expanding";
            }
        }
        else
        {
            for(var i = 0; i < root.divs.length; i++){

                if(root.divs[i] === target)
                    root.divs[i].divState = "activating";
                else
                    root.divs[i].divState = "collapsing";
            }
        }
        hideAll();
        if(target.divText === "Lighting" & !goingDashboard ){
            lighing.visible = true;
            animOpenLighting.running = true;
        }
        if(target.divText === "Web Browsing" & !goingDashboard ){
            browser.visible = true;
            animOpenBrowser.running = true;
        }

    }

    function hideAll(){
        animCloseLighting.running = true;
        lighing.visible = false;
        animCloseBrowser.running = true;
        browser.visible = false;
    }


}

