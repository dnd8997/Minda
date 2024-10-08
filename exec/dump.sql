PGDMP                      |            ssafyb205devdb    16.2 (Debian 16.2-1.pgdg120+2)    16.2 )    M           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            N           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            O           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            P           1262    16389    ssafyb205devdb    DATABASE     y   CREATE DATABASE ssafyb205devdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE ssafyb205devdb;
                ssafyb205dev    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            Q           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    37622    advice    TABLE     �  CREATE TABLE public.advice (
    end_date date,
    is_deleted integer NOT NULL,
    start_date date,
    advice_index bigint NOT NULL,
    member_index bigint,
    mod_date timestamp(6) without time zone,
    reg_date timestamp(6) without time zone NOT NULL,
    advice_comment text,
    advice_content text,
    image_link character varying(255),
    CONSTRAINT advice_is_deleted_check CHECK ((is_deleted = ANY (ARRAY[0, 1])))
);
    DROP TABLE public.advice;
       public         heap    ssafyb205dev    false    4            �            1259    37621    advice_advice_index_seq    SEQUENCE     �   CREATE SEQUENCE public.advice_advice_index_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.advice_advice_index_seq;
       public          ssafyb205dev    false    217    4            R           0    0    advice_advice_index_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.advice_advice_index_seq OWNED BY public.advice.advice_index;
          public          ssafyb205dev    false    216            �            1259    37632    diary    TABLE     7  CREATE TABLE public.diary (
    diary_anger double precision,
    diary_fear double precision,
    diary_happiness double precision,
    diary_sadness double precision,
    diary_set_date date,
    diary_surprise double precision,
    is_deleted integer NOT NULL,
    diary_index bigint NOT NULL,
    member_index bigint,
    mod_date timestamp(6) without time zone,
    reg_date timestamp(6) without time zone NOT NULL,
    diary_content text,
    diary_title character varying(255),
    CONSTRAINT diary_is_deleted_check CHECK ((is_deleted = ANY (ARRAY[0, 1])))
);
    DROP TABLE public.diary;
       public         heap    ssafyb205dev    false    4            �            1259    37631    diary_diary_index_seq    SEQUENCE     ~   CREATE SEQUENCE public.diary_diary_index_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.diary_diary_index_seq;
       public          ssafyb205dev    false    219    4            S           0    0    diary_diary_index_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.diary_diary_index_seq OWNED BY public.diary.diary_index;
          public          ssafyb205dev    false    218            �            1259    37488    diary_image    TABLE     f   CREATE TABLE public.diary_image (
    diary_index bigint NOT NULL,
    image_index bigint NOT NULL
);
    DROP TABLE public.diary_image;
       public         heap    ssafyb205dev    false    4            �            1259    37642    firebase_member_token    TABLE     6  CREATE TABLE public.firebase_member_token (
    firebase_token_index bigint NOT NULL,
    member_index bigint NOT NULL,
    mod_date timestamp(6) without time zone,
    reg_date timestamp(6) without time zone NOT NULL,
    fire_base_token character varying(512) NOT NULL,
    fire_base_platform character varying(255) NOT NULL,
    CONSTRAINT firebase_member_token_fire_base_platform_check CHECK (((fire_base_platform)::text = ANY ((ARRAY['ANDROID'::character varying, 'IOS'::character varying, 'WEB'::character varying, 'UNKNOWN'::character varying])::text[])))
);
 )   DROP TABLE public.firebase_member_token;
       public         heap    ssafyb205dev    false    4            �            1259    37641 .   firebase_member_token_firebase_token_index_seq    SEQUENCE     �   CREATE SEQUENCE public.firebase_member_token_firebase_token_index_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.firebase_member_token_firebase_token_index_seq;
       public          ssafyb205dev    false    4    221            T           0    0 .   firebase_member_token_firebase_token_index_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.firebase_member_token_firebase_token_index_seq OWNED BY public.firebase_member_token.firebase_token_index;
          public          ssafyb205dev    false    220            �            1259    37654    image    TABLE     �   CREATE TABLE public.image (
    diary_index bigint,
    image_index bigint NOT NULL,
    image_link character varying(255),
    image_name character varying(255)
);
    DROP TABLE public.image;
       public         heap    ssafyb205dev    false    4            �            1259    37653    image_image_index_seq    SEQUENCE     ~   CREATE SEQUENCE public.image_image_index_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.image_image_index_seq;
       public          ssafyb205dev    false    4    223            U           0    0    image_image_index_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.image_image_index_seq OWNED BY public.image.image_index;
          public          ssafyb205dev    false    222            �            1259    37663    member    TABLE     s  CREATE TABLE public.member (
    is_deleted integer NOT NULL,
    member_platform smallint NOT NULL,
    member_index bigint NOT NULL,
    mod_date timestamp(6) without time zone,
    reg_date timestamp(6) without time zone NOT NULL,
    member_email character varying(255) NOT NULL,
    member_id character varying(255) NOT NULL,
    member_nickname character varying(255),
    member_password character varying(255),
    member_profile_image character varying(255),
    member_role character varying(255) NOT NULL,
    CONSTRAINT member_is_deleted_check CHECK ((is_deleted = ANY (ARRAY[0, 1]))),
    CONSTRAINT member_member_platform_check CHECK (((member_platform >= 0) AND (member_platform <= 3))),
    CONSTRAINT member_member_role_check CHECK (((member_role)::text = ANY ((ARRAY['USER'::character varying, 'ADMIN'::character varying, 'GUEST'::character varying])::text[])))
);
    DROP TABLE public.member;
       public         heap    ssafyb205dev    false    4            �            1259    37662    member_member_index_seq    SEQUENCE     �   CREATE SEQUENCE public.member_member_index_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.member_member_index_seq;
       public          ssafyb205dev    false    4    225            V           0    0    member_member_index_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.member_member_index_seq OWNED BY public.member.member_index;
          public          ssafyb205dev    false    224            �           2604    37625    advice advice_index    DEFAULT     z   ALTER TABLE ONLY public.advice ALTER COLUMN advice_index SET DEFAULT nextval('public.advice_advice_index_seq'::regclass);
 B   ALTER TABLE public.advice ALTER COLUMN advice_index DROP DEFAULT;
       public          ssafyb205dev    false    217    216    217            �           2604    37635    diary diary_index    DEFAULT     v   ALTER TABLE ONLY public.diary ALTER COLUMN diary_index SET DEFAULT nextval('public.diary_diary_index_seq'::regclass);
 @   ALTER TABLE public.diary ALTER COLUMN diary_index DROP DEFAULT;
       public          ssafyb205dev    false    218    219    219            �           2604    37645 *   firebase_member_token firebase_token_index    DEFAULT     �   ALTER TABLE ONLY public.firebase_member_token ALTER COLUMN firebase_token_index SET DEFAULT nextval('public.firebase_member_token_firebase_token_index_seq'::regclass);
 Y   ALTER TABLE public.firebase_member_token ALTER COLUMN firebase_token_index DROP DEFAULT;
       public          ssafyb205dev    false    221    220    221            �           2604    37657    image image_index    DEFAULT     v   ALTER TABLE ONLY public.image ALTER COLUMN image_index SET DEFAULT nextval('public.image_image_index_seq'::regclass);
 @   ALTER TABLE public.image ALTER COLUMN image_index DROP DEFAULT;
       public          ssafyb205dev    false    222    223    223            �           2604    37666    member member_index    DEFAULT     z   ALTER TABLE ONLY public.member ALTER COLUMN member_index SET DEFAULT nextval('public.member_member_index_seq'::regclass);
 B   ALTER TABLE public.member ALTER COLUMN member_index DROP DEFAULT;
       public          ssafyb205dev    false    225    224    225            �           2606    37630    advice advice_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.advice
    ADD CONSTRAINT advice_pkey PRIMARY KEY (advice_index);
 <   ALTER TABLE ONLY public.advice DROP CONSTRAINT advice_pkey;
       public            ssafyb205dev    false    217            �           2606    37640    diary diary_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.diary
    ADD CONSTRAINT diary_pkey PRIMARY KEY (diary_index);
 :   ALTER TABLE ONLY public.diary DROP CONSTRAINT diary_pkey;
       public            ssafyb205dev    false    219            �           2606    37652 ?   firebase_member_token firebase_member_token_fire_base_token_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.firebase_member_token
    ADD CONSTRAINT firebase_member_token_fire_base_token_key UNIQUE (fire_base_token);
 i   ALTER TABLE ONLY public.firebase_member_token DROP CONSTRAINT firebase_member_token_fire_base_token_key;
       public            ssafyb205dev    false    221            �           2606    37650 0   firebase_member_token firebase_member_token_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.firebase_member_token
    ADD CONSTRAINT firebase_member_token_pkey PRIMARY KEY (firebase_token_index);
 Z   ALTER TABLE ONLY public.firebase_member_token DROP CONSTRAINT firebase_member_token_pkey;
       public            ssafyb205dev    false    221            �           2606    37661    image image_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (image_index);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            ssafyb205dev    false    223            �           2606    37673    member member_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (member_index);
 <   ALTER TABLE ONLY public.member DROP CONSTRAINT member_pkey;
       public            ssafyb205dev    false    225            �           2606    37492 (   diary_image uk_5s3p1vy5s6bkv3cbuinrg3tvb 
   CONSTRAINT     j   ALTER TABLE ONLY public.diary_image
    ADD CONSTRAINT uk_5s3p1vy5s6bkv3cbuinrg3tvb UNIQUE (image_index);
 R   ALTER TABLE ONLY public.diary_image DROP CONSTRAINT uk_5s3p1vy5s6bkv3cbuinrg3tvb;
       public            ssafyb205dev    false    215            �           2606    37675    member uniqueidandplatform 
   CONSTRAINT     k   ALTER TABLE ONLY public.member
    ADD CONSTRAINT uniqueidandplatform UNIQUE (member_id, member_platform);
 D   ALTER TABLE ONLY public.member DROP CONSTRAINT uniqueidandplatform;
       public            ssafyb205dev    false    225    225            �           1259    37677    idx4rw879c4q7wrgi3v64cy73b17    INDEX     T   CREATE INDEX idx4rw879c4q7wrgi3v64cy73b17 ON public.member USING btree (member_id);
 0   DROP INDEX public.idx4rw879c4q7wrgi3v64cy73b17;
       public            ssafyb205dev    false    225            �           1259    37676    token_index_idx_member_index    INDEX     f   CREATE INDEX token_index_idx_member_index ON public.firebase_member_token USING btree (member_index);
 0   DROP INDEX public.token_index_idx_member_index;
       public            ssafyb205dev    false    221            �           2606    37688 1   firebase_member_token fkgdul1wkv0b3jd9yi5ddxlhft3    FK CONSTRAINT     �   ALTER TABLE ONLY public.firebase_member_token
    ADD CONSTRAINT fkgdul1wkv0b3jd9yi5ddxlhft3 FOREIGN KEY (member_index) REFERENCES public.member(member_index);
 [   ALTER TABLE ONLY public.firebase_member_token DROP CONSTRAINT fkgdul1wkv0b3jd9yi5ddxlhft3;
       public          ssafyb205dev    false    225    221    3253            �           2606    37683 !   diary fkgo7rle3u4r5qwstt7qc7wi3nm    FK CONSTRAINT     �   ALTER TABLE ONLY public.diary
    ADD CONSTRAINT fkgo7rle3u4r5qwstt7qc7wi3nm FOREIGN KEY (member_index) REFERENCES public.member(member_index);
 K   ALTER TABLE ONLY public.diary DROP CONSTRAINT fkgo7rle3u4r5qwstt7qc7wi3nm;
       public          ssafyb205dev    false    3253    225    219            �           2606    37693 !   image fkkmlih1t24erosn3uthm8jn403    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkkmlih1t24erosn3uthm8jn403 FOREIGN KEY (diary_index) REFERENCES public.diary(diary_index);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkkmlih1t24erosn3uthm8jn403;
       public          ssafyb205dev    false    223    3243    219            �           2606    37678 "   advice fkqt8b1po9d08vuuchv3k8l6v3l    FK CONSTRAINT     �   ALTER TABLE ONLY public.advice
    ADD CONSTRAINT fkqt8b1po9d08vuuchv3k8l6v3l FOREIGN KEY (member_index) REFERENCES public.member(member_index);
 L   ALTER TABLE ONLY public.advice DROP CONSTRAINT fkqt8b1po9d08vuuchv3k8l6v3l;
       public          ssafyb205dev    false    217    3253    225           