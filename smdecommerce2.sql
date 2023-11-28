--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

-- Started on 2023-11-24 15:41:16 -03

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
-- TOC entry 3019 (class 0 OID 0)
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
-- TOC entry 3020 (class 0 OID 0)
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
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 202
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 209 (class 1259 OID 99943)
-- Name: venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda (
    id integer NOT NULL,
    data timestamp without time zone NOT NULL,
    usuario_id integer NOT NULL
);


ALTER TABLE public.venda OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 99941)
-- Name: venda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venda_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venda_id_seq OWNER TO postgres;

--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 208
-- Name: venda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venda_id_seq OWNED BY public.venda.id;


--
-- TOC entry 210 (class 1259 OID 99954)
-- Name: venda_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda_produto (
    venda_id integer NOT NULL,
    produto_id integer NOT NULL,
    quantidade integer NOT NULL
);


ALTER TABLE public.venda_produto OWNER TO postgres;

--
-- TOC entry 2861 (class 2604 OID 99434)
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- TOC entry 2860 (class 2604 OID 90489)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- TOC entry 2859 (class 2604 OID 90476)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 2862 (class 2604 OID 99946)
-- Name: venda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda ALTER COLUMN id SET DEFAULT nextval('public.venda_id_seq'::regclass);


--
-- TOC entry 3010 (class 0 OID 99431)
-- Dependencies: 207
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categoria VALUES (2, 'ELETRONICO');
INSERT INTO public.categoria VALUES (1, 'VIDEOGAME');


--
-- TOC entry 3008 (class 0 OID 90486)
-- Dependencies: 205
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.produto VALUES (1, 'PLAYSTATION 3', 990.9, NULL, 10, 1);
INSERT INTO public.produto VALUES (2, 'PLAYSTATION 4', 2990.9, NULL, 10, 1);


--
-- TOC entry 3006 (class 0 OID 90473)
-- Dependencies: 203
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario VALUES (1, 'LEONARDO', 'Rua X', 'leo@ufc.br', 'leonardo', 'ufc123', false);
INSERT INTO public.usuario VALUES (2, 'MARIA', 'Rua x', 'maria@gmail.com', 'maria', 'ufc123', true);


--
-- TOC entry 3012 (class 0 OID 99943)
-- Dependencies: 209
-- Data for Name: venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.venda VALUES (4, '2023-11-24 14:52:20.888958', 1);


--
-- TOC entry 3013 (class 0 OID 99954)
-- Dependencies: 210
-- Data for Name: venda_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.venda_produto VALUES (4, 1, 2);
INSERT INTO public.venda_produto VALUES (4, 2, 3);


--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 206
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 6, true);


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 204
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produto_id_seq', 2, true);


--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 202
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 2, true);


--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 208
-- Name: venda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venda_id_seq', 4, true);


--
-- TOC entry 2870 (class 2606 OID 99439)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 90494)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 90483)
-- Name: usuario usuario_login_ukey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_login_ukey UNIQUE (login);


--
-- TOC entry 2866 (class 2606 OID 90481)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2872 (class 2606 OID 99948)
-- Name: venda venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 99958)
-- Name: venda_produto venda_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_pkey PRIMARY KEY (venda_id, produto_id);


--
-- TOC entry 2875 (class 2606 OID 99440)
-- Name: produto produto_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categoria(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 2878 (class 2606 OID 99964)
-- Name: venda_produto venda_produto_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produto(id) NOT VALID;


--
-- TOC entry 2877 (class 2606 OID 99959)
-- Name: venda_produto venda_produto_venda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_venda_id_fkey FOREIGN KEY (venda_id) REFERENCES public.venda(id);


--
-- TOC entry 2876 (class 2606 OID 99949)
-- Name: venda venda_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) NOT VALID;


-- Completed on 2023-11-24 15:41:16 -03

--
-- PostgreSQL database dump complete
--

