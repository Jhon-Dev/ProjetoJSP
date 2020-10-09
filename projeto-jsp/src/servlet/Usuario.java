package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanCursoJsp;
import dao.DaoUsuario;

/**
 * Servlet implementation class Usuario
 */
@WebServlet("/salvarUsuario")
public class Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuario daoUsuario = new DaoUsuario();

	public Usuario() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String acao = request.getParameter("acao");

			String user = request.getParameter("user");

			if (acao.equalsIgnoreCase("delete")) {
				daoUsuario.delete(user);

				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);

			} else if (acao.equalsIgnoreCase("editar")) {

				BeanCursoJsp beanCursoJsp = daoUsuario.consultar(user);

				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("user", beanCursoJsp);
				view.forward(request, response);

			} else if (acao.equalsIgnoreCase("listartodos")) {

				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao != null && acao.equalsIgnoreCase("reset")) {
			try {
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();

			}

		} else {

			String id = request.getParameter("id");

			String login = request.getParameter("login");

			String senha = request.getParameter("senha");

			String nome = request.getParameter("nome");

			String fone = request.getParameter("fone");

			String cep = request.getParameter("cep");

			String rua = request.getParameter("rua");

			String bairro = request.getParameter("bairro");
			
			String cidade = request.getParameter("cidade");
			
			String estado = request.getParameter("estado");

			String ibge = request.getParameter("ibge");

			
			
			BeanCursoJsp usuario = new BeanCursoJsp();

			usuario.setId(!id.isEmpty() ? Long.parseLong(id) : null);
			usuario.setLogin(login);
			usuario.setSenha(senha);
			usuario.setNome(nome);
			usuario.setFone(fone);
			usuario.setCep(cep);
			usuario.setRua(rua);
			usuario.setBairro(bairro);
			usuario.setCidade(cidade);
			usuario.setEstado(estado);
			usuario.setIbge(ibge);

			try {

				String msg = null;

				boolean podeInserir = true;

				if (login == null || login.isEmpty()) {
					msg = "Login deve ser informado";
					podeInserir = false;

				} else if (senha == null || senha.isEmpty()) {
					msg = "Senha deve ser informada";
					podeInserir = false;

				} else if (nome == null || nome.isEmpty()) {
					msg = "Nome deve ser informado";
					podeInserir = false;

				} else if (fone == null || fone.isEmpty()) {
					msg = "Telefone deve ser informado";
					podeInserir = false;

				} else if (id == null || id.isEmpty() && !daoUsuario.validarLogin(login)) {// QUANDO DOR USUÁRIO NOVO
					msg = "Usuário já existe com o mesmo login!";
					podeInserir = false;

				} else if (id == null || id.isEmpty() && !daoUsuario.validarSenha(senha)) {// QUANDO FOR USUÁRIO NOVO
					msg = "\n A senha já existe para outro usuário!";
					podeInserir = false;
				}

				if (msg != null) {
					request.setAttribute("msg", msg);
				}

				else if (id == null || id.isEmpty() && daoUsuario.validarLogin(login) && podeInserir) {

					daoUsuario.salvar(usuario);

				} else if (id != null && !id.isEmpty() && podeInserir) {
					daoUsuario.atualizar(usuario);
				}

				if (!podeInserir) {
					request.setAttribute("user", usuario);
				}
				
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				request.setAttribute("msg", "Salvo com sucesso!");
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

}
