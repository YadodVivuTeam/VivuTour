<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat Application - Home</title>
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css"
            rel="stylesheet"
            />
    </head>
    <body>
        <section>
            <div class="container py-5">

                <div class="row d-flex justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-4" style="border: 1px solid silver; ">

                        <!-- Buttons trigger collapse -->
                        <a class="btn btn-info btn-lg btn-block" data-mdb-toggle="collapse" href="#collapseExample"
                           role="button" aria-expanded="false" aria-controls="collapseExample">
                            <div class="d-flex justify-content-between align-items-center">
                                <<h5>Contact us</h5>>
                                <i class="fas fa-chevron-down"></i>
                            </div>
                        </a>

                        <!-- Collapsed content -->
                        <div class="collapse mt-3" id="collapseExample">
                            <div class="card" id="chat4">
                                <div class="card-body" data-mdb-perfect-scrollbar="true"
                                     style="position: relative; height: 400px">
                                    <div class="d-flex flex-row justify-content-start">
                                        <div id="chat" style="border: 1px solid silver; height: 350px; width: 400px; overflow-y: scroll;"></div>
                                    </div>
                                </div>
                                <div class="card-footer text-muted d-flex justify-content-start align-items-center p-3">
                                    <input type="text" id="message" class="form-control form-control-lg"  placeholder="Enter your message">
                                    <button class="ms-3 link-info"  onclick="sendMessage()"><i class="fas fa-paper-plane"></i></button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"
        ></script>
        <script>
                                        var protocol = location.protocol === "https:" ? "wss://" : "ws://";
                                        var socket = new WebSocket(protocol + location.host + "/SWP-yadodvuvi/chat");

                                        socket.onmessage = function (event) {
                                            var message = event.data;
                                            var chatDiv = document.getElementById("chat");
                                            chatDiv.innerHTML += message + "<br>";
                                            chatDiv.scrollTop = chatDiv.scrollHeight;
                                        };

                                        function sendMessage() {
                                            var messageInput = document.getElementById("message");
                                            var message = messageInput.value;
                                            if (message !== "") {
                                                socket.send("${user.getFullname()}: " + message);
                                                messageInput.value = "";
                                            }
                                        }
        </script>
    </body>
</html>
