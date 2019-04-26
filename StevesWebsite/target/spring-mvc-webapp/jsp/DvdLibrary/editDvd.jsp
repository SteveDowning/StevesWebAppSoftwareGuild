<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>Edit DVD Page</title>
        <style>
            .btn {
                margin-bottom: 6px;
                background-color: cornflowerblue;
            }
            html,
            body,
            .container-fluid {
                background: linear-gradient(skyblue, lightcyan);
                height: 100%;
                padding-top: 10px;
            }
            th {
                text-align: center;
            }
            td {
                text-align:center;
                margin-right: 50px;
            }
            
             h1,
            h2{
                padding-left:100px;
            }

        </style>
    </head>
    <body>
        <div class="container-fluid">
            <h1>Dvd Library</h1>
            <div id="EditDvdDiv">
                <h2>Edit DVD</h2> 
                <hr/>
                <h2 style="margin-left: 50px">Title: <c:out value="${dvd.dvdTitle}"/></h2>

                <sf:form class="form-horizontal" role="form" modelAttribute="dvd"
                         action="${pageContext.request.contextPath}/Dvd/editDvd" method="POST">


                    <div class="form-group">
                        <label for="releaseDate" class="col-md-2 control-label"> Release Year:</label>
                        <div class="col-md-6">
                            <sf:input type="text" class="form-control" id="releaseDate" placeholder="Release Date"
                                      path="releaseDate"/>
                            <sf:errors path="releaseDate" cssclass="errors"> </sf:errors>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="mpaaRating" class="col-md-2 control-label"> Rating:</label>
                            <div class="col-md-6">
                            <sf:input type="text" class="form-control" id="mpaaRating" placeholder="Release Year"
                                      path="mpaaRating"/>
                            <sf:errors path="mpaaRating" cssclass="errors"> </sf:errors>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="studio" class="col-md-2 control-label"> Studio:</label>
                            <div class="col-md-6">
                            <sf:input type="text" class="form-control" id="studio" placeholder="Release Year"
                                      path="studio" />
                            <sf:errors path="studio" cssclass="errors"> </sf:errors>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="director" class="col-md-2 control-label"> Director:</label>
                            <div class="col-md-6">
                            <sf:input type="text" class="form-control" id="director" placeholder="Director"
                                      path="directorsName" />
                            <sf:errors path="directorsName" cssclass="errors"> </sf:errors>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="notes" class="col-md-2 control-label"> Notes:</label>
                            <div class="col-md-6">
                            <sf:input type="text" class="form-control" id="notes" placeholder="Notes"
                                      path="userNote"/>
                            <sf:errors path="userNote" cssclass="errors"> </sf:errors>
                            <sf:hidden path="dvdTitle"/>
                        </div>
                    </div>

                    <div class="form-group ">
                        <div class="col-md-offset-2 col-md-4">
                            <button type="submit"  class="btn btn-default">Save Changes</button>
                        </div>
                    </div>

                </sf:form>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>
