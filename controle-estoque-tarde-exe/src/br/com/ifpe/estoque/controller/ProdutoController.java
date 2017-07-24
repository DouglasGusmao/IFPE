package br.com.ifpe.estoque.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.com.ifpe.estoque.model.Produto;
import br.com.ifpe.estoque.model.ProdutoDao;
import br.com.ifpe.estoque.util.Util;

@Controller
public class ProdutoController {

    @RequestMapping("/exibirIncluirProduto")
    public String exibirIncluirProduto() {

	return "produto/incluirProduto";
    }

    @RequestMapping("/incluirProduto")
    public String incluirProduto(Produto produto, @RequestParam("file") MultipartFile imagem, Model model) {

	if (Util.fazerUploadImagem(imagem)) {
	    produto.setImagem(Calendar.getInstance().getTime() + " - " + imagem.getOriginalFilename());
	}

	ProdutoDao dao = new ProdutoDao();
	dao.inserir(produto);
	model.addAttribute("msg", "Produto Incluído com Sucesso!");

	return "produto/incluirProduto";
    }

    @RequestMapping("listarProduto")
    public String listarProduto(Model model) {

	ProdutoDao dao = new ProdutoDao();
	List<Produto> listaProduto = dao.listar();
	model.addAttribute("listaProduto", listaProduto);
	
	return "produto/pesquisarProduto";
    }

    @RequestMapping("removerProduto")
    public String removerProduto(Produto produto, Model model) {

	ProdutoDao dao = new ProdutoDao();
	dao.remover(produto.getId());
	model.addAttribute("mensagem", "Produto Removido com Sucesso");

	return "forward:listarProduto";
    }
    
    @RequestMapping("exibirAlterarProduto")
    public String exibirAlterarProduto(Produto produto, Model model) {

	ProdutoDao dao = new ProdutoDao();
	Produto produtoCompleto = dao.buscarPorId(produto.getId());
	model.addAttribute("produto", produtoCompleto);

	return "produto/alterarProduto";
    }
    
    @RequestMapping("/alterarProduto")
    public String alterarProduto(Produto produto, Model model) {

	ProdutoDao dao = new ProdutoDao();
	dao.alterar(produto);
	model.addAttribute("mensagem", "Produto Alterado com Sucesso!");

	return "forward:listarProduto";
    }
}
