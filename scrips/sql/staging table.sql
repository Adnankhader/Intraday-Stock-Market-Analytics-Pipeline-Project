CREATE TABLE staging_intraday_market_data (
    [datetime] DATETIME2 NOT NULL,
    symbol NVARCHAR(20) NOT NULL,
    [open] DECIMAL(12,4) NULL,
    high DECIMAL(12,4) NULL,
    low DECIMAL(12,4) NULL,
    [close] DECIMAL(12,4) NULL,
    volume BIGINT NULL
);


CREATE TABLE staging_stock_metadata (
    symbol NVARCHAR(20) NOT NULL,
    name NVARCHAR(100) NOT NULL,
    sector NVARCHAR(50) NOT NULL,
    market_cap BIGINT NULL,
    shares_outstanding BIGINT NULL,
    ingestion_time DATETIME2 NOT NULL
);
