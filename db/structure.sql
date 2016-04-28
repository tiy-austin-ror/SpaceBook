--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: amenities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE amenities (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying
);


--
-- Name: amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE amenities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: amenities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE amenities_id_seq OWNED BY amenities.id;


--
-- Name: campus_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE campus_users (
    id integer NOT NULL,
    user_id integer,
    campus_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: campus_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campus_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: campus_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE campus_users_id_seq OWNED BY campus_users.id;


--
-- Name: campuses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE campuses (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    city character varying,
    state character varying,
    zip character varying,
    name character varying,
    company_id integer,
    profile_image_id character varying
);


--
-- Name: campuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: campuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE campuses_id_seq OWNED BY campuses.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    user_id integer,
    event_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    body text NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE companies (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    profile_image_id character varying
);


--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE companies_id_seq OWNED BY companies.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    room_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    name character varying,
    start_time timestamp without time zone,
    duration integer,
    agenda text,
    description text,
    private boolean,
    open_invite boolean DEFAULT true,
    allow_remote boolean DEFAULT false
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: invite_codes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE invite_codes (
    id integer NOT NULL,
    campus_id integer,
    hash_code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: invite_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE invite_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invite_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE invite_codes_id_seq OWNED BY invite_codes.id;


--
-- Name: invites; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE invites (
    id integer NOT NULL,
    user_id integer,
    event_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status character varying DEFAULT 'Pending'::character varying NOT NULL
);


--
-- Name: invites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE invites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE invites_id_seq OWNED BY invites.id;


--
-- Name: refile_attachments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refile_attachments (
    id integer NOT NULL,
    namespace character varying NOT NULL
);


--
-- Name: refile_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refile_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refile_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refile_attachments_id_seq OWNED BY refile_attachments.id;


--
-- Name: room_amenities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE room_amenities (
    id integer NOT NULL,
    room_id integer,
    amenity_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: room_amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE room_amenities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: room_amenities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE room_amenities_id_seq OWNED BY room_amenities.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rooms (
    id integer NOT NULL,
    campus_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    location character varying,
    capacity integer,
    events_count integer,
    average_event_duration integer,
    average_attendance_count integer,
    average_capacity_use integer,
    profile_image_id character varying
);


--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rooms_id_seq OWNED BY rooms.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    username character varying NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    phone_num character varying NOT NULL,
    encrypted_password character varying(128),
    confirmation_token character varying(128),
    remember_token character varying(128),
    admin boolean DEFAULT false,
    company_id integer,
    profile_image_id character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY amenities ALTER COLUMN id SET DEFAULT nextval('amenities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY campus_users ALTER COLUMN id SET DEFAULT nextval('campus_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY campuses ALTER COLUMN id SET DEFAULT nextval('campuses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY companies ALTER COLUMN id SET DEFAULT nextval('companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY invite_codes ALTER COLUMN id SET DEFAULT nextval('invite_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY invites ALTER COLUMN id SET DEFAULT nextval('invites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refile_attachments ALTER COLUMN id SET DEFAULT nextval('refile_attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY room_amenities ALTER COLUMN id SET DEFAULT nextval('room_amenities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rooms ALTER COLUMN id SET DEFAULT nextval('rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY amenities
    ADD CONSTRAINT amenities_pkey PRIMARY KEY (id);


--
-- Name: campus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY campus_users
    ADD CONSTRAINT campus_users_pkey PRIMARY KEY (id);


--
-- Name: campuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY campuses
    ADD CONSTRAINT campuses_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: invite_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY invite_codes
    ADD CONSTRAINT invite_codes_pkey PRIMARY KEY (id);


--
-- Name: invites_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY invites
    ADD CONSTRAINT invites_pkey PRIMARY KEY (id);


--
-- Name: refile_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refile_attachments
    ADD CONSTRAINT refile_attachments_pkey PRIMARY KEY (id);


--
-- Name: room_amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY room_amenities
    ADD CONSTRAINT room_amenities_pkey PRIMARY KEY (id);


--
-- Name: rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_campus_users_on_campus_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campus_users_on_campus_id ON campus_users USING btree (campus_id);


--
-- Name: index_campus_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campus_users_on_user_id ON campus_users USING btree (user_id);


--
-- Name: index_campuses_on_company_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campuses_on_company_id ON campuses USING btree (company_id);


--
-- Name: index_comments_on_event_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comments_on_event_id ON comments USING btree (event_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_events_on_room_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_events_on_room_id ON events USING btree (room_id);


--
-- Name: index_events_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_events_on_user_id ON events USING btree (user_id);


--
-- Name: index_invite_codes_on_campus_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_invite_codes_on_campus_id ON invite_codes USING btree (campus_id);


--
-- Name: index_invites_on_event_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_invites_on_event_id ON invites USING btree (event_id);


--
-- Name: index_invites_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_invites_on_user_id ON invites USING btree (user_id);


--
-- Name: index_refile_attachments_on_namespace; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refile_attachments_on_namespace ON refile_attachments USING btree (namespace);


--
-- Name: index_room_amenities_on_amenity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_room_amenities_on_amenity_id ON room_amenities USING btree (amenity_id);


--
-- Name: index_room_amenities_on_room_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_room_amenities_on_room_id ON room_amenities USING btree (room_id);


--
-- Name: index_rooms_on_campus_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rooms_on_campus_id ON rooms USING btree (campus_id);


--
-- Name: index_users_on_company_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_company_id ON users USING btree (company_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_remember_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_remember_token ON users USING btree (remember_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_0cb5590091; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fk_rails_0cb5590091 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_1f20526185; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY campus_users
    ADD CONSTRAINT fk_rails_1f20526185 FOREIGN KEY (campus_id) REFERENCES campuses(id);


--
-- Name: fk_rails_30732c6b62; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY invites
    ADD CONSTRAINT fk_rails_30732c6b62 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fk_rails_521633530b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY room_amenities
    ADD CONSTRAINT fk_rails_521633530b FOREIGN KEY (amenity_id) REFERENCES amenities(id);


--
-- Name: fk_rails_6d1ea08515; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY campuses
    ADD CONSTRAINT fk_rails_6d1ea08515 FOREIGN KEY (company_id) REFERENCES companies(id);


--
-- Name: fk_rails_7682a3bdfe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_7682a3bdfe FOREIGN KEY (company_id) REFERENCES companies(id);


--
-- Name: fk_rails_7e6e0059a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY room_amenities
    ADD CONSTRAINT fk_rails_7e6e0059a4 FOREIGN KEY (room_id) REFERENCES rooms(id);


--
-- Name: fk_rails_991d7d7231; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT fk_rails_991d7d7231 FOREIGN KEY (campus_id) REFERENCES campuses(id);


--
-- Name: fk_rails_c6b77e33aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_c6b77e33aa FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fk_rails_c7669a9711; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fk_rails_c7669a9711 FOREIGN KEY (room_id) REFERENCES rooms(id);


--
-- Name: fk_rails_c93c0f2684; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY invite_codes
    ADD CONSTRAINT fk_rails_c93c0f2684 FOREIGN KEY (campus_id) REFERENCES campuses(id);


--
-- Name: fk_rails_ce24072b03; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY campus_users
    ADD CONSTRAINT fk_rails_ce24072b03 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_ff69dbb2ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY invites
    ADD CONSTRAINT fk_rails_ff69dbb2ac FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20160421204842');

INSERT INTO schema_migrations (version) VALUES ('20160421204938');

INSERT INTO schema_migrations (version) VALUES ('20160421205100');

INSERT INTO schema_migrations (version) VALUES ('20160421205101');

INSERT INTO schema_migrations (version) VALUES ('20160421205419');

INSERT INTO schema_migrations (version) VALUES ('20160421205425');

INSERT INTO schema_migrations (version) VALUES ('20160421205431');

INSERT INTO schema_migrations (version) VALUES ('20160421205504');

INSERT INTO schema_migrations (version) VALUES ('20160421205547');

INSERT INTO schema_migrations (version) VALUES ('20160421212033');

INSERT INTO schema_migrations (version) VALUES ('20160421212850');

INSERT INTO schema_migrations (version) VALUES ('20160421214238');

INSERT INTO schema_migrations (version) VALUES ('20160421215047');

INSERT INTO schema_migrations (version) VALUES ('20160421221734');

INSERT INTO schema_migrations (version) VALUES ('20160421222959');

INSERT INTO schema_migrations (version) VALUES ('20160421224140');

INSERT INTO schema_migrations (version) VALUES ('20160421224235');

INSERT INTO schema_migrations (version) VALUES ('20160421224241');

INSERT INTO schema_migrations (version) VALUES ('20160421235835');

INSERT INTO schema_migrations (version) VALUES ('20160422010757');

INSERT INTO schema_migrations (version) VALUES ('20160422010843');

INSERT INTO schema_migrations (version) VALUES ('20160423201902');

INSERT INTO schema_migrations (version) VALUES ('20160423202316');

INSERT INTO schema_migrations (version) VALUES ('20160424165005');

INSERT INTO schema_migrations (version) VALUES ('20160426033131');

INSERT INTO schema_migrations (version) VALUES ('20160426172525');

INSERT INTO schema_migrations (version) VALUES ('20160426174031');

INSERT INTO schema_migrations (version) VALUES ('20160427160905');

INSERT INTO schema_migrations (version) VALUES ('20160427162152');

INSERT INTO schema_migrations (version) VALUES ('20160427172233');

INSERT INTO schema_migrations (version) VALUES ('20160427172251');

INSERT INTO schema_migrations (version) VALUES ('20160427172258');

INSERT INTO schema_migrations (version) VALUES ('20160427201226');

