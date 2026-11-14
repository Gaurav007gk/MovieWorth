package com.movieworth.api.ingestion;
import java.math.BigDecimal;import java.time.LocalDate;
/** Contract for a licensed/authorized box-office provider. Never scrape Sacnilk without written permission. */
public interface BoxOfficeFeedClient { java.util.List<FeedRecord> fetchDaily() throws Exception; record FeedRecord(long tmdbId,LocalDate date,BigDecimal indiaNetCr,BigDecimal indiaGrossCr,BigDecimal overseasCr,BigDecimal worldwideCr,String sourceUrl){} }
