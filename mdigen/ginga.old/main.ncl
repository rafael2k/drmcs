<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="focus" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
<head>

  <regionBase>
    <region id="mainDevice" width="100%" height="100%">
      <region id="rS" left="5%" top="5%" width="40%" height="40%" zIndex="7"/>

      <region id="rB1" right="5%" top="10%" width="23%" height="10%" zIndex="7"/>
      <region id="rB2" right="5%" top="30%" width="23%" height="10%" zIndex="7"/>
      <region id="rB3" right="5%" top="50%" width="23%" height="10%" zIndex="7"/>
      <region id="rB4" right="5%" top="70%" width="23%" height="10%" zIndex="7"/>
      <region id="rT1" left="5%" top="55%" width="70%" height="40%" zIndex="7"/>
    </region>
  </regionBase>

  <descriptorBase>
    <descriptor id="dS" region="rS"/>

    <descriptor id="dB1" region="rB1"
     focusIndex="ixB1"
     moveUp="ixB4" moveDown="ixB2"/>

    <descriptor id="dB2" region="rB2"
     focusIndex="ixB2"
     moveUp="ixB1" moveDown="ixB3"/>

    <descriptor id="dB3" region="rB3"
     focusIndex="ixB3"
     moveUp="ixB2" moveDown="ixB4">
       <descriptorParam name="focused" value="true"/>
    </descriptor>

    <descriptor id="dB4" region="rB4"
     focusIndex="ixB4"
     moveUp="ixB3" moveDown="ixB1" moveLeft="ixT1"/>

    <descriptor id="dT1" region="rT1"
     focusIndex="ixT1"
     moveRight="ixB4"/>

  </descriptorBase>

  <connectorBase>
    <causalConnector id="onBeginStart">
      <simpleCondition role="onBegin"/>
      <simpleAction role="start" max="unbounded" qualifier="par"/>
    </causalConnector>

    <causalConnector id="onSelectionStop">
      <connectorParam name="value"/>
      <simpleCondition role="onSelection"/>
      <simpleAction role="stop" max="unbounded" qualifier="par"/>
    </causalConnector>

    <causalConnector id="onSelectionStopStart">
      <connectorParam name="value"/>
      <simpleCondition role="onSelection"/>
      <compoundAction operator="seq">
        <simpleAction role="stop" max="unbounded" qualifier="par"/>
        <simpleAction role="start" max="unbounded" qualifier="par"/>
      </compoundAction>
    </causalConnector>

    <causalConnector id="onSelectionSetVar">
      <connectorParam name="value"/>
      <connectorParam name="var"/>
      <simpleCondition role="onSelection"/>
      <simpleAction role="set" max="unbounded" qualifier="par" value="$var"/>
    </causalConnector>

    <causalConnector id="onBeginSetVar">
      <connectorParam name="var"/>
      <simpleCondition role="onBegin"/>
      <simpleAction role="set" value="$var"/>
    </causalConnector>
  </connectorBase>

</head>

<body>
  <port id="entrada" component="s"/>
  <!--<port id="entrada2" component="t1"/>-->

  <media descriptor="dS" id="s" src="logo.jpg"/>


  <!-- menu -->
  <media descriptor="dB1" id="b1" src="sobre.txt">
    <property name="fontColor" value="yellow"/>
    <property name="fontStyle" value="text-align:center"/>
    <property name="fontWeight" value="bold"/>    
    <property name="fontSize" value="17"/>
  </media>

  <media descriptor="dB2" id="b2" src="prog.txt">
    <property name="fontColor" value="yellow"/>
    <property name="fontStyle" value="text-align:center"/>
    <property name="fontSize" value="17"/>
  </media>

  <media descriptor="dB3" id="b3" src="equipe.txt">
    <property name="fontColor" value="yellow"/>
    <property name="fontStyle" value="text-align:center"/>
    <property name="fontSize" value="17"/>
  </media>

  <media descriptor="dB4" id="b4" src="sair.txt">
    <property name="fontColor" value="red"/>
    <property name="fontStyle" value="text-align:center"/>
    <property name="fontSize" value="17"/>
  </media>


  <media descriptor="dT1" id="t1" src="text1.txt">
    <property name="fontColor" value="white"/>
    <property name="fontSize" value="15"/>
    <property name="fontStyle" value="text-align:left"/>
  </media>

  <media descriptor="dT1" id="t2" src="text2.txt">
    <property name="fontColor" value="white"/>
    <property name="fontSize" value="15"/>
    <property name="fontStyle" value="text-align:center"/>
  </media>

  <media descriptor="dT1" id="t3" src="text3.txt">
    <property name="fontColor" value="white"/>
    <property name="fontSize" value="15"/>
    <property name="fontStyle" value="text-align:left"/>
  </media>
  
  <link id="linkInicio" xconnector="onBeginStart">
    <bind component="s" role="onBegin"/>
    <bind component="b1" role="start"/>
    <bind component="b2" role="start"/>
    <bind component="b3" role="start"/>
    <bind component="b4" role="start"/>
    <bind component="t1" role="start"/>
  </link>

  <link id="linkInicio2" xconnector="onSelectionStopStart">
    <bind component="b1" role="onSelection"/>
    <bind component="t1" role="start"/>
    <bind component="t2" role="stop"/>
    <bind component="t3" role="stop"/>
  </link>

  <link id="linkInicio3" xconnector="onSelectionStopStart">
    <bind component="b2" role="onSelection"/>
    <bind component="t2" role="start"/>
    <bind component="t1" role="stop"/>
    <bind component="t3" role="stop"/>
  </link>

  <link id="linkInicio4" xconnector="onSelectionStopStart">
    <bind component="b3" role="onSelection"/>
    <bind component="t3" role="start"/>
    <bind component="t1" role="stop"/>
    <bind component="t2" role="stop"/>
  </link>

  <link id="linkTransicaoPraia" xconnector="onSelectionStop">
    <bind component="b4" role="onSelection"/>
    <bind component="s" role="stop"/>
    <bind component="b1" role="stop"/>
    <bind component="b2" role="stop"/>
    <bind component="b3" role="stop"/>
    <bind component="b4" role="stop"/>
    <bind component="t1" role="stop"/>
    <bind component="t2" role="stop"/>
    <bind component="t3" role="stop"/>
  </link>

</body>
</ncl>
