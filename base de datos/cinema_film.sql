-- Tabla de Usuarios
CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    nombre_usuario VARCHAR(100),
    correo_usuario VARCHAR(100),
    contrasena VARCHAR(100)
);

-- Tabla de Comentarios
CREATE TABLE Comentarios (
    id_comentario INT PRIMARY KEY,
    id_usuario INT,
    id_pelicula INT,
    contenido TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
);
-- Tabla de Películas
CREATE TABLE Peliculas (
    id_pelicula INT PRIMARY KEY,
    id_admin INT,
    nombre VARCHAR(100),
    fecha_creacion DATE,
    duracion INT,
    FOREIGN KEY (id_admin) REFERENCES Admin(id_admin)
);

-- Tabla de Administradores
CREATE TABLE Admin (
    id_admin INT PRIMARY KEY,
    nombre_admin VARCHAR(100),
    cedula VARCHAR(20)
);

-- Tabla de Idiomas
CREATE TABLE Idioma (
    id_idioma INT PRIMARY KEY,
    id_pelicula INT,
    especificacion_idioma VARCHAR(50),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
);

-- Tabla de Subtítulos
CREATE TABLE Subtitulo (
    id_subtitulo INT PRIMARY KEY,
    id_pelicula INT,
    idioma_subtitulo VARCHAR(50),
    audio_subtitulado VARCHAR(50),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
);

-- Tabla de Relación Película-Género
CREATE TABLE Pelicula_Genero (
    id_pelicula_genero INT,
    id_genero INT,
    id_pelicula INT,
    PRIMARY KEY (id_genero, id_pelicula),
    FOREIGN KEY (id_genero) REFERENCES Genero(id_genero),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
);

-- Tabla de Géneros
CREATE TABLE Genero (
    id_genero INT PRIMARY KEY,
    descripcion_genero TEXT
);

-- Tabla de Relación Actores-Película
CREATE TABLE Actores_Pelicula (
    id_actores_pelicula INT PRIMARY KEY,
    id_actor INT,
    id_pelicula INT,
    papel_en_pelicula VARCHAR(100), -- Atributo agregado: papel que interpreta el actor en la película
    FOREIGN KEY (id_actor) REFERENCES Actores(id_actor),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
);
-- Tabla de Actores
CREATE TABLE Actores (
    id_actor INT PRIMARY KEY,
    nombre_actor VARCHAR(100)
);