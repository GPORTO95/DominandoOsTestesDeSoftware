using NerdStore.BDD.Tests.Config;
using System;

namespace NerdStore.BDD.Tests.Pedido
{
    public class PedidoTela : PageObjectModel
    {
        public PedidoTela(SeleniumHelper helper) : base(helper) { }

        public void AcessarVitrineDeProdutos()
        {
            Helper.IrParaUrl(Helper.Configuration.VitrineUrl);
        }

        public void ObterDetalhesDoProduto(int posicao = 1)
        {
            Helper.ClicarPorXPath("/html/body/div/main/div/div/div/span/a");
        }
        
        public bool ValidarProdutoDisponivel()
        {
            return Helper.ValidarConteudoUrl(Helper.Configuration.ProdutoUrl);
        }

        public int ObterQuantidadeNoEstoque()
        {
            var elemento = Helper.ObterElementoPorXPath("/html/body/div/main/div/div/div[2]/p[1]");
            var quantidade = elemento.Text.ApenasNumeros();

            if (char.IsNumber(quantidade.ToString(), 0)) return quantidade;

            return 0;
        }

        public void ClicarEmComprarAgora()
        {
            Helper.ClicarPorXPath("/html/body/div/main/div/div/div[2]/form/div[2]/button");
        }

        public bool ValidarSeEstaNoCarrinhoDeCompras()
        {
            return Helper.ValidarConteudoUrl(Helper.Configuration.CarrinhoUrl);
        }

        public decimal ObterValorUnitarioProdutoCarrinho()
        {
            return Convert.ToDecimal(Helper.ObterTextoElementoPorId("valorUnitario")
                .Replace('R', ' ').Replace('$',' ').Trim());
        }
        public decimal ObterValorTotalCarrinho()
        {
            return Convert.ToDecimal(Helper.ObterTextoElementoPorId("valorTotal")
                .Replace('R', ' ').Replace('$', ' ').Trim());
        }

        public void ClicarAdicionarQuantidadeItens(int quantidade)
        {
            var botaoAdicionar = Helper.ObterElementoPorClasse("btn-plus");
            if (botaoAdicionar is null) return;

            for (int i = 1; i < quantidade; i++)
            {
                botaoAdicionar.Click();
            }
        }

        public string ObterMensagemDeErroProduto()
        {
            return Helper.ObterTextoElementoPorClasseCss("alert-danger");
        }

        public void NavegarParaCarrinhoDeCompras()
        {
            Helper.ObterElementoPorXPath("/html/body/header/nav/div/div/ul/li[3]/a").Click();
        }
    }
}
