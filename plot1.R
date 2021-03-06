emissions.df <- readRDS('summarySCC_PM25.rds')
scc.df <- readRDS('Source_Classification_Code.rds')
emission.totals.by.year <- aggregate(Emissions ~ year, data = emissions.df, FUN = sum)
png(filename='plot1.png', width=480, height=480, units='px')

# Print numeric values in fixed notation
options(scipen=10)

with(emission.totals.by.year, {
  plot(year, Emissions, type = 'b',  
       xlab="Year",
       ylab='PM2.5 Emissions (tons)',
       main='Total PM2.5 Emissions in U.S.A.')
})

# Close png device
dev.off()