<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
        var name=prompt("이름을 입력하세요");
        var sex=prompt("성별 입력");
        alert(name);
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:8080/ChattingProject/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
        webSocket.onerror = function(event) {
	      onError(event)
	    };
	    webSocket.onopen = function(event) {
	      onOpen(event)
	    };
	    webSocket.onmessage = function(event) {
	      onMessage(event)
	    };
	    function onMessage(event) {
	        //textarea.value += "상대 : " + event.data + "\n";
	        var html="<div class=\"chat-message\">"
                     +"<img src=\"https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-32.png\" alt=\"avatar\" />"
                     +"<div class=\"chat-message-content\">"
                     +"<h5>"+event.data.substring(event.data.indexOf('[')+1,event.data.indexOf(']'))+"</h5>"
                     +"<p>"+event.data.substring(event.data.indexOf(']')+1)+"</p>"
                     +"</div>"
                     +"</div>"
                     +"<hr>"
            $('.chat-history').append(html);
	    }
	    function onOpen(event) {
	        //textarea.value += "연결 성공\n";
	        var img="";
	        if(sex=="남자")
	        {
	        	img="https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-32.png";
	        }
	        else
	        {
	        	img="https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-32.png";
	        }
	        
	        $('.img-header').attr("src",img);
	        $('.chat-with').text(name);
	    }
	    function onError(event) {
	      alert(event.data);
	    }
	    function send() {
	        //textarea.value += "나 : " + inputMessage.value + "\n";
	        webSocket.send("["+name+"]"+$('#inputMessage').val());
	        $('#inputMessage').val("");
	    }
  </script>
  <link rel="stylesheet" href="./style.css">
</head>
<body>
  <div class="main">
    <!-- <div class="online-chat">
        <input type="checkbox" id="checkbox" />
        <label for="checkbox">Chat Now </label>
        <ul>
            <li>
                <img src="https://cdn0.iconfinder.com/data/icons/user-pictures/100/matureman1-32.png" />
                <a href="#">Mohammed</a>
            </li>

            <li>
                <img src="https://cdn1.iconfinder.com/data/icons/user-pictures/100/boy-32.png" />
                <a href="#">Mustafa</a>
            </li>

            <li>
                <img src="https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-32.png" />
                <a href="#">Lara</a>
            </li>

            <li>
                <img src="https://cdn0.iconfinder.com/data/icons/user-pictures/100/matureman2-32.png" />
                <a href="#">Davied</a>
            </li>

            <li>
                <img src="https://cdn1.iconfinder.com/data/icons/user-pictures/100/girl-32.png" />
                <a href="#">goliana</a>
            </li>

            <li>
                <img src="https://cdn0.iconfinder.com/data/icons/user-pictures/100/maturewoman-2-32.png" />
                <a href="#">Sara</a>
            </li>
        </ul>
    </div> -->
    <div class="chat">
        <div class="chat-header">
            <img class="img-header" src="https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-32.png" alt="avatar" />

            <div class="chat-with">Chat with Lara</div>
        </div>
        <div class="chat-history">
        <!-- <div class="chat-history">

            <div class="chat-message">

                <img src="https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-32.png" alt="avatar" />

                <div class="chat-message-content">

                    <span class="chat-time">10:35 PM</span>

                    <h5>Lara</h5>

                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error, explicabo quasi ratione odio dolorum harum.</p>

                </div>

            </div>

            <hr>

            <div class="chat-message">

                <img src="https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-32.png" alt="avatar" class="me-pic" />

                <div class="chat-message-content">

                    <span class="chat-time me-time">10:37 PM</span>

                    <h5 class="me">Me</h5>

                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis, nulla accusamus magni vel debitis numquam qui tempora rem voluptatem delectus!</p>

                </div>

            </div>

            <hr>

            <div class="chat-message">

                <img src="https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-32.png" alt="avatar" />

                <div class="chat-message-content">

                    <span class="chat-time">10:38 PM</span>

                    <h5>Lara</h5>

                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>

                </div>

            </div>

            <hr>
            <div class="chat-message">

                <img src="https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-32.png" alt="avatar" class="me-pic" />

                <div class="chat-message-content">

                    <span class="chat-time me-time">10:37 PM</span>

                    <h5 class="me">Me</h5>

                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis, nulla accusamus magni vel debitis numquam qui tempora rem voluptatem delectus!</p>

                </div>
              <hr>
                <div class="chat-message">

                    <img src="https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-32.png" alt="avatar" />

                    <div class="chat-message-content">

                        <span class="chat-time">10:35 PM</span>

                        <h5>Lara</h5>

                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error, explicabo quasi ratione odio dolorum harum.</p>

                    </div>

                </div>
            </div>
          <hr>
            <div class="chat-message">

                <img src="https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-32.png" alt="avatar" class="me-pic" />

                <div class="chat-message-content">

                    <span class="chat-time me-time">10:37 PM</span>

                    <h5 class="me">Me</h5>

                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis, nulla accusamus magni vel debitis numquam qui tempora rem voluptatem delectus!</p>

                </div>
            </div>
  <hr> -->
        </div>
        <textarea placeholder="Type your message..." rows="3" id="inputMessage"></textarea>
        <input type="button" value="전송" onclick="send()" id="btn">
    </div>
</div>
</body>
</html>