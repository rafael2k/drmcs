<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="demo1" xmlns="http://www.ncl.org.br/NCL3.1/DRProfile">
<head>

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

  </connectorBase>

</head>

<body>
  <port id="entrada" component="logo"/>

  <!-- station logo -->
  <media id="logo" src="logo.jpg">
    <property name="left" value="5%" />
    <property name="top" value="5%" />
    <property name="width" value="35%" />
    <property name="height" value="35%" />
    <property name="zIndex" value="0" />
  </media>

  <media id="freq" src="freq.txt">
    <property name="left" value="42%" />
    <property name="top" value="5%" />
    <property name="width" value="25%" />
    <property name="height" value="35%" />
    <property name="zIndex" value="0" />

    <property name="fontColor" value="white"/>
    <property name="fontStyle" value="text-align:center"/>
    <property name="fontSize" value="17"/>

  </media>
  
  <!-- menu media itens -->
  <media id="m1" src="sobre.txt">
    <property name="right" value="5%" />
    <property name="top" value="5%" />
    <property name="width" value="23%" />
    <property name="height" value="10%" />
    <property name="zIndex" value="0" />

    <property name="fontColor" value="yellow"/>
    <property name="fontStyle" value="text-align:center"/>
    <property name="fontSize" value="17"/>

    <property name="focusIndex" value="4"/>
    <property name="moveUp" value="0"/>
    <property name="moveDown" value="3"/>
    
  </media>

  <media id="m2" src="prog.txt">
    <property name="right" value="5%" />
    <property name="top" value="25%" />
    <property name="width" value="23%" />
    <property name="height" value="10%" />
    <property name="zIndex" value="0" />

    <property name="fontColor" value="yellow"/>
    <property name="fontStyle" value="text-align:center"/>
    <property name="fontSize" value="17"/>
    
    <property name="focusIndex" value="3"/>
    <property name="moveUp" value="4"/>
    <property name="moveDown" value="2"/>
  </media>

  <media id="m3" src="equipe.txt">
    <property name="right" value="5%" />
    <property name="top" value="45%" />
    <property name="width" value="23%" />
    <property name="height" value="10%" />
    <property name="zIndex" value="0" />

    <property name="fontColor" value="yellow"/>
    <property name="fontStyle" value="text-align:center"/>
    <property name="fontSize" value="17"/>

    <property name="focusIndex" value="2"/>
    <property name="moveUp" value="3"/>
    <property name="moveDown" value="1"/>    
  </media>

  <media id="m4" src="quemfala.txt">
    <property name="right" value="5%" />
    <property name="top" value="65%" />
    <property name="width" value="23%" />
    <property name="height" value="10%" />
    <property name="zIndex" value="0" />

    <property name="fontColor" value="yellow"/>
    <property name="fontStyle" value="text-align:center"/>
    <property name="fontSize" value="17"/>

    <property name="focusIndex" value="1"/>
    <property name="moveUp" value="2"/>
    <property name="moveDown" value="0"/>    
  </media>
  
  <media id="m5" src="sair.txt">
    <property name="right" value="5%" />
    <property name="top" value="85%" />
    <property name="width" value="23%" />
    <property name="height" value="10%" />
    <property name="zIndex" value="0" />

    <property name="fontColor" value="red"/>
    <property name="fontStyle" value="text-align:center"/>
    <property name="fontSize" value="17"/>

    <property name="focusIndex" value="0"/>
    <property name="moveUp" value="1"/>
    <property name="moveDown" value="4"/>        
  </media>

  <!-- medias -->
  <media id="t1" src="text1.txt">
    <property name="left" value="5%" />
    <property name="top" value="45%" />
    <property name="width" value="70%" />
    <property name="height" value="50%" />
    <property name="zIndex" value="0" />

    <property name="fontColor" value="white"/>
    <property name="fontSize" value="15"/>
    <property name="fontStyle" value="text-align:left"/>
  </media>

  <media id="t2" src="text2.txt">
    <property name="left" value="5%" />
    <property name="top" value="40%" />
    <property name="width" value="70%" />
    <property name="height" value="60%" />
    <property name="zIndex" value="0" />

    <property name="fontColor" value="white"/>
    <property name="fontSize" value="15"/>
    <property name="fontStyle" value="text-align:left"/>
  </media>

  <media id="t3" src="text3.txt">
    <property name="left" value="5%" />
    <property name="top" value="45%" />
    <property name="width" value="70%" />
    <property name="height" value="50%" />
    <property name="zIndex" value="0" />

    <property name="fontColor" value="white"/>
    <property name="fontSize" value="15"/>
    <property name="fontStyle" value="text-align:left"/>
  </media>

  <media id="t4" src="quemfala.jpg">
    <property name="left" value="2%" />
    <property name="top" value="45%" />
    <property name="width" value="70%" />
    <property name="height" value="53%" />
    <property name="zIndex" value="0" />

  </media>
  
  <link id="linkInicio" xconnector="onBeginStart">
    <bind component="logo" role="onBegin"/>
    <bind component="freq" role="start"/>
    <bind component="m1" role="start"/>
    <bind component="m2" role="start"/>
    <bind component="m3" role="start"/>
    <bind component="m4" role="start"/>
    <bind component="m5" role="start"/>
    <bind component="t1" role="start"/>
  </link>

  <link id="link1" xconnector="onSelectionStopStart">
    <bind component="m1" role="onSelection"/>
    <bind component="t1" role="start"/>
    <bind component="t2" role="stop"/>
    <bind component="t3" role="stop"/>
    <bind component="t4" role="stop"/>
  </link>

  <link id="link2" xconnector="onSelectionStopStart">
    <bind component="m2" role="onSelection"/>
    <bind component="t2" role="start"/>
    <bind component="t1" role="stop"/>
    <bind component="t3" role="stop"/>
    <bind component="t4" role="stop"/>
  </link>

  <link id="link3" xconnector="onSelectionStopStart">
    <bind component="m3" role="onSelection"/>
    <bind component="t3" role="start"/>
    <bind component="t1" role="stop"/>
    <bind component="t2" role="stop"/>
    <bind component="t4" role="stop"/>
  </link>

  <link id="link4" xconnector="onSelectionStopStart">
    <bind component="m4" role="onSelection"/>
    <bind component="t4" role="start"/>
    <bind component="t1" role="stop"/>
    <bind component="t2" role="stop"/>
    <bind component="t3" role="stop"/>
  </link>

  <link id="linkFim" xconnector="onSelectionStop">
    <bind component="m5" role="onSelection"/>
    <bind component="logo" role="stop"/>
    <bind component="freq" role="stop"/>
    <bind component="m1" role="stop"/>
    <bind component="m2" role="stop"/>
    <bind component="m3" role="stop"/>
    <bind component="m4" role="stop"/>
    <bind component="m5" role="stop"/>
    <bind component="t1" role="stop"/>
    <bind component="t2" role="stop"/>
    <bind component="t3" role="stop"/>
    <bind component="t4" role="stop"/>
  </link>

</body>
</ncl>
