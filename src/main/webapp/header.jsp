
<style>
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}



header .logo img {
  width: 100px;
  margin-left: 25px;

}

body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

body a {
  text-decoration: none;
  color: black;

}

header div .nav {
  display: flex;
  justify-content: space-between;
  align-content: center;
  
}

header div .list .link {
  display: flex;
  justify-content: space-between;

}

header div .list .link .navlist {
  list-style: none;
  padding-right: 20px;
  padding-top: 30px;
  color: black;
  font-weight: bold;
  font-size: 25px;
}

header div .list .link .navlist:hover {
  color: blue !important;
}


* {
  box-sizing: border-box;
}

.header .logo {
  margin-left: 1em;
  margin-top: 1em;
}

.header a:hover {
  color: blue;
}

.header a {
  padding-top: 1em;
  padding-right: 1em;
  padding-left: 1em;
  padding-bottom: 10px;
}



.list1 {
  float: right;
  font-size: 26px;
  font-weight: bold;
  margin-top: 2.5em;
  color: black;
  margin-right: 2em;

}


    </style>

<header>
    <div class="header">
        <a href="<%=request.getContextPath() %>/getrecentbills">
            <img class="logo" src="https://iili.io/J9AdFF1.png" alt="logo" width="110px">
        </a>
        <div class="list1">
            <a href="<%=request.getContextPath() %>/products">Product</a>
            <a class="users" href="<%=request.getContextPath() %>/users">Customer</a>
            <a href="<%=request.getContextPath() %>/bills">Bill</a>
            
                
         
        </div>
        
    </div>
</header>


