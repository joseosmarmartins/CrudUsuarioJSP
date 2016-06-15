<%@ page import="com.jose.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioBean" class="com.jose.UsuarioBean" scope="session"/>
<jsp:setProperty name="usuarioBean" property="*"/>
<html>
<head>
    <title>CRUD Usuário</title>
</head>
<body>
<h1>CRUD Usuário JSP</h1>

<h3>Usuários</h3>
<table border="1">
    <tr>
        <td>Id</td>
        <td>Nome</td>
        <td>CPF</td>
        <td>e-mail</td>
        <td></td>
    </tr>

    <%
        if (usuarioBean.getUsuarioList().isEmpty()) {
    %>
    <tr>
        <td>Nenhum resultado encontrado!</td>
    </tr>
    <%
    } else {
        for (Usuario usuario : usuarioBean.getUsuarioList()) {
    %>
    <tr>
        <td><%=usuario.getId()%>
        </td>
        <td><%=usuario.getNome()%>
        </td>
        <td><%=usuario.getCpf()%>
        </td>
        <td><%=usuario.getEmail()%>
        </td>
        <td>
            <a href="cadastro-usuario.jsp?id=<%=usuario.getId()%>&action=editar&nome=<%=usuario.getNome()%>
            &cpf=<%=usuario.getCpf()%>&email=<%=usuario.getEmail()%>">Editar</a>

            <a href="CadastroUsuario?id=<%=usuario.getId()%>&action=deletar">Deletar</a>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>

<br>
<br>
<a href="cadastro-usuario.jsp?action=adicionar">Novo</a>
</body>
</html>
