emissions.df <- readRDS('summarySCC_PM25.rds')
scc.df <- readRDS('Source_Classification_Code.rds')
baltimore.emissions.df = emissions.df[emissions.df$fips == '24510', ]
baltimore.emission.totals.by.year <- aggregate(Emissions ~ year, data = baltimore.emissions.df, FUN = sum)
png(filename='plot2.png', width=480, height=480, units='px')
options(scipen=10)
with(baltimore.emission.totals.by.year, {
  plot(year, Emissions, type = 'b',
       xlab="Year",
       ylab='PM2.5 Emissions (tons)',
       main='Total PM2.5 Emissions in Baltimore City')
})
dev.off()