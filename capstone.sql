-- setup.sql


CREATE TABLE market_raw (
    trade_date DATE NOT NULL,
    ticker VARCHAR(20) NOT NULL,
    open NUMERIC,
    high NUMERIC,
    low NUMERIC,
    close NUMERIC,
    adj_close NUMERIC,
    volume BIGINT,
    PRIMARY KEY (trade_date, ticker)
);

CREATE TABLE daily_features (
    trade_date DATE PRIMARY KEY,
    spy_close NUMERIC,
    spy_ret_1d NUMERIC,
    spy_vol_60d NUMERIC,
    vix_level NUMERIC,
    fxi_ret_1d NUMERIC,
    oil_ret_1d NUMERIC,
    corr_spy_vs_fxi_60d NUMERIC
);

CREATE TABLE macro_observations (
    observation_date DATE NOT NULL,
    series_id VARCHAR(50) NOT NULL,
    series_name VARCHAR(100),
    cover_date DATE,
    report_date DATE,
    value NUMERIC,
    PRIMARY KEY (observation_date, series_id)
);

CREATE TABLE fomc_minutes (
    meeting_date DATE PRIMARY KEY,
    minutes_url TEXT,
    doc_hash VARCHAR(255),
    hawkish_score NUMERIC,
    text_chars INT
);


SELECT * FROM market_raw
ORDER BY trade_date, ticker
LIMIT 10;

SELECT * FROM daily_features
ORDER BY trade_date
LIMIT 10;

SELECT * FROM macro_observations
ORDER BY observation_date, series_id
LIMIT 10;

SELECT * FROM fomc_minutes
ORDER BY meeting_date
LIMIT 10;