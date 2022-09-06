DROP TABLE IF EXISTS language, author, book, book_store, book_to_book_store;

CREATE TABLE language
(
    id          INTEGER NOT NULL PRIMARY KEY,
    cd          CHAR    NOT NULL,
    description VARCHAR
);

CREATE TABLE author
(
    id            INTEGER NOT NULL PRIMARY KEY,
    first_name    VARCHAR,
    last_name     VARCHAR NOT NULL,
    date_of_birth DATE,
    year_of_birth INTEGER,
    distinguished INTEGER
);

CREATE TABLE book
(
    id           INTEGER NOT NULL PRIMARY KEY,
    author_id    INTEGER NOT NULL,
    title        VARCHAR NOT NULL,
    published_in INTEGER NOT NULL,
    language_id  INTEGER NOT NULL,

    CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES author (id),
    CONSTRAINT fk_book_language FOREIGN KEY (language_id) REFERENCES language (id)
);

CREATE TABLE book_store
(
    name VARCHAR NOT NULL UNIQUE
);

CREATE TABLE book_to_book_store
(
    name    VARCHAR NOT NULL,
    book_id INTEGER NOT NULL,
    stock   INTEGER,

    PRIMARY KEY (name, book_id),
    CONSTRAINT fk_b2bs_book_store FOREIGN KEY (name) REFERENCES book_store (name) ON DELETE CASCADE,
    CONSTRAINT fk_b2bs_book FOREIGN KEY (book_id) REFERENCES book (id) ON DELETE CASCADE
);