/*
   SPDX-FileCopyrightText: 2023 Bernhard Mayr <unknown_spirit@gmx.at>
   SPDX-License-Identifier: GPL-3.0
*/

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.kde.plasma.plasmoid
import BusyTasksPlugin

GridLayout
{
   id: gridlayout
   anchors.fill: parent
   columns: 2
   rowSpacing: 0
   columnSpacing: 0
   CustomBorderRect
   {
      Layout.preferredWidth: plasmoid.configuration.fontsize*22+2
      Layout.minimumHeight: 20
      Layout.fillHeight: true
      color: "black"
      clip: true
      lBorderwidth: 2
      rBorderwidth: 0
      tBorderwidth: 2
      bBorderwidth: 0
      borderColor: "#666666"
      Item
      {
         id: balkenreihe1
         visible: false
         Repeater
         {
            model: 3
            Rectangle
            {
               x: (index+1)*55
               color: "#555555"
               height: 17
               width: 1
            }
         }
         Repeater
         {
            model: 2
            Rectangle
            {
               y: index*17
               color: "white"
               height: 1
               width: 220
            }
         }
         Repeater
         {
            model: 2
            Rectangle
            {
               x: (index)*220
               color: "white"
               height: 17
               width: 1
            }
         }
         Row
         {
            spacing: 1
            Repeater
            {
               id: repeaterCPU
               model: 6
               Rectangle
               {
                  y: 3
                  height: 12
                  color: "red"
               }
            }
            Rectangle
            {
               id: restCPU
               y: 3
               color: "darkred"
               height: 12
            }
         }
      }
      RowLayout
      {
         id: textreihe1
         visible: true
         anchors.verticalCenter: parent.verticalCenter
         Textlabel
         {
            id: mylabel1
            leftPadding: 3
         }
         Textlabel
         {
            id: mylabel11
            Layout.fillWidth: true
         }
      }
   }
   CustomBorderRect
   {
      Layout.preferredWidth: plasmoid.configuration.fontsize*22+2
      Layout.minimumHeight: 20
      Layout.fillHeight: true
      color: "black"
      clip: true
      lBorderwidth: 0
      rBorderwidth: 2
      tBorderwidth: 2
      bBorderwidth: 0
      borderColor: "#666666"
      Item
      {
         id: balkenreihe2
         visible: false
         Rectangle
         {
            x: 0
            color: "white"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 10
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 24
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 62
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 96
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 120
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 134
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x:172
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 206
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 110
            color: "white"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 220
            color: "white"
            height: 17
            width: 1
         }
         Repeater
         {
            model: 2
            Rectangle
            {
               y: index*17
               color: "white"
               height: 1
               width: 220
            }
         }
         Column
         {
            spacing: 1
            y: 2
            Repeater
            {
               id: repeaterIO
               model: 3
               RowLayout
               {
                  width: 220
                  spacing: 0
                  Rectangle
                  {
                     height: 4
                  }
                  Rectangle
                  {
                     height: 4
                  }
               }
            }
         }
      }
      RowLayout
      {
         id: textreihe2
         visible: true
         anchors.verticalCenter: parent.verticalCenter
         Textlabel
         {
            id: mylabel2
         }
         Textlabel
         {
            id: mylabel21
         }
         Textlabel
         {
            id: mylabel22
            Layout.fillWidth: true
         }
      }
   }
   CustomBorderRect
   {
      Layout.preferredWidth: plasmoid.configuration.fontsize*22+2
      Layout.minimumHeight: 20
      Layout.fillHeight: true
      color: "black"
      clip: true
      lBorderwidth: 2
      rBorderwidth: 0
      tBorderwidth: 0
      bBorderwidth: 2
      borderColor: "#666666"
      Item
      {
         id: balkenreihe3
         visible: false
         Repeater
         {
            model: 3
            Rectangle
            {
               x: (index+1)*55
               color: "#555555"
               height: 17
               width: 1
            }
         }
         Repeater
         {
            model: 2
            Rectangle
            {
               y: index*17
               color: "white"
               height: 1
               width: 220
            }
         }
         Repeater
         {
            model: 2
            Rectangle
            {
               x: (index)*220
               color: "white"
               height: 17
               width: 1
            }
         }
         Row
         {
            spacing: 1
            Repeater
            {
               id: repeaterMEM
               model: 6
               Rectangle
               {
                  y: 3
                  height: 12
                  color: "lime"
               }
            }
            Rectangle
            {
               id: restMEM
               y: 3
               color: "darkgreen"
               height: 12
            }
         }
      }
      RowLayout
      {
         id: textreihe3
         visible: true
         anchors.verticalCenter: parent.verticalCenter
         Textlabel
         {
            id: mylabel3
            leftPadding: 3
         }
         Textlabel
         {
            id: mylabel31
            Layout.fillWidth: true
         }
      }
   }
   CustomBorderRect
   {
      Layout.preferredWidth: plasmoid.configuration.fontsize*22+2
      Layout.minimumHeight: 20
      Layout.fillHeight: true
      color: "black"
      clip: true
      lBorderwidth: 0
      rBorderwidth: 2
      tBorderwidth: 0
      bBorderwidth: 2
      borderColor: "#666666"
      Item
      {
         id: balkenreihe4
         visible: false
         Rectangle
         {
            x: 0
            color: "white"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 10
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 24
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 62
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 96
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 120
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 134
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x:172
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 206
            color: "#555555"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 110
            color: "white"
            height: 17
            width: 1
         }
         Rectangle
         {
            x: 220
            color: "white"
            height: 17
            width: 1
         }
         Repeater
         {
            model: 2
            Rectangle
            {
               y: index*17
               color: "white"
               height: 1
               width: 220
            }
         }
         Column
         {
            y: 2
            spacing: 1
            Repeater
            {
               id: repeaterNET
               model: 3
               RowLayout
               {
                  width: 220
                  spacing: 0
                  Rectangle
                  {
                     height: 4
                  }
                  Rectangle
                  {
                     height: 4
                  }
               }
            }
         }
      }
      RowLayout
      {
         id: textreihe4
         visible: true
         anchors.verticalCenter: parent.verticalCenter
         Textlabel
         {
            id: mylabel4
         }
         Textlabel
         {
            id: mylabel41
         }
         Textlabel
         {
            id: mylabel42
            Layout.fillWidth: true
         }
      }
   }
   BusyTasks
   {
      id: meinProgramm
      property var datenspeicher: []
      property var aktuelleAnzeige: 1
      property var permanenteFenster: false
      property var pausiert: false
   }
   Connections
   {
      target: plasmoid.configuration
      onPasswordChanged: meinProgramm.setzePasswort(plasmoid.configuration.password)
      onUsesmemChanged: meinProgramm.verwendeSMEM(plasmoid.configuration.usesmem)
   }
   Timer
   {
      interval: 500
      repeat: true
      running: true
      onTriggered:
      {
         var CPU = meinProgramm.liefereGesamtCPU;
         var GesamtMEM = meinProgramm.liefereGesamtgenutzterspeicher;
         var IORate = String(meinProgramm.liefereIORate);
         var IOSumme = String(meinProgramm.liefereIOSumme);
         var IOSummeneinheit = "B";
         var IORateneinheit = "B/s";
         var NETRate = String(meinProgramm.liefereNETRate);
         var NETSumme = String(meinProgramm.liefereNETSumme);
         var NETSummeneinheit = "B";
         var NETRateneinheit = "B/s";

         meinProgramm.datenspeicher[0]=CPU
         meinProgramm.datenspeicher[1]=GesamtMEM
         meinProgramm.datenspeicher[2]=meinProgramm.liefereIORohdaten(0,0)
         meinProgramm.datenspeicher[3]=meinProgramm.liefereNETRohdaten(0,0)

         if(!meinProgramm.pausiert)
         {
            mylabel1.text = CPU.toFixed(1) + "% / " + meinProgramm.liefereCPU(0).toFixed(1) + "%"
            mylabel1.color = Qt.rgba(1,1-CPU/100,1-CPU/100)
            mylabel11.text = meinProgramm.liefereCPUProzess

            mylabel2.color = "white"
            if(IOSumme.endsWith('k'))
            {
               mylabel2.color = "yellow"
               IOSummeneinheit="KB"
            }
            if(IOSumme.endsWith('m'))
            {
               mylabel2.color = "#ff66ff"
               IOSummeneinheit="MB"
            }
            if(IOSumme.endsWith('g'))
            {
               mylabel2.color = "#64afff"
               IOSummeneinheit="GB"
            }
            if(IOSumme[IOSumme.length-1].match(/[a-z]/i))
               IOSumme = IOSumme.slice(0,-1)
            if(IOSumme!==" ")
            {
               if (plasmoid.configuration.showunits)
                  IOSumme = IOSumme + " " + IOSummeneinheit
               mylabel2.text = IOSumme
            }
            mylabel21.color = "white"
            if(IORate.endsWith('k'))
            {
               mylabel21.color = "yellow"
               IORateneinheit = "KB/s"
            }
            if(IORate.endsWith('m'))
            {
               mylabel21.color = "#ff66ff"
               IORateneinheit = "MB/s"
            }
            if(IORate.endsWith('g'))
            {
               mylabel21.color = "#64afff"
               IORateneinheit = "GB/s"
            }
            if(IORate[IORate.length-1].match(/[a-z]/i))
               IORate = IORate.slice(0,-1)
            if(IORate!==" ")
            {
               if (plasmoid.configuration.showunits)
                  IORate = IORate + " " + IORateneinheit
               mylabel21.text = IORate
            }
            mylabel22.text = meinProgramm.liefereIOProzess

            mylabel3.text = GesamtMEM.toFixed(1) +"% / " + meinProgramm.liefereMEMProzent(0).toFixed(1) + "% " + meinProgramm.liefereMEM;
            mylabel3.color = Qt.rgba(1-GesamtMEM/100, 1, 1-GesamtMEM/100)
            mylabel31.text = meinProgramm.liefereMEMProzess

            mylabel4.color = "white"
            if(NETSumme.endsWith('k'))
            {
               mylabel4.color = "yellow"
               NETSummeneinheit="KB"
            }
            if(NETSumme.endsWith('m'))
            {
               mylabel4.color = "#ff66ff"
               NETSummeneinheit="MB"
            }
            if(NETSumme.endsWith('g'))
            {
               mylabel4.color = "#64afff"
               NETSummeneinheit="GB"
            }
            if(NETSumme[NETSumme.length-1].match(/[a-z]/i))
               NETSumme = NETSumme.slice(0,-1)
            if(NETSumme!==" ")
            {
               if (plasmoid.configuration.showunits)
                  NETSumme = NETSumme + " " + NETSummeneinheit
               mylabel4.text = NETSumme
            }
            mylabel41.color = "white"
            if(NETRate.endsWith('k'))
            {
               mylabel41.color = "yellow"
               NETRateneinheit = "KB/s"
            }
            if(NETRate.endsWith('m'))
            {
               mylabel41.color = "#ff66ff"
               NETRateneinheit = "MB/s"
            }
            if(NETRate.endsWith('g'))
            {
               mylabel41.color = "#64afff"
               NETRateneinheit = "GB/s"
            }
            if(NETRate[NETRate.length-1].match(/[a-z]/i))
               NETRate = NETRate.slice(0,-1)
            if (NETRate!==" ")
            {
               if (plasmoid.configuration.showunits)
                  NETRate = NETRate + " " + NETRateneinheit
               mylabel41.text = NETRate
            }
            mylabel42.text = meinProgramm.liefereNETProzess

            datenCPU.text = meinProgramm.liefereDatenliste(1)
            prozesseCPU.text = meinProgramm.liefereProzessliste(1)
            datenMEM.text = meinProgramm.liefereDatenliste(2)
            prozesseMEM.text = meinProgramm.liefereProzessliste(2)
            datenIO.text = meinProgramm.liefereDatenliste(3)
            prozesseIO.text = meinProgramm.liefereProzessliste(3)
            datenNET.text = meinProgramm.liefereDatenliste(4)
            prozesseNET.text = meinProgramm.liefereProzessliste(4)

            if(plasmoid.configuration.showbars)
            {
               var summeCPU = 0;
               var summeMEM = 0;
               for (var i=0; i<6; ++i)
               {
                  var aktuelleCPU = meinProgramm.liefereCPU(i);
                  var aktuelleMEM = meinProgramm.liefereMEMProzent(i);
                  summeCPU += aktuelleCPU;
                  summeMEM += aktuelleMEM;
                  repeaterCPU.itemAt(i).width=(aktuelleCPU * 2.2).toFixed(0);
                  repeaterMEM.itemAt(i).width=(aktuelleMEM * 2.2).toFixed(0);
                  if (i<3)
                  {
                     var aktuelleIO1 = meinProgramm.liefereIORohdaten(i,1);
                     var aktuelleIO2 = meinProgramm.liefereIORohdaten(i,2);
                     var aktuelleNET1 = meinProgramm.liefereNETRohdaten(i,1);
                     var aktuelleNET2 = meinProgramm.liefereNETRohdaten(i,2);
                     for (var j=1; j<5 && aktuelleIO1>=1024; ++j)
                        aktuelleIO1/=1024;
                     for (var m=1; m<5 && aktuelleIO2>=1024; ++m)
                        aktuelleIO2/=1024;
                     for (var k=1; k<5 && aktuelleNET1>=1024; ++k)
                        aktuelleNET1/=1024;
                     for (var n=1; n<5 && aktuelleNET2>=1024; ++n)
                        aktuelleNET2/=1024;
                     var IOFarbe1 = liefereFarbe(j), IOFarbe2 = liefereFarbe(m);
                     var NETFarbe1 = liefereFarbe(k), NETFarbe2 = liefereFarbe(n);

                     repeaterIO.itemAt(i).children[0].color=IOFarbe1;
                     if (aktuelleIO1>=1)
                        repeaterIO.itemAt(i).children[0].width=(Math.pow(Math.log(aktuelleIO1), 1.5)*6+3).toFixed(0);
                     else
                        repeaterIO.itemAt(i).children[0].width=0;
                     repeaterIO.itemAt(i).children[1].color=IOFarbe2;
                     if (aktuelleIO2>=1)
                        repeaterIO.itemAt(i).children[1].width=(Math.pow(Math.log(aktuelleIO2), 1.5)*6+3).toFixed(0);
                     else
                        repeaterIO.itemAt(i).children[1].width=0;

                     repeaterNET.itemAt(i).children[0].color=NETFarbe1;
                     if (aktuelleNET1>=1)
                        repeaterNET.itemAt(i).children[0].width=(Math.pow(Math.log(aktuelleNET1), 1.5)*6+3).toFixed(0);
                     else
                        repeaterNET.itemAt(i).children[0].width=0;
                     repeaterNET.itemAt(i).children[1].color=NETFarbe2;
                     if (aktuelleNET2>=1)
                        repeaterNET.itemAt(i).children[1].width=(Math.pow(Math.log(aktuelleNET2), 1.5)*6+3).toFixed(0);
                     else
                        repeaterNET.itemAt(i).children[1].width=0;
                  }
               }
               restCPU.width = ((CPU-summeCPU)*2.2).toFixed(0);
               restMEM.width = ((GesamtMEM-summeMEM)*2.2).toFixed(0);
            }
         }
      }
      function liefereFarbe(Wert : real): string
      {
         if (Wert==1)
            return "white";
         else if(Wert==2)
            return "yellow";
         else if(Wert==3)
            return "#ff66ff";
         else if(Wert==4)
            return "#64afff";
      }
   }
   Component.onCompleted:
   {
      setView();
      if (plasmoid.configuration.password!=="")
      {
         meinProgramm.setzePasswort(plasmoid.configuration.password)
         if (plasmoid.configuration.usesmem)
            meinProgramm.verwendeSMEM(plasmoid.configuration.usesmem);
      }
      else if(plasmoid.configuration.showinfo==true)
         plasmoid.internalAction("configure").trigger();
   }
   Component.onDestruction:
   {
      filterFenster.close();
      optionsFenster.close();
      textFenster.close();
      graphhistory.close();
      graph.close();
      prozessFenster.close();
      infoFenster.close();
   }
   MouseArea
   {
      id: mausfeld
      anchors.fill: parent
      hoverEnabled: true
      onEntered:
      {
         popuptimer.stop();
         var globalc = mapToGlobal(0,0);
         optionsFenster.x = globalc.x-optionsFenster.width-5;
         optionsFenster.y = globalc.y-optionsFenster.height+gridlayout.height;
         optionsFenster.show();
         if (meinProgramm.aktuelleAnzeige==1)
         {
            prozessFenster.hide();
            graph.show();
            graphhistory.show();
         }
         else
         {
            graphhistory.hide();
            graph.hide();
            prozessFenster.show();
         }
      }
      onExited: popuptimer.start();
      onClicked:
      {
         if(plasmoid.configuration.showbars==false)
            plasmoid.configuration.showbars=true;
         else
            plasmoid.configuration.showbars=false;
         setView();
      }
   }
   function setView()
   {
      if (plasmoid.configuration.showbars==true)
      {
         balkenreihe1.visible=true;
         textreihe1.visible=false;
         balkenreihe2.visible=true;
         textreihe2.visible=false;
         balkenreihe3.visible=true;
         textreihe3.visible=false;
         balkenreihe4.visible=true;
         textreihe4.visible=false;
      }
      else
      {
         balkenreihe1.visible=false;
         textreihe1.visible=true;
         balkenreihe2.visible=false;
         textreihe2.visible=true;
         balkenreihe3.visible=false;
         textreihe3.visible=true;
         balkenreihe4.visible=false;
         textreihe4.visible=true;
      }
   }
   Timer
   {
      id: popuptimer
      interval: 2000
      repeat: false
      running: false
      onTriggered:
      {
         if(meinProgramm.permanenteFenster==false)
         {
            filterFenster.hide();
            graphhistory.hide();
            graph.hide();
            prozessFenster.hide();
            optionsFenster.hide();
         }
      }
   }
   ApplicationWindow
   {
      id: textFenster
      parent: optionsFenster
      transientParent: optionsFenster
      flags: Qt.Popup | Qt.FramelessWindowHint
      width: prozessFenster.width
      height: prozessFenster.height
      x: optionsFenster.width
      y: -prozessFenster.height
      visible: false
      color: "transparent"
      Rectangle
      {
         anchors.centerIn: parent
         color: "white"
         height: textlabel.height
         width: textlabel.width
         Text
         {
            id: textlabel
            color: "black"
            font.pixelSize: 12
         }
      }
      Timer
      {
         id: textFenstertimer
         interval: 2000
         repeat: false
         running: false
         onTriggered: textFenster.hide()
      }
   }
   ApplicationWindow
   {
      id: graph
      parent: optionsFenster
      transientParent: optionsFenster
      flags: Qt.Popup | Qt.FramelessWindowHint
      width: 450
      height: 160
      color: "transparent"
      x: optionsFenster.width
      y: -graph.height+liefereGraphY()
      property var cpuWerte: []
      property var memWerte: []
      property var ioWerte: []
      property var netWerte: []
      property var texte_daten: [[],[],[],[]]
      property var texte_prozesse: [[],[],[],[]]
      property var datum: []

      Canvas
      {
         id: leinwand
         width: 450
         height: 160
         antialiasing: false
         property var mausposition: 0
         onPaint:
         {
            var painter = getContext("2d")
            painter.clearRect(0,0,450,160);
            painter.fillStyle="#C8000000"
            painter.strokeStyle="white"
            painter.fillRect(0,0,450,160)

            painter.strokeStyle="white"
            painter.beginPath()
            for (var i=0; i<4; ++i)
            {
               painter.moveTo(0,i*40)
               painter.lineTo(450,i*40)
            }
            painter.moveTo(0,159)
            painter.lineTo(450,159)
            painter.moveTo(0,0)
            painter.lineTo(0,159)
            painter.moveTo(449,0)
            painter.lineTo(449,159)
            painter.closePath()
            painter.stroke()

            if (mausposition!==0)
            {
               painter.beginPath()
               painter.moveTo(mausposition,0)
               painter.lineTo(mausposition,160)
               painter.closePath()
               painter.stroke()
            }
            painter.fillStyle="white"
            painter.font="normal normal bold 10px sans-serif"
            painter.fillText("100 MB/s", 5,38)
            painter.fillText("10 MB/s", 5,78)
            painter.fillText("1 MB/s", 5,118)
            painter.fillStyle="grey"
            painter.fillText("10 KB/s", 5,138)
            painter.font="normal normal normal 12px sans-serif"
            painter.fillStyle="red"
            painter.fillText("CPU", 50,15)
            painter.fillStyle="lime"
            painter.fillText("MEM", 80,15)
            painter.fillStyle="peru"
            painter.fillText("IO", 115,15)
            painter.fillStyle="cyan"
            painter.fillText("NET", 135,15)

            painter.strokeStyle="grey"
            painter.beginPath()
            painter.moveTo(0,140)
            painter.lineTo(450,140)
            painter.closePath()
            painter.stroke()

            painter.strokeStyle="red"
            painter.moveTo(0,160)
            painter.beginPath()
            var i=0
            while (i++<225)
            {
               painter.lineTo(i*2,160-graph.cpuWerte[i]*1.6)
               painter.moveTo(i*2,160-graph.cpuWerte[i]*1.6)
            }
            painter.closePath()
            painter.stroke()

            painter.strokeStyle="lime"
            painter.moveTo(0,160)
            painter.beginPath()
            var i=0
            while (i++<225)
            {
               painter.lineTo(i*2,160-graph.memWerte[i]*1.6)
               painter.moveTo(i*2,160-graph.memWerte[i]*1.6)
            }
            painter.closePath()
            painter.stroke()

            painter.strokeStyle="peru"
            painter.moveTo(0,160)
            painter.beginPath()
            var i=0
            while (i++<225)
            {
               painter.lineTo(i*2,160-graph.ioWerte[i])
               painter.moveTo(i*2,160-graph.ioWerte[i])
            }
            painter.closePath()
            painter.stroke()

            painter.strokeStyle="cyan"
            painter.moveTo(0,160)
            painter.beginPath()
            var i=0
            while (i++<225)
            {
               painter.lineTo(i*2,160-graph.netWerte[i])
               painter.moveTo(i*2,160-graph.netWerte[i])
            }
            painter.closePath()
            painter.stroke()
         }
      }
      Component.onCompleted:
      {
         var aktuellesDatum= new Date();
         var i=0;
         while (i++ < 225)
         {
            cpuWerte.push(0);
            memWerte.push(0);
            ioWerte.push(0);
            netWerte.push(0);
            datum.push(aktuellesDatum);
            for (var j=0; j<4; ++j)
            {
               texte_daten[j][i]=" ";
               texte_prozesse[j][i]=" ";
            }
         }
      }
      Timer
      {
         id: graphtimer
         interval: 2000
         repeat: true
         running: true
         onTriggered:
         {
            for (var i=1; i<225; ++i)
            {
               graph.cpuWerte[i-1]=graph.cpuWerte[i];
               graph.memWerte[i-1]=graph.memWerte[i];
               graph.ioWerte[i-1]=graph.ioWerte[i];
               graph.netWerte[i-1]=graph.netWerte[i];
               graph.datum[i-1]=graph.datum[i];
               for (var j=0; j<4; ++j)
               {
                  graph.texte_daten[j][i-1]=graph.texte_daten[j][i];
                  graph.texte_prozesse[j][i-1]=graph.texte_prozesse[j][i];
               }
            }
            graph.datum[224]=new Date()
            graph.cpuWerte[224]=meinProgramm.datenspeicher[0]
            graph.memWerte[224]=meinProgramm.datenspeicher[1]
            graph.ioWerte[224]=formatiereDaten(meinProgramm.datenspeicher[2])
            graph.netWerte[224]=formatiereDaten(meinProgramm.datenspeicher[3])
            graph.texte_daten[0][224]=mylabel1.text
            graph.texte_prozesse[0][224]=mylabel11.text
            graph.texte_daten[1][224]=mylabel3.text
            graph.texte_prozesse[1][224]=mylabel31.text
            var Einheiten = []
            if (plasmoid.configuration.showunits)
            {
               Einheiten[0] = ""
               Einheiten[1] = ""
               Einheiten[3] = ""
               Einheiten[4] = ""
            }
            else
            {
               Einheiten[0] = " " + liefereEinheit(mylabel2.color)
               Einheiten[1] = " " + liefereEinheit(mylabel21.color)+"/s"
               Einheiten[3] = " " + liefereEinheit(mylabel4.color)
               Einheiten[4] = " " + liefereEinheit(mylabel41.color)+"/s"
            }
            graph.texte_daten[2][224] = mylabel2.text + Einheiten[0] + " " + mylabel21.text + Einheiten[1]
            graph.texte_prozesse[2][224] = mylabel22.text
            graph.texte_daten[3][224] = mylabel4.text + Einheiten[3] + " " + mylabel41.text + Einheiten[4]
            graph.texte_prozesse[3][224] = mylabel42.text

            leinwand.mausposition-=2
            if(!meinProgramm.pausiert)
               leinwand.requestPaint()
         }
         function formatiereDaten(daten: real): real
         {
            daten/=1024;
            var Wert = daten;
            if(daten<=10)
               Wert/=0.5;
            else if(daten<=1024)
               Wert = 20+Wert/51.2;
            else if(daten<=10*1024)
               Wert = 40+Wert/256;
            else if(daten<=100*1024)
               Wert = 80+Wert/2560;
            else
               Wert = 120+Wert/25600;
            return Wert;
         }
         function liefereEinheit(Farbe: string) : string
         {
            if(Qt.colorEqual(Farbe, "white"))
               return "B";
            else if (Qt.colorEqual(Farbe, "yellow"))
               return "KB";
            else if (Farbe=="#ff66ff")
               return "MB";
            else if (Farbe=="#64afff")
               return "GB";
         }
      }
      MouseArea
      {
         id: popupmausfeld
         anchors.fill: parent
         hoverEnabled: true
         onEntered: popuptimer.stop()
         onExited:
         {
            popuptimer.start();
            leinwand.mausposition=0;
         }
         onPositionChanged:
         {
            if(mouseY>80)
            {
               leinwand.mausposition=mouseX;
               var position = (mouseX/2).toFixed(0);
               var space = " ";
               if(position>-1 && position<225)
               {
                  datumslabel.text= space + graph.datum[position].toLocaleString();
                  cpuLabel1.text=space + graph.texte_daten[0][position];
                  cpuLabel2.text=space + graph.texte_prozesse[0][position];
                  memLabel1.text=space + graph.texte_daten[1][position];
                  memLabel2.text=space + graph.texte_prozesse[1][position];
                  ioLabel1.text=space + graph.texte_daten[2][position];
                  ioLabel2.text=space + graph.texte_prozesse[2][position];
                  netLabel1.text=space + graph.texte_daten[3][position];
                  netLabel2.text=space + graph.texte_prozesse[3][position];
                  if(!meinProgramm.pausiert)
                     leinwand.requestPaint();
               }
            }
         }
         onWheel:
         {
            if (wheel.angleDelta.y>0)
               leinwand.mausposition+=2
            else
               leinwand.mausposition-=2
            var space = " "
            var position = (leinwand.mausposition/2).toFixed(0)
            if(position>-1 && position<225)
            {
               datumslabel.text=space + graph.datum[position].toLocaleString();
               cpuLabel1.text=space + graph.texte_daten[0][position];
               cpuLabel2.text=space + graph.texte_prozesse[0][position];
               memLabel1.text=space + graph.texte_daten[1][position];
               memLabel2.text=space + graph.texte_prozesse[1][position];
               ioLabel1.text=space + graph.texte_daten[2][position];
               ioLabel2.text=space + graph.texte_prozesse[2][position];
               netLabel1.text=space + graph.texte_daten[3][position];
               netLabel2.text=space + graph.texte_prozesse[3][position];
            }
            if(!meinProgramm.pausiert)
               leinwand.requestPaint();
         }
      }
      function liefereGraphY() : real
      {
         if (plasmoid.location==4)
            return optionsFenster.height;
         else
            return 50
      }
   }
   ApplicationWindow
   {
      id: graphhistory
      parent: graph
      transientParent: graph
      flags: Qt.Popup | Qt.FramelessWindowHint
      width: 350
      height: 80
      color: "transparent"
      y: -graphhistory.height
      Rectangle
      {
         width: 350
         height: 80
         color: "#C8000000"
         border.color: "white"
         border.width: 1

         ColumnLayout
         {
            spacing: 0
            anchors.fill: parent

            Textlabel
            {
               id: datumslabel
               font.pixelSize: 11
               Layout.fillWidth: true
            }
            Row
            {
               Textlabel
               {
                  id: cpuLabel1
                  width: 180
                  horizontalAlignment: Text.AlignRight
                  font.pixelSize: 11
                  color: "red"
               }
               Textlabel
               {
                  id: cpuLabel2
                  font.pixelSize: 11
                  color: "red"
               }
            }
            Row
            {
               Textlabel
               {
                  id: memLabel1
                  width: 180
                  horizontalAlignment: Text.AlignRight
                  font.pixelSize: 11
                  color: "lime"
               }
               Textlabel
               {
                  id: memLabel2
                  font.pixelSize: 11
                  color: "lime"
               }
            }
            Row
            {
               Textlabel
               {
                  id: ioLabel1
                  width: 180
                  horizontalAlignment: Text.AlignRight
                  font.pixelSize: 11
                  color: "peru"
               }
               Textlabel
               {
                  id: ioLabel2
                  font.pixelSize: 11
                  color: "peru"
               }
            }
            Row
            {
               Textlabel
               {
                  id: netLabel1
                  width: 180
                  horizontalAlignment: Text.AlignRight
                  font.pixelSize: 11
                  color: "cyan"
               }
               Textlabel
               {
                  id: netLabel2
                  font.pixelSize: 11
                  color: "cyan"
               }
            }
         }
      }
      MouseArea
      {
         anchors.fill: parent
         hoverEnabled: true
         onEntered: popuptimer.stop()
         onExited: popuptimer.start()
      }
   }
   ApplicationWindow
   {
      id: prozessFenster
      parent: optionsFenster
      transientParent: optionsFenster
      flags: Qt.Popup | Qt.FramelessWindowHint
      width: 450
      height: 200
      x: optionsFenster.width
      y: -prozessFenster.height + liefereProzessFensterY()
      color: "transparent"

      GridLayout
      {
         columns: 2
         rowSpacing: 0
         columnSpacing: 0
         Rectangle
         {
            width: 225
            height: 100
            color: "#C8000000"
            border.color: "white"
            border.width: 1
            Row
            {
               Textlabel
               {
                  width: 15
                  height: 100
                  font.pixelSize: 11
                  horizontalAlignment: Text.AlignHCenter
                  verticalAlignment: Text.AlignVCenter
                  color: "red"
                  text: "C\nP\nU"
               }
               Textlabel
               {
                  id: datenCPU
                  width: 45
                  horizontalAlignment: Text.AlignRight
                  rightPadding: 7
                  font.pixelSize: 11
                  font.bold: false
                  opacity: 1.0
               }
               Textlabel
               {
                  id: prozesseCPU
                  font.pixelSize: 11
                  font.bold: false
                  opacity: 1.0
               }
            }
         }
         Rectangle
         {
            width: 225
            height: 100
            color: "#C8000000"
            border.color: "white"
            border.width: 1
            Row
            {
               Textlabel
               {
                  width: 15
                  height: 100
                  font.pixelSize: 11
                  horizontalAlignment: Text.AlignHCenter
                  verticalAlignment: Text.AlignVCenter
                  color: "peru"
                  text: "I\nO"
               }
               Textlabel
               {
                  id: datenIO
                  width: 80
                  leftPadding: 5
                  rightPadding: 7
                  font.pixelSize: 11
                  font.bold: false
               }
               Textlabel
               {
                  id: prozesseIO
                  font.pixelSize: 11
                  font.bold: false
               }
            }
         }
         Rectangle
         {
            width: 225
            height: 100
            color: "#C8000000"
            border.color: "white"
            border.width: 1
            Row
            {
               Textlabel
               {
                  width: 15
                  height: 100
                  font.pixelSize: 11
                  horizontalAlignment: Text.AlignHCenter
                  verticalAlignment: Text.AlignVCenter
                  color: "lime"
                  text: "M\nE\nM"
               }
               Textlabel
               {
                  id: datenMEM
                  width: 60
                  horizontalAlignment: Text.AlignRight
                  rightPadding: 7
                  font.pixelSize: 11
                  font.bold: false
               }
               Textlabel
               {
                  id: prozesseMEM
                  font.pixelSize: 11
                  font.bold: false
               }
            }
         }
         Rectangle
         {
            width: 225
            height: 100
            color: "#C8000000"
            border.color: "white"
            border.width: 1
            Row
            {
               Textlabel
               {
                  width: 15
                  height: 100
                  font.pixelSize: 11
                  horizontalAlignment: Text.AlignHCenter
                  verticalAlignment: Text.AlignVCenter
                  color: "cyan"
                  text: "N\nE\nT"
               }
               Textlabel
               {
                  id: datenNET
                  width: 80
                  leftPadding: 5
                  rightPadding: 7
                  font.pixelSize: 11
                  font.bold: false
               }
               Textlabel
               {
                  id: prozesseNET
                  font.pixelSize: 11
                  font.bold: false
               }
            }
         }
      }
      MouseArea
      {
         anchors.fill: parent
         hoverEnabled: true
         onEntered: popuptimer.stop()
         onExited: popuptimer.start()
      }
      function liefereProzessFensterY() : real
      {
         if (plasmoid.location==4)
            return optionsFenster.height;
         else
            return 50
      }
   }
   ApplicationWindow
   {
      id: infoFenster
      title: "BusyTasksPlasmoid Info"
      width: 550
      height: 90
      visible: plasmoid.configuration.showinfo
      ColumnLayout
      {
         width: 550
         Text
         {
            id: infotext
            width: infoFenster.width
            text: "This plasmoid needs the command line tools \"iotop\" and \"nethogs\" for full functionality.\nPlease make sure you have these programs installed.\nAdditionally, you have to set the superuser password in the configuration!"
         }
         Button
         {
            text: "Do not show again"
            Layout.alignment: Qt.AlignHCenter
            onClicked:
            {
               plasmoid.configuration.showinfo=false
               infoFenster.close()
            }
         }
      }
   }
   ApplicationWindow
   {
      id: filterFenster
      flags: Qt.Popup | Qt.FramelessWindowHint
//       parent: optionsFenster
      transientParent: optionsFenster
      width: 500
      height: 40
      color: "transparent"
      x: transientParent.x+optionsFenster.width;
      y: transientParent.y-graph.height;
      Rectangle
      {
         width: 500
         height: 40
         color: "#C8000000"
         border.color: "white"
         border.width: 1

         Row
         {
            width: parent.width
            height: parent.height
            Textlabel
            {
               height: parent.height
               text: " Process name:"
               font.pixelSize: 12
               verticalAlignment: Text.AlignVCenter
            }
            TextField
            {
               id: filter
               y: 5
               width: 150
               height: 30
               verticalAlignment: Text.AlignVCenter
               onAccepted:
               {
                  meinProgramm.setzeFilter(filter.text)
                  if (plasmoid.configuration.usesmem)
                     meinProgramm.SMEMZruecksetzen()
               }
               MouseArea
               {
                  anchors.fill: parent
                  onClicked: filter.focus=true
               }
            }
            Rectangle
            {
               anchors.verticalCenter: parent.verticalCenter
               width: 75
               height: 25
               color: "black"
               border.color: "white"
               Textlabel
               {
                  text: "Apply"
                  font.pixelSize: 12
                  anchors.centerIn: parent
               }
               MouseArea
               {
                  anchors.fill: parent
                  onClicked:
                  {
                     meinProgramm.setzeFilter(filter.text)
                     if (plasmoid.configuration.usesmem)
                        meinProgramm.SMEMZruecksetzen()
                  }
               }
            }
            Rectangle
            {
               anchors.verticalCenter: parent.verticalCenter
               width: 75
               height: 25
               color: "black"
               border.color: "white"
               Textlabel
               {
                  text: "Clear"
                  font.pixelSize: 12
                  anchors.centerIn: parent
               }
               MouseArea
               {
                  anchors.fill: parent
                  onClicked:
                  {
                     filter.text = ""
                     meinProgramm.setzeFilter(filter.text)
                     if (plasmoid.configuration.usesmem)
                        meinProgramm.SMEMZruecksetzen()
                  }
               }
            }
            Rectangle
            {
               anchors.verticalCenter: parent.verticalCenter
               width: 75
               height: 25
               color: "black"
               border.color: "white"
               Textlabel
               {
                  text: "Close"
                  font.pixelSize: 12
                  anchors.centerIn: parent
               }
               MouseArea
               {
                  anchors.fill: parent
                  onClicked: filterFenster.hide()
               }
            }
         }
      }
      function liefereFilterFensterY() : real
      {
         if (plasmoid.location==4)
            return optionsFenster.height;
         else
            return 0
      }
      MouseArea
      {
         anchors.fill: parent
         propagateComposedEvents: true
         hoverEnabled: true
         onEntered: popuptimer.stop()
         onExited: popuptimer.start()
      }
   }
   ApplicationWindow
   {
      id: optionsFenster
      flags: Qt.Popup | Qt.FramelessWindowHint
      opacity: 0.8
      width: 75
      height: 125
      x: -width
      Column
      {
         Rectangle
         {
            width: 75
            height: 25
            color: "black"
            border.color: "white"
            border.width: 1
            Textlabel
            {
               text: "Filter"
               anchors.centerIn: parent
               font.pixelSize: 12
            }
            MouseArea
            {
               anchors.fill: parent
               onClicked:
               {
                  if (filterFenster.visible==false)
                     filterFenster.show();
                  else
                     filterFenster.hide();
               }
            }
         }
         Rectangle
         {
            width: 75
            height: 25
            color: "black"
            border.color: "white"
            border.width: 1
            Textlabel
            {
               text: "Config"
               anchors.centerIn: parent
               font.pixelSize: 12
            }
            MouseArea
            {
               anchors.fill: parent
               onClicked: plasmoid.internalAction("configure").trigger();
            }
         }
         Rectangle
         {
            width: 75
            height: 25
            color: "black"
            border.color: "white"
            border.width: 1
            Textlabel
            {
               id: pausenlabel
               text: "Pause"
               anchors.centerIn: parent
               font.pixelSize: 12
            }
            MouseArea
            {
               anchors.fill: parent
               onClicked:
               {
                  if(meinProgramm.pausiert)
                  {
                     meinProgramm.pausiert=false;
                     textlabel.text= " Updates activated ";
                     pausenlabel.text="Pause";
                  }
                  else
                  {
                     meinProgramm.pausiert=true;
                     textlabel.text= " Updates paused ";
                     pausenlabel.text="Unpause";
                  }
                  textFenster.show();
                  textFenstertimer.start();
               }
            }
         }
         Rectangle
         {
            width: 75
            height: 25
            color: "black"
            border.color: "white"
            border.width: 1
            Textlabel
            {
               id: keeplabel
               text: "Keep open"
               anchors.centerIn: parent
               font.pixelSize: 12
            }
            MouseArea
            {
               anchors.fill: parent
               onClicked:
               {
                  if (meinProgramm.permanenteFenster==false)
                  {
                     meinProgramm.permanenteFenster=true;
                     textlabel.text= " Auto-hide deactivated ";
                     keeplabel.text= "Auto-hide";
                  }
                  else
                  {
                     meinProgramm.permanenteFenster=false;
                     textlabel.text= " Auto-hide activated ";
                     keeplabel.text= "Keep open";
                  }
                  textFenster.show();
                  textFenstertimer.start();
               }
            }
         }
         Rectangle
         {
            width: 75
            height: 25
            color: "black"
            border.color: "white"
            border.width: 1
            Textlabel
            {
               id: anzeigeLabel
               text: "Processes"
               anchors.centerIn: parent
               font.pixelSize: 12
            }
            MouseArea
            {
               anchors.fill: parent
               onClicked:
               {
                  if (meinProgramm.aktuelleAnzeige==1)
                  {
                     anzeigeLabel.text="Graph";
                     meinProgramm.aktuelleAnzeige=2;
                     graphhistory.hide();
                     graph.hide();
                     prozessFenster.show();
                  }
                  else
                  {
                     anzeigeLabel.text="Processes";
                     meinProgramm.aktuelleAnzeige=1;
                     prozessFenster.hide();
                     graph.show();
                     graphhistory.show();
                  }
               }
            }
         }
      }
      MouseArea
      {
         anchors.fill: parent
         propagateComposedEvents: true
         hoverEnabled: true
         onEntered: popuptimer.stop()
         onExited: popuptimer.start()
      }
   }
}
