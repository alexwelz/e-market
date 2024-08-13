USE master;
GO

CREATE DATABASE CATALOGO_DB;
GO

USE CATALOGO_DB;
GO

CREATE TABLE dbo.MARCAS (
    Id INT IDENTITY(1,1) NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
    CONSTRAINT PK_MARCAS PRIMARY KEY CLUSTERED (Id ASC)
);
GO

CREATE TABLE dbo.CATEGORIAS (
    Id INT IDENTITY(1,1) NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
    CONSTRAINT PK_CATEGORIAS PRIMARY KEY CLUSTERED (Id ASC)
);
GO

CREATE TABLE dbo.ARTICULOS (
    Id INT IDENTITY(1,1) NOT NULL,
    Codigo VARCHAR(50) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(150) NULL,
    IdMarca INT NOT NULL,
    IdCategoria INT NOT NULL,
    Precio MONEY NOT NULL,
    CONSTRAINT PK_ARTICULOS PRIMARY KEY CLUSTERED (Id ASC),
    CONSTRAINT FK_ARTICULOS_MARCAS FOREIGN KEY (IdMarca) REFERENCES dbo.MARCAS(Id),
    CONSTRAINT FK_ARTICULOS_CATEGORIAS FOREIGN KEY (IdCategoria) REFERENCES dbo.CATEGORIAS(Id)
);
GO

CREATE TABLE dbo.IMAGENES (
    Id INT IDENTITY(1,1) NOT NULL,
    IdArticulo INT NOT NULL,
    ImagenUrl VARCHAR(1000) NOT NULL,
    CONSTRAINT PK_IMAGENES PRIMARY KEY CLUSTERED (Id ASC),
    CONSTRAINT FK_IMAGENES_ARTICULOS FOREIGN KEY (IdArticulo) REFERENCES dbo.ARTICULOS(Id)
);
GO

INSERT INTO dbo.MARCAS (Descripcion) VALUES 
('Samsung'), 
('Apple'), 
('Sony'), 
('Huawei'), 
('Motorola');
GO

INSERT INTO dbo.CATEGORIAS (Descripcion) VALUES 
('Celulares'),
('Televisores'), 
('Media'), 
('Audio');
GO

INSERT INTO dbo.ARTICULOS (Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio) VALUES
('S01', 'Galaxy S10', 'Smartphone de alta gama con pantalla AMOLED', 1, 1, 69999),
('M03', 'Moto G Play 7ma Gen', 'Smartphone económico con buenas prestaciones', 5, 1, 15699),
('S99', 'PlayStation 4', 'Consola de videojuegos de última generación', 3, 3, 35000),
('S56', 'Bravia 55', 'Televisor 4K HDR con tecnología avanzada de imagen', 3, 2, 49500),
('A23', 'Apple TV', 'Dispositivo de streaming de alta calidad', 2, 3, 7850),
('H10', 'Huawei P40', 'Smartphone con cámara ultra vision Leica', 4, 1, 58999);
GO

INSERT INTO dbo.IMAGENES (IdArticulo, ImagenUrl) VALUES
(1, 'https://images.samsung.com/is/image/samsung/assets/ar/p6_gro2/p6_initial_mktpd/smartphones/galaxy-s10/specs/galaxy-s10-plus_specs_design_colors_prism_white.jpg?$163_346_PNG$'),
(1, 'https://images.samsung.com/is/image/samsung/assets/ar/p6_gro2/p6_initial_mktpd/smartphones/galaxy-s10/specs/galaxy-s10-plus_specs_design_colors_prism_black.jpg?$163_346_PNG$'),
(1, 'https://images.samsung.com/is/image/samsung/assets/ar/p6_gro2/p6_initial_mktpd/smartphones/galaxy-s10/specs/galaxy-s10-plus_specs_design_colors_prism_blue.jpg?$163_346_PNG$'),
(2, 'https://i.blogs.es/20679f/moto-g7-play-8/1366_2000.webp'),
(3, 'https://acdn.mitiendanube.com/stores/474/538/products/fat-1-2c3c757d85f14102f317134510864118-640-0.webp'),
(3, 'https://acdn.mitiendanube.com/stores/474/538/products/ps42-b3879ce591232cd80a17134510873915-640-0.webp'),
(4, 'https://petenattiar.vtexassets.com/arquivos/ids/204029-600-600?v=637932457955070000&width=600&height=600&aspect=true'),
(5, 'https://hiraoka.com.pe/media/mageplaza/blog/post/a/p/apple-tv-hd.jpg'),
(5, 'https://hiraoka.com.pe/media/mageplaza/blog/post/a/p/apple-tv-4k.jpg'),
(6, 'https://cdn-files.kimovil.com/default/0004/43/thumb_342360_default_big.jpeg')
GO