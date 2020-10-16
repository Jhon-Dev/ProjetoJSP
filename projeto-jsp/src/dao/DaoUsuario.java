package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanCursoJsp;
import connection.SingleConnection;

public class DaoUsuario {

	private Connection connection;

	public DaoUsuario() {

		connection = SingleConnection.getConnection();
	}

	public void salvar(BeanCursoJsp usuario) {

		try {

			String sql = "insert into usuario(login, senha, nome, fone, cep, rua, bairro, cidade, estado, ibge, fotobase64, contenttype,curriculoBase64, contentTypeCurriculo, fotoBase64Miniatura, ativo) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, usuario.getLogin());
			insert.setString(2, usuario.getSenha());
			insert.setString(3, usuario.getNome());
			insert.setString(4, usuario.getFone());
			insert.setString(5, usuario.getCep());
			insert.setString(6, usuario.getRua());
			insert.setString(7, usuario.getBairro());
			insert.setString(8, usuario.getCidade());
			insert.setString(9, usuario.getEstado());
			insert.setString(10, usuario.getIbge());
			insert.setString(11, usuario.getFotoBase64());
			insert.setString(12, usuario.getContentType());
			insert.setString(13, usuario.getCurriculoBase64());
			insert.setString(14, usuario.getContentTypeCurriculo());
			insert.setString(15, usuario.getFotoBase64Miniatura());
			insert.setBoolean(16, usuario.isAtivo());
			insert.execute();
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (Exception e1) {

			}

		}
	}

	public List<BeanCursoJsp> listar() throws Exception {
		List<BeanCursoJsp> listar = new ArrayList<BeanCursoJsp>();

		String sql = "select * from usuario where login <>'admin'";

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {

			BeanCursoJsp beanCursoJsp = new BeanCursoJsp();
			beanCursoJsp.setId(resultSet.getLong("id"));
			beanCursoJsp.setLogin(resultSet.getString("login"));
			beanCursoJsp.setSenha(resultSet.getString("senha"));
			beanCursoJsp.setNome(resultSet.getString("nome"));
			beanCursoJsp.setFone(resultSet.getString("fone"));
			beanCursoJsp.setCep(resultSet.getString("cep"));
			beanCursoJsp.setRua(resultSet.getString("rua"));
			beanCursoJsp.setBairro(resultSet.getString("bairro"));
			beanCursoJsp.setCidade(resultSet.getString("cidade"));
			beanCursoJsp.setEstado(resultSet.getString("estado"));
			beanCursoJsp.setIbge(resultSet.getString("ibge"));
			beanCursoJsp.setContentType(resultSet.getString("contenttype"));
			// beanCursoJsp.setFotoBase64(resultSet.getString("fotobase64"));+
			beanCursoJsp.setFotoBase64Miniatura(resultSet.getString("fotobase64miniatura"));
			beanCursoJsp.setCurriculoBase64(resultSet.getString("curriculoBase64"));
			beanCursoJsp.setContentTypeCurriculo(resultSet.getString("contentTypeCurriculo"));

			listar.add(beanCursoJsp);
		}

		return listar;
	}

	public void delete(String id) {
		try {
			String sql = "delete from usuario where id = '" + id + "' and login <> 'admin'";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.execute();

			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();

			try {
				connection.rollback();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public BeanCursoJsp consultar(String id) throws SQLException {
		String sql = "select * from usuario where id ='" + id + "' and login <> 'admin'";

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();

		if (resultSet.next()) {
			BeanCursoJsp beanCursoJsp = new BeanCursoJsp();
			beanCursoJsp.setId(resultSet.getLong("id"));
			beanCursoJsp.setLogin(resultSet.getString("login"));
			beanCursoJsp.setSenha(resultSet.getString("senha"));
			beanCursoJsp.setNome(resultSet.getString("nome"));
			beanCursoJsp.setFone(resultSet.getString("fone"));
			beanCursoJsp.setCep(resultSet.getString("cep"));
			beanCursoJsp.setRua(resultSet.getString("rua"));
			beanCursoJsp.setBairro(resultSet.getString("bairro"));
			beanCursoJsp.setCidade(resultSet.getString("cidade"));
			beanCursoJsp.setEstado(resultSet.getString("estado"));
			beanCursoJsp.setIbge(resultSet.getString("ibge"));
			beanCursoJsp.setFotoBase64(resultSet.getString("fotobase64"));
			beanCursoJsp.setFotoBase64Miniatura(resultSet.getString("fotobase64miniatura"));
			beanCursoJsp.setContentType(resultSet.getString("contenttype"));
			beanCursoJsp.setCurriculoBase64(resultSet.getString("curriculoBase64"));
			beanCursoJsp.setContentTypeCurriculo(resultSet.getString("contentTypeCurriculo"));

			return beanCursoJsp;
		}

		return null;
	}

	public boolean validarLogin(String login) throws SQLException {
		String sql = "select count(1) as qtd from usuario where login ='" + login + "'";

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();

		if (resultSet.next()) {

			return resultSet.getInt("qtd") <= 0; /* Return true */
		}

		return false;
	}

	public boolean validarLoginUpdate(String login, String id) throws SQLException {
		String sql = "select count(1) as qtd from usuario where login ='" + login + "' and id <> " + id;

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();

		if (resultSet.next()) {

			return resultSet.getInt("qtd") <= 0; /* Return true */
		}

		return false;
	}

	public boolean validarSenha(String senha) throws Exception {
		String sql = "select count(1) as qtd from usuario where senha='" + senha + "'";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {

			return resultSet.getInt("qtd") <= 0;/* Return true */
		}
		return false;
	}

	public void atualizar(BeanCursoJsp usuario) {

		try {
			StringBuilder sql = new StringBuilder();

			sql.append(" update usuario set login = ?, senha = ?, nome = ?, fone = ?, ");
			sql.append(" cep = ?, rua = ?, bairro = ?, cidade = ?, ");
			sql.append(" estado = ?, ibge = ?, ativo = ? ");

			if (usuario.isAtualizarImagem()) {

				sql.append(", fotobase64 = ?, contenttype = ? ");

			}

			if (usuario.isAtualizarPdf()) {

				sql.append(", curriculoBase64 = ?, contentTypeCurriculo = ? ");

			}

			if (usuario.isAtualizarImagem()) {

				sql.append(", fotoBase64Miniatura = ? ");
			}

			sql.append(" where id = " + usuario.getId());

			PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());

			preparedStatement.setString(1, usuario.getLogin());
			preparedStatement.setString(2, usuario.getSenha());
			preparedStatement.setString(3, usuario.getNome());
			preparedStatement.setString(4, usuario.getFone());
			preparedStatement.setString(5, usuario.getCep());
			preparedStatement.setString(6, usuario.getRua());
			preparedStatement.setString(7, usuario.getBairro());
			preparedStatement.setString(8, usuario.getCidade());
			preparedStatement.setString(9, usuario.getEstado());
			preparedStatement.setString(10, usuario.getIbge());
			preparedStatement.setBoolean(11, usuario.isAtivo());

			if (usuario.isAtualizarImagem()) {
				preparedStatement.setString(12, usuario.getFotoBase64());
				preparedStatement.setString(13, usuario.getContentType());
			}			

			if (usuario.isAtualizarPdf()) {
				if (usuario.isAtualizarPdf() && !usuario.isAtualizarImagem()) {
					
					preparedStatement.setString(12, usuario.getCurriculoBase64());
					preparedStatement.setString(13, usuario.getContentTypeCurriculo());
				} else {
					
					preparedStatement.setString(14, usuario.getCurriculoBase64());
					preparedStatement.setString(15, usuario.getContentTypeCurriculo());
				}

			}else {
				
				if (usuario.isAtualizarImagem()) {
					preparedStatement.setString(14, usuario.getFotoBase64Miniatura());
				}

				
			}
			
			if (usuario.isAtualizarImagem() && usuario.isAtualizarPdf()) {
				preparedStatement.setString(16, usuario.getFotoBase64Miniatura());
			}

			preparedStatement.executeUpdate();
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}
}
