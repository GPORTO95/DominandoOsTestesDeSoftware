﻿using Xunit;

namespace Features.Tests
{
    public class TesteNaoPassandoMotivoEspecifico
    {
        [Fact(DisplayName = "Novo Cliente 2.0", Skip = "Nova versão 2.0 quebrando" )]
        [Trait("Categoria", "Escapando dos Testes")]
        public void Teste_NaoEstaPassando_VersaoNaoCompativel()
        {
            Assert.True(false);
        }
    }
}
