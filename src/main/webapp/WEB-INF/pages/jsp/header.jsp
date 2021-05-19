<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<nav class="navbar navbar-inverse">
  <div class="container-fluid bg-dark">
    <div class="navbar-header">
      <a class="navbar-brand" id="home" href="home">Hibernate Users Management</a>
    </div>
    <ul class="nav navbar-nav">
      <li id="usersPage"><a href="users">Show All Users</a></li>
      <li id="logout"><a href="logout">Logout</a></li>
    </ul>
    <form class="navbar-form navbar-right" method="post" action="user">
      <div class="navbar-form navbar-left input-group">
        <input type="text" class="form-control" placeholder="Search" name="searchId" required>
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
  </div>
</nav>
<script src="js/utils.js"></script>