--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE candidato;
DROP DATABASE escola;
DROP DATABASE keycloak;
DROP DATABASE processo;




--
-- Drop roles
--

DROP ROLE admin;
DROP ROLE candidatoapp;
DROP ROLE escolaapp;
DROP ROLE keycloak;
DROP ROLE processoapp;


--
-- Roles
--

CREATE ROLE admin;
ALTER ROLE admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5b9d11b3be25f5a1a7dc8ca04cd310b28';
CREATE ROLE candidatoapp;
ALTER ROLE candidatoapp WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5b653db658bceef61f4912c6229045984';
CREATE ROLE escolaapp;
ALTER ROLE escolaapp WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md51dd22791f0deb14dff6c9893289ff78f';
CREATE ROLE keycloak;
ALTER ROLE keycloak WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5df11eacaa0f4af30e4c8a149bc993d94';
CREATE ROLE processoapp;
ALTER ROLE processoapp WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md568032dca07567cee9a3099ef13ec19bd';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO admin;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: admin
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: admin
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: admin
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "candidato" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

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

--
-- Name: candidato; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE candidato WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE candidato OWNER TO admin;

\connect candidato

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
-- Name: candidato; Type: TABLE; Schema: public; Owner: candidatoapp
--

CREATE TABLE public.candidato (
    id bigint NOT NULL,
    celular character varying(255) NOT NULL,
    cpf character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_usuario character varying(255) NOT NULL,
    filiacao1 character varying(255) NOT NULL,
    filiacao2 character varying(255) NOT NULL,
    naturalidade character varying(255) NOT NULL,
    nome_completo character varying(255) NOT NULL,
    telefone_fixo character varying(255),
    educacao_id bigint NOT NULL,
    endereco_id bigint NOT NULL
);


ALTER TABLE public.candidato OWNER TO candidatoapp;

--
-- Name: candidato_sequence; Type: SEQUENCE; Schema: public; Owner: candidatoapp
--

CREATE SEQUENCE public.candidato_sequence
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.candidato_sequence OWNER TO candidatoapp;

--
-- Name: educacao; Type: TABLE; Schema: public; Owner: candidatoapp
--

CREATE TABLE public.educacao (
    id bigint NOT NULL,
    nivel_escolaridade character varying(255) NOT NULL
);


ALTER TABLE public.educacao OWNER TO candidatoapp;

--
-- Name: educacao_sequence; Type: SEQUENCE; Schema: public; Owner: candidatoapp
--

CREATE SEQUENCE public.educacao_sequence
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.educacao_sequence OWNER TO candidatoapp;

--
-- Name: endereco; Type: TABLE; Schema: public; Owner: candidatoapp
--

CREATE TABLE public.endereco (
    id bigint NOT NULL,
    bairro character varying(255) NOT NULL,
    cidade_residencia character varying(255) NOT NULL,
    estado_residencia character varying(255) NOT NULL,
    numero bigint NOT NULL,
    rua character varying(255) NOT NULL
);


ALTER TABLE public.endereco OWNER TO candidatoapp;

--
-- Name: endereco_sequence; Type: SEQUENCE; Schema: public; Owner: candidatoapp
--

CREATE SEQUENCE public.endereco_sequence
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.endereco_sequence OWNER TO candidatoapp;

--
-- Name: inscricao; Type: TABLE; Schema: public; Owner: candidatoapp
--

CREATE TABLE public.inscricao (
    id bigint NOT NULL,
    bairro character varying(255) NOT NULL,
    celular character varying(255) NOT NULL,
    cidade_residencia character varying(255) NOT NULL,
    cpf character varying(255) NOT NULL,
    data_inscricao timestamp without time zone NOT NULL,
    email character varying(255) NOT NULL,
    email_usuario character varying(255) NOT NULL,
    estado_residencia character varying(255) NOT NULL,
    filiacao1 character varying(255) NOT NULL,
    filiacao2 character varying(255) NOT NULL,
    naturalidade character varying(255) NOT NULL,
    nivel_escolaridade character varying(255) NOT NULL,
    nome_completo character varying(255) NOT NULL,
    numero bigint NOT NULL,
    processo_seletivo_id bigint NOT NULL,
    rua character varying(255) NOT NULL,
    situacao character varying(255),
    telefone_fixo character varying(255)
);


ALTER TABLE public.inscricao OWNER TO candidatoapp;

--
-- Name: inscricao_sequence; Type: SEQUENCE; Schema: public; Owner: candidatoapp
--

CREATE SEQUENCE public.inscricao_sequence
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inscricao_sequence OWNER TO candidatoapp;

--
-- Name: titulo; Type: TABLE; Schema: public; Owner: candidatoapp
--

CREATE TABLE public.titulo (
    id bigint NOT NULL,
    ano_conclusao integer NOT NULL,
    instituicao_ensino character varying(255) NOT NULL,
    titulo_curso character varying(255) NOT NULL,
    educacao_id bigint
);


ALTER TABLE public.titulo OWNER TO candidatoapp;

--
-- Name: titulo_inscricao; Type: TABLE; Schema: public; Owner: candidatoapp
--

CREATE TABLE public.titulo_inscricao (
    id bigint NOT NULL,
    ano_conclusao integer NOT NULL,
    instituicao_ensino character varying(255) NOT NULL,
    titulo_curso character varying(255) NOT NULL,
    inscricao_id bigint
);


ALTER TABLE public.titulo_inscricao OWNER TO candidatoapp;

--
-- Name: titulo_inscricao_sequence; Type: SEQUENCE; Schema: public; Owner: candidatoapp
--

CREATE SEQUENCE public.titulo_inscricao_sequence
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.titulo_inscricao_sequence OWNER TO candidatoapp;

--
-- Name: titulo_sequence; Type: SEQUENCE; Schema: public; Owner: candidatoapp
--

CREATE SEQUENCE public.titulo_sequence
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.titulo_sequence OWNER TO candidatoapp;

--
-- Data for Name: candidato; Type: TABLE DATA; Schema: public; Owner: candidatoapp
--

COPY public.candidato (id, celular, cpf, email, email_usuario, filiacao1, filiacao2, naturalidade, nome_completo, telefone_fixo, educacao_id, endereco_id) FROM stdin;
\.


--
-- Data for Name: educacao; Type: TABLE DATA; Schema: public; Owner: candidatoapp
--

COPY public.educacao (id, nivel_escolaridade) FROM stdin;
\.


--
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: candidatoapp
--

COPY public.endereco (id, bairro, cidade_residencia, estado_residencia, numero, rua) FROM stdin;
\.


--
-- Data for Name: inscricao; Type: TABLE DATA; Schema: public; Owner: candidatoapp
--

COPY public.inscricao (id, bairro, celular, cidade_residencia, cpf, data_inscricao, email, email_usuario, estado_residencia, filiacao1, filiacao2, naturalidade, nivel_escolaridade, nome_completo, numero, processo_seletivo_id, rua, situacao, telefone_fixo) FROM stdin;
\.


--
-- Data for Name: titulo; Type: TABLE DATA; Schema: public; Owner: candidatoapp
--

COPY public.titulo (id, ano_conclusao, instituicao_ensino, titulo_curso, educacao_id) FROM stdin;
\.


--
-- Data for Name: titulo_inscricao; Type: TABLE DATA; Schema: public; Owner: candidatoapp
--

COPY public.titulo_inscricao (id, ano_conclusao, instituicao_ensino, titulo_curso, inscricao_id) FROM stdin;
\.


--
-- Name: candidato_sequence; Type: SEQUENCE SET; Schema: public; Owner: candidatoapp
--

SELECT pg_catalog.setval('public.candidato_sequence', 1, false);


--
-- Name: educacao_sequence; Type: SEQUENCE SET; Schema: public; Owner: candidatoapp
--

SELECT pg_catalog.setval('public.educacao_sequence', 1, false);


--
-- Name: endereco_sequence; Type: SEQUENCE SET; Schema: public; Owner: candidatoapp
--

SELECT pg_catalog.setval('public.endereco_sequence', 1, false);


--
-- Name: inscricao_sequence; Type: SEQUENCE SET; Schema: public; Owner: candidatoapp
--

SELECT pg_catalog.setval('public.inscricao_sequence', 1, false);


--
-- Name: titulo_inscricao_sequence; Type: SEQUENCE SET; Schema: public; Owner: candidatoapp
--

SELECT pg_catalog.setval('public.titulo_inscricao_sequence', 1, false);


--
-- Name: titulo_sequence; Type: SEQUENCE SET; Schema: public; Owner: candidatoapp
--

SELECT pg_catalog.setval('public.titulo_sequence', 1, false);


--
-- Name: candidato candidato_pkey; Type: CONSTRAINT; Schema: public; Owner: candidatoapp
--

ALTER TABLE ONLY public.candidato
    ADD CONSTRAINT candidato_pkey PRIMARY KEY (id);


--
-- Name: educacao educacao_pkey; Type: CONSTRAINT; Schema: public; Owner: candidatoapp
--

ALTER TABLE ONLY public.educacao
    ADD CONSTRAINT educacao_pkey PRIMARY KEY (id);


--
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: candidatoapp
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);


--
-- Name: inscricao inscricao_pkey; Type: CONSTRAINT; Schema: public; Owner: candidatoapp
--

ALTER TABLE ONLY public.inscricao
    ADD CONSTRAINT inscricao_pkey PRIMARY KEY (id);


--
-- Name: titulo_inscricao titulo_inscricao_pkey; Type: CONSTRAINT; Schema: public; Owner: candidatoapp
--

ALTER TABLE ONLY public.titulo_inscricao
    ADD CONSTRAINT titulo_inscricao_pkey PRIMARY KEY (id);


--
-- Name: titulo titulo_pkey; Type: CONSTRAINT; Schema: public; Owner: candidatoapp
--

ALTER TABLE ONLY public.titulo
    ADD CONSTRAINT titulo_pkey PRIMARY KEY (id);


--
-- Name: titulo fkf9umvc44rjvdc9sb7x03jnavn; Type: FK CONSTRAINT; Schema: public; Owner: candidatoapp
--

ALTER TABLE ONLY public.titulo
    ADD CONSTRAINT fkf9umvc44rjvdc9sb7x03jnavn FOREIGN KEY (educacao_id) REFERENCES public.educacao(id);


--
-- Name: titulo_inscricao fkfbejy7tgclm226nh54dj4vvms; Type: FK CONSTRAINT; Schema: public; Owner: candidatoapp
--

ALTER TABLE ONLY public.titulo_inscricao
    ADD CONSTRAINT fkfbejy7tgclm226nh54dj4vvms FOREIGN KEY (inscricao_id) REFERENCES public.inscricao(id);


--
-- Name: candidato fkh9g703cdmoptwedk439pux0if; Type: FK CONSTRAINT; Schema: public; Owner: candidatoapp
--

ALTER TABLE ONLY public.candidato
    ADD CONSTRAINT fkh9g703cdmoptwedk439pux0if FOREIGN KEY (endereco_id) REFERENCES public.endereco(id);


--
-- Name: candidato fkm2aplxxy012oqf9kpnokax90d; Type: FK CONSTRAINT; Schema: public; Owner: candidatoapp
--

ALTER TABLE ONLY public.candidato
    ADD CONSTRAINT fkm2aplxxy012oqf9kpnokax90d FOREIGN KEY (educacao_id) REFERENCES public.educacao(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "escola" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

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

--
-- Name: escola; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE escola WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE escola OWNER TO admin;

\connect escola

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
-- Name: demanda_professores; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.demanda_professores (
    id bigint NOT NULL,
    ano integer NOT NULL,
    disciplina character varying(255) NOT NULL,
    escola character varying(255) NOT NULL,
    escola_id bigint NOT NULL,
    justificativa character varying(255) NOT NULL,
    quantidade integer NOT NULL,
    semestre integer NOT NULL
);


ALTER TABLE public.demanda_professores OWNER TO admin;

--
-- Name: demanda_professores_sequence; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.demanda_professores_sequence
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.demanda_professores_sequence OWNER TO admin;

--
-- Name: disciplina; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.disciplina (
    id bigint NOT NULL,
    ativa character varying(255) NOT NULL,
    nome character varying(255) NOT NULL
);


ALTER TABLE public.disciplina OWNER TO admin;

--
-- Name: disciplina_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.disciplina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disciplina_id_seq OWNER TO admin;

--
-- Name: disciplina_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.disciplina_id_seq OWNED BY public.disciplina.id;


--
-- Name: escola; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.escola (
    id bigint NOT NULL,
    nome character varying(255) NOT NULL
);


ALTER TABLE public.escola OWNER TO admin;

--
-- Name: escola_sequence; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.escola_sequence
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.escola_sequence OWNER TO admin;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.usuario (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    escola_id bigint
);


ALTER TABLE public.usuario OWNER TO admin;

--
-- Name: usuario_sequence; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.usuario_sequence
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_sequence OWNER TO admin;

--
-- Name: disciplina id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.disciplina ALTER COLUMN id SET DEFAULT nextval('public.disciplina_id_seq'::regclass);


--
-- Data for Name: demanda_professores; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.demanda_professores (id, ano, disciplina, escola, escola_id, justificativa, quantidade, semestre) FROM stdin;
\.


--
-- Data for Name: disciplina; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.disciplina (id, ativa, nome) FROM stdin;
\.


--
-- Data for Name: escola; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.escola (id, nome) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.usuario (id, email, nome, escola_id) FROM stdin;
\.


--
-- Name: demanda_professores_sequence; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.demanda_professores_sequence', 1, false);


--
-- Name: disciplina_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.disciplina_id_seq', 1, false);


--
-- Name: escola_sequence; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.escola_sequence', 1, false);


--
-- Name: usuario_sequence; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.usuario_sequence', 1, false);


--
-- Name: demanda_professores demanda_professores_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.demanda_professores
    ADD CONSTRAINT demanda_professores_pkey PRIMARY KEY (id);


--
-- Name: disciplina disciplina_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.disciplina
    ADD CONSTRAINT disciplina_pkey PRIMARY KEY (id);


--
-- Name: escola escola_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.escola
    ADD CONSTRAINT escola_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: usuario fkgvp4dx45wgdfxahkm9e80hmdy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fkgvp4dx45wgdfxahkm9e80hmdy FOREIGN KEY (escola_id) REFERENCES public.escola(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "keycloak" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

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

--
-- Name: keycloak; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE keycloak OWNER TO admin;

\connect keycloak

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
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_default_roles; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_default_roles (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_default_roles OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_default_roles; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_roles (
    realm_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_roles OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
505df013-5a2e-465e-b21a-f1944cc3022a	\N	auth-cookie	master	b105013f-9083-42f1-946c-92c51c6f0dfd	2	10	f	\N	\N
5f527f02-0ecd-4620-86cb-d53c04c77761	\N	auth-spnego	master	b105013f-9083-42f1-946c-92c51c6f0dfd	3	20	f	\N	\N
89396558-9f1b-4907-b3a6-99d85a24df4f	\N	identity-provider-redirector	master	b105013f-9083-42f1-946c-92c51c6f0dfd	2	25	f	\N	\N
c1f71d03-fc69-4d33-8eec-c1c601456f1d	\N	\N	master	b105013f-9083-42f1-946c-92c51c6f0dfd	2	30	t	e8669409-2fac-4529-9cc1-e35af584a556	\N
82a6a4d5-fa82-4ef5-9ad5-9ce789f4781b	\N	auth-username-password-form	master	e8669409-2fac-4529-9cc1-e35af584a556	0	10	f	\N	\N
fc176c0e-7a94-4e46-b8a1-e770854cdf11	\N	\N	master	e8669409-2fac-4529-9cc1-e35af584a556	1	20	t	9e0563dd-b8ad-426c-9952-0d74e9773169	\N
22b0f45d-b4ff-438c-b504-4ade9e289349	\N	conditional-user-configured	master	9e0563dd-b8ad-426c-9952-0d74e9773169	0	10	f	\N	\N
ad8169b4-976f-4a8b-b403-52c803a1f69c	\N	auth-otp-form	master	9e0563dd-b8ad-426c-9952-0d74e9773169	0	20	f	\N	\N
d5ec3ab2-3019-46c5-a3e7-546c7f117884	\N	direct-grant-validate-username	master	583047f5-b8d1-4ff5-b2cd-9574757bf971	0	10	f	\N	\N
20884d34-5829-4547-a941-4045cceed1f5	\N	direct-grant-validate-password	master	583047f5-b8d1-4ff5-b2cd-9574757bf971	0	20	f	\N	\N
5bc67b4f-c610-4480-94e4-3a4ecda8f707	\N	\N	master	583047f5-b8d1-4ff5-b2cd-9574757bf971	1	30	t	dff8c26a-c49e-42db-898b-072e9a3d8ef0	\N
6af1269d-7f4c-4e12-9b2d-6494207ca95a	\N	conditional-user-configured	master	dff8c26a-c49e-42db-898b-072e9a3d8ef0	0	10	f	\N	\N
7a1617d6-146b-471d-ae3c-daea5e6ea080	\N	direct-grant-validate-otp	master	dff8c26a-c49e-42db-898b-072e9a3d8ef0	0	20	f	\N	\N
e4f08c18-98b7-4b91-8243-86caa5fbdccc	\N	registration-page-form	master	947d1b96-f90d-4d95-aa53-efa9b9cf351d	0	10	t	36ec1aad-f895-43e3-a341-99ca77c3e4f0	\N
dcdcab94-4b81-4bb6-8e97-8c9661fc4281	\N	registration-user-creation	master	36ec1aad-f895-43e3-a341-99ca77c3e4f0	0	20	f	\N	\N
aae83141-88fd-473a-82ef-18e74ecb8492	\N	registration-profile-action	master	36ec1aad-f895-43e3-a341-99ca77c3e4f0	0	40	f	\N	\N
b00e3b2a-0d8f-4af7-846e-374da1bd1f3c	\N	registration-password-action	master	36ec1aad-f895-43e3-a341-99ca77c3e4f0	0	50	f	\N	\N
fe0e584d-9b8e-4ab5-9e86-9d88960da5f0	\N	registration-recaptcha-action	master	36ec1aad-f895-43e3-a341-99ca77c3e4f0	3	60	f	\N	\N
1242e1dc-23a9-4943-98f3-69a07bcd8449	\N	reset-credentials-choose-user	master	5611872a-460e-4808-9d77-45a8b178f96d	0	10	f	\N	\N
6d24e668-bb06-4c24-bfc3-5f1ea208756d	\N	reset-credential-email	master	5611872a-460e-4808-9d77-45a8b178f96d	0	20	f	\N	\N
3cbf00e6-118c-4e30-b155-4a89dc518531	\N	reset-password	master	5611872a-460e-4808-9d77-45a8b178f96d	0	30	f	\N	\N
24829dee-b532-4e81-99eb-82d746950153	\N	\N	master	5611872a-460e-4808-9d77-45a8b178f96d	1	40	t	6bca3cb4-53c5-435d-bd00-4ec79e9e2c10	\N
8c771580-a5b1-4f9d-a5bb-e2c2c314424c	\N	conditional-user-configured	master	6bca3cb4-53c5-435d-bd00-4ec79e9e2c10	0	10	f	\N	\N
bdc7324e-554e-494d-a568-bd41f1d12de4	\N	reset-otp	master	6bca3cb4-53c5-435d-bd00-4ec79e9e2c10	0	20	f	\N	\N
1b72a4dc-850d-41c4-86a8-9330f82078f6	\N	client-secret	master	fb94b6d0-68b6-46b3-a771-73123d84e296	2	10	f	\N	\N
6355109c-0a34-4d3f-9db1-fff877668711	\N	client-jwt	master	fb94b6d0-68b6-46b3-a771-73123d84e296	2	20	f	\N	\N
5571241f-4702-4d09-80ac-95732fae5eeb	\N	client-secret-jwt	master	fb94b6d0-68b6-46b3-a771-73123d84e296	2	30	f	\N	\N
be5e87ba-1fd0-4070-bde1-028df8892bcd	\N	client-x509	master	fb94b6d0-68b6-46b3-a771-73123d84e296	2	40	f	\N	\N
fb1dceb8-bdb3-4da5-891a-a0ebd03d13fa	\N	idp-review-profile	master	95785c26-9c15-4f1b-9358-932c6828ab79	0	10	f	\N	e259a0e5-e3a2-41ef-83ef-75fe29f7998d
c152be35-94b6-4fcb-b6f7-79e0202945ce	\N	\N	master	95785c26-9c15-4f1b-9358-932c6828ab79	0	20	t	98378248-3f33-47e2-bcd6-1cf174e981b6	\N
ad7dc637-c5ea-411a-9c01-59be3757ab8e	\N	idp-create-user-if-unique	master	98378248-3f33-47e2-bcd6-1cf174e981b6	2	10	f	\N	07bf8c2e-132b-4aea-ac2b-03d3650947bd
7cfed498-c544-49ea-8867-d62787b9dbf3	\N	\N	master	98378248-3f33-47e2-bcd6-1cf174e981b6	2	20	t	9dca4852-162a-4cc8-9974-cce1a3b45c07	\N
2c1202e7-cade-4c04-82af-9a3781939b55	\N	idp-confirm-link	master	9dca4852-162a-4cc8-9974-cce1a3b45c07	0	10	f	\N	\N
3433d891-d762-4b69-a167-2f2b38ced48a	\N	\N	master	9dca4852-162a-4cc8-9974-cce1a3b45c07	0	20	t	5c3b0a4c-9d62-422b-a22b-7eeb55e39017	\N
0426a3ae-3eed-4fec-9334-36784257efcf	\N	idp-email-verification	master	5c3b0a4c-9d62-422b-a22b-7eeb55e39017	2	10	f	\N	\N
771fa143-99ea-4c98-a391-ceeb99c1a4bf	\N	\N	master	5c3b0a4c-9d62-422b-a22b-7eeb55e39017	2	20	t	70d3065d-a8c0-4715-a6f5-250082685567	\N
5fa5da0f-dec6-4f85-b500-2e83eb7e5425	\N	idp-username-password-form	master	70d3065d-a8c0-4715-a6f5-250082685567	0	10	f	\N	\N
2f2c50f8-d5ad-474d-be93-a178b4b43c91	\N	\N	master	70d3065d-a8c0-4715-a6f5-250082685567	1	20	t	af85fbd3-6b8a-45cc-8702-f07c5a2e58f8	\N
3f815432-172a-4299-accf-29fc332bd373	\N	conditional-user-configured	master	af85fbd3-6b8a-45cc-8702-f07c5a2e58f8	0	10	f	\N	\N
cd1b097f-9366-4508-8a13-054490f44942	\N	auth-otp-form	master	af85fbd3-6b8a-45cc-8702-f07c5a2e58f8	0	20	f	\N	\N
1ebf64ab-92dd-4513-8559-5fcd5b64d407	\N	http-basic-authenticator	master	c2f0675f-745c-4240-ae0d-23e346100a74	0	10	f	\N	\N
42d987af-4425-4ac4-8bb4-ee5e393f7f75	\N	docker-http-basic-authenticator	master	fd8bec64-cef3-4667-b738-09371a92e64b	0	10	f	\N	\N
59cb9a56-bd37-49e8-859a-f967d0ace7b7	\N	no-cookie-redirect	master	3fe4af60-310f-4f6a-94fd-6d429e715e54	0	10	f	\N	\N
7f364d6e-a520-4458-9f62-a8897cc89476	\N	\N	master	3fe4af60-310f-4f6a-94fd-6d429e715e54	0	20	t	b98250ea-598e-4cea-b972-5b3f69cc3a70	\N
2973386c-d1c5-4951-ab2a-eb430444815d	\N	basic-auth	master	b98250ea-598e-4cea-b972-5b3f69cc3a70	0	10	f	\N	\N
2b9e84d8-a7b3-453d-b77f-32c8af0121ab	\N	basic-auth-otp	master	b98250ea-598e-4cea-b972-5b3f69cc3a70	3	20	f	\N	\N
5d4d1c8a-586e-40d4-921e-19e34ea69a51	\N	auth-spnego	master	b98250ea-598e-4cea-b972-5b3f69cc3a70	3	30	f	\N	\N
ae0295e8-f82b-4e94-b3ca-9efc5ca86909	\N	idp-email-verification	edukare	eabacfd5-b190-46fa-8cd7-74305495f16f	2	10	f	\N	\N
341a8a82-a1d4-4c98-ac9e-177230148708	\N	\N	edukare	eabacfd5-b190-46fa-8cd7-74305495f16f	2	20	t	76b49c16-2b7b-46ad-9588-5d92ebff95ab	\N
eff12282-b37a-4e36-834d-9f22209b58a6	\N	basic-auth	edukare	cae9f62a-0ed5-48d7-aa3a-82cc5aff6db2	0	10	f	\N	\N
cc9d4aaf-7b72-4800-be60-d74e469228f0	\N	basic-auth-otp	edukare	cae9f62a-0ed5-48d7-aa3a-82cc5aff6db2	3	20	f	\N	\N
f2bde838-981d-4e6c-a49e-8d7013bfa904	\N	auth-spnego	edukare	cae9f62a-0ed5-48d7-aa3a-82cc5aff6db2	3	30	f	\N	\N
fd3276dd-e042-4e24-aa6b-3344d691b450	\N	conditional-user-configured	edukare	6b133614-7032-4934-919d-c88663b3128d	0	10	f	\N	\N
a62d59b2-36fa-4149-8920-bb1dc404c6d3	\N	auth-otp-form	edukare	6b133614-7032-4934-919d-c88663b3128d	0	20	f	\N	\N
136d09b0-a82a-4dbd-bdc4-bcdb98dd729c	\N	conditional-user-configured	edukare	9ca8b235-8f1a-42c6-8262-cfdd4d61bc0e	0	10	f	\N	\N
7d8b822b-76b4-44d7-a7aa-71f9fe91ebf0	\N	direct-grant-validate-otp	edukare	9ca8b235-8f1a-42c6-8262-cfdd4d61bc0e	0	20	f	\N	\N
14e729d0-d54f-42a6-834c-ad0ffa19e224	\N	conditional-user-configured	edukare	a8341d39-6eeb-46ad-8777-5aafeff580cb	0	10	f	\N	\N
a7efdb13-29e0-47a9-b816-e7f2963c36c0	\N	auth-otp-form	edukare	a8341d39-6eeb-46ad-8777-5aafeff580cb	0	20	f	\N	\N
2346a37e-e452-46bd-ba9f-4e0c935f4b3c	\N	idp-confirm-link	edukare	e1eedcc1-685f-4874-822b-6c095991434c	0	10	f	\N	\N
49f4f77b-a8e9-40e2-9447-269d1df886ba	\N	\N	edukare	e1eedcc1-685f-4874-822b-6c095991434c	0	20	t	eabacfd5-b190-46fa-8cd7-74305495f16f	\N
42f9b61a-d81e-4527-a3ad-7cf0b650c796	\N	conditional-user-configured	edukare	2bfefa1a-3f27-4f36-9685-97fe754342c4	0	10	f	\N	\N
67df0783-826f-4ffc-b3ae-3c800bd9793f	\N	reset-otp	edukare	2bfefa1a-3f27-4f36-9685-97fe754342c4	0	20	f	\N	\N
9164cb7b-b556-4bda-a933-29e9313847f7	\N	idp-create-user-if-unique	edukare	c406754e-dae9-4ba2-9e2b-3d0d130d6da2	2	10	f	\N	62c9c1a8-0ab1-4ef7-8985-71aebc87430b
800531ff-e297-4fd0-9721-cc2ad6265837	\N	\N	edukare	c406754e-dae9-4ba2-9e2b-3d0d130d6da2	2	20	t	e1eedcc1-685f-4874-822b-6c095991434c	\N
44deba6e-7330-46bd-b8ee-4e46b7733c5c	\N	idp-username-password-form	edukare	76b49c16-2b7b-46ad-9588-5d92ebff95ab	0	10	f	\N	\N
23a2b2f1-d03f-460b-beb3-92f4ae29811c	\N	\N	edukare	76b49c16-2b7b-46ad-9588-5d92ebff95ab	1	20	t	a8341d39-6eeb-46ad-8777-5aafeff580cb	\N
5f974306-b9b3-4295-bbc3-4b6e98677643	\N	auth-cookie	edukare	3c883951-4888-41b9-9a40-35d6c2fa09db	2	10	f	\N	\N
c5662adc-6086-4754-94f7-05afb64c1d30	\N	auth-spnego	edukare	3c883951-4888-41b9-9a40-35d6c2fa09db	3	20	f	\N	\N
809fb061-3dfa-4414-afd8-d4181e7bb61f	\N	identity-provider-redirector	edukare	3c883951-4888-41b9-9a40-35d6c2fa09db	2	25	f	\N	\N
b51c07d6-c940-4c86-b0c3-ed68a31b5d6c	\N	\N	edukare	3c883951-4888-41b9-9a40-35d6c2fa09db	2	30	t	ab79918f-9815-4e0b-bccc-5ac193a31471	\N
0545debf-4787-4e52-818c-cba0050fddea	\N	client-secret	edukare	5d1e66c4-7a79-421f-95c4-545e2187f4e9	2	10	f	\N	\N
8be97ed5-f4fa-455a-a61a-6788adc762ef	\N	client-jwt	edukare	5d1e66c4-7a79-421f-95c4-545e2187f4e9	2	20	f	\N	\N
08d3be22-4523-40d7-b8bd-5792f97f81d1	\N	client-secret-jwt	edukare	5d1e66c4-7a79-421f-95c4-545e2187f4e9	2	30	f	\N	\N
332eab63-4438-4b73-912c-d1bcd8779531	\N	client-x509	edukare	5d1e66c4-7a79-421f-95c4-545e2187f4e9	2	40	f	\N	\N
13963eff-6a25-451b-b1f9-420812b5a87b	\N	direct-grant-validate-username	edukare	a3763e91-60b3-4b67-ac70-974500737cee	0	10	f	\N	\N
ba770aa6-ca1b-46e7-a585-95ac65e2d72d	\N	direct-grant-validate-password	edukare	a3763e91-60b3-4b67-ac70-974500737cee	0	20	f	\N	\N
e7b9a736-7b06-48b4-8e63-07978be3e1b7	\N	\N	edukare	a3763e91-60b3-4b67-ac70-974500737cee	1	30	t	9ca8b235-8f1a-42c6-8262-cfdd4d61bc0e	\N
b667b881-896a-4877-8891-101795d1a5bf	\N	docker-http-basic-authenticator	edukare	64c04599-b0a4-4c73-a0b4-dac974b77350	0	10	f	\N	\N
e9835a2d-19d7-4f66-a35a-6d14af7fa9a7	\N	idp-review-profile	edukare	cd1ba4c8-7029-412a-99d7-4d08b9f0aa5b	0	10	f	\N	904b5a4d-3942-4e83-b8c8-349fea5c68ae
d5f2334a-25ce-4b26-acd4-01d89ada1c4f	\N	\N	edukare	cd1ba4c8-7029-412a-99d7-4d08b9f0aa5b	0	20	t	c406754e-dae9-4ba2-9e2b-3d0d130d6da2	\N
40ec688b-1af4-4dfa-ac99-beda58e9898a	\N	auth-username-password-form	edukare	ab79918f-9815-4e0b-bccc-5ac193a31471	0	10	f	\N	\N
db2634e1-7d94-45a7-8f11-b6d7c3a0a150	\N	\N	edukare	ab79918f-9815-4e0b-bccc-5ac193a31471	1	20	t	6b133614-7032-4934-919d-c88663b3128d	\N
f459b959-0c53-4e35-a4bf-1ab5b73fe6d6	\N	no-cookie-redirect	edukare	a8db4b4c-2d7e-40d0-951c-65c2d613274c	0	10	f	\N	\N
d7491f14-ea34-497c-8498-88fce28e636e	\N	\N	edukare	a8db4b4c-2d7e-40d0-951c-65c2d613274c	0	20	t	cae9f62a-0ed5-48d7-aa3a-82cc5aff6db2	\N
74120c0b-2981-44d9-848d-686a361cddc7	\N	registration-page-form	edukare	7e168018-732a-48c5-aa08-98e5cd31b5e3	0	10	t	89b12803-7c8d-4566-9db9-cbe8349c7361	\N
a6c25302-c73a-45e2-be09-87291c4ad6a8	\N	registration-user-creation	edukare	89b12803-7c8d-4566-9db9-cbe8349c7361	0	20	f	\N	\N
58996418-d62f-4c7d-b7b7-74b2676fe186	\N	registration-profile-action	edukare	89b12803-7c8d-4566-9db9-cbe8349c7361	0	40	f	\N	\N
1ade8023-da0e-4d52-b7ce-3e7d0e06d46c	\N	registration-password-action	edukare	89b12803-7c8d-4566-9db9-cbe8349c7361	0	50	f	\N	\N
d91c3242-bf2e-4b65-9a40-98e25709eed1	\N	registration-recaptcha-action	edukare	89b12803-7c8d-4566-9db9-cbe8349c7361	3	60	f	\N	\N
2354ecf2-cc8a-4ec1-ac62-db8d0583e450	\N	reset-credentials-choose-user	edukare	5ef1a5dd-f375-411d-b7c3-102a7e95c8cc	0	10	f	\N	\N
d96532e1-de93-4c50-afe6-c245128fdcd5	\N	reset-credential-email	edukare	5ef1a5dd-f375-411d-b7c3-102a7e95c8cc	0	20	f	\N	\N
3eda6516-c87c-4315-98b6-a5a108a83752	\N	reset-password	edukare	5ef1a5dd-f375-411d-b7c3-102a7e95c8cc	0	30	f	\N	\N
5cc61a69-9322-478b-827a-73ce338c351b	\N	\N	edukare	5ef1a5dd-f375-411d-b7c3-102a7e95c8cc	1	40	t	2bfefa1a-3f27-4f36-9685-97fe754342c4	\N
4c42a817-7d10-4709-9b7b-720a03b62788	\N	http-basic-authenticator	edukare	8f636b17-a0f8-4577-b5e5-aee1891c3282	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
b105013f-9083-42f1-946c-92c51c6f0dfd	browser	browser based authentication	master	basic-flow	t	t
e8669409-2fac-4529-9cc1-e35af584a556	forms	Username, password, otp and other auth forms.	master	basic-flow	f	t
9e0563dd-b8ad-426c-9952-0d74e9773169	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
583047f5-b8d1-4ff5-b2cd-9574757bf971	direct grant	OpenID Connect Resource Owner Grant	master	basic-flow	t	t
dff8c26a-c49e-42db-898b-072e9a3d8ef0	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
947d1b96-f90d-4d95-aa53-efa9b9cf351d	registration	registration flow	master	basic-flow	t	t
36ec1aad-f895-43e3-a341-99ca77c3e4f0	registration form	registration form	master	form-flow	f	t
5611872a-460e-4808-9d77-45a8b178f96d	reset credentials	Reset credentials for a user if they forgot their password or something	master	basic-flow	t	t
6bca3cb4-53c5-435d-bd00-4ec79e9e2c10	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	master	basic-flow	f	t
fb94b6d0-68b6-46b3-a771-73123d84e296	clients	Base authentication for clients	master	client-flow	t	t
95785c26-9c15-4f1b-9358-932c6828ab79	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	master	basic-flow	t	t
98378248-3f33-47e2-bcd6-1cf174e981b6	User creation or linking	Flow for the existing/non-existing user alternatives	master	basic-flow	f	t
9dca4852-162a-4cc8-9974-cce1a3b45c07	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	master	basic-flow	f	t
5c3b0a4c-9d62-422b-a22b-7eeb55e39017	Account verification options	Method with which to verity the existing account	master	basic-flow	f	t
70d3065d-a8c0-4715-a6f5-250082685567	Verify Existing Account by Re-authentication	Reauthentication of existing account	master	basic-flow	f	t
af85fbd3-6b8a-45cc-8702-f07c5a2e58f8	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
c2f0675f-745c-4240-ae0d-23e346100a74	saml ecp	SAML ECP Profile Authentication Flow	master	basic-flow	t	t
fd8bec64-cef3-4667-b738-09371a92e64b	docker auth	Used by Docker clients to authenticate against the IDP	master	basic-flow	t	t
3fe4af60-310f-4f6a-94fd-6d429e715e54	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	master	basic-flow	t	t
b98250ea-598e-4cea-b972-5b3f69cc3a70	Authentication Options	Authentication options.	master	basic-flow	f	t
eabacfd5-b190-46fa-8cd7-74305495f16f	Account verification options	Method with which to verity the existing account	edukare	basic-flow	f	t
cae9f62a-0ed5-48d7-aa3a-82cc5aff6db2	Authentication Options	Authentication options.	edukare	basic-flow	f	t
6b133614-7032-4934-919d-c88663b3128d	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	edukare	basic-flow	f	t
9ca8b235-8f1a-42c6-8262-cfdd4d61bc0e	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	edukare	basic-flow	f	t
a8341d39-6eeb-46ad-8777-5aafeff580cb	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	edukare	basic-flow	f	t
e1eedcc1-685f-4874-822b-6c095991434c	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	edukare	basic-flow	f	t
2bfefa1a-3f27-4f36-9685-97fe754342c4	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	edukare	basic-flow	f	t
c406754e-dae9-4ba2-9e2b-3d0d130d6da2	User creation or linking	Flow for the existing/non-existing user alternatives	edukare	basic-flow	f	t
76b49c16-2b7b-46ad-9588-5d92ebff95ab	Verify Existing Account by Re-authentication	Reauthentication of existing account	edukare	basic-flow	f	t
3c883951-4888-41b9-9a40-35d6c2fa09db	browser	browser based authentication	edukare	basic-flow	t	t
5d1e66c4-7a79-421f-95c4-545e2187f4e9	clients	Base authentication for clients	edukare	client-flow	t	t
a3763e91-60b3-4b67-ac70-974500737cee	direct grant	OpenID Connect Resource Owner Grant	edukare	basic-flow	t	t
64c04599-b0a4-4c73-a0b4-dac974b77350	docker auth	Used by Docker clients to authenticate against the IDP	edukare	basic-flow	t	t
cd1ba4c8-7029-412a-99d7-4d08b9f0aa5b	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	edukare	basic-flow	t	t
ab79918f-9815-4e0b-bccc-5ac193a31471	forms	Username, password, otp and other auth forms.	edukare	basic-flow	f	t
a8db4b4c-2d7e-40d0-951c-65c2d613274c	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	edukare	basic-flow	t	t
7e168018-732a-48c5-aa08-98e5cd31b5e3	registration	registration flow	edukare	basic-flow	t	t
89b12803-7c8d-4566-9db9-cbe8349c7361	registration form	registration form	edukare	form-flow	f	t
5ef1a5dd-f375-411d-b7c3-102a7e95c8cc	reset credentials	Reset credentials for a user if they forgot their password or something	edukare	basic-flow	t	t
8f636b17-a0f8-4577-b5e5-aee1891c3282	saml ecp	SAML ECP Profile Authentication Flow	edukare	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
e259a0e5-e3a2-41ef-83ef-75fe29f7998d	review profile config	master
07bf8c2e-132b-4aea-ac2b-03d3650947bd	create unique user config	master
62c9c1a8-0ab1-4ef7-8985-71aebc87430b	create unique user config	edukare
904b5a4d-3942-4e83-b8c8-349fea5c68ae	review profile config	edukare
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
e259a0e5-e3a2-41ef-83ef-75fe29f7998d	missing	update.profile.on.first.login
07bf8c2e-132b-4aea-ac2b-03d3650947bd	false	require.password.update.after.registration
62c9c1a8-0ab1-4ef7-8985-71aebc87430b	false	require.password.update.after.registration
904b5a4d-3942-4e83-b8c8-349fea5c68ae	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
8afe9f43-58e9-4ded-b864-1782d2d87670	t	t	master-realm	0	f	02012fdf-5409-4528-accb-6de2912ba6d9	\N	t	\N	f	master	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	t	f	account	0	f	8d0d5ae9-92a9-4bfb-bff2-a2e070440066	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
96524905-088e-4c9a-ad36-f411231992f0	t	f	account-console	0	t	f0d5a8f7-510c-4121-a7a9-69e34e7dae98	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
258852dc-0f14-421c-9cd6-a9c88edf88e3	t	f	broker	0	f	d6385cb6-951e-4cfe-acaa-7c5af13675b1	\N	f	\N	f	master	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
730eb95f-f8fc-4d08-97d4-fb8e7afa9ce6	t	f	security-admin-console	0	t	cdf90a6e-1ae4-49ba-bae0-c9dde0d127b0	/admin/master/console/	f	\N	f	master	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
4f894fd5-753a-480a-ac07-9eadaaba4647	t	f	admin-cli	0	t	9f814287-b3f8-45f7-b1bc-7bb3e8bd6ea0	\N	f	\N	f	master	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
050ce0e7-6fc5-4499-af6f-c3237a169d30	t	t	edukare-realm	0	f	faddae46-6e1e-4edb-95c6-48c358af66a5	\N	t	\N	f	master	\N	0	f	f	edukare Realm	f	client-secret	\N	\N	\N	t	f	f	f
987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	t	f	account	0	f	**********	/realms/edukare/account/	f	\N	f	edukare	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
8ba9b806-3d2e-4d2b-a631-eb3b6746faad	t	f	account-console	0	t	**********	/realms/edukare/account/	f	\N	f	edukare	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
751a85a3-1d42-4bc2-b586-af6122c295e4	t	f	admin-cli	0	t	**********	\N	f	\N	f	edukare	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
21cf3e28-7dc4-44de-9052-3db6b6ee9eb6	t	f	broker	0	f	**********	\N	f	\N	f	edukare	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
8f4857b7-d402-4ae8-b8c7-2ede589a5865	t	t	gateway	0	f	**********	\N	f	http://localhost:8080	f	edukare	openid-connect	-1	f	f	\N	f	client-secret	http://localhost:8080	\N	\N	t	f	t	f
8edf80fd-3e16-4067-8206-f838b2b63d7d	t	f	realm-management	0	f	**********	\N	t	\N	f	edukare	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
9b279deb-ff44-4e32-9529-602ea54d6056	t	f	security-admin-console	0	t	**********	/admin/edukare/console/	f	\N	f	edukare	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
553bd174-14f6-43f4-b3e3-856a8963ac32	t	t	webapp	0	t	**********	\N	f	http://localhost:4200	f	edukare	openid-connect	-1	f	f	\N	f	client-secret	http://localhost:4200	\N	\N	t	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
96524905-088e-4c9a-ad36-f411231992f0	S256	pkce.code.challenge.method
730eb95f-f8fc-4d08-97d4-fb8e7afa9ce6	S256	pkce.code.challenge.method
8ba9b806-3d2e-4d2b-a631-eb3b6746faad	S256	pkce.code.challenge.method
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	saml.assertion.signature
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	saml.force.post.binding
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	saml.multivalued.roles
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	saml.encrypt
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	backchannel.logout.revoke.offline.tokens
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	saml.server.signature
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	saml.server.signature.keyinfo.ext
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	exclude.session.state.from.auth.response
8f4857b7-d402-4ae8-b8c7-2ede589a5865	true	backchannel.logout.session.required
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	client_credentials.use_refresh_token
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	saml_force_name_id_format
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	saml.client.signature
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	tls.client.certificate.bound.access.tokens
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	saml.authnstatement
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	display.on.consent.screen
8f4857b7-d402-4ae8-b8c7-2ede589a5865	false	saml.onetimeuse.condition
9b279deb-ff44-4e32-9529-602ea54d6056	S256	pkce.code.challenge.method
553bd174-14f6-43f4-b3e3-856a8963ac32	false	saml.assertion.signature
553bd174-14f6-43f4-b3e3-856a8963ac32	false	saml.force.post.binding
553bd174-14f6-43f4-b3e3-856a8963ac32	false	saml.multivalued.roles
553bd174-14f6-43f4-b3e3-856a8963ac32	false	saml.encrypt
553bd174-14f6-43f4-b3e3-856a8963ac32	false	backchannel.logout.revoke.offline.tokens
553bd174-14f6-43f4-b3e3-856a8963ac32	false	saml.server.signature
553bd174-14f6-43f4-b3e3-856a8963ac32	false	saml.server.signature.keyinfo.ext
553bd174-14f6-43f4-b3e3-856a8963ac32	false	exclude.session.state.from.auth.response
553bd174-14f6-43f4-b3e3-856a8963ac32	true	backchannel.logout.session.required
553bd174-14f6-43f4-b3e3-856a8963ac32	false	client_credentials.use_refresh_token
553bd174-14f6-43f4-b3e3-856a8963ac32	false	saml_force_name_id_format
553bd174-14f6-43f4-b3e3-856a8963ac32	false	saml.client.signature
553bd174-14f6-43f4-b3e3-856a8963ac32	false	tls.client.certificate.bound.access.tokens
553bd174-14f6-43f4-b3e3-856a8963ac32	false	saml.authnstatement
553bd174-14f6-43f4-b3e3-856a8963ac32	false	display.on.consent.screen
553bd174-14f6-43f4-b3e3-856a8963ac32	false	saml.onetimeuse.condition
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_default_roles (client_id, role_id) FROM stdin;
4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	7568b522-06cf-41c0-b3a2-6837f8edc0fd
4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	9664541a-0f9a-45f6-944e-261396bff9c6
987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	fa4f84cf-1038-445d-ad0c-c7d052db0b9b
987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	d9a246ef-1dc2-44a6-9c5d-389b6caa1536
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
66173265-acae-4908-a6fa-f8084780c265	offline_access	master	OpenID Connect built-in scope: offline_access	openid-connect
ad0b1819-a5fd-4b04-967f-37e3d2bbe1c3	role_list	master	SAML role list	saml
be074402-9093-4ca8-844a-2bef39fdec7f	profile	master	OpenID Connect built-in scope: profile	openid-connect
c21d91db-948f-4af9-a9f3-da2cb72b88ae	email	master	OpenID Connect built-in scope: email	openid-connect
3455d000-0c4a-402f-82a9-22a14e609d36	address	master	OpenID Connect built-in scope: address	openid-connect
1821bde3-b2fa-4a3f-a244-9a96b5b412c5	phone	master	OpenID Connect built-in scope: phone	openid-connect
4ab66071-a7be-4809-b3b9-239ece01780d	roles	master	OpenID Connect scope for add user roles to the access token	openid-connect
05279f8b-b4e2-4c92-ae53-0241ee86da0f	web-origins	master	OpenID Connect scope for add allowed web origins to the access token	openid-connect
69ef1ebb-0cca-4558-9088-5e8881903c70	microprofile-jwt	master	Microprofile - JWT built-in scope	openid-connect
3d9506dc-4043-4dca-b0e2-3b9abee91e12	address	edukare	OpenID Connect built-in scope: address	openid-connect
07c5d8ab-320d-44ab-b9a8-8e53a5468300	email	edukare	OpenID Connect built-in scope: email	openid-connect
be6e69d6-ecb6-41ab-aff0-f42d58701fe9	microprofile-jwt	edukare	Microprofile - JWT built-in scope	openid-connect
711ec79b-d3f2-4a1d-9b6a-2e3959bc64b8	offline_access	edukare	OpenID Connect built-in scope: offline_access	openid-connect
281d9623-40fb-492a-9fb0-9d8d0c17cb9d	phone	edukare	OpenID Connect built-in scope: phone	openid-connect
8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff	profile	edukare	OpenID Connect built-in scope: profile	openid-connect
89f9be1e-c089-4bf1-885e-1eae41fac07c	role_list	edukare	SAML role list	saml
cbf5d1f5-ef2a-496d-b151-d118f470ddd1	roles	edukare	OpenID Connect scope for add user roles to the access token	openid-connect
ecab7702-b663-496a-8984-7c499f4455df	web-origins	edukare	OpenID Connect scope for add allowed web origins to the access token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
66173265-acae-4908-a6fa-f8084780c265	true	display.on.consent.screen
66173265-acae-4908-a6fa-f8084780c265	${offlineAccessScopeConsentText}	consent.screen.text
ad0b1819-a5fd-4b04-967f-37e3d2bbe1c3	true	display.on.consent.screen
ad0b1819-a5fd-4b04-967f-37e3d2bbe1c3	${samlRoleListScopeConsentText}	consent.screen.text
be074402-9093-4ca8-844a-2bef39fdec7f	true	display.on.consent.screen
be074402-9093-4ca8-844a-2bef39fdec7f	${profileScopeConsentText}	consent.screen.text
be074402-9093-4ca8-844a-2bef39fdec7f	true	include.in.token.scope
c21d91db-948f-4af9-a9f3-da2cb72b88ae	true	display.on.consent.screen
c21d91db-948f-4af9-a9f3-da2cb72b88ae	${emailScopeConsentText}	consent.screen.text
c21d91db-948f-4af9-a9f3-da2cb72b88ae	true	include.in.token.scope
3455d000-0c4a-402f-82a9-22a14e609d36	true	display.on.consent.screen
3455d000-0c4a-402f-82a9-22a14e609d36	${addressScopeConsentText}	consent.screen.text
3455d000-0c4a-402f-82a9-22a14e609d36	true	include.in.token.scope
1821bde3-b2fa-4a3f-a244-9a96b5b412c5	true	display.on.consent.screen
1821bde3-b2fa-4a3f-a244-9a96b5b412c5	${phoneScopeConsentText}	consent.screen.text
1821bde3-b2fa-4a3f-a244-9a96b5b412c5	true	include.in.token.scope
4ab66071-a7be-4809-b3b9-239ece01780d	true	display.on.consent.screen
4ab66071-a7be-4809-b3b9-239ece01780d	${rolesScopeConsentText}	consent.screen.text
4ab66071-a7be-4809-b3b9-239ece01780d	false	include.in.token.scope
05279f8b-b4e2-4c92-ae53-0241ee86da0f	false	display.on.consent.screen
05279f8b-b4e2-4c92-ae53-0241ee86da0f		consent.screen.text
05279f8b-b4e2-4c92-ae53-0241ee86da0f	false	include.in.token.scope
69ef1ebb-0cca-4558-9088-5e8881903c70	false	display.on.consent.screen
69ef1ebb-0cca-4558-9088-5e8881903c70	true	include.in.token.scope
3d9506dc-4043-4dca-b0e2-3b9abee91e12	true	include.in.token.scope
3d9506dc-4043-4dca-b0e2-3b9abee91e12	true	display.on.consent.screen
3d9506dc-4043-4dca-b0e2-3b9abee91e12	${addressScopeConsentText}	consent.screen.text
07c5d8ab-320d-44ab-b9a8-8e53a5468300	true	include.in.token.scope
07c5d8ab-320d-44ab-b9a8-8e53a5468300	true	display.on.consent.screen
07c5d8ab-320d-44ab-b9a8-8e53a5468300	${emailScopeConsentText}	consent.screen.text
be6e69d6-ecb6-41ab-aff0-f42d58701fe9	true	include.in.token.scope
be6e69d6-ecb6-41ab-aff0-f42d58701fe9	false	display.on.consent.screen
711ec79b-d3f2-4a1d-9b6a-2e3959bc64b8	${offlineAccessScopeConsentText}	consent.screen.text
711ec79b-d3f2-4a1d-9b6a-2e3959bc64b8	true	display.on.consent.screen
281d9623-40fb-492a-9fb0-9d8d0c17cb9d	true	include.in.token.scope
281d9623-40fb-492a-9fb0-9d8d0c17cb9d	true	display.on.consent.screen
281d9623-40fb-492a-9fb0-9d8d0c17cb9d	${phoneScopeConsentText}	consent.screen.text
8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff	true	include.in.token.scope
8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff	true	display.on.consent.screen
8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff	${profileScopeConsentText}	consent.screen.text
89f9be1e-c089-4bf1-885e-1eae41fac07c	${samlRoleListScopeConsentText}	consent.screen.text
89f9be1e-c089-4bf1-885e-1eae41fac07c	true	display.on.consent.screen
cbf5d1f5-ef2a-496d-b151-d118f470ddd1	false	include.in.token.scope
cbf5d1f5-ef2a-496d-b151-d118f470ddd1	true	display.on.consent.screen
cbf5d1f5-ef2a-496d-b151-d118f470ddd1	${rolesScopeConsentText}	consent.screen.text
ecab7702-b663-496a-8984-7c499f4455df	false	include.in.token.scope
ecab7702-b663-496a-8984-7c499f4455df	false	display.on.consent.screen
ecab7702-b663-496a-8984-7c499f4455df		consent.screen.text
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	ad0b1819-a5fd-4b04-967f-37e3d2bbe1c3	t
96524905-088e-4c9a-ad36-f411231992f0	ad0b1819-a5fd-4b04-967f-37e3d2bbe1c3	t
4f894fd5-753a-480a-ac07-9eadaaba4647	ad0b1819-a5fd-4b04-967f-37e3d2bbe1c3	t
258852dc-0f14-421c-9cd6-a9c88edf88e3	ad0b1819-a5fd-4b04-967f-37e3d2bbe1c3	t
8afe9f43-58e9-4ded-b864-1782d2d87670	ad0b1819-a5fd-4b04-967f-37e3d2bbe1c3	t
730eb95f-f8fc-4d08-97d4-fb8e7afa9ce6	ad0b1819-a5fd-4b04-967f-37e3d2bbe1c3	t
4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	be074402-9093-4ca8-844a-2bef39fdec7f	t
4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	05279f8b-b4e2-4c92-ae53-0241ee86da0f	t
4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	c21d91db-948f-4af9-a9f3-da2cb72b88ae	t
4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	4ab66071-a7be-4809-b3b9-239ece01780d	t
4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	69ef1ebb-0cca-4558-9088-5e8881903c70	f
4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	3455d000-0c4a-402f-82a9-22a14e609d36	f
4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	66173265-acae-4908-a6fa-f8084780c265	f
4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	1821bde3-b2fa-4a3f-a244-9a96b5b412c5	f
96524905-088e-4c9a-ad36-f411231992f0	be074402-9093-4ca8-844a-2bef39fdec7f	t
96524905-088e-4c9a-ad36-f411231992f0	05279f8b-b4e2-4c92-ae53-0241ee86da0f	t
96524905-088e-4c9a-ad36-f411231992f0	c21d91db-948f-4af9-a9f3-da2cb72b88ae	t
96524905-088e-4c9a-ad36-f411231992f0	4ab66071-a7be-4809-b3b9-239ece01780d	t
96524905-088e-4c9a-ad36-f411231992f0	69ef1ebb-0cca-4558-9088-5e8881903c70	f
96524905-088e-4c9a-ad36-f411231992f0	3455d000-0c4a-402f-82a9-22a14e609d36	f
96524905-088e-4c9a-ad36-f411231992f0	66173265-acae-4908-a6fa-f8084780c265	f
96524905-088e-4c9a-ad36-f411231992f0	1821bde3-b2fa-4a3f-a244-9a96b5b412c5	f
4f894fd5-753a-480a-ac07-9eadaaba4647	be074402-9093-4ca8-844a-2bef39fdec7f	t
4f894fd5-753a-480a-ac07-9eadaaba4647	05279f8b-b4e2-4c92-ae53-0241ee86da0f	t
4f894fd5-753a-480a-ac07-9eadaaba4647	c21d91db-948f-4af9-a9f3-da2cb72b88ae	t
4f894fd5-753a-480a-ac07-9eadaaba4647	4ab66071-a7be-4809-b3b9-239ece01780d	t
4f894fd5-753a-480a-ac07-9eadaaba4647	69ef1ebb-0cca-4558-9088-5e8881903c70	f
4f894fd5-753a-480a-ac07-9eadaaba4647	3455d000-0c4a-402f-82a9-22a14e609d36	f
4f894fd5-753a-480a-ac07-9eadaaba4647	66173265-acae-4908-a6fa-f8084780c265	f
4f894fd5-753a-480a-ac07-9eadaaba4647	1821bde3-b2fa-4a3f-a244-9a96b5b412c5	f
258852dc-0f14-421c-9cd6-a9c88edf88e3	be074402-9093-4ca8-844a-2bef39fdec7f	t
258852dc-0f14-421c-9cd6-a9c88edf88e3	05279f8b-b4e2-4c92-ae53-0241ee86da0f	t
258852dc-0f14-421c-9cd6-a9c88edf88e3	c21d91db-948f-4af9-a9f3-da2cb72b88ae	t
258852dc-0f14-421c-9cd6-a9c88edf88e3	4ab66071-a7be-4809-b3b9-239ece01780d	t
258852dc-0f14-421c-9cd6-a9c88edf88e3	69ef1ebb-0cca-4558-9088-5e8881903c70	f
258852dc-0f14-421c-9cd6-a9c88edf88e3	3455d000-0c4a-402f-82a9-22a14e609d36	f
258852dc-0f14-421c-9cd6-a9c88edf88e3	66173265-acae-4908-a6fa-f8084780c265	f
258852dc-0f14-421c-9cd6-a9c88edf88e3	1821bde3-b2fa-4a3f-a244-9a96b5b412c5	f
8afe9f43-58e9-4ded-b864-1782d2d87670	be074402-9093-4ca8-844a-2bef39fdec7f	t
8afe9f43-58e9-4ded-b864-1782d2d87670	05279f8b-b4e2-4c92-ae53-0241ee86da0f	t
8afe9f43-58e9-4ded-b864-1782d2d87670	c21d91db-948f-4af9-a9f3-da2cb72b88ae	t
8afe9f43-58e9-4ded-b864-1782d2d87670	4ab66071-a7be-4809-b3b9-239ece01780d	t
8afe9f43-58e9-4ded-b864-1782d2d87670	69ef1ebb-0cca-4558-9088-5e8881903c70	f
8afe9f43-58e9-4ded-b864-1782d2d87670	3455d000-0c4a-402f-82a9-22a14e609d36	f
8afe9f43-58e9-4ded-b864-1782d2d87670	66173265-acae-4908-a6fa-f8084780c265	f
8afe9f43-58e9-4ded-b864-1782d2d87670	1821bde3-b2fa-4a3f-a244-9a96b5b412c5	f
730eb95f-f8fc-4d08-97d4-fb8e7afa9ce6	be074402-9093-4ca8-844a-2bef39fdec7f	t
730eb95f-f8fc-4d08-97d4-fb8e7afa9ce6	05279f8b-b4e2-4c92-ae53-0241ee86da0f	t
730eb95f-f8fc-4d08-97d4-fb8e7afa9ce6	c21d91db-948f-4af9-a9f3-da2cb72b88ae	t
730eb95f-f8fc-4d08-97d4-fb8e7afa9ce6	4ab66071-a7be-4809-b3b9-239ece01780d	t
730eb95f-f8fc-4d08-97d4-fb8e7afa9ce6	69ef1ebb-0cca-4558-9088-5e8881903c70	f
730eb95f-f8fc-4d08-97d4-fb8e7afa9ce6	3455d000-0c4a-402f-82a9-22a14e609d36	f
730eb95f-f8fc-4d08-97d4-fb8e7afa9ce6	66173265-acae-4908-a6fa-f8084780c265	f
730eb95f-f8fc-4d08-97d4-fb8e7afa9ce6	1821bde3-b2fa-4a3f-a244-9a96b5b412c5	f
050ce0e7-6fc5-4499-af6f-c3237a169d30	ad0b1819-a5fd-4b04-967f-37e3d2bbe1c3	t
050ce0e7-6fc5-4499-af6f-c3237a169d30	be074402-9093-4ca8-844a-2bef39fdec7f	t
050ce0e7-6fc5-4499-af6f-c3237a169d30	05279f8b-b4e2-4c92-ae53-0241ee86da0f	t
050ce0e7-6fc5-4499-af6f-c3237a169d30	c21d91db-948f-4af9-a9f3-da2cb72b88ae	t
050ce0e7-6fc5-4499-af6f-c3237a169d30	4ab66071-a7be-4809-b3b9-239ece01780d	t
050ce0e7-6fc5-4499-af6f-c3237a169d30	69ef1ebb-0cca-4558-9088-5e8881903c70	f
050ce0e7-6fc5-4499-af6f-c3237a169d30	3455d000-0c4a-402f-82a9-22a14e609d36	f
050ce0e7-6fc5-4499-af6f-c3237a169d30	66173265-acae-4908-a6fa-f8084780c265	f
050ce0e7-6fc5-4499-af6f-c3237a169d30	1821bde3-b2fa-4a3f-a244-9a96b5b412c5	f
987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	ecab7702-b663-496a-8984-7c499f4455df	t
987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	89f9be1e-c089-4bf1-885e-1eae41fac07c	t
987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff	t
987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	cbf5d1f5-ef2a-496d-b151-d118f470ddd1	t
987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	07c5d8ab-320d-44ab-b9a8-8e53a5468300	t
987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	3d9506dc-4043-4dca-b0e2-3b9abee91e12	f
987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	281d9623-40fb-492a-9fb0-9d8d0c17cb9d	f
987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	711ec79b-d3f2-4a1d-9b6a-2e3959bc64b8	f
987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	be6e69d6-ecb6-41ab-aff0-f42d58701fe9	f
8ba9b806-3d2e-4d2b-a631-eb3b6746faad	ecab7702-b663-496a-8984-7c499f4455df	t
8ba9b806-3d2e-4d2b-a631-eb3b6746faad	89f9be1e-c089-4bf1-885e-1eae41fac07c	t
8ba9b806-3d2e-4d2b-a631-eb3b6746faad	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff	t
8ba9b806-3d2e-4d2b-a631-eb3b6746faad	cbf5d1f5-ef2a-496d-b151-d118f470ddd1	t
8ba9b806-3d2e-4d2b-a631-eb3b6746faad	07c5d8ab-320d-44ab-b9a8-8e53a5468300	t
8ba9b806-3d2e-4d2b-a631-eb3b6746faad	3d9506dc-4043-4dca-b0e2-3b9abee91e12	f
8ba9b806-3d2e-4d2b-a631-eb3b6746faad	281d9623-40fb-492a-9fb0-9d8d0c17cb9d	f
8ba9b806-3d2e-4d2b-a631-eb3b6746faad	711ec79b-d3f2-4a1d-9b6a-2e3959bc64b8	f
8ba9b806-3d2e-4d2b-a631-eb3b6746faad	be6e69d6-ecb6-41ab-aff0-f42d58701fe9	f
751a85a3-1d42-4bc2-b586-af6122c295e4	ecab7702-b663-496a-8984-7c499f4455df	t
751a85a3-1d42-4bc2-b586-af6122c295e4	89f9be1e-c089-4bf1-885e-1eae41fac07c	t
751a85a3-1d42-4bc2-b586-af6122c295e4	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff	t
751a85a3-1d42-4bc2-b586-af6122c295e4	cbf5d1f5-ef2a-496d-b151-d118f470ddd1	t
751a85a3-1d42-4bc2-b586-af6122c295e4	07c5d8ab-320d-44ab-b9a8-8e53a5468300	t
751a85a3-1d42-4bc2-b586-af6122c295e4	3d9506dc-4043-4dca-b0e2-3b9abee91e12	f
751a85a3-1d42-4bc2-b586-af6122c295e4	281d9623-40fb-492a-9fb0-9d8d0c17cb9d	f
751a85a3-1d42-4bc2-b586-af6122c295e4	711ec79b-d3f2-4a1d-9b6a-2e3959bc64b8	f
751a85a3-1d42-4bc2-b586-af6122c295e4	be6e69d6-ecb6-41ab-aff0-f42d58701fe9	f
21cf3e28-7dc4-44de-9052-3db6b6ee9eb6	ecab7702-b663-496a-8984-7c499f4455df	t
21cf3e28-7dc4-44de-9052-3db6b6ee9eb6	89f9be1e-c089-4bf1-885e-1eae41fac07c	t
21cf3e28-7dc4-44de-9052-3db6b6ee9eb6	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff	t
21cf3e28-7dc4-44de-9052-3db6b6ee9eb6	cbf5d1f5-ef2a-496d-b151-d118f470ddd1	t
21cf3e28-7dc4-44de-9052-3db6b6ee9eb6	07c5d8ab-320d-44ab-b9a8-8e53a5468300	t
21cf3e28-7dc4-44de-9052-3db6b6ee9eb6	3d9506dc-4043-4dca-b0e2-3b9abee91e12	f
21cf3e28-7dc4-44de-9052-3db6b6ee9eb6	281d9623-40fb-492a-9fb0-9d8d0c17cb9d	f
21cf3e28-7dc4-44de-9052-3db6b6ee9eb6	711ec79b-d3f2-4a1d-9b6a-2e3959bc64b8	f
21cf3e28-7dc4-44de-9052-3db6b6ee9eb6	be6e69d6-ecb6-41ab-aff0-f42d58701fe9	f
8f4857b7-d402-4ae8-b8c7-2ede589a5865	ecab7702-b663-496a-8984-7c499f4455df	t
8f4857b7-d402-4ae8-b8c7-2ede589a5865	89f9be1e-c089-4bf1-885e-1eae41fac07c	t
8f4857b7-d402-4ae8-b8c7-2ede589a5865	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff	t
8f4857b7-d402-4ae8-b8c7-2ede589a5865	cbf5d1f5-ef2a-496d-b151-d118f470ddd1	t
8f4857b7-d402-4ae8-b8c7-2ede589a5865	07c5d8ab-320d-44ab-b9a8-8e53a5468300	t
8f4857b7-d402-4ae8-b8c7-2ede589a5865	3d9506dc-4043-4dca-b0e2-3b9abee91e12	f
8f4857b7-d402-4ae8-b8c7-2ede589a5865	281d9623-40fb-492a-9fb0-9d8d0c17cb9d	f
8f4857b7-d402-4ae8-b8c7-2ede589a5865	711ec79b-d3f2-4a1d-9b6a-2e3959bc64b8	f
8f4857b7-d402-4ae8-b8c7-2ede589a5865	be6e69d6-ecb6-41ab-aff0-f42d58701fe9	f
8edf80fd-3e16-4067-8206-f838b2b63d7d	ecab7702-b663-496a-8984-7c499f4455df	t
8edf80fd-3e16-4067-8206-f838b2b63d7d	89f9be1e-c089-4bf1-885e-1eae41fac07c	t
8edf80fd-3e16-4067-8206-f838b2b63d7d	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff	t
8edf80fd-3e16-4067-8206-f838b2b63d7d	cbf5d1f5-ef2a-496d-b151-d118f470ddd1	t
8edf80fd-3e16-4067-8206-f838b2b63d7d	07c5d8ab-320d-44ab-b9a8-8e53a5468300	t
8edf80fd-3e16-4067-8206-f838b2b63d7d	3d9506dc-4043-4dca-b0e2-3b9abee91e12	f
8edf80fd-3e16-4067-8206-f838b2b63d7d	281d9623-40fb-492a-9fb0-9d8d0c17cb9d	f
8edf80fd-3e16-4067-8206-f838b2b63d7d	711ec79b-d3f2-4a1d-9b6a-2e3959bc64b8	f
8edf80fd-3e16-4067-8206-f838b2b63d7d	be6e69d6-ecb6-41ab-aff0-f42d58701fe9	f
9b279deb-ff44-4e32-9529-602ea54d6056	ecab7702-b663-496a-8984-7c499f4455df	t
9b279deb-ff44-4e32-9529-602ea54d6056	89f9be1e-c089-4bf1-885e-1eae41fac07c	t
9b279deb-ff44-4e32-9529-602ea54d6056	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff	t
9b279deb-ff44-4e32-9529-602ea54d6056	cbf5d1f5-ef2a-496d-b151-d118f470ddd1	t
9b279deb-ff44-4e32-9529-602ea54d6056	07c5d8ab-320d-44ab-b9a8-8e53a5468300	t
9b279deb-ff44-4e32-9529-602ea54d6056	3d9506dc-4043-4dca-b0e2-3b9abee91e12	f
9b279deb-ff44-4e32-9529-602ea54d6056	281d9623-40fb-492a-9fb0-9d8d0c17cb9d	f
9b279deb-ff44-4e32-9529-602ea54d6056	711ec79b-d3f2-4a1d-9b6a-2e3959bc64b8	f
9b279deb-ff44-4e32-9529-602ea54d6056	be6e69d6-ecb6-41ab-aff0-f42d58701fe9	f
553bd174-14f6-43f4-b3e3-856a8963ac32	ecab7702-b663-496a-8984-7c499f4455df	t
553bd174-14f6-43f4-b3e3-856a8963ac32	89f9be1e-c089-4bf1-885e-1eae41fac07c	t
553bd174-14f6-43f4-b3e3-856a8963ac32	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff	t
553bd174-14f6-43f4-b3e3-856a8963ac32	cbf5d1f5-ef2a-496d-b151-d118f470ddd1	t
553bd174-14f6-43f4-b3e3-856a8963ac32	07c5d8ab-320d-44ab-b9a8-8e53a5468300	t
553bd174-14f6-43f4-b3e3-856a8963ac32	3d9506dc-4043-4dca-b0e2-3b9abee91e12	f
553bd174-14f6-43f4-b3e3-856a8963ac32	281d9623-40fb-492a-9fb0-9d8d0c17cb9d	f
553bd174-14f6-43f4-b3e3-856a8963ac32	711ec79b-d3f2-4a1d-9b6a-2e3959bc64b8	f
553bd174-14f6-43f4-b3e3-856a8963ac32	be6e69d6-ecb6-41ab-aff0-f42d58701fe9	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
66173265-acae-4908-a6fa-f8084780c265	c71d7aae-c672-4efc-979a-4fd6879ca3a4
711ec79b-d3f2-4a1d-9b6a-2e3959bc64b8	3b5cdbbd-09f9-48d5-80d7-81e291f3ed7e
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
5c4fd737-2e86-4048-bbbf-ebccc8712f71	Trusted Hosts	master	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
eb8a89a1-8b29-4ea3-92b2-3437a8e7d9f1	Consent Required	master	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
0572c531-62d9-4a8c-b0f0-62b3d2b09f1d	Full Scope Disabled	master	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
5700bf83-4e3f-4878-ae83-82e47361e51d	Max Clients Limit	master	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
48212655-103e-41c7-8694-e37f9807b4d6	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
c4a377a9-897f-4c20-b86e-6e15005206e1	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
c947c931-8e6d-418e-958e-d517bfe31dd5	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
23211829-e497-46d3-acc6-8c13143d5138	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
193344c3-4581-4cc1-ba3e-7fc3e5f2790c	Trusted Hosts	edukare	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	edukare	anonymous
28e95f4d-6e89-452d-a4bc-1f61a3bc5cc5	Max Clients Limit	edukare	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	edukare	anonymous
6c02a1be-d017-4844-8d10-2d3a4aacd1ab	Consent Required	edukare	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	edukare	anonymous
688b7cb3-c9e8-4a30-b205-f9afe6cab3c0	Allowed Protocol Mapper Types	edukare	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	edukare	anonymous
d947c3c0-1ea7-46e1-9d2f-9f6fdb7d9686	Allowed Client Scopes	edukare	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	edukare	anonymous
880cbc4c-0541-4222-b2a0-2208017abc7e	Allowed Client Scopes	edukare	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	edukare	authenticated
c66b1091-d59a-4bab-9fbe-9d3ed792cef6	Full Scope Disabled	edukare	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	edukare	anonymous
43d3f433-956e-4c2c-9331-0e3321e990ab	Allowed Protocol Mapper Types	edukare	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	edukare	authenticated
41ae33b0-472c-4db9-8d19-f8bc3c4d9835	hmac-generated	edukare	hmac-generated	org.keycloak.keys.KeyProvider	edukare	\N
cf23c0d8-4cf1-4012-8a95-df61ed516d7f	aes-generated	edukare	aes-generated	org.keycloak.keys.KeyProvider	edukare	\N
3f64c152-a473-4652-aa10-c7372ac8148d	rsa-generated	edukare	rsa-generated	org.keycloak.keys.KeyProvider	edukare	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
097795ae-f7cd-4d59-8cdb-e11377ecd581	c4a377a9-897f-4c20-b86e-6e15005206e1	allow-default-scopes	true
6a79b157-b6ee-4344-a75a-c8b3b1c153e3	23211829-e497-46d3-acc6-8c13143d5138	allow-default-scopes	true
fe44a1d0-6097-4b44-ba1c-d60c91a79e1e	5c4fd737-2e86-4048-bbbf-ebccc8712f71	host-sending-registration-request-must-match	true
a2245a3c-f247-43e8-b6ce-a0ccdb91e1f7	5c4fd737-2e86-4048-bbbf-ebccc8712f71	client-uris-must-match	true
01b103c6-c4be-4f52-a8dd-99a9990a8066	5700bf83-4e3f-4878-ae83-82e47361e51d	max-clients	200
560acd29-efa4-4264-adf6-7dfaded1e5be	c947c931-8e6d-418e-958e-d517bfe31dd5	allowed-protocol-mapper-types	saml-user-attribute-mapper
6d31622a-8788-402c-ac2d-2e8ff48b5d8a	c947c931-8e6d-418e-958e-d517bfe31dd5	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
16a59f42-7cd4-4a54-8228-1725c3d81a7f	c947c931-8e6d-418e-958e-d517bfe31dd5	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
f2a763a5-5186-441a-bf6e-2a3332ec8fa8	c947c931-8e6d-418e-958e-d517bfe31dd5	allowed-protocol-mapper-types	oidc-full-name-mapper
720a3e7e-5eae-4762-9928-5c1f030de316	c947c931-8e6d-418e-958e-d517bfe31dd5	allowed-protocol-mapper-types	saml-user-property-mapper
deddcf27-750f-4d5c-b047-dfae65fad0ab	c947c931-8e6d-418e-958e-d517bfe31dd5	allowed-protocol-mapper-types	oidc-address-mapper
86555e57-a6fd-4f70-882c-822efb3331c9	c947c931-8e6d-418e-958e-d517bfe31dd5	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
44988b8e-f587-4d7a-beb6-5b183cb3cb24	c947c931-8e6d-418e-958e-d517bfe31dd5	allowed-protocol-mapper-types	saml-role-list-mapper
84538710-573f-4eab-8d91-c7f68980494f	48212655-103e-41c7-8694-e37f9807b4d6	allowed-protocol-mapper-types	saml-user-property-mapper
5d8dbbb8-b4d5-42ec-a6bf-5fb43f66c899	48212655-103e-41c7-8694-e37f9807b4d6	allowed-protocol-mapper-types	oidc-full-name-mapper
479dd616-0bc8-4ab4-8eb2-b790b476f44f	48212655-103e-41c7-8694-e37f9807b4d6	allowed-protocol-mapper-types	saml-user-attribute-mapper
266ede3b-328a-4d3a-b42d-308e34338140	48212655-103e-41c7-8694-e37f9807b4d6	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
910c284a-7370-4634-8ad2-354c0e2313af	48212655-103e-41c7-8694-e37f9807b4d6	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
109412b6-434e-40fb-a008-d088b6877b9f	48212655-103e-41c7-8694-e37f9807b4d6	allowed-protocol-mapper-types	oidc-address-mapper
0fe9d381-c16e-4d2e-8798-1f4fa627d1dc	48212655-103e-41c7-8694-e37f9807b4d6	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
8cbaf02c-6836-46ff-91d8-7748d8a22dd7	48212655-103e-41c7-8694-e37f9807b4d6	allowed-protocol-mapper-types	saml-role-list-mapper
1e73478a-6e05-43f7-8fd6-8593b32c6009	193344c3-4581-4cc1-ba3e-7fc3e5f2790c	client-uris-must-match	true
b8d478e1-866d-4a2d-a3ff-1d21846d2cf2	193344c3-4581-4cc1-ba3e-7fc3e5f2790c	host-sending-registration-request-must-match	true
aa78023f-514d-4d8c-9472-3671f743f862	41ae33b0-472c-4db9-8d19-f8bc3c4d9835	secret	sbb3qCA3oib1oLV_n6vwfZ_m39UYYKEOJJLhXrGmck98FqPy-wJGqfYDm0wTtkMTc3VR3XoOkHLkf5NrgoOChA
53395f29-fc41-4422-b5ef-246724f9c927	41ae33b0-472c-4db9-8d19-f8bc3c4d9835	kid	c4db30a0-1c86-4411-b87f-c25701dd302d
6189111d-d530-484f-aa0e-60fd52f506b6	41ae33b0-472c-4db9-8d19-f8bc3c4d9835	priority	100
94bdc012-e3b8-48ae-8ca5-76d245f0be69	41ae33b0-472c-4db9-8d19-f8bc3c4d9835	algorithm	HS256
bb0c8292-0660-4feb-adc1-853b3aa0bd90	28e95f4d-6e89-452d-a4bc-1f61a3bc5cc5	max-clients	200
5840829d-690a-41ce-9b8e-877c37b52ebe	688b7cb3-c9e8-4a30-b205-f9afe6cab3c0	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
740de407-021a-4666-92cc-ea6d09bdcbeb	688b7cb3-c9e8-4a30-b205-f9afe6cab3c0	allowed-protocol-mapper-types	saml-role-list-mapper
c5bc3028-1baa-4f5c-be9e-b0c2f9195e9e	688b7cb3-c9e8-4a30-b205-f9afe6cab3c0	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
4130e72d-de08-48e7-b319-6ae723e45b2c	688b7cb3-c9e8-4a30-b205-f9afe6cab3c0	allowed-protocol-mapper-types	saml-user-property-mapper
9a6816bd-653a-4940-9ddc-34e7a94683f1	688b7cb3-c9e8-4a30-b205-f9afe6cab3c0	allowed-protocol-mapper-types	oidc-full-name-mapper
22918222-ab03-4f9a-9801-54637319e6d3	688b7cb3-c9e8-4a30-b205-f9afe6cab3c0	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
1797bdef-c3b6-4c3f-a7b1-a07aec2f8c28	688b7cb3-c9e8-4a30-b205-f9afe6cab3c0	allowed-protocol-mapper-types	saml-user-attribute-mapper
895af038-16e6-46bb-abee-20ac191cef8a	688b7cb3-c9e8-4a30-b205-f9afe6cab3c0	allowed-protocol-mapper-types	oidc-address-mapper
0e32272c-1571-450b-a747-cc13bbb2980f	d947c3c0-1ea7-46e1-9d2f-9f6fdb7d9686	allow-default-scopes	true
f8f9ae90-2cca-463d-bb90-d6d8a4b5dea7	880cbc4c-0541-4222-b2a0-2208017abc7e	allow-default-scopes	true
7b541e93-9ee2-4139-a672-7247a98a061d	43d3f433-956e-4c2c-9331-0e3321e990ab	allowed-protocol-mapper-types	oidc-address-mapper
4752cefb-b0cd-43f6-be3e-c8f2220bf688	43d3f433-956e-4c2c-9331-0e3321e990ab	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
83a6760a-82ec-4511-8d33-ff4bee905683	43d3f433-956e-4c2c-9331-0e3321e990ab	allowed-protocol-mapper-types	oidc-full-name-mapper
9463b540-6307-499f-9c27-91d9f7a28182	43d3f433-956e-4c2c-9331-0e3321e990ab	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
b98c3337-5a45-4716-8d78-d19a91624b5d	43d3f433-956e-4c2c-9331-0e3321e990ab	allowed-protocol-mapper-types	saml-role-list-mapper
ec1421a1-2728-4633-9dab-a6ffae27c5e4	43d3f433-956e-4c2c-9331-0e3321e990ab	allowed-protocol-mapper-types	saml-user-property-mapper
002a30d1-74b1-40e5-ba92-2c0c0c6cf06c	43d3f433-956e-4c2c-9331-0e3321e990ab	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
e7021562-91ee-4290-af65-73f85b520eee	43d3f433-956e-4c2c-9331-0e3321e990ab	allowed-protocol-mapper-types	saml-user-attribute-mapper
c8181606-a644-442a-afcf-bcaa7e9b8a47	cf23c0d8-4cf1-4012-8a95-df61ed516d7f	secret	qES4xW0s8eBm-AsCYnHcWQ
d5e57bd9-ff22-40c2-8ce5-8a92416f39b7	cf23c0d8-4cf1-4012-8a95-df61ed516d7f	kid	7cf2c897-6509-4932-9132-5e2f1d35a421
b84481ad-a7d0-4ebf-bbf7-3fe4f0d6d2e2	cf23c0d8-4cf1-4012-8a95-df61ed516d7f	priority	100
0802c566-131c-410b-a469-8733dacdc886	3f64c152-a473-4652-aa10-c7372ac8148d	privateKey	MIIEowIBAAKCAQEAxt7gH2H01UZBofLTY2nABrKAzVFKvtXPnLRlhzZDV18hGED9jMurHqAAi1NLtJZMBJ90FjopgNMfyCi67nBONE35tCwOgJMYO4pKovAXooc+/Oc0NFdHy4YrrIwr2sxaQpuW9J125+FHmBJ+FKzdYjQfgz4++YbQYZKz12V/WOicG/Nz83lpNlcFMIF1Xhuw2QFOBF4EtHmIxYvF3NT7Q/iBlO4973pUS5Wl/texX2Pj6fP9dQ/yGTf3XnFwJMSVtOVpyfea1Dypy7h0Xe8xCYzZVA3BolS3NwhdP6+uQ/mnD5eVkVQ2jih3rMjsXmlo0XOAuaW8rsaPAf5wq5nMywIDAQABAoIBAG60LssJeoMmwu5mACp8+bpAr9abhCJLX3D6MvJb0IzYldGsi/hOgAliRCtKyP/UEqkYIkUlR2lBHZYMplKJDd+r8G7Nf50vRPQP/ZBKWr3Mz9F02uiwFXVEUReSR+9ahnxBpHyzEzftfi83TBwyRmKeZVRn2CKLW4CVa6tiAsv4ZYaWQaFtzyRZPJuRrU/wQDXDcgo5W5tBMy4UtK9AbRnDpMpEgFxFFUr9+keTzE1cVGHkq7x78vlq4ac4vdoKAlhfHc5MkQZA0my4tVnoyImZrc42rWkEFHMO5Pb+qDjICbxyutr2jluveLsqfBE6/6Auf+dP5mYJvp5KLAB1/zECgYEA457X2tmDJCBuWKRSxYnZMwIpqWPyEi5E93dveD/PKRaG4UlGU7W2DzMq1Zd8o38RhuzBuNjBOfcS6oJdUsuve6slrpCZjUNRGAFRbrMOWRau/osxHKbHaiSr0kJKALDgwfsZW7LwVVjTNJ45h2QJpSGrn09JniaxrtSvCftIHzUCgYEA36pl6IKB73YKkv/dgZMhKLT63t8TOT0mq6qnVfbOd5lDqO1g2tMYc2h5X247YS0DzQmYZfngYqBwyTMTFSV+Ra6gvgj5dbHqe+2pqBUTNac0wmEzdqEh5nHeoHomoJjHgZZdBpbnSa2YJYYxtOtkWP1OM8/xDbDZqQkxvpv7u/8CgYA7klbr8AFicxpuGJORH4K41tgQfRfdqj5ihd+mmQyetEaYr5S4U9ZSJBIR1JPKNndf2Jbayd/IS+GnfnbuNGC4/RHfnfiSAAw5PB8T2cjniAhElilEVmHaZb6SSMcVZzVrj0wTs8EylQyxuLdVt9jOXwGLsDSUL4xRNViaRCmcAQKBgQCD4aKTVZiuDMkxYkNG6u0rZoNiNODN6FvL7yUaEBwv8yQtEEMC5GPPcPPYLFRA+Vz7YkQFJTCElxvJ1x7SYjgxeEV5qCsHle+wQTO/UyXvhfcbAltpAJvPmKbvsvbhzRQeOf4CK6qXDA/hWF4o0n9p5XpeHKeDLhs5i51USf9GGwKBgG+gfwVNlJReQgg0yzlKHn/shPGdYQaVatQlSSmc8LLcQN5CIKz9XAg8NGT+fsTPs3llizcTWSDAqj2ejp2/UlI9LilP5rjUHQctMDie7r3Tid6t5AK/5gkJ6gIPlqZUZzdeKCf/HQRdbH13ecIS5r1g0GWVwdDKhPQ71a4XXswg
b3ea3a10-18b9-4a3f-83f5-f588a8a7afd3	3f64c152-a473-4652-aa10-c7372ac8148d	priority	100
c0b90121-a585-4d96-9e95-3a253bca83b1	3f64c152-a473-4652-aa10-c7372ac8148d	certificate	MIICnTCCAYUCBgF4hXxtyTANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdlZHVrYXJlMB4XDTIxMDMzMDIzMzIwN1oXDTMxMDMzMDIzMzM0N1owEjEQMA4GA1UEAwwHZWR1a2FyZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMbe4B9h9NVGQaHy02NpwAaygM1RSr7Vz5y0ZYc2Q1dfIRhA/YzLqx6gAItTS7SWTASfdBY6KYDTH8gouu5wTjRN+bQsDoCTGDuKSqLwF6KHPvznNDRXR8uGK6yMK9rMWkKblvSddufhR5gSfhSs3WI0H4M+PvmG0GGSs9dlf1jonBvzc/N5aTZXBTCBdV4bsNkBTgReBLR5iMWLxdzU+0P4gZTuPe96VEuVpf7XsV9j4+nz/XUP8hk3915xcCTElbTlacn3mtQ8qcu4dF3vMQmM2VQNwaJUtzcIXT+vrkP5pw+XlZFUNo4od6zI7F5paNFzgLmlvK7GjwH+cKuZzMsCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAEI+I8SscGnzYACqSZm6CYD7HWU4WsrGMaK+40j2gx7L4rSG3wVBJ3Ihxv1HX5cYiTXycTMHgxCX0tfZPP+9w1t7OQU+niGIGxjywyXUGpQe2hXtHNq991tg+Lh/SgNqpZgDcmTIbjB2+e17h7zG68JCpB1CBfuUVSEuJLNIji/sVoqok6V4OrijAczOO775QxlwehY0/saW9YWdQ1ifs7jadR5WWFBhXxti+/f8kwrCA006P8lx3qs/ix/HBiwB69Av8ABMoAuU6Kkzq5tlPbGRrkMgA5HRrTkEqbXsi4g5lsyyTFdC3uYvetu5UZNoblBKQmmVPrAinKUzF34aoSg==
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
184aaa78-1319-4c64-b6c2-cd31af7a3f94	133a0c41-9d1e-48b8-8060-8e1c599dd903
184aaa78-1319-4c64-b6c2-cd31af7a3f94	4f130e75-dc05-4444-8c4e-b9db8ef7e299
184aaa78-1319-4c64-b6c2-cd31af7a3f94	6c7f3516-824d-4ec3-9755-7342120c5b18
184aaa78-1319-4c64-b6c2-cd31af7a3f94	4ed56b9c-9efd-43f3-8cbb-1d5d6319cbac
184aaa78-1319-4c64-b6c2-cd31af7a3f94	a076fd8c-aad0-403c-8e6c-b0222411119c
184aaa78-1319-4c64-b6c2-cd31af7a3f94	9b5ca2fc-ebe5-476d-a049-5e7ff5205ee1
184aaa78-1319-4c64-b6c2-cd31af7a3f94	59c36b5f-f522-4327-a55b-af793d116df6
184aaa78-1319-4c64-b6c2-cd31af7a3f94	7b78ab30-60fb-45f5-9772-f8cc18ab08cf
184aaa78-1319-4c64-b6c2-cd31af7a3f94	24af1aba-5a31-4f8b-a96d-b7fc381f82fa
184aaa78-1319-4c64-b6c2-cd31af7a3f94	dcc8c22d-78dd-4d96-b8a0-5e2aaad22e44
184aaa78-1319-4c64-b6c2-cd31af7a3f94	fc879a6b-5957-4571-9f1d-9e92c83973b8
184aaa78-1319-4c64-b6c2-cd31af7a3f94	207f2368-9776-4de4-8b04-aa600e61cc2d
184aaa78-1319-4c64-b6c2-cd31af7a3f94	265c2ce1-33a5-439b-b109-cd15822b6e7d
184aaa78-1319-4c64-b6c2-cd31af7a3f94	70c0474c-f86e-4b82-9853-1238f5bf0040
184aaa78-1319-4c64-b6c2-cd31af7a3f94	f42df299-39c6-41a5-9b6e-33164dbcefc0
184aaa78-1319-4c64-b6c2-cd31af7a3f94	0c64a31c-fcff-40b4-81a8-7af30130c0dc
184aaa78-1319-4c64-b6c2-cd31af7a3f94	7060613c-341a-4eca-be70-50cd64845e4c
184aaa78-1319-4c64-b6c2-cd31af7a3f94	94ea12f4-eeb7-42c0-b8ce-d5db5dc2c421
a076fd8c-aad0-403c-8e6c-b0222411119c	0c64a31c-fcff-40b4-81a8-7af30130c0dc
4ed56b9c-9efd-43f3-8cbb-1d5d6319cbac	94ea12f4-eeb7-42c0-b8ce-d5db5dc2c421
4ed56b9c-9efd-43f3-8cbb-1d5d6319cbac	f42df299-39c6-41a5-9b6e-33164dbcefc0
9664541a-0f9a-45f6-944e-261396bff9c6	c6a37e2b-79ea-4d57-b37e-e9c4cc8463dd
111e66c5-afe0-4ba0-93eb-f017f0550915	47b418a4-9cbf-4203-bed3-51cc7f399630
184aaa78-1319-4c64-b6c2-cd31af7a3f94	2d05ad2c-2213-4493-ac47-2852b5f49d99
184aaa78-1319-4c64-b6c2-cd31af7a3f94	832c9f9f-4ef1-44c6-bda1-f8fdbfe5b560
184aaa78-1319-4c64-b6c2-cd31af7a3f94	669e25a0-f186-443c-9fef-3f361a1cd297
184aaa78-1319-4c64-b6c2-cd31af7a3f94	df162ab7-a2da-4479-92cd-26e5040b3cba
184aaa78-1319-4c64-b6c2-cd31af7a3f94	5dc9a33d-4c8a-4409-adab-27c232fe44ca
184aaa78-1319-4c64-b6c2-cd31af7a3f94	97f2d68d-0522-4622-99b2-17521a3c6f43
184aaa78-1319-4c64-b6c2-cd31af7a3f94	4cd395c5-ec61-478c-bcd4-7c5e0d322be9
184aaa78-1319-4c64-b6c2-cd31af7a3f94	161c34d3-c2f4-4756-91bb-d2a6dbf9e069
184aaa78-1319-4c64-b6c2-cd31af7a3f94	a033ded0-4d66-49aa-94c2-038fb8953af5
184aaa78-1319-4c64-b6c2-cd31af7a3f94	79af4bbd-12fa-4f38-9a3d-d58fc0564482
184aaa78-1319-4c64-b6c2-cd31af7a3f94	bd9a4d11-974e-4897-a353-d498057356ad
184aaa78-1319-4c64-b6c2-cd31af7a3f94	0df43a6a-4dc5-4eb1-b918-ed1af656a9fe
184aaa78-1319-4c64-b6c2-cd31af7a3f94	6fb54c98-c916-4484-a465-52417c770d65
184aaa78-1319-4c64-b6c2-cd31af7a3f94	a4b3d37e-f4de-411f-877c-6acc575dc2c9
184aaa78-1319-4c64-b6c2-cd31af7a3f94	823e2c50-f880-4281-92aa-bdf7cc24601b
184aaa78-1319-4c64-b6c2-cd31af7a3f94	511976a4-79f9-44f3-82c7-a96836c6432c
184aaa78-1319-4c64-b6c2-cd31af7a3f94	feeedc2d-a9b7-4b59-a534-af9abe5919f3
184aaa78-1319-4c64-b6c2-cd31af7a3f94	2f2972da-35fb-4455-8add-54b70c8374e7
5dc9a33d-4c8a-4409-adab-27c232fe44ca	511976a4-79f9-44f3-82c7-a96836c6432c
df162ab7-a2da-4479-92cd-26e5040b3cba	2f2972da-35fb-4455-8add-54b70c8374e7
df162ab7-a2da-4479-92cd-26e5040b3cba	823e2c50-f880-4281-92aa-bdf7cc24601b
183db5f8-45dd-4515-984c-2cee89401444	e95f7350-73c1-4412-b7e3-85a07c9b4e06
183db5f8-45dd-4515-984c-2cee89401444	dba4bfce-5164-4aba-8d4e-5c770887a480
4986b9e3-5c73-4bdf-8248-05c873fc32c3	2e0e2612-53f0-4d60-8b64-807afe5bcf0c
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	40c59592-6c9b-445f-8b72-6d1f4805f37d
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	ccd4f169-1a9e-4c8a-ab24-9c8419b4d30a
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	143faefc-7ca5-4177-ba4c-ee73bcde38ed
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	25018e71-10b1-4e4c-a102-d9dfcd9c89fe
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	4fcb72e8-aca5-4d7c-a89e-892a29017314
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	72dcf3d6-8d28-4896-ace4-3757b5d3d36a
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	183db5f8-45dd-4515-984c-2cee89401444
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	e95f7350-73c1-4412-b7e3-85a07c9b4e06
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	d4c506df-8695-42a3-8599-d19cc9303c8a
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	fa2e9f55-f547-408d-88d1-79f6554eb6f2
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	4986b9e3-5c73-4bdf-8248-05c873fc32c3
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	d3b766ec-6aa6-4462-9fa6-49cb056d02d7
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	8a56fa3c-67a9-4396-8f6a-3c15e5f580a2
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	bae5fabd-5b35-4313-8814-14db184e3525
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	dba4bfce-5164-4aba-8d4e-5c770887a480
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	dea8426c-3099-4786-8bf5-248969542d83
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	ca0a16a5-526d-485e-baff-4ea71c94132e
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	2e0e2612-53f0-4d60-8b64-807afe5bcf0c
fa4f84cf-1038-445d-ad0c-c7d052db0b9b	f9ef671d-7615-4e8e-a846-ca0dde74e8bb
d6b6a2ed-077d-4bc2-86e0-66e51a4f9dc3	9f8c1f60-bde7-4e77-86f3-2a4e7c991a2c
184aaa78-1319-4c64-b6c2-cd31af7a3f94	4643676a-9150-4866-9b2a-2eb4df9c9aa3
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
92685134-af32-4c0c-862b-c388faee42f4	\N	password	32d29917-4097-47f1-ba66-77ec0a3681da	1617147228179	\N	{"value":"w6aCBAZRmDzbWuZqHL3bCFoRhsaBdGERH3viaKDsuOjBNsJ7EugC97V6ZuStT80Wb7gQ/X0VLWuYkoBcI+wdNA==","salt":"MvlYDX75Zy3lBYb7rNhKwQ==","additionalParameters":{}}	{"hashIterations":100000,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2021-03-30 23:33:37.199347	1	EXECUTED	7:4e70412f24a3f382c82183742ec79317	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	7147216727
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2021-03-30 23:33:37.211983	2	MARK_RAN	7:cb16724583e9675711801c6875114f28	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	7147216727
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2021-03-30 23:33:37.262273	3	EXECUTED	7:0310eb8ba07cec616460794d42ade0fa	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	3.5.4	\N	\N	7147216727
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2021-03-30 23:33:37.267522	4	EXECUTED	7:5d25857e708c3233ef4439df1f93f012	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	7147216727
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2021-03-30 23:33:37.387335	5	EXECUTED	7:c7a54a1041d58eb3817a4a883b4d4e84	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	7147216727
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2021-03-30 23:33:37.392081	6	MARK_RAN	7:2e01012df20974c1c2a605ef8afe25b7	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	7147216727
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2021-03-30 23:33:37.50516	7	EXECUTED	7:0f08df48468428e0f30ee59a8ec01a41	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	7147216727
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2021-03-30 23:33:37.510274	8	MARK_RAN	7:a77ea2ad226b345e7d689d366f185c8c	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	7147216727
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2021-03-30 23:33:37.515916	9	EXECUTED	7:a3377a2059aefbf3b90ebb4c4cc8e2ab	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	3.5.4	\N	\N	7147216727
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2021-03-30 23:33:37.624478	10	EXECUTED	7:04c1dbedc2aa3e9756d1a1668e003451	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	3.5.4	\N	\N	7147216727
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2021-03-30 23:33:37.695597	11	EXECUTED	7:36ef39ed560ad07062d956db861042ba	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7147216727
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2021-03-30 23:33:37.700463	12	MARK_RAN	7:d909180b2530479a716d3f9c9eaea3d7	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7147216727
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2021-03-30 23:33:37.718433	13	EXECUTED	7:cf12b04b79bea5152f165eb41f3955f6	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7147216727
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-03-30 23:33:37.743714	14	EXECUTED	7:7e32c8f05c755e8675764e7d5f514509	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	3.5.4	\N	\N	7147216727
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-03-30 23:33:37.746762	15	MARK_RAN	7:980ba23cc0ec39cab731ce903dd01291	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	7147216727
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-03-30 23:33:37.74984	16	MARK_RAN	7:2fa220758991285312eb84f3b4ff5336	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	3.5.4	\N	\N	7147216727
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-03-30 23:33:37.752775	17	EXECUTED	7:d41d8cd98f00b204e9800998ecf8427e	empty		\N	3.5.4	\N	\N	7147216727
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2021-03-30 23:33:37.815019	18	EXECUTED	7:91ace540896df890cc00a0490ee52bbc	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	3.5.4	\N	\N	7147216727
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2021-03-30 23:33:37.868557	19	EXECUTED	7:c31d1646dfa2618a9335c00e07f89f24	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	7147216727
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2021-03-30 23:33:37.874459	20	EXECUTED	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	7147216727
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-03-30 23:33:38.50169	45	EXECUTED	7:6a48ce645a3525488a90fbf76adf3bb3	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	7147216727
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2021-03-30 23:33:37.87805	21	MARK_RAN	7:f987971fe6b37d963bc95fee2b27f8df	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	7147216727
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2021-03-30 23:33:37.882484	22	MARK_RAN	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	7147216727
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2021-03-30 23:33:37.904471	23	EXECUTED	7:ed2dc7f799d19ac452cbcda56c929e47	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	3.5.4	\N	\N	7147216727
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2021-03-30 23:33:37.911225	24	EXECUTED	7:80b5db88a5dda36ece5f235be8757615	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	7147216727
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2021-03-30 23:33:37.914303	25	MARK_RAN	7:1437310ed1305a9b93f8848f301726ce	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	7147216727
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2021-03-30 23:33:37.953624	26	EXECUTED	7:b82ffb34850fa0836be16deefc6a87c4	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	3.5.4	\N	\N	7147216727
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2021-03-30 23:33:38.053053	27	EXECUTED	7:9cc98082921330d8d9266decdd4bd658	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	3.5.4	\N	\N	7147216727
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2021-03-30 23:33:38.058247	28	EXECUTED	7:03d64aeed9cb52b969bd30a7ac0db57e	update tableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	7147216727
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2021-03-30 23:33:38.158171	29	EXECUTED	7:f1f9fd8710399d725b780f463c6b21cd	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	3.5.4	\N	\N	7147216727
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2021-03-30 23:33:38.17814	30	EXECUTED	7:53188c3eb1107546e6f765835705b6c1	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	3.5.4	\N	\N	7147216727
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2021-03-30 23:33:38.208758	31	EXECUTED	7:d6e6f3bc57a0c5586737d1351725d4d4	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	3.5.4	\N	\N	7147216727
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2021-03-30 23:33:38.215425	32	EXECUTED	7:454d604fbd755d9df3fd9c6329043aa5	customChange		\N	3.5.4	\N	\N	7147216727
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-03-30 23:33:38.221359	33	EXECUTED	7:57e98a3077e29caf562f7dbf80c72600	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	7147216727
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-03-30 23:33:38.22593	34	MARK_RAN	7:e4c7e8f2256210aee71ddc42f538b57a	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	7147216727
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-03-30 23:33:38.262999	35	EXECUTED	7:09a43c97e49bc626460480aa1379b522	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	7147216727
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2021-03-30 23:33:38.2705	36	EXECUTED	7:26bfc7c74fefa9126f2ce702fb775553	addColumn tableName=REALM		\N	3.5.4	\N	\N	7147216727
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-03-30 23:33:38.278599	37	EXECUTED	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7147216727
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2021-03-30 23:33:38.284135	38	EXECUTED	7:37fc1781855ac5388c494f1442b3f717	addColumn tableName=FED_USER_CONSENT		\N	3.5.4	\N	\N	7147216727
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2021-03-30 23:33:38.289065	39	EXECUTED	7:13a27db0dae6049541136adad7261d27	addColumn tableName=IDENTITY_PROVIDER		\N	3.5.4	\N	\N	7147216727
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-03-30 23:33:38.292541	40	MARK_RAN	7:550300617e3b59e8af3a6294df8248a3	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	7147216727
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-03-30 23:33:38.295465	41	MARK_RAN	7:e3a9482b8931481dc2772a5c07c44f17	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	7147216727
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2021-03-30 23:33:38.305079	42	EXECUTED	7:72b07d85a2677cb257edb02b408f332d	customChange		\N	3.5.4	\N	\N	7147216727
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-03-30 23:33:38.48804	43	EXECUTED	7:a72a7858967bd414835d19e04d880312	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	3.5.4	\N	\N	7147216727
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2021-03-30 23:33:38.494678	44	EXECUTED	7:94edff7cf9ce179e7e85f0cd78a3cf2c	addColumn tableName=USER_ENTITY		\N	3.5.4	\N	\N	7147216727
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-03-30 23:33:38.508805	46	EXECUTED	7:e64b5dcea7db06077c6e57d3b9e5ca14	customChange		\N	3.5.4	\N	\N	7147216727
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-03-30 23:33:38.511904	47	MARK_RAN	7:fd8cf02498f8b1e72496a20afc75178c	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	7147216727
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-03-30 23:33:38.570358	48	EXECUTED	7:542794f25aa2b1fbabb7e577d6646319	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	3.5.4	\N	\N	7147216727
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-03-30 23:33:38.575589	49	EXECUTED	7:edad604c882df12f74941dac3cc6d650	addColumn tableName=REALM		\N	3.5.4	\N	\N	7147216727
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2021-03-30 23:33:38.62816	50	EXECUTED	7:0f88b78b7b46480eb92690cbf5e44900	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	3.5.4	\N	\N	7147216727
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2021-03-30 23:33:38.669154	51	EXECUTED	7:d560e43982611d936457c327f872dd59	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	3.5.4	\N	\N	7147216727
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2021-03-30 23:33:38.673435	52	EXECUTED	7:c155566c42b4d14ef07059ec3b3bbd8e	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	7147216727
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2021-03-30 23:33:38.677449	53	EXECUTED	7:b40376581f12d70f3c89ba8ddf5b7dea	update tableName=REALM		\N	3.5.4	\N	\N	7147216727
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2021-03-30 23:33:38.680973	54	EXECUTED	7:a1132cc395f7b95b3646146c2e38f168	update tableName=CLIENT		\N	3.5.4	\N	\N	7147216727
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-03-30 23:33:38.688762	55	EXECUTED	7:d8dc5d89c789105cfa7ca0e82cba60af	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	3.5.4	\N	\N	7147216727
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-03-30 23:33:38.6956	56	EXECUTED	7:7822e0165097182e8f653c35517656a3	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	3.5.4	\N	\N	7147216727
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-03-30 23:33:38.720542	57	EXECUTED	7:c6538c29b9c9a08f9e9ea2de5c2b6375	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	3.5.4	\N	\N	7147216727
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-03-30 23:33:38.871741	58	EXECUTED	7:6d4893e36de22369cf73bcb051ded875	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	3.5.4	\N	\N	7147216727
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2021-03-30 23:33:38.907589	59	EXECUTED	7:57960fc0b0f0dd0563ea6f8b2e4a1707	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	3.5.4	\N	\N	7147216727
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2021-03-30 23:33:38.914871	60	EXECUTED	7:2b4b8bff39944c7097977cc18dbceb3b	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	7147216727
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2021-03-30 23:33:38.924131	61	EXECUTED	7:2aa42a964c59cd5b8ca9822340ba33a8	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	3.5.4	\N	\N	7147216727
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2021-03-30 23:33:38.931791	62	EXECUTED	7:9ac9e58545479929ba23f4a3087a0346	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	3.5.4	\N	\N	7147216727
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2021-03-30 23:33:38.935943	63	EXECUTED	7:14d407c35bc4fe1976867756bcea0c36	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	7147216727
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2021-03-30 23:33:38.939175	64	EXECUTED	7:241a8030c748c8548e346adee548fa93	update tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	7147216727
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2021-03-30 23:33:38.94237	65	EXECUTED	7:7d3182f65a34fcc61e8d23def037dc3f	update tableName=RESOURCE_SERVER_RESOURCE		\N	3.5.4	\N	\N	7147216727
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2021-03-30 23:33:38.957565	66	EXECUTED	7:b30039e00a0b9715d430d1b0636728fa	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	3.5.4	\N	\N	7147216727
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2021-03-30 23:33:38.96439	67	EXECUTED	7:3797315ca61d531780f8e6f82f258159	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	3.5.4	\N	\N	7147216727
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2021-03-30 23:33:38.970763	68	EXECUTED	7:c7aa4c8d9573500c2d347c1941ff0301	addColumn tableName=REALM		\N	3.5.4	\N	\N	7147216727
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2021-03-30 23:33:38.982446	69	EXECUTED	7:b207faee394fc074a442ecd42185a5dd	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	3.5.4	\N	\N	7147216727
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2021-03-30 23:33:38.98752	70	EXECUTED	7:ab9a9762faaba4ddfa35514b212c4922	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	3.5.4	\N	\N	7147216727
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2021-03-30 23:33:38.991919	71	EXECUTED	7:b9710f74515a6ccb51b72dc0d19df8c4	addColumn tableName=RESOURCE_SERVER		\N	3.5.4	\N	\N	7147216727
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-03-30 23:33:38.998835	72	EXECUTED	7:ec9707ae4d4f0b7452fee20128083879	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7147216727
8.0.0-updating-credential-data-not-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-03-30 23:33:39.005523	73	EXECUTED	7:03b3f4b264c3c68ba082250a80b74216	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7147216727
8.0.0-updating-credential-data-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-03-30 23:33:39.008109	74	MARK_RAN	7:64c5728f5ca1f5aa4392217701c4fe23	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7147216727
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-03-30 23:33:39.024018	75	EXECUTED	7:b48da8c11a3d83ddd6b7d0c8c2219345	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	3.5.4	\N	\N	7147216727
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-03-30 23:33:39.032072	76	EXECUTED	7:a73379915c23bfad3e8f5c6d5c0aa4bd	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	3.5.4	\N	\N	7147216727
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-03-30 23:33:39.036361	77	EXECUTED	7:39e0073779aba192646291aa2332493d	addColumn tableName=CLIENT		\N	3.5.4	\N	\N	7147216727
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-03-30 23:33:39.038672	78	MARK_RAN	7:81f87368f00450799b4bf42ea0b3ec34	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	3.5.4	\N	\N	7147216727
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-03-30 23:33:39.05822	79	EXECUTED	7:20b37422abb9fb6571c618148f013a15	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	3.5.4	\N	\N	7147216727
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-03-30 23:33:39.061357	80	MARK_RAN	7:1970bb6cfb5ee800736b95ad3fb3c78a	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	3.5.4	\N	\N	7147216727
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-03-30 23:33:39.068493	81	EXECUTED	7:45d9b25fc3b455d522d8dcc10a0f4c80	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	3.5.4	\N	\N	7147216727
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-03-30 23:33:39.071183	82	MARK_RAN	7:890ae73712bc187a66c2813a724d037f	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7147216727
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-03-30 23:33:39.075357	83	EXECUTED	7:0a211980d27fafe3ff50d19a3a29b538	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7147216727
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-03-30 23:33:39.077672	84	MARK_RAN	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7147216727
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-03-30 23:33:39.083812	85	EXECUTED	7:01c49302201bdf815b0a18d1f98a55dc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	7147216727
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2021-03-30 23:33:39.090221	86	EXECUTED	7:3dace6b144c11f53f1ad2c0361279b86	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	3.5.4	\N	\N	7147216727
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2021-03-30 23:33:39.097764	87	EXECUTED	7:578d0b92077eaf2ab95ad0ec087aa903	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	3.5.4	\N	\N	7147216727
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2021-03-30 23:33:39.108514	88	EXECUTED	7:c95abe90d962c57a09ecaee57972835d	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	3.5.4	\N	\N	7147216727
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
master	66173265-acae-4908-a6fa-f8084780c265	f
master	ad0b1819-a5fd-4b04-967f-37e3d2bbe1c3	t
master	be074402-9093-4ca8-844a-2bef39fdec7f	t
master	c21d91db-948f-4af9-a9f3-da2cb72b88ae	t
master	3455d000-0c4a-402f-82a9-22a14e609d36	f
master	1821bde3-b2fa-4a3f-a244-9a96b5b412c5	f
master	4ab66071-a7be-4809-b3b9-239ece01780d	t
master	05279f8b-b4e2-4c92-ae53-0241ee86da0f	t
master	69ef1ebb-0cca-4558-9088-5e8881903c70	f
edukare	07c5d8ab-320d-44ab-b9a8-8e53a5468300	t
edukare	89f9be1e-c089-4bf1-885e-1eae41fac07c	t
edukare	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff	t
edukare	cbf5d1f5-ef2a-496d-b151-d118f470ddd1	t
edukare	ecab7702-b663-496a-8984-7c499f4455df	t
edukare	281d9623-40fb-492a-9fb0-9d8d0c17cb9d	f
edukare	3d9506dc-4043-4dca-b0e2-3b9abee91e12	f
edukare	711ec79b-d3f2-4a1d-9b6a-2e3959bc64b8	f
edukare	be6e69d6-ecb6-41ab-aff0-f42d58701fe9	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
c2c7e8cb-63c3-40a9-a31b-f30da7fbdab0	99b82e17-c873-47e1-98c6-09478f2274d3
ea8147fd-a1fb-401c-a105-f892d1ffb70c	074a5db7-a1da-493e-b3e0-2592d3c37fbd
9129e24c-1024-4ad3-a4f5-3016ef64af0a	429b2326-c162-480f-9c43-fc5408a0cc3a
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
99b82e17-c873-47e1-98c6-09478f2274d3	CIDADAO	 	edukare
074a5db7-a1da-493e-b3e0-2592d3c37fbd	ESCOLA_MACHADO_DE_ASSIS	 	edukare
429b2326-c162-480f-9c43-fc5408a0cc3a	SECRETARIA	 	edukare
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
184aaa78-1319-4c64-b6c2-cd31af7a3f94	master	f	${role_admin}	admin	master	\N	master
133a0c41-9d1e-48b8-8060-8e1c599dd903	master	f	${role_create-realm}	create-realm	master	\N	master
4f130e75-dc05-4444-8c4e-b9db8ef7e299	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_create-client}	create-client	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
6c7f3516-824d-4ec3-9755-7342120c5b18	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_view-realm}	view-realm	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
4ed56b9c-9efd-43f3-8cbb-1d5d6319cbac	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_view-users}	view-users	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
a076fd8c-aad0-403c-8e6c-b0222411119c	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_view-clients}	view-clients	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
9b5ca2fc-ebe5-476d-a049-5e7ff5205ee1	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_view-events}	view-events	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
59c36b5f-f522-4327-a55b-af793d116df6	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_view-identity-providers}	view-identity-providers	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
7b78ab30-60fb-45f5-9772-f8cc18ab08cf	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_view-authorization}	view-authorization	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
24af1aba-5a31-4f8b-a96d-b7fc381f82fa	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_manage-realm}	manage-realm	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
dcc8c22d-78dd-4d96-b8a0-5e2aaad22e44	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_manage-users}	manage-users	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
fc879a6b-5957-4571-9f1d-9e92c83973b8	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_manage-clients}	manage-clients	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
207f2368-9776-4de4-8b04-aa600e61cc2d	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_manage-events}	manage-events	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
265c2ce1-33a5-439b-b109-cd15822b6e7d	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_manage-identity-providers}	manage-identity-providers	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
70c0474c-f86e-4b82-9853-1238f5bf0040	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_manage-authorization}	manage-authorization	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
f42df299-39c6-41a5-9b6e-33164dbcefc0	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_query-users}	query-users	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
0c64a31c-fcff-40b4-81a8-7af30130c0dc	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_query-clients}	query-clients	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
7060613c-341a-4eca-be70-50cd64845e4c	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_query-realms}	query-realms	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
94ea12f4-eeb7-42c0-b8ce-d5db5dc2c421	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_query-groups}	query-groups	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
7568b522-06cf-41c0-b3a2-6837f8edc0fd	4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	t	${role_view-profile}	view-profile	master	4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	\N
9664541a-0f9a-45f6-944e-261396bff9c6	4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	t	${role_manage-account}	manage-account	master	4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	\N
c6a37e2b-79ea-4d57-b37e-e9c4cc8463dd	4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	t	${role_manage-account-links}	manage-account-links	master	4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	\N
9338cee2-8458-4a8d-9244-afe22c8b363c	4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	t	${role_view-applications}	view-applications	master	4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	\N
47b418a4-9cbf-4203-bed3-51cc7f399630	4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	t	${role_view-consent}	view-consent	master	4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	\N
111e66c5-afe0-4ba0-93eb-f017f0550915	4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	t	${role_manage-consent}	manage-consent	master	4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	\N
09f9dcdf-2794-423f-b78c-a28f66076126	4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	t	${role_delete-account}	delete-account	master	4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	\N
f050898e-aa01-4e1e-835f-d17ad9204e1b	258852dc-0f14-421c-9cd6-a9c88edf88e3	t	${role_read-token}	read-token	master	258852dc-0f14-421c-9cd6-a9c88edf88e3	\N
2d05ad2c-2213-4493-ac47-2852b5f49d99	8afe9f43-58e9-4ded-b864-1782d2d87670	t	${role_impersonation}	impersonation	master	8afe9f43-58e9-4ded-b864-1782d2d87670	\N
c71d7aae-c672-4efc-979a-4fd6879ca3a4	master	f	${role_offline-access}	offline_access	master	\N	master
a39be0e9-dd26-4288-956a-9a205f62d4da	master	f	${role_uma_authorization}	uma_authorization	master	\N	master
832c9f9f-4ef1-44c6-bda1-f8fdbfe5b560	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_create-client}	create-client	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
669e25a0-f186-443c-9fef-3f361a1cd297	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_view-realm}	view-realm	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
df162ab7-a2da-4479-92cd-26e5040b3cba	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_view-users}	view-users	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
5dc9a33d-4c8a-4409-adab-27c232fe44ca	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_view-clients}	view-clients	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
97f2d68d-0522-4622-99b2-17521a3c6f43	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_view-events}	view-events	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
4cd395c5-ec61-478c-bcd4-7c5e0d322be9	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_view-identity-providers}	view-identity-providers	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
161c34d3-c2f4-4756-91bb-d2a6dbf9e069	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_view-authorization}	view-authorization	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
a033ded0-4d66-49aa-94c2-038fb8953af5	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_manage-realm}	manage-realm	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
79af4bbd-12fa-4f38-9a3d-d58fc0564482	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_manage-users}	manage-users	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
bd9a4d11-974e-4897-a353-d498057356ad	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_manage-clients}	manage-clients	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
0df43a6a-4dc5-4eb1-b918-ed1af656a9fe	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_manage-events}	manage-events	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
6fb54c98-c916-4484-a465-52417c770d65	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_manage-identity-providers}	manage-identity-providers	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
a4b3d37e-f4de-411f-877c-6acc575dc2c9	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_manage-authorization}	manage-authorization	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
823e2c50-f880-4281-92aa-bdf7cc24601b	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_query-users}	query-users	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
511976a4-79f9-44f3-82c7-a96836c6432c	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_query-clients}	query-clients	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
feeedc2d-a9b7-4b59-a534-af9abe5919f3	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_query-realms}	query-realms	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
2f2972da-35fb-4455-8add-54b70c8374e7	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_query-groups}	query-groups	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
c2c7e8cb-63c3-40a9-a31b-f30da7fbdab0	edukare	f	Papel padrão para qualquer usuário que não seja SECRETARIA ou ESCOLA.	CIDADAO	edukare	\N	edukare
26230ce1-188c-41ec-aae5-55626638f009	edukare	f	${role_uma_authorization}	uma_authorization	edukare	\N	edukare
9129e24c-1024-4ad3-a4f5-3016ef64af0a	edukare	f	Papel utilizado pelos usuários da secretaria	SECRETARIA	edukare	\N	edukare
ea8147fd-a1fb-401c-a105-f892d1ffb70c	edukare	f	Papel utilizado pelos usuários das escolas.	ESCOLA	edukare	\N	edukare
3b5cdbbd-09f9-48d5-80d7-81e291f3ed7e	edukare	f	${role_offline-access}	offline_access	edukare	\N	edukare
5b995d1d-0fa1-4833-98a0-1fc47ac9cb95	edukare	f	Papel de administrador	ADMIN	edukare	\N	edukare
ccd4f169-1a9e-4c8a-ab24-9c8419b4d30a	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_manage-authorization}	manage-authorization	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
40c59592-6c9b-445f-8b72-6d1f4805f37d	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_manage-realm}	manage-realm	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
143faefc-7ca5-4177-ba4c-ee73bcde38ed	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_view-events}	view-events	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
4fcb72e8-aca5-4d7c-a89e-892a29017314	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_create-client}	create-client	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
25018e71-10b1-4e4c-a102-d9dfcd9c89fe	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_manage-users}	manage-users	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
72dcf3d6-8d28-4896-ace4-3757b5d3d36a	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_view-identity-providers}	view-identity-providers	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
e95f7350-73c1-4412-b7e3-85a07c9b4e06	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_query-users}	query-users	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
183db5f8-45dd-4515-984c-2cee89401444	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_view-users}	view-users	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
d4c506df-8695-42a3-8599-d19cc9303c8a	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_query-realms}	query-realms	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
fa2e9f55-f547-408d-88d1-79f6554eb6f2	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_view-authorization}	view-authorization	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
4986b9e3-5c73-4bdf-8248-05c873fc32c3	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_view-clients}	view-clients	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
d3b766ec-6aa6-4462-9fa6-49cb056d02d7	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_view-realm}	view-realm	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
8a56fa3c-67a9-4396-8f6a-3c15e5f580a2	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_manage-clients}	manage-clients	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
1b975aae-8d8f-43b8-a9d5-1339cd6d9dc8	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_realm-admin}	realm-admin	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
bae5fabd-5b35-4313-8814-14db184e3525	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_manage-events}	manage-events	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
dba4bfce-5164-4aba-8d4e-5c770887a480	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_query-groups}	query-groups	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
dea8426c-3099-4786-8bf5-248969542d83	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_manage-identity-providers}	manage-identity-providers	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
ca0a16a5-526d-485e-baff-4ea71c94132e	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_impersonation}	impersonation	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
2e0e2612-53f0-4d60-8b64-807afe5bcf0c	8edf80fd-3e16-4067-8206-f838b2b63d7d	t	${role_query-clients}	query-clients	edukare	8edf80fd-3e16-4067-8206-f838b2b63d7d	\N
ebf487bc-ed9b-45d8-a0aa-0b391409f49a	21cf3e28-7dc4-44de-9052-3db6b6ee9eb6	t	${role_read-token}	read-token	edukare	21cf3e28-7dc4-44de-9052-3db6b6ee9eb6	\N
fa4f84cf-1038-445d-ad0c-c7d052db0b9b	987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	t	${role_manage-account}	manage-account	edukare	987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	\N
d9a246ef-1dc2-44a6-9c5d-389b6caa1536	987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	t	${role_view-profile}	view-profile	edukare	987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	\N
9f8c1f60-bde7-4e77-86f3-2a4e7c991a2c	987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	t	${role_view-consent}	view-consent	edukare	987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	\N
f9003b11-5de7-457c-8e74-cc95256ddaf8	987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	t	${role_delete-account}	delete-account	edukare	987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	\N
d6b6a2ed-077d-4bc2-86e0-66e51a4f9dc3	987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	t	${role_manage-consent}	manage-consent	edukare	987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	\N
f9ef671d-7615-4e8e-a846-ca0dde74e8bb	987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	t	${role_manage-account-links}	manage-account-links	edukare	987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	\N
cfbf63b5-1e47-4ba4-8912-d73da05991f7	987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	t	${role_view-applications}	view-applications	edukare	987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	\N
4643676a-9150-4866-9b2a-2eb4df9c9aa3	050ce0e7-6fc5-4499-af6f-c3237a169d30	t	${role_impersonation}	impersonation	master	050ce0e7-6fc5-4499-af6f-c3237a169d30	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
om4lg	12.0.2	1617147222
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
f5645c11-127a-45a8-88ef-e73a7257004e	audience resolve	openid-connect	oidc-audience-resolve-mapper	96524905-088e-4c9a-ad36-f411231992f0	\N
70468f40-6607-403b-bce3-eca2ca5d8fb5	locale	openid-connect	oidc-usermodel-attribute-mapper	730eb95f-f8fc-4d08-97d4-fb8e7afa9ce6	\N
5ef39384-9f11-45ef-92e6-2a2f72afe5d6	role list	saml	saml-role-list-mapper	\N	ad0b1819-a5fd-4b04-967f-37e3d2bbe1c3
82d90101-c0d3-436e-b8ed-4a1ec515dbc1	full name	openid-connect	oidc-full-name-mapper	\N	be074402-9093-4ca8-844a-2bef39fdec7f
7d4a35c6-fd68-4271-8236-bc46dc7767b6	family name	openid-connect	oidc-usermodel-property-mapper	\N	be074402-9093-4ca8-844a-2bef39fdec7f
ae660cac-4a88-4d93-aa4f-0a24649ae0a8	given name	openid-connect	oidc-usermodel-property-mapper	\N	be074402-9093-4ca8-844a-2bef39fdec7f
9a537cf4-184f-4454-9b17-1c72bed7687c	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	be074402-9093-4ca8-844a-2bef39fdec7f
5a5fc37f-840e-4d50-aa97-8e2e97396877	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	be074402-9093-4ca8-844a-2bef39fdec7f
4b5085fa-4310-47a8-91b0-3b9ae2e29b21	username	openid-connect	oidc-usermodel-property-mapper	\N	be074402-9093-4ca8-844a-2bef39fdec7f
f3d35ae4-56a3-4063-a7ea-b04b4cf040f6	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	be074402-9093-4ca8-844a-2bef39fdec7f
5606d733-d476-41e1-91fe-6f7e91c79005	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	be074402-9093-4ca8-844a-2bef39fdec7f
b9d380e1-36ce-40f8-a779-88301c20e9a7	website	openid-connect	oidc-usermodel-attribute-mapper	\N	be074402-9093-4ca8-844a-2bef39fdec7f
b5c0a86a-65b3-4aa1-b382-834b24e0cb04	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	be074402-9093-4ca8-844a-2bef39fdec7f
2be8e0db-ca6a-450d-a049-5b133b76be81	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	be074402-9093-4ca8-844a-2bef39fdec7f
eed85161-da24-4318-9612-2e66be01fdd9	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	be074402-9093-4ca8-844a-2bef39fdec7f
72b25cf6-4115-4d51-baf9-8f2e55184cde	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	be074402-9093-4ca8-844a-2bef39fdec7f
a5dffc0e-b80e-4e4d-b096-49bee6364605	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	be074402-9093-4ca8-844a-2bef39fdec7f
aa0c009d-5abc-4dc7-9845-07dbed4a025a	email	openid-connect	oidc-usermodel-property-mapper	\N	c21d91db-948f-4af9-a9f3-da2cb72b88ae
de391f2f-52dc-44e0-bd09-c4605ad0e3b7	email verified	openid-connect	oidc-usermodel-property-mapper	\N	c21d91db-948f-4af9-a9f3-da2cb72b88ae
3da0e77e-fbca-4015-8251-257eaa54d987	address	openid-connect	oidc-address-mapper	\N	3455d000-0c4a-402f-82a9-22a14e609d36
ce2c3f46-22f8-45f9-aad4-de075fcafa41	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	1821bde3-b2fa-4a3f-a244-9a96b5b412c5
aeeadc36-41fa-4276-872f-2af15c285d3c	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	1821bde3-b2fa-4a3f-a244-9a96b5b412c5
f726297f-7ec5-4f1c-b8dd-5ebd3e5e3311	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	4ab66071-a7be-4809-b3b9-239ece01780d
baab6161-c086-4454-8a2a-daa0a4ddc214	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	4ab66071-a7be-4809-b3b9-239ece01780d
3bd4fb11-811b-43c1-8c68-0caf3f610c4f	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	4ab66071-a7be-4809-b3b9-239ece01780d
6f60df9f-bbc4-4985-a726-bd78eaf612b0	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	05279f8b-b4e2-4c92-ae53-0241ee86da0f
5392c409-cb00-4f4a-857a-be8b4573ef17	upn	openid-connect	oidc-usermodel-property-mapper	\N	69ef1ebb-0cca-4558-9088-5e8881903c70
37ec3236-8d27-4cab-a788-6f5a4574f90e	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	69ef1ebb-0cca-4558-9088-5e8881903c70
03758271-8bde-4fcd-b4fb-cf8f10d75a80	address	openid-connect	oidc-address-mapper	\N	3d9506dc-4043-4dca-b0e2-3b9abee91e12
25691eec-5568-4f33-93e0-0057875222ce	email	openid-connect	oidc-usermodel-property-mapper	\N	07c5d8ab-320d-44ab-b9a8-8e53a5468300
0eba1be2-4137-405f-acc4-d16fd0bfc38a	email verified	openid-connect	oidc-usermodel-property-mapper	\N	07c5d8ab-320d-44ab-b9a8-8e53a5468300
552925df-548e-4b2a-a27d-e46c955a370c	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	be6e69d6-ecb6-41ab-aff0-f42d58701fe9
a1e06cec-657c-42f3-a7dc-2ac95049e49a	upn	openid-connect	oidc-usermodel-property-mapper	\N	be6e69d6-ecb6-41ab-aff0-f42d58701fe9
2e63d6c5-d5c6-4a3a-992c-292431866c93	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	281d9623-40fb-492a-9fb0-9d8d0c17cb9d
57a91e26-98ab-4d3e-97a9-e0f02a98bfb7	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	281d9623-40fb-492a-9fb0-9d8d0c17cb9d
3a126146-6a84-41ad-8ea3-7166e38898d0	username	openid-connect	oidc-usermodel-property-mapper	\N	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff
ac3af776-5b1f-49ce-ad62-5171fe9e2034	full name	openid-connect	oidc-full-name-mapper	\N	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff
0da00d26-a9bd-430a-8195-c5bf279b61e3	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff
be674e68-f622-4564-8248-bb7a470068ce	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff
386b32a7-f91b-47d1-9742-49dc81aa9afe	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff
b400b84f-0c1d-4b04-adbd-baae21b740de	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff
c823711e-dfed-4bae-8437-621a31b8fea5	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff
a3352fa8-1dae-443b-9234-8ca04b0638ce	website	openid-connect	oidc-usermodel-attribute-mapper	\N	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff
a393b96d-4cd2-45b9-9ecf-80772cc5814a	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff
596eea49-1ed1-47e9-9154-b1df92079cfd	family name	openid-connect	oidc-usermodel-property-mapper	\N	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff
ad33688d-7f69-4699-aa37-5561b6181f18	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff
094e7502-003d-4885-89a6-d8cac51da240	given name	openid-connect	oidc-usermodel-property-mapper	\N	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff
5a86552c-a1d0-4d72-b9c8-18ea7164d672	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff
45825f3e-3887-449c-9e61-8de71ddee009	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	8e43d0a8-8bc0-4b07-afd1-45884d4fc2ff
66e2368d-e19a-4b89-90a6-1bcdd318bb8f	role list	saml	saml-role-list-mapper	\N	89f9be1e-c089-4bf1-885e-1eae41fac07c
495ac079-5e34-43c3-a6de-422f51b46212	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	cbf5d1f5-ef2a-496d-b151-d118f470ddd1
9ab0bca1-f127-45f2-9fa8-373ebd9d6b7b	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	cbf5d1f5-ef2a-496d-b151-d118f470ddd1
85eb1121-4797-4927-befd-2e92a22ca909	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	cbf5d1f5-ef2a-496d-b151-d118f470ddd1
9efab1ba-edf1-4013-bb18-454bcc1cb2bb	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	ecab7702-b663-496a-8984-7c499f4455df
eac8c303-ec80-40fb-b7cd-17bfcd2b1769	audience resolve	openid-connect	oidc-audience-resolve-mapper	8ba9b806-3d2e-4d2b-a631-eb3b6746faad	\N
5aa0e3ff-2d57-4dfb-ab47-8fa14c9bc046	locale	openid-connect	oidc-usermodel-attribute-mapper	9b279deb-ff44-4e32-9529-602ea54d6056	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
70468f40-6607-403b-bce3-eca2ca5d8fb5	true	userinfo.token.claim
70468f40-6607-403b-bce3-eca2ca5d8fb5	locale	user.attribute
70468f40-6607-403b-bce3-eca2ca5d8fb5	true	id.token.claim
70468f40-6607-403b-bce3-eca2ca5d8fb5	true	access.token.claim
70468f40-6607-403b-bce3-eca2ca5d8fb5	locale	claim.name
70468f40-6607-403b-bce3-eca2ca5d8fb5	String	jsonType.label
5ef39384-9f11-45ef-92e6-2a2f72afe5d6	false	single
5ef39384-9f11-45ef-92e6-2a2f72afe5d6	Basic	attribute.nameformat
5ef39384-9f11-45ef-92e6-2a2f72afe5d6	Role	attribute.name
82d90101-c0d3-436e-b8ed-4a1ec515dbc1	true	userinfo.token.claim
82d90101-c0d3-436e-b8ed-4a1ec515dbc1	true	id.token.claim
82d90101-c0d3-436e-b8ed-4a1ec515dbc1	true	access.token.claim
7d4a35c6-fd68-4271-8236-bc46dc7767b6	true	userinfo.token.claim
7d4a35c6-fd68-4271-8236-bc46dc7767b6	lastName	user.attribute
7d4a35c6-fd68-4271-8236-bc46dc7767b6	true	id.token.claim
7d4a35c6-fd68-4271-8236-bc46dc7767b6	true	access.token.claim
7d4a35c6-fd68-4271-8236-bc46dc7767b6	family_name	claim.name
7d4a35c6-fd68-4271-8236-bc46dc7767b6	String	jsonType.label
ae660cac-4a88-4d93-aa4f-0a24649ae0a8	true	userinfo.token.claim
ae660cac-4a88-4d93-aa4f-0a24649ae0a8	firstName	user.attribute
ae660cac-4a88-4d93-aa4f-0a24649ae0a8	true	id.token.claim
ae660cac-4a88-4d93-aa4f-0a24649ae0a8	true	access.token.claim
ae660cac-4a88-4d93-aa4f-0a24649ae0a8	given_name	claim.name
ae660cac-4a88-4d93-aa4f-0a24649ae0a8	String	jsonType.label
9a537cf4-184f-4454-9b17-1c72bed7687c	true	userinfo.token.claim
9a537cf4-184f-4454-9b17-1c72bed7687c	middleName	user.attribute
9a537cf4-184f-4454-9b17-1c72bed7687c	true	id.token.claim
9a537cf4-184f-4454-9b17-1c72bed7687c	true	access.token.claim
9a537cf4-184f-4454-9b17-1c72bed7687c	middle_name	claim.name
9a537cf4-184f-4454-9b17-1c72bed7687c	String	jsonType.label
5a5fc37f-840e-4d50-aa97-8e2e97396877	true	userinfo.token.claim
5a5fc37f-840e-4d50-aa97-8e2e97396877	nickname	user.attribute
5a5fc37f-840e-4d50-aa97-8e2e97396877	true	id.token.claim
5a5fc37f-840e-4d50-aa97-8e2e97396877	true	access.token.claim
5a5fc37f-840e-4d50-aa97-8e2e97396877	nickname	claim.name
5a5fc37f-840e-4d50-aa97-8e2e97396877	String	jsonType.label
4b5085fa-4310-47a8-91b0-3b9ae2e29b21	true	userinfo.token.claim
4b5085fa-4310-47a8-91b0-3b9ae2e29b21	username	user.attribute
4b5085fa-4310-47a8-91b0-3b9ae2e29b21	true	id.token.claim
4b5085fa-4310-47a8-91b0-3b9ae2e29b21	true	access.token.claim
4b5085fa-4310-47a8-91b0-3b9ae2e29b21	preferred_username	claim.name
4b5085fa-4310-47a8-91b0-3b9ae2e29b21	String	jsonType.label
f3d35ae4-56a3-4063-a7ea-b04b4cf040f6	true	userinfo.token.claim
f3d35ae4-56a3-4063-a7ea-b04b4cf040f6	profile	user.attribute
f3d35ae4-56a3-4063-a7ea-b04b4cf040f6	true	id.token.claim
f3d35ae4-56a3-4063-a7ea-b04b4cf040f6	true	access.token.claim
f3d35ae4-56a3-4063-a7ea-b04b4cf040f6	profile	claim.name
f3d35ae4-56a3-4063-a7ea-b04b4cf040f6	String	jsonType.label
5606d733-d476-41e1-91fe-6f7e91c79005	true	userinfo.token.claim
5606d733-d476-41e1-91fe-6f7e91c79005	picture	user.attribute
5606d733-d476-41e1-91fe-6f7e91c79005	true	id.token.claim
5606d733-d476-41e1-91fe-6f7e91c79005	true	access.token.claim
5606d733-d476-41e1-91fe-6f7e91c79005	picture	claim.name
5606d733-d476-41e1-91fe-6f7e91c79005	String	jsonType.label
b9d380e1-36ce-40f8-a779-88301c20e9a7	true	userinfo.token.claim
b9d380e1-36ce-40f8-a779-88301c20e9a7	website	user.attribute
b9d380e1-36ce-40f8-a779-88301c20e9a7	true	id.token.claim
b9d380e1-36ce-40f8-a779-88301c20e9a7	true	access.token.claim
b9d380e1-36ce-40f8-a779-88301c20e9a7	website	claim.name
b9d380e1-36ce-40f8-a779-88301c20e9a7	String	jsonType.label
b5c0a86a-65b3-4aa1-b382-834b24e0cb04	true	userinfo.token.claim
b5c0a86a-65b3-4aa1-b382-834b24e0cb04	gender	user.attribute
b5c0a86a-65b3-4aa1-b382-834b24e0cb04	true	id.token.claim
b5c0a86a-65b3-4aa1-b382-834b24e0cb04	true	access.token.claim
b5c0a86a-65b3-4aa1-b382-834b24e0cb04	gender	claim.name
b5c0a86a-65b3-4aa1-b382-834b24e0cb04	String	jsonType.label
2be8e0db-ca6a-450d-a049-5b133b76be81	true	userinfo.token.claim
2be8e0db-ca6a-450d-a049-5b133b76be81	birthdate	user.attribute
2be8e0db-ca6a-450d-a049-5b133b76be81	true	id.token.claim
2be8e0db-ca6a-450d-a049-5b133b76be81	true	access.token.claim
2be8e0db-ca6a-450d-a049-5b133b76be81	birthdate	claim.name
2be8e0db-ca6a-450d-a049-5b133b76be81	String	jsonType.label
eed85161-da24-4318-9612-2e66be01fdd9	true	userinfo.token.claim
eed85161-da24-4318-9612-2e66be01fdd9	zoneinfo	user.attribute
eed85161-da24-4318-9612-2e66be01fdd9	true	id.token.claim
eed85161-da24-4318-9612-2e66be01fdd9	true	access.token.claim
eed85161-da24-4318-9612-2e66be01fdd9	zoneinfo	claim.name
eed85161-da24-4318-9612-2e66be01fdd9	String	jsonType.label
72b25cf6-4115-4d51-baf9-8f2e55184cde	true	userinfo.token.claim
72b25cf6-4115-4d51-baf9-8f2e55184cde	locale	user.attribute
72b25cf6-4115-4d51-baf9-8f2e55184cde	true	id.token.claim
72b25cf6-4115-4d51-baf9-8f2e55184cde	true	access.token.claim
72b25cf6-4115-4d51-baf9-8f2e55184cde	locale	claim.name
72b25cf6-4115-4d51-baf9-8f2e55184cde	String	jsonType.label
a5dffc0e-b80e-4e4d-b096-49bee6364605	true	userinfo.token.claim
a5dffc0e-b80e-4e4d-b096-49bee6364605	updatedAt	user.attribute
a5dffc0e-b80e-4e4d-b096-49bee6364605	true	id.token.claim
a5dffc0e-b80e-4e4d-b096-49bee6364605	true	access.token.claim
a5dffc0e-b80e-4e4d-b096-49bee6364605	updated_at	claim.name
a5dffc0e-b80e-4e4d-b096-49bee6364605	String	jsonType.label
aa0c009d-5abc-4dc7-9845-07dbed4a025a	true	userinfo.token.claim
aa0c009d-5abc-4dc7-9845-07dbed4a025a	email	user.attribute
aa0c009d-5abc-4dc7-9845-07dbed4a025a	true	id.token.claim
aa0c009d-5abc-4dc7-9845-07dbed4a025a	true	access.token.claim
aa0c009d-5abc-4dc7-9845-07dbed4a025a	email	claim.name
aa0c009d-5abc-4dc7-9845-07dbed4a025a	String	jsonType.label
de391f2f-52dc-44e0-bd09-c4605ad0e3b7	true	userinfo.token.claim
de391f2f-52dc-44e0-bd09-c4605ad0e3b7	emailVerified	user.attribute
de391f2f-52dc-44e0-bd09-c4605ad0e3b7	true	id.token.claim
de391f2f-52dc-44e0-bd09-c4605ad0e3b7	true	access.token.claim
de391f2f-52dc-44e0-bd09-c4605ad0e3b7	email_verified	claim.name
de391f2f-52dc-44e0-bd09-c4605ad0e3b7	boolean	jsonType.label
3da0e77e-fbca-4015-8251-257eaa54d987	formatted	user.attribute.formatted
3da0e77e-fbca-4015-8251-257eaa54d987	country	user.attribute.country
3da0e77e-fbca-4015-8251-257eaa54d987	postal_code	user.attribute.postal_code
3da0e77e-fbca-4015-8251-257eaa54d987	true	userinfo.token.claim
3da0e77e-fbca-4015-8251-257eaa54d987	street	user.attribute.street
3da0e77e-fbca-4015-8251-257eaa54d987	true	id.token.claim
3da0e77e-fbca-4015-8251-257eaa54d987	region	user.attribute.region
3da0e77e-fbca-4015-8251-257eaa54d987	true	access.token.claim
3da0e77e-fbca-4015-8251-257eaa54d987	locality	user.attribute.locality
ce2c3f46-22f8-45f9-aad4-de075fcafa41	true	userinfo.token.claim
ce2c3f46-22f8-45f9-aad4-de075fcafa41	phoneNumber	user.attribute
ce2c3f46-22f8-45f9-aad4-de075fcafa41	true	id.token.claim
ce2c3f46-22f8-45f9-aad4-de075fcafa41	true	access.token.claim
ce2c3f46-22f8-45f9-aad4-de075fcafa41	phone_number	claim.name
ce2c3f46-22f8-45f9-aad4-de075fcafa41	String	jsonType.label
aeeadc36-41fa-4276-872f-2af15c285d3c	true	userinfo.token.claim
aeeadc36-41fa-4276-872f-2af15c285d3c	phoneNumberVerified	user.attribute
aeeadc36-41fa-4276-872f-2af15c285d3c	true	id.token.claim
aeeadc36-41fa-4276-872f-2af15c285d3c	true	access.token.claim
aeeadc36-41fa-4276-872f-2af15c285d3c	phone_number_verified	claim.name
aeeadc36-41fa-4276-872f-2af15c285d3c	boolean	jsonType.label
f726297f-7ec5-4f1c-b8dd-5ebd3e5e3311	true	multivalued
f726297f-7ec5-4f1c-b8dd-5ebd3e5e3311	foo	user.attribute
f726297f-7ec5-4f1c-b8dd-5ebd3e5e3311	true	access.token.claim
f726297f-7ec5-4f1c-b8dd-5ebd3e5e3311	realm_access.roles	claim.name
f726297f-7ec5-4f1c-b8dd-5ebd3e5e3311	String	jsonType.label
baab6161-c086-4454-8a2a-daa0a4ddc214	true	multivalued
baab6161-c086-4454-8a2a-daa0a4ddc214	foo	user.attribute
baab6161-c086-4454-8a2a-daa0a4ddc214	true	access.token.claim
baab6161-c086-4454-8a2a-daa0a4ddc214	resource_access.${client_id}.roles	claim.name
baab6161-c086-4454-8a2a-daa0a4ddc214	String	jsonType.label
5392c409-cb00-4f4a-857a-be8b4573ef17	true	userinfo.token.claim
5392c409-cb00-4f4a-857a-be8b4573ef17	username	user.attribute
5392c409-cb00-4f4a-857a-be8b4573ef17	true	id.token.claim
5392c409-cb00-4f4a-857a-be8b4573ef17	true	access.token.claim
5392c409-cb00-4f4a-857a-be8b4573ef17	upn	claim.name
5392c409-cb00-4f4a-857a-be8b4573ef17	String	jsonType.label
37ec3236-8d27-4cab-a788-6f5a4574f90e	true	multivalued
37ec3236-8d27-4cab-a788-6f5a4574f90e	foo	user.attribute
37ec3236-8d27-4cab-a788-6f5a4574f90e	true	id.token.claim
37ec3236-8d27-4cab-a788-6f5a4574f90e	true	access.token.claim
37ec3236-8d27-4cab-a788-6f5a4574f90e	groups	claim.name
37ec3236-8d27-4cab-a788-6f5a4574f90e	String	jsonType.label
03758271-8bde-4fcd-b4fb-cf8f10d75a80	formatted	user.attribute.formatted
03758271-8bde-4fcd-b4fb-cf8f10d75a80	country	user.attribute.country
03758271-8bde-4fcd-b4fb-cf8f10d75a80	postal_code	user.attribute.postal_code
03758271-8bde-4fcd-b4fb-cf8f10d75a80	true	userinfo.token.claim
03758271-8bde-4fcd-b4fb-cf8f10d75a80	street	user.attribute.street
03758271-8bde-4fcd-b4fb-cf8f10d75a80	true	id.token.claim
03758271-8bde-4fcd-b4fb-cf8f10d75a80	region	user.attribute.region
03758271-8bde-4fcd-b4fb-cf8f10d75a80	true	access.token.claim
03758271-8bde-4fcd-b4fb-cf8f10d75a80	locality	user.attribute.locality
25691eec-5568-4f33-93e0-0057875222ce	true	userinfo.token.claim
25691eec-5568-4f33-93e0-0057875222ce	email	user.attribute
25691eec-5568-4f33-93e0-0057875222ce	true	id.token.claim
25691eec-5568-4f33-93e0-0057875222ce	true	access.token.claim
25691eec-5568-4f33-93e0-0057875222ce	email	claim.name
25691eec-5568-4f33-93e0-0057875222ce	String	jsonType.label
0eba1be2-4137-405f-acc4-d16fd0bfc38a	true	userinfo.token.claim
0eba1be2-4137-405f-acc4-d16fd0bfc38a	emailVerified	user.attribute
0eba1be2-4137-405f-acc4-d16fd0bfc38a	true	id.token.claim
0eba1be2-4137-405f-acc4-d16fd0bfc38a	true	access.token.claim
0eba1be2-4137-405f-acc4-d16fd0bfc38a	email_verified	claim.name
0eba1be2-4137-405f-acc4-d16fd0bfc38a	boolean	jsonType.label
552925df-548e-4b2a-a27d-e46c955a370c	true	multivalued
552925df-548e-4b2a-a27d-e46c955a370c	true	userinfo.token.claim
552925df-548e-4b2a-a27d-e46c955a370c	foo	user.attribute
552925df-548e-4b2a-a27d-e46c955a370c	true	id.token.claim
552925df-548e-4b2a-a27d-e46c955a370c	true	access.token.claim
552925df-548e-4b2a-a27d-e46c955a370c	groups	claim.name
552925df-548e-4b2a-a27d-e46c955a370c	String	jsonType.label
a1e06cec-657c-42f3-a7dc-2ac95049e49a	true	userinfo.token.claim
a1e06cec-657c-42f3-a7dc-2ac95049e49a	username	user.attribute
a1e06cec-657c-42f3-a7dc-2ac95049e49a	true	id.token.claim
a1e06cec-657c-42f3-a7dc-2ac95049e49a	true	access.token.claim
a1e06cec-657c-42f3-a7dc-2ac95049e49a	upn	claim.name
a1e06cec-657c-42f3-a7dc-2ac95049e49a	String	jsonType.label
2e63d6c5-d5c6-4a3a-992c-292431866c93	true	userinfo.token.claim
2e63d6c5-d5c6-4a3a-992c-292431866c93	phoneNumber	user.attribute
2e63d6c5-d5c6-4a3a-992c-292431866c93	true	id.token.claim
2e63d6c5-d5c6-4a3a-992c-292431866c93	true	access.token.claim
2e63d6c5-d5c6-4a3a-992c-292431866c93	phone_number	claim.name
2e63d6c5-d5c6-4a3a-992c-292431866c93	String	jsonType.label
57a91e26-98ab-4d3e-97a9-e0f02a98bfb7	true	userinfo.token.claim
57a91e26-98ab-4d3e-97a9-e0f02a98bfb7	phoneNumberVerified	user.attribute
57a91e26-98ab-4d3e-97a9-e0f02a98bfb7	true	id.token.claim
57a91e26-98ab-4d3e-97a9-e0f02a98bfb7	true	access.token.claim
57a91e26-98ab-4d3e-97a9-e0f02a98bfb7	phone_number_verified	claim.name
57a91e26-98ab-4d3e-97a9-e0f02a98bfb7	boolean	jsonType.label
3a126146-6a84-41ad-8ea3-7166e38898d0	true	userinfo.token.claim
3a126146-6a84-41ad-8ea3-7166e38898d0	username	user.attribute
3a126146-6a84-41ad-8ea3-7166e38898d0	true	id.token.claim
3a126146-6a84-41ad-8ea3-7166e38898d0	true	access.token.claim
3a126146-6a84-41ad-8ea3-7166e38898d0	preferred_username	claim.name
3a126146-6a84-41ad-8ea3-7166e38898d0	String	jsonType.label
ac3af776-5b1f-49ce-ad62-5171fe9e2034	true	id.token.claim
ac3af776-5b1f-49ce-ad62-5171fe9e2034	true	access.token.claim
ac3af776-5b1f-49ce-ad62-5171fe9e2034	true	userinfo.token.claim
0da00d26-a9bd-430a-8195-c5bf279b61e3	true	userinfo.token.claim
0da00d26-a9bd-430a-8195-c5bf279b61e3	locale	user.attribute
0da00d26-a9bd-430a-8195-c5bf279b61e3	true	id.token.claim
0da00d26-a9bd-430a-8195-c5bf279b61e3	true	access.token.claim
0da00d26-a9bd-430a-8195-c5bf279b61e3	locale	claim.name
0da00d26-a9bd-430a-8195-c5bf279b61e3	String	jsonType.label
be674e68-f622-4564-8248-bb7a470068ce	true	userinfo.token.claim
be674e68-f622-4564-8248-bb7a470068ce	picture	user.attribute
be674e68-f622-4564-8248-bb7a470068ce	true	id.token.claim
be674e68-f622-4564-8248-bb7a470068ce	true	access.token.claim
be674e68-f622-4564-8248-bb7a470068ce	picture	claim.name
be674e68-f622-4564-8248-bb7a470068ce	String	jsonType.label
386b32a7-f91b-47d1-9742-49dc81aa9afe	true	userinfo.token.claim
386b32a7-f91b-47d1-9742-49dc81aa9afe	birthdate	user.attribute
386b32a7-f91b-47d1-9742-49dc81aa9afe	true	id.token.claim
386b32a7-f91b-47d1-9742-49dc81aa9afe	true	access.token.claim
386b32a7-f91b-47d1-9742-49dc81aa9afe	birthdate	claim.name
386b32a7-f91b-47d1-9742-49dc81aa9afe	String	jsonType.label
b400b84f-0c1d-4b04-adbd-baae21b740de	true	userinfo.token.claim
b400b84f-0c1d-4b04-adbd-baae21b740de	profile	user.attribute
b400b84f-0c1d-4b04-adbd-baae21b740de	true	id.token.claim
b400b84f-0c1d-4b04-adbd-baae21b740de	true	access.token.claim
b400b84f-0c1d-4b04-adbd-baae21b740de	profile	claim.name
b400b84f-0c1d-4b04-adbd-baae21b740de	String	jsonType.label
c823711e-dfed-4bae-8437-621a31b8fea5	true	userinfo.token.claim
c823711e-dfed-4bae-8437-621a31b8fea5	gender	user.attribute
c823711e-dfed-4bae-8437-621a31b8fea5	true	id.token.claim
c823711e-dfed-4bae-8437-621a31b8fea5	true	access.token.claim
c823711e-dfed-4bae-8437-621a31b8fea5	gender	claim.name
c823711e-dfed-4bae-8437-621a31b8fea5	String	jsonType.label
a3352fa8-1dae-443b-9234-8ca04b0638ce	true	userinfo.token.claim
a3352fa8-1dae-443b-9234-8ca04b0638ce	website	user.attribute
a3352fa8-1dae-443b-9234-8ca04b0638ce	true	id.token.claim
a3352fa8-1dae-443b-9234-8ca04b0638ce	true	access.token.claim
a3352fa8-1dae-443b-9234-8ca04b0638ce	website	claim.name
a3352fa8-1dae-443b-9234-8ca04b0638ce	String	jsonType.label
a393b96d-4cd2-45b9-9ecf-80772cc5814a	true	userinfo.token.claim
a393b96d-4cd2-45b9-9ecf-80772cc5814a	middleName	user.attribute
a393b96d-4cd2-45b9-9ecf-80772cc5814a	true	id.token.claim
a393b96d-4cd2-45b9-9ecf-80772cc5814a	true	access.token.claim
a393b96d-4cd2-45b9-9ecf-80772cc5814a	middle_name	claim.name
a393b96d-4cd2-45b9-9ecf-80772cc5814a	String	jsonType.label
596eea49-1ed1-47e9-9154-b1df92079cfd	true	userinfo.token.claim
596eea49-1ed1-47e9-9154-b1df92079cfd	lastName	user.attribute
596eea49-1ed1-47e9-9154-b1df92079cfd	true	id.token.claim
596eea49-1ed1-47e9-9154-b1df92079cfd	true	access.token.claim
596eea49-1ed1-47e9-9154-b1df92079cfd	family_name	claim.name
596eea49-1ed1-47e9-9154-b1df92079cfd	String	jsonType.label
ad33688d-7f69-4699-aa37-5561b6181f18	true	userinfo.token.claim
ad33688d-7f69-4699-aa37-5561b6181f18	nickname	user.attribute
ad33688d-7f69-4699-aa37-5561b6181f18	true	id.token.claim
ad33688d-7f69-4699-aa37-5561b6181f18	true	access.token.claim
ad33688d-7f69-4699-aa37-5561b6181f18	nickname	claim.name
ad33688d-7f69-4699-aa37-5561b6181f18	String	jsonType.label
094e7502-003d-4885-89a6-d8cac51da240	true	userinfo.token.claim
094e7502-003d-4885-89a6-d8cac51da240	firstName	user.attribute
094e7502-003d-4885-89a6-d8cac51da240	true	id.token.claim
094e7502-003d-4885-89a6-d8cac51da240	true	access.token.claim
094e7502-003d-4885-89a6-d8cac51da240	given_name	claim.name
094e7502-003d-4885-89a6-d8cac51da240	String	jsonType.label
5a86552c-a1d0-4d72-b9c8-18ea7164d672	true	userinfo.token.claim
5a86552c-a1d0-4d72-b9c8-18ea7164d672	zoneinfo	user.attribute
5a86552c-a1d0-4d72-b9c8-18ea7164d672	true	id.token.claim
5a86552c-a1d0-4d72-b9c8-18ea7164d672	true	access.token.claim
5a86552c-a1d0-4d72-b9c8-18ea7164d672	zoneinfo	claim.name
5a86552c-a1d0-4d72-b9c8-18ea7164d672	String	jsonType.label
45825f3e-3887-449c-9e61-8de71ddee009	true	userinfo.token.claim
45825f3e-3887-449c-9e61-8de71ddee009	updatedAt	user.attribute
45825f3e-3887-449c-9e61-8de71ddee009	true	id.token.claim
45825f3e-3887-449c-9e61-8de71ddee009	true	access.token.claim
45825f3e-3887-449c-9e61-8de71ddee009	updated_at	claim.name
45825f3e-3887-449c-9e61-8de71ddee009	String	jsonType.label
66e2368d-e19a-4b89-90a6-1bcdd318bb8f	false	single
66e2368d-e19a-4b89-90a6-1bcdd318bb8f	Basic	attribute.nameformat
66e2368d-e19a-4b89-90a6-1bcdd318bb8f	Role	attribute.name
495ac079-5e34-43c3-a6de-422f51b46212	foo	user.attribute
495ac079-5e34-43c3-a6de-422f51b46212	true	access.token.claim
495ac079-5e34-43c3-a6de-422f51b46212	resource_access.${client_id}.roles	claim.name
495ac079-5e34-43c3-a6de-422f51b46212	String	jsonType.label
495ac079-5e34-43c3-a6de-422f51b46212	true	multivalued
9ab0bca1-f127-45f2-9fa8-373ebd9d6b7b	foo	user.attribute
9ab0bca1-f127-45f2-9fa8-373ebd9d6b7b	true	access.token.claim
9ab0bca1-f127-45f2-9fa8-373ebd9d6b7b	realm_access.roles	claim.name
9ab0bca1-f127-45f2-9fa8-373ebd9d6b7b	String	jsonType.label
9ab0bca1-f127-45f2-9fa8-373ebd9d6b7b	true	multivalued
5aa0e3ff-2d57-4dfb-ab47-8fa14c9bc046	true	userinfo.token.claim
5aa0e3ff-2d57-4dfb-ab47-8fa14c9bc046	locale	user.attribute
5aa0e3ff-2d57-4dfb-ab47-8fa14c9bc046	true	id.token.claim
5aa0e3ff-2d57-4dfb-ab47-8fa14c9bc046	true	access.token.claim
5aa0e3ff-2d57-4dfb-ab47-8fa14c9bc046	locale	claim.name
5aa0e3ff-2d57-4dfb-ab47-8fa14c9bc046	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me) FROM stdin;
master	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	8afe9f43-58e9-4ded-b864-1782d2d87670	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	b105013f-9083-42f1-946c-92c51c6f0dfd	947d1b96-f90d-4d95-aa53-efa9b9cf351d	583047f5-b8d1-4ff5-b2cd-9574757bf971	5611872a-460e-4808-9d77-45a8b178f96d	fb94b6d0-68b6-46b3-a771-73123d84e296	2592000	f	900	t	f	fd8bec64-cef3-4667-b738-09371a92e64b	0	f	0	0
edukare	60	300	300	\N	\N	\N	t	f	0	\N	edukare	0	\N	t	t	t	f	EXTERNAL	1800	36000	f	f	050ce0e7-6fc5-4499-af6f-c3237a169d30	1800	f	\N	t	f	f	t	0	1	30	6	HmacSHA1	totp	3c883951-4888-41b9-9a40-35d6c2fa09db	7e168018-732a-48c5-aa08-98e5cd31b5e3	a3763e91-60b3-4b67-ac70-974500737cee	5ef1a5dd-f375-411d-b7c3-102a7e95c8cc	5d1e66c4-7a79-421f-95c4-545e2187f4e9	2592000	f	900	t	f	64c04599-b0a4-4c73-a0b4-dac974b77350	0	f	0	0
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, value, realm_id) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly		master
_browser_header.xContentTypeOptions	nosniff	master
_browser_header.xRobotsTag	none	master
_browser_header.xFrameOptions	SAMEORIGIN	master
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	master
_browser_header.xXSSProtection	1; mode=block	master
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	master
bruteForceProtected	false	master
permanentLockout	false	master
maxFailureWaitSeconds	900	master
minimumQuickLoginWaitSeconds	60	master
waitIncrementSeconds	60	master
quickLoginCheckMilliSeconds	1000	master
maxDeltaTimeSeconds	43200	master
failureFactor	30	master
displayName	Keycloak	master
displayNameHtml	<div class="kc-logo-text"><span>Keycloak</span></div>	master
offlineSessionMaxLifespanEnabled	false	master
offlineSessionMaxLifespan	5184000	master
_browser_header.contentSecurityPolicyReportOnly		edukare
_browser_header.xContentTypeOptions	nosniff	edukare
_browser_header.xRobotsTag	none	edukare
_browser_header.xFrameOptions	SAMEORIGIN	edukare
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	edukare
_browser_header.xXSSProtection	1; mode=block	edukare
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	edukare
bruteForceProtected	false	edukare
permanentLockout	false	edukare
maxFailureWaitSeconds	900	edukare
minimumQuickLoginWaitSeconds	60	edukare
waitIncrementSeconds	60	edukare
quickLoginCheckMilliSeconds	1000	edukare
maxDeltaTimeSeconds	43200	edukare
failureFactor	30	edukare
offlineSessionMaxLifespanEnabled	false	edukare
offlineSessionMaxLifespan	5184000	edukare
clientSessionIdleTimeout	0	edukare
clientSessionMaxLifespan	0	edukare
clientOfflineSessionIdleTimeout	0	edukare
clientOfflineSessionMaxLifespan	0	edukare
actionTokenGeneratedByAdminLifespan	43200	edukare
actionTokenGeneratedByUserLifespan	300	edukare
webAuthnPolicyRpEntityName	keycloak	edukare
webAuthnPolicySignatureAlgorithms	ES256	edukare
webAuthnPolicyRpId		edukare
webAuthnPolicyAttestationConveyancePreference	not specified	edukare
webAuthnPolicyAuthenticatorAttachment	not specified	edukare
webAuthnPolicyRequireResidentKey	not specified	edukare
webAuthnPolicyUserVerificationRequirement	not specified	edukare
webAuthnPolicyCreateTimeout	0	edukare
webAuthnPolicyAvoidSameAuthenticatorRegister	false	edukare
webAuthnPolicyRpEntityNamePasswordless	keycloak	edukare
webAuthnPolicySignatureAlgorithmsPasswordless	ES256	edukare
webAuthnPolicyRpIdPasswordless		edukare
webAuthnPolicyAttestationConveyancePreferencePasswordless	not specified	edukare
webAuthnPolicyAuthenticatorAttachmentPasswordless	not specified	edukare
webAuthnPolicyRequireResidentKeyPasswordless	not specified	edukare
webAuthnPolicyUserVerificationRequirementPasswordless	not specified	edukare
webAuthnPolicyCreateTimeoutPasswordless	0	edukare
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	false	edukare
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_roles (realm_id, role_id) FROM stdin;
master	c71d7aae-c672-4efc-979a-4fd6879ca3a4
master	a39be0e9-dd26-4288-956a-9a205f62d4da
edukare	26230ce1-188c-41ec-aae5-55626638f009
edukare	3b5cdbbd-09f9-48d5-80d7-81e291f3ed7e
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
master	jboss-logging
edukare	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	master
password	password	t	t	edukare
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
4cbdc7de-2838-4486-aad7-f31c0f3cb5ac	/realms/master/account/*
96524905-088e-4c9a-ad36-f411231992f0	/realms/master/account/*
730eb95f-f8fc-4d08-97d4-fb8e7afa9ce6	/admin/master/console/*
987ca1e3-f867-4cf9-b8ca-59fde4c43d1e	/realms/edukare/account/*
8ba9b806-3d2e-4d2b-a631-eb3b6746faad	/realms/edukare/account/*
8f4857b7-d402-4ae8-b8c7-2ede589a5865	*
9b279deb-ff44-4e32-9529-602ea54d6056	/admin/edukare/console/*
553bd174-14f6-43f4-b3e3-856a8963ac32	*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
cfab7ea0-c743-448e-9510-9dff1fbd0a58	VERIFY_EMAIL	Verify Email	master	t	f	VERIFY_EMAIL	50
a667f0c8-c882-4ec2-9cbc-996c5cccf8b0	UPDATE_PROFILE	Update Profile	master	t	f	UPDATE_PROFILE	40
0d79b57b-7064-46c1-95e3-6c832250f55f	CONFIGURE_TOTP	Configure OTP	master	t	f	CONFIGURE_TOTP	10
114bbd98-8725-4be1-82dd-73140249eb8b	UPDATE_PASSWORD	Update Password	master	t	f	UPDATE_PASSWORD	30
72ca45fb-0996-41f2-a829-a0bf41d813af	terms_and_conditions	Terms and Conditions	master	f	f	terms_and_conditions	20
ef59482a-e8d3-4f03-ba1f-3c1214ced4aa	update_user_locale	Update User Locale	master	t	f	update_user_locale	1000
6637f2b2-5fd6-4c9a-a277-3805160cddc0	delete_account	Delete Account	master	f	f	delete_account	60
68aac670-5c8e-4752-9ec4-221ede49c2c2	CONFIGURE_TOTP	Configure OTP	edukare	t	f	CONFIGURE_TOTP	10
c2d72814-8fc5-480f-a00a-b413e8fae95b	terms_and_conditions	Terms and Conditions	edukare	f	f	terms_and_conditions	20
2cdd37f2-84c1-4d1e-abe3-9a0186dca8bb	UPDATE_PASSWORD	Update Password	edukare	t	f	UPDATE_PASSWORD	30
ca134f04-cbcd-4c71-84ce-666032d0321d	UPDATE_PROFILE	Update Profile	edukare	t	f	UPDATE_PROFILE	40
9248fc59-9847-49a6-ba93-321166a33c3a	VERIFY_EMAIL	Verify Email	edukare	t	f	VERIFY_EMAIL	50
30172358-3a01-4749-9608-0b32923eaaae	delete_account	Delete Account	edukare	f	f	delete_account	60
425af11a-2e78-43c6-abf3-97cfa4bae088	update_user_locale	Update User Locale	edukare	t	f	update_user_locale	1000
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
96524905-088e-4c9a-ad36-f411231992f0	9664541a-0f9a-45f6-944e-261396bff9c6
8ba9b806-3d2e-4d2b-a631-eb3b6746faad	fa4f84cf-1038-445d-ad0c-c7d052db0b9b
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
32d29917-4097-47f1-ba66-77ec0a3681da	\N	229e4cc1-106b-49f4-9df3-314c27fb7171	f	t	\N	\N	\N	master	admin	1617147228025	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
c71d7aae-c672-4efc-979a-4fd6879ca3a4	32d29917-4097-47f1-ba66-77ec0a3681da
a39be0e9-dd26-4288-956a-9a205f62d4da	32d29917-4097-47f1-ba66-77ec0a3681da
7568b522-06cf-41c0-b3a2-6837f8edc0fd	32d29917-4097-47f1-ba66-77ec0a3681da
9664541a-0f9a-45f6-944e-261396bff9c6	32d29917-4097-47f1-ba66-77ec0a3681da
184aaa78-1319-4c64-b6c2-cd31af7a3f94	32d29917-4097-47f1-ba66-77ec0a3681da
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
730eb95f-f8fc-4d08-97d4-fb8e7afa9ce6	+
8f4857b7-d402-4ae8-b8c7-2ede589a5865	*
9b279deb-ff44-4e32-9529-602ea54d6056	+
553bd174-14f6-43f4-b3e3-856a8963ac32	*
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: client_default_roles constr_client_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT constr_client_default_roles PRIMARY KEY (client_id, role_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: realm_default_roles constraint_realm_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT constraint_realm_default_roles PRIMARY KEY (realm_id, role_id);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client_default_roles uk_8aelwnibji49avxsrtuf6xjow; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT uk_8aelwnibji49avxsrtuf6xjow UNIQUE (role_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: realm_default_roles uk_h4wpd7w4hsoolni3h0sw7btje; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT uk_h4wpd7w4hsoolni3h0sw7btje UNIQUE (role_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_def_roles_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_def_roles_client ON public.client_default_roles USING btree (client_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_def_roles_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_roles_realm ON public.realm_default_roles USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_client fk_c_cli_scope_client; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_client FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_scope_client fk_c_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_roles fk_evudb1ppw84oxfax2drs03icc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_evudb1ppw84oxfax2drs03icc FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: keycloak_group fk_group_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT fk_group_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_default_roles fk_nuilts7klwqw2h8m2b5joytky; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_nuilts7klwqw2h8m2b5joytky FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client fk_p56ctinxxb9gsk57fo49f9tac; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_p56ctinxxb9gsk57fo49f9tac FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope fk_realm_cli_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT fk_realm_cli_scope FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO admin;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: admin
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "processo" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

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

--
-- Name: processo; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE processo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE processo OWNER TO admin;

\connect processo

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
-- Name: etapa; Type: TABLE; Schema: public; Owner: processoapp
--

CREATE TABLE public.etapa (
    id bigint NOT NULL,
    data date,
    descricao character varying(255),
    titulo character varying(255),
    processo_seletivo_id bigint
);


ALTER TABLE public.etapa OWNER TO processoapp;

--
-- Name: etapa_sequence; Type: SEQUENCE; Schema: public; Owner: processoapp
--

CREATE SEQUENCE public.etapa_sequence
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.etapa_sequence OWNER TO processoapp;

--
-- Name: processo_seletivo; Type: TABLE; Schema: public; Owner: processoapp
--

CREATE TABLE public.processo_seletivo (
    id bigint NOT NULL,
    descricao character varying(255),
    dt_encerramento_inscricao date,
    dt_inicio_inscricao date,
    situacao character varying(255),
    titulo character varying(255)
);


ALTER TABLE public.processo_seletivo OWNER TO processoapp;

--
-- Name: processo_sequence; Type: SEQUENCE; Schema: public; Owner: processoapp
--

CREATE SEQUENCE public.processo_sequence
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.processo_sequence OWNER TO processoapp;

--
-- Name: professor; Type: TABLE; Schema: public; Owner: processoapp
--

CREATE TABLE public.professor (
    id bigint NOT NULL,
    celular character varying(255) NOT NULL,
    cpf character varying(255) NOT NULL,
    data_efetivacao timestamp without time zone NOT NULL,
    email character varying(255) NOT NULL,
    encaminhado boolean NOT NULL,
    escola_encaminhamento character varying(255),
    escola_id_encaminhamento bigint,
    inscricao_id bigint NOT NULL,
    nome_completo character varying(255) NOT NULL,
    processo_seletivo_id bigint NOT NULL,
    processo_seletivo_titulo character varying(255) NOT NULL,
    telefone_fixo character varying(255) NOT NULL
);


ALTER TABLE public.professor OWNER TO processoapp;

--
-- Name: professor_sequence; Type: SEQUENCE; Schema: public; Owner: processoapp
--

CREATE SEQUENCE public.professor_sequence
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.professor_sequence OWNER TO processoapp;

--
-- Data for Name: etapa; Type: TABLE DATA; Schema: public; Owner: processoapp
--

COPY public.etapa (id, data, descricao, titulo, processo_seletivo_id) FROM stdin;
\.


--
-- Data for Name: processo_seletivo; Type: TABLE DATA; Schema: public; Owner: processoapp
--

COPY public.processo_seletivo (id, descricao, dt_encerramento_inscricao, dt_inicio_inscricao, situacao, titulo) FROM stdin;
\.


--
-- Data for Name: professor; Type: TABLE DATA; Schema: public; Owner: processoapp
--

COPY public.professor (id, celular, cpf, data_efetivacao, email, encaminhado, escola_encaminhamento, escola_id_encaminhamento, inscricao_id, nome_completo, processo_seletivo_id, processo_seletivo_titulo, telefone_fixo) FROM stdin;
\.


--
-- Name: etapa_sequence; Type: SEQUENCE SET; Schema: public; Owner: processoapp
--

SELECT pg_catalog.setval('public.etapa_sequence', 1, false);


--
-- Name: processo_sequence; Type: SEQUENCE SET; Schema: public; Owner: processoapp
--

SELECT pg_catalog.setval('public.processo_sequence', 1, false);


--
-- Name: professor_sequence; Type: SEQUENCE SET; Schema: public; Owner: processoapp
--

SELECT pg_catalog.setval('public.professor_sequence', 1, false);


--
-- Name: etapa etapa_pkey; Type: CONSTRAINT; Schema: public; Owner: processoapp
--

ALTER TABLE ONLY public.etapa
    ADD CONSTRAINT etapa_pkey PRIMARY KEY (id);


--
-- Name: processo_seletivo processo_seletivo_pkey; Type: CONSTRAINT; Schema: public; Owner: processoapp
--

ALTER TABLE ONLY public.processo_seletivo
    ADD CONSTRAINT processo_seletivo_pkey PRIMARY KEY (id);


--
-- Name: professor professor_pkey; Type: CONSTRAINT; Schema: public; Owner: processoapp
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (id);


--
-- Name: etapa fkcbaeroxlo9b24wxs986l4qspr; Type: FK CONSTRAINT; Schema: public; Owner: processoapp
--

ALTER TABLE ONLY public.etapa
    ADD CONSTRAINT fkcbaeroxlo9b24wxs986l4qspr FOREIGN KEY (processo_seletivo_id) REFERENCES public.processo_seletivo(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

