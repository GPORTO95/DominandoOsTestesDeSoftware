IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210813004705_Catalogo')
BEGIN
    CREATE TABLE [Categorias] (
        [Id] uniqueidentifier NOT NULL,
        [Nome] varchar(250) NOT NULL,
        [Codigo] int NOT NULL,
        CONSTRAINT [PK_Categorias] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210813004705_Catalogo')
BEGIN
    CREATE TABLE [Produtos] (
        [Id] uniqueidentifier NOT NULL,
        [CategoriaId] uniqueidentifier NOT NULL,
        [Nome] varchar(250) NOT NULL,
        [Descricao] varchar(500) NOT NULL,
        [Ativo] bit NOT NULL,
        [Valor] decimal(18,2) NOT NULL,
        [DataCadastro] datetime2 NOT NULL,
        [Imagem] varchar(250) NOT NULL,
        [QuantidadeEstoque] int NOT NULL,
        [Altura] int NULL,
        [Largura] int NULL,
        [Profundidade] int NULL,
        CONSTRAINT [PK_Produtos] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Produtos_Categorias_CategoriaId] FOREIGN KEY ([CategoriaId]) REFERENCES [Categorias] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210813004705_Catalogo')
BEGIN
    CREATE INDEX [IX_Produtos_CategoriaId] ON [Produtos] ([CategoriaId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210813004705_Catalogo')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20210813004705_Catalogo', N'5.0.6');
END;
GO

COMMIT;
GO

