<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
    
    <title>Reservations</title>
    
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
     <link href="static/css/style.css" rel="stylesheet">
    
</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Restourant Reservations</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-reservation">New Reservation</a></li>
					<li><a href="all-reservations">All Reservations</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Restourant reservations</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_RESERVATIONS'}">
			<div class="container text-center" id="reservationsDiv">
				<h3>My Reservations</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Note</th>
								<th>Reservation Date and Time</th>
								<th>Smokers</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="reservation" items="${reservations}">
								<tr>
									<td>${reservation.id}</td>
									<td>${reservation.name}</td>
									<td>${reservation.note}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${reservation.reservationDate}"/></td>
									<td>${reservation.isSmoker}</td>
									<td><a href="update-reservation?id=${reservation.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-reservation?id=${reservation.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Manage Reservation</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-reservation">
					<input type="hidden" name="id" value="${reservation.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name" value="${reservation.name}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Special Note</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="description" value="${reservation.note}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Smokers</label>
						<div class="col-md-7">
							<input type="radio" class="col-sm-1" name="isSmoker" value="true"/>
							<div class="col-sm-1">Yes</div>
							<input type="radio" class="col-sm-1" name="isSmoker" value="false" checked/>
							<div class="col-sm-1">No</div>
						</div>				
					</div>		
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save"/>
					</div>
				</form>
			</div>
		</c:when>		
	</c:choose>

	<script src="static/js/jquery-1.11.1.min.js"></script>    
    <script src="static/js/bootstrap.min.js"></script>
</body>
</html>