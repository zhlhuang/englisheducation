var cn=0;
var cp=0;
var crp=0;
var crn=0;
var cc=0;
var cs=0;
var cq=0;
var ce=0;


function checkUname(){
	var myreg=/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
	var uname=$('uname').value;
	if(myreg.test(uname)){
		checkname();
	}else{
		$('check_name').innerHTML="字母开头，允许5-16字节，允许字母数字下划线";
		cn=0;
	}
}
function checkname(){
	myXmlHttpRequest=getXmlHttpObject();
	if(myXmlHttpRequest){
		var url="/regisiter/regisiterService.php";
		var data="uname="+$('uname').value;
		
		myXmlHttpRequest.open("post",url,true);
		myXmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");	
		myXmlHttpRequest.onreadystatechange=function (){
			if(myXmlHttpRequest.readyState==4){
				if(myXmlHttpRequest.status==200){
					$('check_name').innerHTML=myXmlHttpRequest.responseText;
					
					}
			    }
			};
		cn=1;
		myXmlHttpRequest.send(data);
		}
}
		

function checkPwd(){
	var myreg=/[a-zA-Z0-9_]{5,15}/;
	var pwd=$('password').value;
	if(myreg.test(pwd)){
		$('check_pwd').innerHTML="ok";
		cp=1;
	}else{
		$('check_pwd').innerHTML="只能包含字母、数字和下划线,6-15个字节";
		cp=0;
	}
}
function recheckPwd(){
	var pwd=$('password').value;
	var rpwd=$('pwd').value;
	if(pwd!=rpwd){
		$('check_rpwd').innerHTML="密码不一致";
		crp=0;
	}else{
		$('check_rpwd').innerHTML="ok";
		crp=1;
	}
}

function checkRname(){
	var myreg=/[\u4E00-\u9FA5]{2,6}|[a-zA-Z\-\']{3,16}/;
	var rname=$('rname').value;
	if(myreg.test(rname)){
		$('check_rname').innerHTML="ok";
		crn=1;
	}else{
		$('check_rname').innerHTML="非合法名";
		crn=0;
	}
	
}
function sendRequest(){
	myXmlHttpRequest=getXmlHttpObject();
	if(myXmlHttpRequest){
		var url="/regisiter/regisiterService.php";
		var data="county="+$('county').value;
		
		myXmlHttpRequest.open("post",url,true);
		myXmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");	
		myXmlHttpRequest.onreadystatechange=function (){
			if(myXmlHttpRequest.readyState==4){
				if(myXmlHttpRequest.status==200){
					
					var mes=myXmlHttpRequest.responseText;//得到字符串
					var mes_obj=eval("("+mes+")");//eval（）将mes字串转成对象 
					var myoption=document.createElement("option");
					$('school').length=0;
					myoption.innerText="--请选择学校--";
					$('school').appendChild(myoption);
					
					for(var i=0;i<mes_obj.length;i++){
						var school=mes_obj[i].school;
						var myoption=document.createElement("option");
						myoption.value=school;
						myoption.innerText=school;
						$('school').appendChild(myoption);
						
					}
					
					}
			    }
			};
		cc=1;cs=1;
		myXmlHttpRequest.send(data);
		}
}

function checkQQ(){
	var myreg=/^[0-9]{5,10}$/;
	var qq=$('qq').value;
	if(myreg.test(qq)){
		$('check_qq').innerHTML="ok";
		cq=1;
	}else{
		$('check_qq').innerHTML="不是正确QQ账号，请重新输入！";
		cq=0;
	}
}
function checkEmail(){
	var myreg = /^([a-zA-Z0-9]+[_|\_|\.\|-]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	var email=$('email').value;
	if(myreg.test(email)){
		$('check_email').innerHTML="ok";
		ce=1;
	}else{
		$('check_email').innerHTML="email格式不正确，请重新输入！";
		ce=0;
	}
}

function check(){
	if(cn==1&&cp==1&&crp==1&&crn==1&&cc==1&&cs==1&&cq==1&&ce==1){
		return true;
	}else {
		alert("fail");
		return false;
		
	}
}

