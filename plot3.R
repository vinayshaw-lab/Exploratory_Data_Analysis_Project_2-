library(ggplot2)
emissions.df <- readRDS('summarySCC_PM25.rds')
scc.df <- readRDS('Source_Classification_Code.rds')
baltimore.emissions.df = emissions.df[emissions.df$fips == '24510', ]
baltimore.emission.totals.df <- aggregate(Emissions ~ type + year, baltimore.emissions.df, FUN = sum)
png(filename='plot3.png', width=1200, height=640, units='px')
options(scipen=10)
plot3 <- qplot(year, Emissions, data=baltimore.emission.totals.df, facets = . ~ type) +  
  geom_line() +
  xlab("Year") +
  ylab('PM2.5 Emissions (tons)') +
  ggtitle('Total PM2.5 Emissions in Baltimore City')

print(plot3)
dev.off()