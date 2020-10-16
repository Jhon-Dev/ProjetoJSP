package beans;

public class BeanCursoJsp {

	private Long id;

	private String login;

	private String senha;

	private String nome;

	private String fone;

	private String cep;

	private String rua;

	private String bairro;

	private String cidade;

	private String estado;
	
	private String ibge;
	
	private boolean ativo;

	private String fotoBase64;

	private String fotoBase64Miniatura;

	private String curriculoBase64;

	private String contentType;

	private String contentTypeCurriculo;

	private String tempFotoUser;
	
	private boolean atualizarImagem = true;
	
	private boolean atualizarPdf = true;
	
	
	


	public String getTempFotoUser() {

		tempFotoUser = "data:" + contentType + ";base64," + fotoBase64;

		return tempFotoUser;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNome() {
		return nome;
	}

	public String getFone() {
		return fone;
	}

	public void setFone(String fone) {
		this.fone = fone;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getIbge() {
		return ibge;
	}

	public void setIbge(String ibge) {
		this.ibge = ibge;
	}	

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public String getFotoBase64() {
		return fotoBase64;
	}

	public void setFotoBase64(String fotoBase64) {
		this.fotoBase64 = fotoBase64;
	}

	public String getFotoBase64Miniatura() {
		return fotoBase64Miniatura;
	}

	public void setFotoBase64Miniatura(String fotoBase64Miniatura) {
		this.fotoBase64Miniatura = fotoBase64Miniatura;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public void setCurriculoBase64(String curriculoBase64) {
		this.curriculoBase64 = curriculoBase64;
	}

	public String getCurriculoBase64() {
		return curriculoBase64;
	}

	public void setContentTypeCurriculo(String contentTypeCurriculo) {
		this.contentTypeCurriculo = contentTypeCurriculo;
	}

	public String getContentTypeCurriculo() {
		return contentTypeCurriculo;
	}


	public boolean isAtualizarImagem() {
		return atualizarImagem;
	}

	public void setAtualizarImagem(boolean atualizarImagem) {
		this.atualizarImagem = atualizarImagem;
	}

	public boolean isAtualizarPdf() {
		return atualizarPdf;
	}

	public void setAtualizarPdf(boolean atualizarPdf) {
		this.atualizarPdf = atualizarPdf;
	}
	
	
	@Override
	public String toString() {
		return "BeanCursoJsp [fone=" + fone + "]";
	}

}
