<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
Reg Class: <input type="text" id="reg_class" value="DEVICE" />

<BR/>
Gender: <input type="text" id="gender" value="F" />

<BR/>
<input type="button" value="Generate" onclick="javascript:GenerateTable()"/>
<BR/>
	
Selected Template: <input type="text" id="template" value="" />
<BR/>
<!-- <body><input type="button" value="Generate Table" onclick="GenerateTable()" /> -->
<hr />
<div id="myTable">
</div>
<div id="templateSelection"></div>

<div id="test"></div>
<script type="text/javascript">
var mapWithANSYes={'DEVICE F':'Q2', 'CO F':'Q1', 'OTC F':'Q1','NH F':'Q1','DEVICE M':'Q1','CO M':'Q1', 'OTC M':'Q1', 'NH M':'Q1', 'DEVICE':'Q1', 'CO':'Q1', 'OTC':'Q1', 'NH':'Q1'};
var questions={'Q1':'Is this a pregnancy case?','Q2':'Is this a pregnancy case?'};
var questionMap= {'Q1':{'A1':'Auto Narrative_ND_Pregnancy.docx','A2':'Auto Narrative_ND_Standard.docx'},'Q2':{'A1':'Auto Narrative_D_Pregnancy.docx','A2':'Auto Narrative_D_Standard.docx'}};   



function checkValue(str){		
		var question=document.getElementsByName("question")[0].value;
		var a1a2Map=questionMap[question];
		// alert(a1a2Map[str.value]);
		document.getElementById("template").value = a1a2Map[str.value];
		
}
function GenerateTable() {
    //Build an array containing Customer records.
    var customers = new Array();
    var regClass=document.getElementById('reg_class').value;
    var gender=document.getElementById('gender').value;
	//alert(regClass+" "+gender );
   
    //map with questions    //
    var a1a2Map={};
	// var questionMap= {'Q1':{'A1':}};   
	
    // alert(questions[mapWithANSYes['DEVICE F']]);
    var div = document.createElement('div');
    div.className = 'row';
    var questionKey=mapWithANSYes[regClass+" "+gender];
    var question=questions[mapWithANSYes[regClass+" "+gender]];
    if(question!=null){
    div.innerHTML='<input type="hidden" name="question" value='+questionKey+'><label name="Question">'+question+'</label><br><input type="radio" name="YES" value="A1" onclick="javascript:checkValue(this)">YES<br>'
    				+'<input type="radio" name="YES" value="A2" onclick="javascript:checkValue(this)">NO<br>';
    document.getElementById('templateSelection').appendChild(div);
    }
    
    
   /*  customers.push(["Customer Id", "Name", "City"]);
    customers.push([1, "Nagesh Korde", "Ahmednagar"]);
    customers.push([2, "Girish Korde", "Pune"]);
    customers.push([3, "Sagar Korde", "Mumbai"]);
    customers.push([4, "Sachin Raut", "Rahuri"]);
 
    //Create a HTML Table element.
    var table = document.createElement("TABLE");
    table.border = "1";
 
    //Get the count of columns.
    var columnCount = customers[0].length;
 
    //Add the header row.
    var row = table.insertRow(-1);
    for (var i = 0; i < columnCount; i++) {
        var headerCell = document.createElement("TH");
        headerCell.innerHTML = customers[0][i];
        row.appendChild(headerCell);
    }
 
    //Add the data rows.
    for (var i = 1; i < customers.length; i++) {
        row = table.insertRow(-1);
        for (var j = 0; j < columnCount; j++) {
            var cell = row.insertCell(-1);
            cell.innerHTML = customers[i][j];
        }
    }
 
    var dvTable = document.getElementById("myTable");
    dvTable.innerHTML = "";
    dvTable.appendChild(table);
  */   
}
</script>


</body>
</html>