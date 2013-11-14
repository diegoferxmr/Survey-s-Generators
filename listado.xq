xquery version "3.0";
declare option exist:serialize "method=html media-type=text/html omit-xml-declaration=yes";
  
<html>
    <head>
        <title>Survey's List</title>
        <style>
            body {{ font-family: Arial; }}
            <!--.listado {{ display: block; }}-->
            h2 {{ text-shadow: 5px 5px 5px #FF0000;}}
            
            h1 {{ 
    	  text-align: center;
		  color: white;
		  text-transform: uppercase;
		  padding: 1px;
		  font-family: 'Raleway', cursive;
		  font-weight: 100;
		  position: relative;
		  background: -webkit-linear-gradient(left, black, #eee, black);
		  background: -moz-linear-gradient(left, black, #eee, black);
		  background: -ms-linear-gradient(left, black, #eee, black);
		  background: -o-linear-gradient(left, black, #eee, black);
		}}
		h1:before {{
		  content: "";
		  position: absolute;
		  left: 50%;
		  top: -50px;
		  width: 600px;
		  margin-left: -300px;
		  margin-top: -220px;
		  height: 600px;
		  background: -webkit-radial-gradient(50% 50%, ellipse closest-side, #444, black);
		  background: -moz-radial-gradient(50% 50%, ellipse closest-side, #444, black);
		  background: -ms-radial-gradient(50% 50%, ellipse closest-side, #444, black);
		  background: -o-radial-gradient(50% 50%, ellipse closest-side, #444, black);
		  z-index: -1;
		}}
		h1 a {{
		  background: black;
		  display: block;
		  padding: 20px;
		  text-decoration: none;
		  letter-spacing: 30px;
		  color: white;
		  -webkit-animation: comein 1.5s 1 ease-in-out forwards;
		  -moz-animation: comein 1.5s 1 ease-in-out forwards;
		}}
		
		@-webkit-keyframes comein {{
		   0% {{ letter-spacing: 100px; color: rgba(255,255,255,0); }}
		   70% {{ letter-spacing: 20px; }}
		   100% {{ letter-spacing: 30px; color: rgba(255,255,255,1) }}
		}}
		@-moz-keyframes comein {{
		   0% {{ letter-spacing: 100px; color: rgba(255,255,255,0); }}
		   70% {{ letter-spacing: 20px; }}
		   100% {{ letter-spacing: 30px; color: rgba(255,255,255,1) }}
		}}
            
        </style>
        
    </head>
    <body style="background:black;" >
        <div id='cssmenu'>
    <ul style="color:white">
   <li class='active'>
        <a href='encuestas.xml'><span style="color:white">Disenador</span></a></li>
    <li>
       <a href='listado.xq'><span style="color:white">Encuestas</span></a></li>
    </ul>
</div>

        <center>
        <br/>
        <h1><a href="#">Survey's List</a></h1>
<table width="30%" border="1" align="center" style="background:#E6E6E6">
<thead>
    
</thead>
{
let $lista := collection('/db/sqbl/encuestas')/QuestionModule/ModuleData

for $x in $lista
     return 
            <tr>
                <td align="center">
                    <span style="color:blackred">{$x/Name/text()}</span>
                </td>
                <td align="center">
                    <a href="leerEncuesta.xml?id={substring-after(base-uri($x),'/encuestas/')}" >Show</a>
                </td>
                <td align="center">
                    <a href="encuestas/{substring-after(base-uri($x),'/encuestas/')}" target="_blank">Download XML</a> 
                </td>
             </tr>               
}
</table>

</center>
    </body>
</html>
