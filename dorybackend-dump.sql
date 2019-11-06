--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4 (Debian 11.4-1.pgdg90+1)
-- Dumped by pg_dump version 11.1

-- Started on 2019-08-05 14:25:55

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2909 (class 1262 OID 16386)
-- Name: dorybackend; Type: DATABASE; Schema: -; Owner: pgdorybackend
--

DROP USER IF EXISTS pgdorybackend;

CREATE USER pgdorybackend WITH
	LOGIN
	SUPERUSER
	CREATEDB
	CREATEROLE
	INHERIT
	NOREPLICATION
	CONNECTION LIMIT -1
	PASSWORD 'pgdorybackend';

	
DROP DATABASE IS EXISTS dorybackend;

CREATE DATABASE dorybackend WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';

ALTER DATABASE dorybackend OWNER TO pgdorybackend;


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16387)
-- Name: pgdorybackend; Type: SCHEMA; Schema: -; Owner: pgdorybackend
--
DROP SCHEMA IF EXISTS pgdorybackend CASCADE;


CREATE SCHEMA pgdorybackend;


ALTER SCHEMA pgdorybackend OWNER TO pgdorybackend;

--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA pgdorybackend; Type: COMMENT; Schema: -; Owner: pgdorybackend
--

COMMENT ON SCHEMA pgdorybackend IS 'Schéma de données application rest';


SET default_tablespace = '';

SET default_with_oids = false;

DROP TABLE IF EXISTS pgdorybackend.statut_document cascade;
DROP TABLE IF EXISTS pgdorybackend.statut_sip cascade;
DROP TABLE IF EXISTS pgdorybackend.statut_lot_versement cascade;
DROP TABLE IF EXISTS pgdorybackend.sip cascade;
DROP TABLE IF EXISTS pgdorybackend.lot_versement cascade;
DROP TABLE IF EXISTS pgdorybackend.document cascade;
DROP TABLE IF EXISTS pgdorybackend.log_document;
DROP TABLE IF EXISTS pgdorybackend.historique_statut_document;
DROP TABLE IF EXISTS pgdorybackend.vitam_access_info_config;

--
-- TOC entry 204 (class 1259 OID 16414)
-- Name: statut_document; Type: TABLE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE TABLE pgdorybackend.statut_document (
    id bigint NOT NULL,
    code character varying(128) COLLATE pg_catalog."default" NOT NULL,
    dt_maj timestamp without time zone,
    dt_creation timestamp without time zone NOT NULL
);


ALTER TABLE pgdorybackend.statut_document OWNER TO pgdorybackend;

--
-- TOC entry 203 (class 1259 OID 16412)
-- Name: statut_document_id_seq; Type: SEQUENCE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE SEQUENCE pgdorybackend.statut_document_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NO MAXVALUE
    CACHE 1
    NO CYCLE;


ALTER TABLE pgdorybackend.statut_document_id_seq OWNER TO pgdorybackend;

--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 203
-- Name: statut_document_id_seq; Type: SEQUENCE OWNED BY; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER SEQUENCE pgdorybackend.statut_document_id_seq OWNED BY pgdorybackend.statut_document.id;


--
-- TOC entry 200 (class 1259 OID 16398)
-- Name: statut_sip; Type: TABLE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE TABLE pgdorybackend.statut_sip (
    id bigint NOT NULL,
    code character varying(128) COLLATE pg_catalog."default" NOT NULL,
    dt_maj timestamp without time zone,
    dt_creation timestamp without time zone NOT NULL
);


ALTER TABLE pgdorybackend.statut_sip OWNER TO pgdorybackend;

--
-- TOC entry 199 (class 1259 OID 16396)
-- Name: statut_sip_id_seq; Type: SEQUENCE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE SEQUENCE pgdorybackend.statut_sip_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NO MAXVALUE
    CACHE 1
    NO CYCLE;


ALTER TABLE pgdorybackend.statut_sip_id_seq OWNER TO pgdorybackend;

--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 199
-- Name: statut_sip_id_seq; Type: SEQUENCE OWNED BY; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER SEQUENCE pgdorybackend.statut_sip_id_seq OWNED BY pgdorybackend.statut_sip.id;

--
-- TOC entry 200 (class 1259 OID 16398)
-- Name: statut_lot_versement; Type: TABLE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE TABLE pgdorybackend.statut_lot_versement (
    id bigint NOT NULL,
    code character varying(128) COLLATE pg_catalog."default" NOT NULL,
    dt_maj timestamp without time zone,
    dt_creation timestamp without time zone NOT NULL
);


ALTER TABLE pgdorybackend.statut_lot_versement OWNER TO pgdorybackend;

--
-- TOC entry 199 (class 1259 OID 16396)
-- Name: statut_lot_versement_id_seq; Type: SEQUENCE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE SEQUENCE pgdorybackend.statut_lot_versement_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NO MAXVALUE
    CACHE 1
    NO CYCLE;


ALTER TABLE pgdorybackend.statut_lot_versement_id_seq OWNER TO pgdorybackend;

--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 199
-- Name: statut_lot_versement_id_seq; Type: SEQUENCE OWNED BY; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER SEQUENCE pgdorybackend.statut_lot_versement_id_seq OWNED BY pgdorybackend.statut_lot_versement.id;


--
-- TOC entry 198 (class 1259 OID 16390)
-- Name: sip; Type: TABLE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE TABLE pgdorybackend.sip (
    id bigint NOT NULL,
    nom character varying(255) COLLATE pg_catalog."default" NOT NULL,
    url_depot character varying(255) COLLATE pg_catalog."default" NOT NULL,
    id_request character varying(255) COLLATE pg_catalog."default" ,
    id_statut_sip bigint NOT NULL,
    dt_creation timestamp without time zone,
    dt_maj timestamp without time zone
);


ALTER TABLE pgdorybackend.sip OWNER TO pgdorybackend;

--
-- TOC entry 197 (class 1259 OID 16388)
-- Name: sip_id_seq; Type: SEQUENCE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE SEQUENCE pgdorybackend.sip_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NO MAXVALUE
    CACHE 1
    NO CYCLE;


ALTER TABLE pgdorybackend.sip_id_seq OWNER TO pgdorybackend;

--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 197
-- Name: sip_id_seq; Type: SEQUENCE OWNED BY; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER SEQUENCE pgdorybackend.sip_id_seq OWNED BY pgdorybackend.sip.id;





--
-- TOC entry 198 (class 1259 OID 16390)
-- Name: lot_versement; Type: TABLE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE TABLE pgdorybackend.lot_versement (
    id bigint NOT NULL,
    nom character varying(255) COLLATE pg_catalog."default" NOT NULL,
    url_depot character varying(255) COLLATE pg_catalog."default" NOT NULL,
    code_statut_lot_versement character varying(128) COLLATE pg_catalog."default" NOT NULL,
    dt_creation timestamp without time zone,
    dt_maj timestamp without time zone
);


ALTER TABLE pgdorybackend.lot_versement OWNER TO pgdorybackend;

--
-- TOC entry 197 (class 1259 OID 16388)
-- Name: lot_versement_id_seq; Type: SEQUENCE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE SEQUENCE pgdorybackend.lot_versement_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NO MAXVALUE
    CACHE 1
    NO CYCLE;


ALTER TABLE pgdorybackend.lot_versement_id_seq OWNER TO pgdorybackend;

--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 197
-- Name: lot_versement_id_seq; Type: SEQUENCE OWNED BY; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER SEQUENCE pgdorybackend.lot_versement_id_seq OWNED BY pgdorybackend.lot_versement.id;


--
-- TOC entry 202 (class 1259 OID 16406)
-- Name: document; Type: TABLE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE TABLE pgdorybackend.document (
    id bigint NOT NULL,
    uuid character varying(255) COLLATE pg_catalog."default" NOT NULL,
    contrat_service character varying(255) COLLATE pg_catalog."default",
    application_versante character varying(255) COLLATE pg_catalog."default",
    dt_maj timestamp without time zone,
    dt_creation timestamp without time zone NOT NULL,
    path_metadonnees character varying(255) COLLATE pg_catalog."default",
    path_document character varying(255) COLLATE pg_catalog."default",
	code_statut_document character varying(128) COLLATE pg_catalog."default" NOT NULL,
    metadonnees_document text COLLATE pg_catalog."default",
    hash_scelle text COLLATE pg_catalog."default",
    hash_non_scelle text COLLATE pg_catalog."default",
    bloc_horodate text COLLATE pg_catalog."default",
    cle_public_certificat text COLLATE pg_catalog."default",
    id_sip bigint,
    id_lot_versement bigint
);


ALTER TABLE pgdorybackend.document OWNER TO pgdorybackend;

--
-- TOC entry 201 (class 1259 OID 16404)
-- Name: document_id_seq; Type: SEQUENCE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE SEQUENCE pgdorybackend.document_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NO MAXVALUE
    CACHE 1
    NO CYCLE;


ALTER TABLE pgdorybackend.document_id_seq OWNER TO pgdorybackend;

--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 201
-- Name: document_id_seq; Type: SEQUENCE OWNED BY; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER SEQUENCE pgdorybackend.document_id_seq OWNED BY pgdorybackend.document.id;

--
-- TOC entry 202 (class 1259 OID 16406)
-- Name: log_document; Type: TABLE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE TABLE pgdorybackend.log_document (
    id bigint NOT NULL,
    message text COLLATE pg_catalog."default" NOT NULL,
    id_document bigint NOT NULL,
    dt_maj timestamp without time zone,
    dt_creation timestamp without time zone NOT NULL
);


ALTER TABLE pgdorybackend.log_document OWNER TO pgdorybackend;

--
-- TOC entry 201 (class 1259 OID 16404)
-- Name: log_document_id_seq; Type: SEQUENCE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE SEQUENCE pgdorybackend.log_document_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NO MAXVALUE
    CACHE 1
    NO CYCLE;


ALTER TABLE pgdorybackend.log_document_id_seq OWNER TO pgdorybackend;

--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 201
-- Name: log_document_id_seq; Type: SEQUENCE OWNED BY; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER SEQUENCE pgdorybackend.log_document_id_seq OWNED BY pgdorybackend.log_document.id;

--
-- TOC entry 202 (class 1259 OID 16406)
-- Name: historique_statut_document; Type: TABLE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE TABLE pgdorybackend.historique_statut_document (
    id bigint NOT NULL,
    code_statut text COLLATE pg_catalog."default" NOT NULL,
    message text COLLATE pg_catalog."default" NOT NULL,
    id_document bigint NOT NULL,
    dt_maj timestamp without time zone,
    dt_creation timestamp without time zone NOT NULL
);


ALTER TABLE pgdorybackend.historique_statut_document OWNER TO pgdorybackend;

--
-- TOC entry 201 (class 1259 OID 16404)
-- Name: historique_statut_document_id_seq_name; Type: SEQUENCE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE SEQUENCE pgdorybackend.historique_statut_document_id_seq_name
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NO MAXVALUE
    CACHE 1
    NO CYCLE;


ALTER TABLE pgdorybackend.historique_statut_document_id_seq_name OWNER TO pgdorybackend;

--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 201
-- Name: historique_statut_document_id_seq_name; Type: SEQUENCE OWNED BY; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER SEQUENCE pgdorybackend.historique_statut_document_id_seq_name OWNED BY pgdorybackend.historique_statut_document.id;

--
-- TOC entry 202 (class 1259 OID 16406)
-- Name: vitam_access_info_config; Type: TABLE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE TABLE pgdorybackend.vitam_access_info_config (
    id bigint NOT NULL,
    code character varying(255) COLLATE pg_catalog."default" NOT NULL,
    ssl_client_cert text COLLATE pg_catalog."default",
    tenant_id character varying(255) COLLATE pg_catalog."default",
    application_id character varying(255) COLLATE pg_catalog."default",
    context_id character varying(255) COLLATE pg_catalog."default",
    access_contract_id character varying(255) COLLATE pg_catalog."default",
    dt_maj timestamp without time zone,
    dt_creation timestamp without time zone NOT NULL
);


ALTER TABLE pgdorybackend.vitam_access_info_config OWNER TO pgdorybackend;

--
-- TOC entry 201 (class 1259 OID 16404)
-- Name: vitam_access_info_config_id_seq; Type: SEQUENCE; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE SEQUENCE pgdorybackend.vitam_access_info_config_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NO MAXVALUE
    CACHE 1
    NO CYCLE;


ALTER TABLE pgdorybackend.vitam_access_info_config_id_seq OWNER TO pgdorybackend;

--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 201
-- Name: vitam_access_info_config_id_seq; Type: SEQUENCE OWNED BY; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER SEQUENCE pgdorybackend.vitam_access_info_config_id_seq OWNED BY pgdorybackend.vitam_access_info_config.id;


--
-- TOC entry 2762 (class 2604 OID 16417)
-- Name: statut_document id; Type: DEFAULT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.statut_document ALTER COLUMN id SET DEFAULT nextval('pgdorybackend.statut_document_id_seq'::regclass);


--
-- TOC entry 2760 (class 2604 OID 16401)
-- Name: statut_sip id; Type: DEFAULT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.statut_sip ALTER COLUMN id SET DEFAULT nextval('pgdorybackend.statut_sip_id_seq'::regclass);



--
-- TOC entry 2760 (class 2604 OID 16401)
-- Name: statut_lot_versement id; Type: DEFAULT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.statut_lot_versement ALTER COLUMN id SET DEFAULT nextval('pgdorybackend.statut_lot_versement_id_seq'::regclass);

--
-- TOC entry 2759 (class 2604 OID 16393)
-- Name: sip id; Type: DEFAULT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.sip ALTER COLUMN id SET DEFAULT nextval('pgdorybackend.sip_id_seq'::regclass);


--
-- TOC entry 2759 (class 2604 OID 16393)
-- Name: lot_versement id; Type: DEFAULT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.lot_versement ALTER COLUMN id SET DEFAULT nextval('pgdorybackend.lot_versement_id_seq'::regclass);

--
-- TOC entry 2761 (class 2604 OID 16409)
-- Name: document id; Type: DEFAULT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.document ALTER COLUMN id SET DEFAULT nextval('pgdorybackend.document_id_seq'::regclass);


--
-- TOC entry 2761 (class 2604 OID 16409)
-- Name: log_document id; Type: DEFAULT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.log_document ALTER COLUMN id SET DEFAULT nextval('pgdorybackend.log_document_id_seq'::regclass);


--
-- TOC entry 2761 (class 2604 OID 16409)
-- Name: historique_statut_document id; Type: DEFAULT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.historique_statut_document ALTER COLUMN id SET DEFAULT nextval('pgdorybackend.historique_statut_document_id_seq_name'::regclass);


--
-- TOC entry 2761 (class 2604 OID 16409)
-- Name: vitam_access_info_config id; Type: DEFAULT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.vitam_access_info_config ALTER COLUMN id SET DEFAULT nextval('pgdorybackend.vitam_access_info_config_id_seq'::regclass);


--
-- TOC entry 2772 (class 2606 OID 16419)
-- Name: statut_document pk_statut_document; Type: CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.statut_document
    ADD CONSTRAINT pk_statut_document PRIMARY KEY (id);

--
-- TOC entry 2766 (class 2606 OID 16403)
-- Name: statut_sip pk_statut_sip; Type: CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.statut_sip
    ADD CONSTRAINT pk_statut_sip PRIMARY KEY (id);

    
--
-- TOC entry 2766 (class 2606 OID 16403)
-- Name: statut_sip pk_statut_sip; Type: CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.statut_lot_versement
    ADD CONSTRAINT pk_statut_lot_versement PRIMARY KEY (id);
      

--
-- TOC entry 2764 (class 2606 OID 16395)
-- Name: sip pk_sip; Type: CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.sip
    ADD CONSTRAINT pk_sip PRIMARY KEY (id);
    
--
-- TOC entry 2764 (class 2606 OID 16395)
-- Name: sip pk_sip; Type: CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.lot_versement
    ADD CONSTRAINT pk_lot_vesrement PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 16411)
-- Name: document pk_document; Type: CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.document
    ADD CONSTRAINT pk_document PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 16411)
-- Name: log_document pk_log_document; Type: CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.log_document
    ADD CONSTRAINT pk_log_document PRIMARY KEY (id);
    
    
--
-- TOC entry 2768 (class 2606 OID 16411)
-- Name: historique_statut_document pk_historique_statut_document; Type: CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.historique_statut_document
    ADD CONSTRAINT pk_historique_statut_document PRIMARY KEY (id);
    
    
--
-- TOC entry 2768 (class 2606 OID 16411)
-- Name: vitam_access_info_config pk_vitam_access_info_config; Type: CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.vitam_access_info_config
    ADD CONSTRAINT pk_vitam_access_info_config PRIMARY KEY (id);
    
    
--
-- TOC entry 2770 (class 1259 OID 16420)
-- Name: idx_sip_on_id_statut_sip; Type: INDEX; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE INDEX idx_sip_on_id_statut_sip ON pgdorybackend.sip USING btree (id_statut_sip);


--
-- TOC entry 2769 (class 1259 OID 16421)
-- Name: idx_document_on_code_statut_document; Type: INDEX; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE INDEX idx_document_on_code_statut_document ON pgdorybackend.document USING btree (code_statut_document);


--
-- TOC entry 2769 (class 1259 OID 16421)
-- Name: idx_document_on_id_sip; Type: INDEX; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE INDEX idx_document_on_id_sip ON pgdorybackend.document USING btree (id_sip);


--
-- TOC entry 2769 (class 1259 OID 16421)
-- Name: idx_document_on_id_lot_versement; Type: INDEX; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE INDEX idx_document_on_id_lot_versement ON pgdorybackend.document USING btree (id_lot_versement);

--
-- TOC entry 2769 (class 1259 OID 16421)
-- Name: idx_lot_versement_on_code_statut_lot_versement; Type: INDEX; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE INDEX idx_lot_versement_on_code_statut_lot_versement ON pgdorybackend.lot_versement USING btree (code_statut_lot_versement);


--
-- TOC entry 2769 (class 1259 OID 16421)
-- Name: idx_log_document_on_id_document; Type: INDEX; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE INDEX idx_log_document_on_id_document ON pgdorybackend.log_document USING btree (id_document);


--
-- TOC entry 2769 (class 1259 OID 16421)
-- Name: idx_log_document_on_id_document; Type: INDEX; Schema: pgdorybackend; Owner: pgdorybackend
--

CREATE INDEX idx_historique_statut_document_on_id_document ON pgdorybackend.historique_statut_document USING btree (id_document);


--
-- TOC entry 2774 (class 2606 OID 16427)
-- Name: statut_document uk_to_code; Type: UNIQUE; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.statut_document
    ADD CONSTRAINT uk_statut_document_to_code UNIQUE (code);
    
--
-- TOC entry 2774 (class 2606 OID 16427)
-- Name: statut_sip uk_to_code; Type: UNIQUE; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.statut_sip
    ADD CONSTRAINT uk_statut_sip_to_code UNIQUE (code);


--
-- TOC entry 2774 (class 2606 OID 16427)
-- Name: document uk_to_uuid; Type: UNIQUE; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.document
    ADD CONSTRAINT uk_to_uuid UNIQUE (uuid);
    
--
-- TOC entry 2774 (class 2606 OID 16427)
-- Name: statut_lot_versement uk_to_code; Type: UNIQUE; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.statut_lot_versement
    ADD CONSTRAINT uk_statut_lot_versement_to_code UNIQUE (code);

--
-- TOC entry 2774 (class 2606 OID 16427)
-- Name: sip fk_sip_to_statut_sip; Type: FK CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.sip
    ADD CONSTRAINT fk_sip_to_statut_sip FOREIGN KEY (id_statut_sip) REFERENCES pgdorybackend.statut_sip(id);


--
-- TOC entry 2773 (class 2606 OID 16422)
-- Name: document fk_document_to_statut_document; Type: FK CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.document
    ADD CONSTRAINT fk_document_to_statut_document FOREIGN KEY (code_statut_document) REFERENCES pgdorybackend.statut_document(code);
    
    
--
-- TOC entry 2773 (class 2606 OID 16422)
-- Name: document fk_document_to_sip; Type: FK CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.document
    ADD CONSTRAINT fk_document_to_sip FOREIGN KEY (id_sip) REFERENCES pgdorybackend.sip(id);


--
-- TOC entry 2773 (class 2606 OID 16422)
-- Name: document fk_document_to_lot_versement; Type: FK CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.document
    ADD CONSTRAINT fk_document_to_lot_versement FOREIGN KEY (id_lot_versement) REFERENCES pgdorybackend.lot_versement(id);
    
--
-- TOC entry 2773 (class 2606 OID 16422)
-- Name: lot_versement fk_lot_versement_to_statut_lot_versement; Type: FK CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.lot_versement
    ADD CONSTRAINT fk_lot_versement_to_statut_lot_versement FOREIGN KEY (code_statut_lot_versement) REFERENCES pgdorybackend.statut_lot_versement(code);
    
    
--
-- TOC entry 2773 (class 2606 OID 16422)
-- Name: log_document fk_log_document_to_document; Type: FK CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.log_document
    ADD CONSTRAINT fk_log_document_to_document FOREIGN KEY (id_document) REFERENCES pgdorybackend.document(id);

    
    
--
-- TOC entry 2773 (class 2606 OID 16422)
-- Name: historique_statut_document fk_historique_statut_document_to_document; Type: FK CONSTRAINT; Schema: pgdorybackend; Owner: pgdorybackend
--

ALTER TABLE ONLY pgdorybackend.historique_statut_document
    ADD CONSTRAINT fk_historique_statut_document_to_document FOREIGN KEY (id_document) REFERENCES pgdorybackend.document(id);   
 
--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA pgdorybackend; Type: ACL; Schema: -; Owner: pgdorybackend
--

GRANT ALL ON SCHEMA pgdorybackend TO postgres;


-- Completed on 2019-08-05 14:25:55

--
-- PostgreSQL database dump complete
--


--
-- 
-- STATUT_DOCUMENT
--
--
INSERT INTO pgdorybackend.statut_document(
	code, dt_maj, dt_creation)
	VALUES ('INIT_DEPOT', NOW(), NOW());
INSERT INTO pgdorybackend.statut_document(
	code, dt_maj, dt_creation)
	VALUES ('DEPOSE', NOW(), NOW());
INSERT INTO pgdorybackend.statut_document(
	code, dt_maj, dt_creation)
	VALUES ('SCELLE', NOW(), NOW());
INSERT INTO pgdorybackend.statut_document(
	code, dt_maj, dt_creation)
	VALUES ('HORODATE', NOW(), NOW());
INSERT INTO pgdorybackend.statut_document(
	code, dt_maj, dt_creation)
	VALUES ('CREATION_SIP', NOW(), NOW());
INSERT INTO pgdorybackend.statut_document(
	code, dt_maj, dt_creation)
	VALUES ('INTEGRE_SIP', NOW(), NOW());
INSERT INTO pgdorybackend.statut_document(
	code, dt_maj, dt_creation)
	VALUES ('ARCHIVE', NOW(), NOW());
INSERT INTO pgdorybackend.statut_document(
	code, dt_maj, dt_creation)
	VALUES ('ERREUR', NOW(), NOW());

--
-- 
-- STATUT_SIP
--
--
INSERT INTO pgdorybackend.statut_sip(
	code, dt_maj, dt_creation)
	VALUES ('CREE', NOW(), NOW());
INSERT INTO pgdorybackend.statut_sip(
	code, dt_maj, dt_creation)
	VALUES ('EN_COURS_VERSEMENT', NOW(), NOW());
INSERT INTO pgdorybackend.statut_sip(
	code, dt_maj, dt_creation)
	VALUES ('VERSE', NOW(), NOW());
INSERT INTO pgdorybackend.statut_sip(
	code, dt_maj, dt_creation)
	VALUES ('ERREUR_VERSEMENT', NOW(), NOW());

--
-- 
-- STATUT_LOT_VERSEMENT
--
--
INSERT INTO pgdorybackend.statut_lot_versement(
	code, dt_maj, dt_creation)
	VALUES ('INIT_DEPOT', NOW(), NOW());
INSERT INTO pgdorybackend.statut_lot_versement(
	code, dt_maj, dt_creation)
	VALUES ('DEPOSE', NOW(), NOW());
INSERT INTO pgdorybackend.statut_lot_versement(
	code, dt_maj, dt_creation)
	VALUES ('SCELLE', NOW(), NOW());
INSERT INTO pgdorybackend.statut_lot_versement(
	code, dt_maj, dt_creation)
	VALUES ('HORODATE', NOW(), NOW());
INSERT INTO pgdorybackend.statut_lot_versement(
	code, dt_maj, dt_creation)
	VALUES ('CREATION_SIP', NOW(), NOW());
INSERT INTO pgdorybackend.statut_lot_versement(
	code, dt_maj, dt_creation)
	VALUES ('INTEGRE_SIP', NOW(), NOW());
INSERT INTO pgdorybackend.statut_lot_versement(
	code, dt_maj, dt_creation)
	VALUES ('ARCHIVE', NOW(), NOW());
INSERT INTO pgdorybackend.statut_lot_versement(
	code, dt_maj, dt_creation)
	VALUES ('ERREUR', NOW(), NOW());
