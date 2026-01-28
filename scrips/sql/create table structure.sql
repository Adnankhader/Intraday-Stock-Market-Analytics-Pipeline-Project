-- Creating Table Structures and Indexes

-- Creating Metadata Table

CREATE TABLE stock_metadata (
    symbol NVARCHAR(20) NOT NULL PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    sector NVARCHAR(50) NOT NULL,
    market_cap BIGINT NULL,
    shares_outstanding BIGINT NULL,
    ingestion_time DATETIME2 NOT NULL
);

-- Creating intraday_market_data

CREATE TABLE intraday_market_data (
    [datetime] DATETIME2 NOT NULL,
    symbol NVARCHAR(20) NOT NULL,
    [open] DECIMAL(12,4) NULL,
    high DECIMAL(12,4) NULL,
    low DECIMAL(12,4) NULL,
    [close] DECIMAL(12,4) NULL,
    volume BIGINT NULL,

    CONSTRAINT pk_intraday_market_data
        PRIMARY KEY ([datetime], symbol),

    CONSTRAINT fk_intraday_symbol
        FOREIGN KEY (symbol)
        REFERENCES stock_metadata(symbol)
);

-- Creating Index for both tables

CREATE INDEX idx_intraday_symbol
ON intraday_market_data (symbol);


CREATE INDEX idx_intraday_datetime
ON intraday_market_data ([datetime]);

