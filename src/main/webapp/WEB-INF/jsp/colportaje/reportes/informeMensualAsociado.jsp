<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <title><s:message code="informeMensualAsociado.label" /></title>
    </head>
    <body>
        <jsp:include page="./menu.jsp" >
            <jsp:param name="menu" value="informeMensualAsociado" />
        </jsp:include>

        <h1><s:message code="informeMensualAsociado.label" /></h1>
        <hr/>

        <form name="filtraLista" class="form-search" method="post" action="<c:url value='/colportaje/reportes/informeMensualAsociado' />">
            <input type="hidden" name="pagina" id="pagina" value="${pagina}" />
            <input type="hidden" name="tipo" id="tipo" value="" />
            <input type="hidden" name="correo" id="correo" value="" />
            <input type="hidden" name="order" id="order" value="${param.order}" />
            <input type="hidden" name="sort" id="sort" value="${param.sort}" />
            <p class="well">
                <input name="filtro" type="text" class="input-medium search-query" value="${param.filtro}">
                <button type="submit" class="btn"><i class="icon-search"></i> <s:message code="buscar.label" /></button>
            </p>
            <c:if test="${not empty message}">
                <div class="alert alert-block alert-success fade in" role="status">
                    <a class="close" data-dismiss="alert">×</a>
                    <s:message code="${message}" arguments="${messageAttrs}" />
                </div>
            </c:if>
            
            
            <table id="lista" class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th><s:message code="nombre.label" /></th>
                        <th><s:message code="hrsTrabajadas.label" /></th>
                        <th><s:message code="literaturaVendida.label" /></th>
                        <th><s:message code="totalPedidos.label" /></th>
                        <th><s:message code="totalVentas.label" /></th>
                        <th><s:message code="literaturaGratis.label" /></th>
                        <th><s:message code="oracionesOfrecidas.label" /></th>
                        <th><s:message code="casasVisitadas.label" /></th>
                        <th><s:message code="contactosEstudiosBiblicos.label" /></th>
                        <th><s:message code="bautizados.label" /></th>
                        <th><s:message code="diezmo.label" /></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${informeMensualAsociado}" var="clp" varStatus="status">
                        <tr class="${status.index % 2 == 0 ? 'even' : 'odd'}">
                            <td>${clp.informeMensual.colportor.nombreCompleto}</td>
                            <td>${clp.hrsTrabajadas}</td>
                            <td>${clp.literaturaVendida}</td>
                            <td><fmt:formatNumber type="currency" currencySymbol="$" value="${clp.totalPedidos}"/></td>
                            <td><fmt:formatNumber type="currency" currencySymbol="$" value="${clp.totalVentas}"/></td>
                            <td>${clp.literaturaGratis}</td>
                            <td>${clp.oracionesOfrecidas}</td>
                            <td>${clp.casasVisitadas}</td>
                            <td>${clp.contactosEstudiosBiblicos}</td>
                            <td>${clp.bautizados}</td>
                            <td><fmt:formatNumber type="currency" currencySymbol="$" value="${clp.diezmo}"/></td>
                            
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form>        
        <content>
            <script src="<c:url value='/js/lista.js' />"></script>
        </content>
    </body>
</html>
