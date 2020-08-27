<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	var socket = null;

	$(function() {
		connect();
	});

	function connect() {
		sock = new SockJS("<c:url value="/"/>");
		socket = sock;

		sock.onopen = function() {
			console.log('info: connection opened.');
		};

		sock.onmessage = function(event) {
			var data = event.data;
			console.log("Message : " + data + "\n")
		};

		sock.onclose = function() {
			console.log("connect close");
		};

		sock.onerror = function(err) {
			console.log("Error: ", err);
		};

	}
</script>