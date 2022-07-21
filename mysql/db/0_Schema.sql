DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL,
    popularity_v  INTEGER    AS (-popularity)     NOT NULL
);

CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    popularity_v  INTEGER    AS (-popularity)     NOT NULL ,
    stock       INTEGER         NOT NULL
);

create index chair1 ON isuumo.chair(stock, price, id);
create index chair2 ON isuumo.chair(price, stock);
create index chair3 ON isuumo.chair(price, id);
create index chair4 ON isuumo.chair(popularity_v, id);
create index chair5 ON isuumo.chair(color, stock);
create index chair6 ON isuumo.chair(width, stock);
create index chair7 ON isuumo.chair(height, stock);
create index chair8 ON isuumo.chair(kind, stock);
create index estate1 ON isuumo.estate(rent, id);
create index estate2 ON isuumo.estate(rent);
create index estate3 ON isuumo.estate (popularity_v, id);
create index estate4 ON isuumo.estate(latitude, longitude);
create index estate5 ON isuumo.estate(door_height);
create index estate6 ON isuumo.estate(door_width);
create index estate7 ON isuumo.estate(door_height, rent);



