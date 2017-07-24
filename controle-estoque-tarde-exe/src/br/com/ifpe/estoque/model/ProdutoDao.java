package br.com.ifpe.estoque.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.estoque.util.ConnectionFactory;

public class ProdutoDao {

    private Connection connection;

    public ProdutoDao() {
	try {
	    this.connection = new ConnectionFactory().getConnection();
	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }

    public void inserir(Produto produto) {

	String sql = "INSERT INTO produto (codigo, descricao, preco_custo, preco_venda, garantia, quantidade, imagem) VALUES (?,?,?,?,?,?,?)";
	PreparedStatement stmt;

	try {
	    stmt = connection.prepareStatement(sql);

	    stmt.setString(1, produto.getCodigo());
	    stmt.setString(2, produto.getDescricao());
	    stmt.setDouble(3, produto.getPrecoCusto());
	    stmt.setDouble(4, produto.getPrecoVenda());
	    stmt.setDate(5, new java.sql.Date(produto.getGarantia().getTime()));
	    stmt.setInt(6, produto.getQuantidade());
	    stmt.setString(7, produto.getImagem());

	    stmt.execute();
	    connection.close();

	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }
    
    public void alterar(Produto produto) {

	String sql = "UPDATE produto SET codigo=?, descricao=?, preco_custo=?, preco_venda=?, garantia=?, quantidade=? WHERE id=?";
	PreparedStatement stmt;

	try {
	    stmt = connection.prepareStatement(sql);

	    stmt.setString(1, produto.getCodigo());
	    stmt.setString(2, produto.getDescricao());
	    stmt.setDouble(3, produto.getPrecoCusto());
	    stmt.setDouble(4, produto.getPrecoVenda());
	    stmt.setDate(5, new java.sql.Date(produto.getGarantia().getTime()));
	    stmt.setInt(6, produto.getQuantidade());
	    stmt.setInt(7, produto.getId());

	    stmt.execute();
	    connection.close();

	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }

    public List<Produto> listar() {

	try {

	    List<Produto> listaProduto = new ArrayList<Produto>();
	    PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto ORDER BY descricao");
	    ResultSet rs = stmt.executeQuery();

	    while (rs.next()) {

		Produto produto = new Produto();

		produto.setId(rs.getInt("id"));
		produto.setCodigo(rs.getString("codigo"));
		produto.setDescricao(rs.getString("descricao"));
		produto.setPrecoCusto(rs.getDouble("preco_custo"));
		produto.setPrecoVenda(rs.getDouble("preco_venda"));
		produto.setGarantia(rs.getDate("garantia"));
		produto.setQuantidade(rs.getInt("quantidade"));
		produto.setImagem(rs.getString("imagem"));

		listaProduto.add(produto);
	    }

	    rs.close();
	    stmt.close();
	    connection.close();

	    return listaProduto;

	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }

    public void remover(Integer id) {

	try {

	    String sql = "DELETE FROM produto WHERE id = ?";
	    PreparedStatement stmt = connection.prepareStatement(sql);
	    stmt.setInt(1, id);

	    stmt.execute();
	    connection.close();

	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }
    
    public Produto buscarPorId(int id) {
	
	try {
	    
	    PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto WHERE id = ?");
	    stmt.setInt(1, id);
	    ResultSet rs = stmt.executeQuery();
	    
	    Produto produto = new Produto();
	    
	    while (rs.next()) {

		produto.setId(rs.getInt("id"));
		produto.setCodigo(rs.getString("codigo"));
		produto.setDescricao(rs.getString("descricao"));
		produto.setPrecoCusto(rs.getDouble("preco_custo"));
		produto.setPrecoVenda(rs.getDouble("preco_venda"));
		produto.setGarantia(rs.getDate("garantia"));
		produto.setQuantidade(rs.getInt("quantidade"));
		produto.setImagem(rs.getString("imagem"));
	    }

	    rs.close();
	    stmt.close();
	    connection.close();

	    return produto;

	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }
}
