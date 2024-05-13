<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Inicia a imagem img2 ap�s o delay atribu�do pela property -->
<ncl id="connector1" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region id="background" left="0" top="0"> <!--resolução: 800x600px -->
                <region id="rgMenu" left="13" top="0" width="150px">
                    <region id="regButton1" height="78px" top="44px"/>
          	        <region id="regButton2" height="78px" top="152px"/>
			        <region id="regButton3" height="78px" top="260px"/> 
                    <region id="regButton4" height="78px" top="368px"/> 
                    <region id="regButton5" height="78px" top="476px"/> 
                </region>
                <region id="regButton6" width="100px" height="39px" left="687px" top="476px"/> 
                <region id="regImage" width="537px" height="350px" left="250px" top="100px"/>
                <region id="text" width="400px" height="90px" left="350px" top="10px"/> 
            </region>
		</regionBase>
	
		<descriptorBase>
			<descriptor id="desc1" region="regButton1" focusIndex="1" focusBorderWidth="-10" moveUp="5" moveDown="2" />
			<descriptor id="desc2" region="regButton2" focusIndex="2" focusBorderWidth="-10" moveUp="1" moveDown="3" />
			<descriptor id="desc3" region="regButton3" focusIndex="3" focusBorderWidth="-10" moveUp="2" moveDown="4" />
            <descriptor id="desc4" region="regButton4" focusIndex="4" focusBorderWidth="-10" moveUp="3" moveDown="5" />
            <descriptor id="desc5" region="regButton5" focusIndex="5" focusBorderWidth="-10" moveLeft="6"  moveRight="6" moveUp="4" moveDown="1" />
            <descriptor id="desc6" region="regButton6" focusIndex="6" focusBorderWidth="10" moveLeft="5"  moveRight="5" />
            
            <descriptor id="desc7" region="regImage" />            
            <descriptor id="desc8" region="background" />
            <descriptor id="desc9" region="text" />

		</descriptorBase>
                    
        <connectorBase>

            <importBase documentURI="script/causalConnBase.ncl" alias="conEx"/>

        </connectorBase>

	</head>

	<body>
        <!--rgTV-->
        <port id="port6" component="img6"/> <!--botão encerrar-->      
        <port id="port8" component="img8"/> <!--fundo-->   
        <port id="port9" component="txt"/> <!--texto-->

        <media id="img6" src="media/buttons/encerrar.png" descriptor="desc6"/>
        <media id="img8" src="media/images/fundo.jpg" descriptor="desc8"/>	   
        <media id="txt" src="media/text/Visite.txt" descriptor="desc9">
            <property name="fontColor" value="white"/>
            <property name="fontSize" value="20"/>
            <property name="fontWeight" value="bold"/>
        </media>  

        <context id="cmenu">

            <port id="port1" component="img1"/> <!--imagem botão 1 nao selecionado-->        
            <port id="port2" component="img2"/> <!--imagem botão 2 nao selecionado-->
		    <port id="port3" component="img3"/> <!--botão 3-->
            <port id="port4" component="img4"/> <!--botão 4-->
            <port id="port5" component="img5"/> <!--botão 5-->

            <media id="img1" src="media/buttons/praiaN.png" descriptor="desc1"/>
            <media id="img2" src="media/buttons/museuN.png" descriptor="desc2"/>
            <media id="img3" src="media/buttons/teatroN.png" descriptor="desc3"/>
            <media id="img4" src="media/buttons/parqueN.png" descriptor="desc4"/>
            <media id="img5" src="media/buttons/cachoeiraN.png" descriptor="desc5"/>

            <link id="selimage1" xconnector="conEx#onKeySelectionStopStart"> <!--Ao selecionar botão 1, acionar construtor do contexto cpraia-->
          	    <bind role="onSelection" component="img1"/>
                <bind role="stop" component="img1"/>
                <bind role="stop" component="img2"/>
                <bind role="stop" component="img3"/>
                <bind role="stop" component="img4"/>
                <bind role="stop" component="img5"/>
                <bind role="start" component="cpraia"/>
            </link>

            <link id="selimage2" xconnector="conEx#onKeySelectionStopStart"> <!--Ao selecionar botão 2, acionar construtor do contexto cmuseu-->
          	    <bind role="onSelection" component="img2"/>
                <bind role="stop" component="img1"/>
                <bind role="stop" component="img2"/>
                <bind role="stop" component="img3"/>
                <bind role="stop" component="img4"/>
                <bind role="stop" component="img5"/>
                <bind role="start" component="cmuseu"/>
            </link>

            <link id="selimage3" xconnector="conEx#onKeySelectionStopStart">
          	    <bind role="onSelection" component="img3"/>
                <bind role="stop" component="img1"/>
                <bind role="stop" component="img2"/>
                <bind role="stop" component="img3"/>
                <bind role="stop" component="img4"/>
                <bind role="stop" component="img5"/>
                <bind role="start" component="cteatro"/>
            </link>

            <link id="selimage4" xconnector="conEx#onKeySelectionStopStart">
          	    <bind role="onSelection" component="img4"/>
                <bind role="stop" component="img1"/>
                <bind role="stop" component="img2"/>
                <bind role="stop" component="img3"/>
                <bind role="stop" component="img4"/>
                <bind role="stop" component="img5"/>
                <bind role="start" component="cparque"/>
            </link>

            <link id="selimage5" xconnector="conEx#onKeySelectionStopStart">
          	    <bind role="onSelection" component="img5"/>
                <bind role="stop" component="img1"/>
                <bind role="stop" component="img2"/>
                <bind role="stop" component="img3"/>
                <bind role="stop" component="img4"/>
                <bind role="stop" component="img5"/>
                <bind role="start" component="ccachoeira"/>
            </link>

            <context id="cpraia">

                <port id="port10" component="img10"/> <!--imagem praia-->        
                <port id="port11" component="img11"/> <!--imagem botão 1 selecionado-->
                <media id="img10" src="media/images/praia.jpg" descriptor="desc7"/> <!--mostra a imagem praia-->
                <media id="img11" src="media/buttons/praiaS.png" descriptor="desc1"/> <!--muda para botão 1 selecionado-->

     		    <link xconnector="conEx#onKeySelectionStop"> <!--estrutura para voltar ao menu inicial-->
			        <bind role="onSelection" component="img11">
                        <bindParam name="vKey" value="RED"/>
                    </bind>
                    <bind role="stop" component="cpraia"/>
	            </link>
            </context>

            <link xconnector="conEx#onEndStart">  <!--reativa os botoes do menu, quando cpraia é desativado-->
			        <bind role="onEnd" component="cpraia"/>
                    <bind role="start" component="img1"/>
                    <bind role="start" component="img2"/>
                    <bind role="start" component="img3"/>
                    <bind role="start" component="img4"/>
                    <bind role="start" component="img5"/>
	        </link>

            <context id="cmuseu">

                    <port id="port20" component="img20"/> <!--imagem museu-->        
                    <port id="port21" component="img21"/> <!--imagem botão 2 selecionado-->
                    <media id="img20" src="media/images/museu.jpg" descriptor="desc7"/> 
                    <media id="img21" src="media/buttons/museuS.png" descriptor="desc2"/>
            
                    <link xconnector="conEx#onKeySelectionStop">
			            <bind role="onSelection" component="img21">
                            <bindParam name="vKey" value="RED"/>
                        </bind>
                        <bind role="stop" component="cmuseu"/>
	                </link>           
            </context>

            <link xconnector="conEx#onEndStart">
			        <bind role="onEnd" component="cmuseu"/>
                    <bind role="start" component="img1"/>
                    <bind role="start" component="img2"/>
                    <bind role="start" component="img3"/>
                    <bind role="start" component="img4"/>
                    <bind role="start" component="img5"/>
	        </link>

            <context id="cteatro">
                
                    <port id="port30" component="img30"/> <!--imagem museu-->        
                    <port id="port31" component="img31"/> <!--imagem botão 2 selecionado-->
                    <media id="img30" src="media/images/teatro.jpg" descriptor="desc7"/> 
                    <media id="img31" src="media/buttons/teatroS.png" descriptor="desc3"/>

                    <link xconnector="conEx#onKeySelectionStop">
			            <bind role="onSelection" component="img31">
                            <bindParam name="vKey" value="RED"/>
                        </bind>
                        <bind role="stop" component="cteatro"/>
	                </link>  
		    
            </context>

           <link xconnector="conEx#onEndStart">
			        <bind role="onEnd" component="cteatro"/>
                    <bind role="start" component="img1"/>
                    <bind role="start" component="img2"/>
                    <bind role="start" component="img3"/>
                    <bind role="start" component="img4"/>
                    <bind role="start" component="img5"/>
	        </link>

            <context id="cparque">

                <port id="port40" component="img40"/> <!--imagem museu-->        
                <port id="port41" component="img41"/> <!--imagem botão 2 selecionado-->
                <media id="img40" src="media/images/parque.jpg" descriptor="desc7"/> 
                <media id="img41" src="media/buttons/parqueS.png" descriptor="desc4"/>

                <link xconnector="conEx#onKeySelectionStop">
			        <bind role="onSelection" component="img41">
                        <bindParam name="vKey" value="RED"/>
                    </bind>
                    <bind role="stop" component="cparque"/>
	            </link>  
		    
            </context>

           <link xconnector="conEx#onEndStart">
			        <bind role="onEnd" component="cparque"/>
                    <bind role="start" component="img1"/>
                    <bind role="start" component="img2"/>
                    <bind role="start" component="img3"/>
                    <bind role="start" component="img4"/>
                    <bind role="start" component="img5"/>
	        </link>

            <context id="ccachoeira">

                <port id="port50" component="img50"/> <!--imagem museu-->        
                <port id="port51" component="img51"/> <!--imagem botão 2 selecionado-->
                <media id="img50" src="media/images/cachoeira.jpg" descriptor="desc7"/> 
                <media id="img51" src="media/buttons/cachoeiraS.png" descriptor="desc5"/>

                <link xconnector="conEx#onKeySelectionStop">
			        <bind role="onSelection" component="img51">
                        <bindParam name="vKey" value="RED"/>
                    </bind>
                    <bind role="stop" component="ccachoeira"/>
	            </link>  
		    
            </context>

           <link xconnector="conEx#onEndStart">
			        <bind role="onEnd" component="ccachoeira"/>
                    <bind role="start" component="img1"/>
                    <bind role="start" component="img2"/>
                    <bind role="start" component="img3"/>
                    <bind role="start" component="img4"/>
                    <bind role="start" component="img5"/>
	        </link>

        </context> 
      
        <!--inicia o menu da aplicação-->
        <link id="inicio" xconnector="conEx#onBeginStart">
            <bind role="onBegin" component="img8"/>
            <bind role="start" component="cmenu"/>             
        </link>

        <!--encerrar a aplicação-->
        <link id="selimage6" xconnector="conEx#onKeySelectionStop">
            <bind role="onSelection" component="img6"/>
            <bind role="stop" component="connector1"/>             
        </link>
	</body>
</ncl>
