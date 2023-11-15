--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

-- Started on 2023-10-27 16:48:53 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 207 (class 1259 OID 99431)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 99429)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_seq OWNER TO postgres;

--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 206
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- TOC entry 205 (class 1259 OID 90486)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    id integer NOT NULL,
    descricao character varying NOT NULL,
    preco numeric NOT NULL,
    foto character varying,
    quantidade integer NOT NULL,
    categoria_id integer NOT NULL
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 90484)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produto_id_seq OWNER TO postgres;

--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 204
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- TOC entry 203 (class 1259 OID 90473)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying NOT NULL,
    endereco character varying NOT NULL,
    email character varying NOT NULL,
    login character varying NOT NULL,
    senha character varying NOT NULL,
    administrador boolean NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 90471)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 202
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 2851 (class 2604 OID 99434)
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- TOC entry 2850 (class 2604 OID 90489)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- TOC entry 2849 (class 2604 OID 90476)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 2992 (class 0 OID 99431)
-- Dependencies: 207
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categoria (id, nome) VALUES (1, 'Eletrônicos');
INSERT INTO public.categoria (id, nome) VALUES (3, 'Outros');


--
-- TOC entry 2990 (class 0 OID 90486)
-- Dependencies: 205
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.produto (id, descricao, preco, foto, quantidade, categoria_id, nome) VALUES (1, 'Video game Playstation 3', 990.9, 'https://4.imimg.com/data4/ED/OP/MY-23263516/sony-ps3.png', 5, 1,'Playstation 3');
INSERT INTO public.produto (id, descricao, preco, foto, quantidade, categoria_id, nome) VALUES (2, 'Video game Playstation 4 <br> A PlayStation 4 é uma consola de videojogos, da oitava geração com arquitetura x86, produzida pela empresa Sony Interactive Entertainment e lançada em Novembro de 2013, como a quarta edição da série PlayStation, sucessora da PlayStation 3, competindo directamente com a Wii U da Nintendo e, com a Xbox One da Microsoft.', 2990.9, 'https://www.playinformatica.net.br/loja/img/prod/playstation-4-slim-1tb-sony_62.jpg', 3, 1, 'Playstation 4');
INSERT INTO public.produto (id, descricao, preco, foto, quantidade, categoria_id, nome) VALUES (3, 'Incrível xícara com o logo da linguagem de programação JAVA - perfeito para programadores!', 50, 'https://cdn.awsli.com.br/1225/1225697/produto/47027787/caneca-java-logo-3ff0c50b.jpg', 10, 3, 'Xícara Java');


--
-- TOC entry 2988 (class 0 OID 90473)
-- Dependencies: 203
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario (id, nome, endereco, email, login, senha, administrador) VALUES (1, 'Leo', 'Rua X', 'leo@ufc.br', 'leo', 'ufc123', false);
INSERT INTO public.usuario (id, nome, endereco, email, login, senha, administrador) VALUES (2, 'maria sofia', 'rua x', 'mariasofia@gmail.com', 'maria', '12345', true);


--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 206
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 4, true);


--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 204
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produto_id_seq', 2, true);


--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 202
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 2, true);


--
-- TOC entry 2859 (class 2606 OID 99439)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 90494)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 90483)
-- Name: usuario usuario_login_ukey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_login_ukey UNIQUE (login);


--
-- TOC entry 2855 (class 2606 OID 90481)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 99440)
-- Name: produto produto_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categoria(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


-- Completed on 2023-10-27 16:48:53 -03

--
-- PostgreSQL database dump complete
--

