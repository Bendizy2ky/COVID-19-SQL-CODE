select *
from [PORTFOLIO PROJECT]..coviddeaths

insert into [PORTFOLIO PROJECT]..coviddeaths

values ('China','Asia','1416251616','503302','28567','10946987','5678','930057','56789','90543','54875','987')



select *
from [PORTFOLIO PROJECT]..covidrecovered
order by 1

--display of the data that i will be using

select Location, TotalCases, NewCases, TotalDeaths, NewDeaths, ActiveCases, population
from [PORTFOLIO PROJECT]..coviddeaths
order by 7 desc

--working on total cases vs total deaths

--select Location, TotalCases,TotalDeaths, (totaldeaths/totalcases)*100 as Death_percentage
--from [PORTFOLIO PROJECT]..coviddeaths
--where location like '%Nigeria%'
--order by 4

--shows likehood of dyig of covid in your country
select Location, TotalCases,TotalDeaths, (totaldeaths/totalcases)*100 as Death_percentage
from [PORTFOLIO PROJECT]..coviddeaths
order by 4

--looking at total cases vs the population

select Location, TotalCases,population, (totalcases/population)*100 as Percentage_of_Population_infected
from [PORTFOLIO PROJECT]..coviddeaths
order by 1 


--Countries with Highest Infection rate compared to Population

select Location, Population, max(TotalCases) as Highest_Infection_Count, max((totalcases/population))*100 as Percentage_of_Population_infected
from [PORTFOLIO PROJECT]..coviddeaths
group by Location, Population
order by Percentage_of_Population_infected desc


--Showing Countries With Highest Death Count per Population

select Location, max(TotalDeaths) as Total_Death_Count
from [PORTFOLIO PROJECT]..coviddeaths
group by Location
order by Total_Death_Count desc


--Showing Continents With Highest Death Count per Population

select Continent, max(TotalDeaths) as Total_Death_Count
from [PORTFOLIO PROJECT]..coviddeaths
group by Continent
order by Total_Death_Count desc

select Location, sum(TotalDeaths) as Total_Death_Count, SUM(population) as Population_Sum
from [PORTFOLIO PROJECT]..coviddeaths
group by Location
order by Total_Death_Count desc

--Showing Continents With Highest Death Count per Population vs Continent Population Sum

select Continent, max(TotalDeaths) as Total_Death_Count_Continent, SUM(population) as Population_Sum
from [PORTFOLIO PROJECT]..coviddeaths
group by Continent
order by Total_Death_Count_Continent desc

--Looking for Critical Cases vs Total cases

select Location, TotalCases, CriticalCases
from [PORTFOLIO PROJECT]..coviddeaths
order by 1,2,3


--Looking for Percentage of Critical Cases vs Total cases by location


select Location, TotalCases, CriticalCases, (CriticalCases/TotalCases)*100 as Percentage_of_Critical_Cases_location
from [PORTFOLIO PROJECT]..coviddeaths
where CriticalCases is not null
order by 1,2,3



select *
from [PORTFOLIO PROJECT]..coviddeaths

--This is showing the percentage of Persons tested positive per location

select Location, TotalTests,TotalCases,(TotalCases/TotalTests)*100 as Percentage_Of_Positive_test_per_Location
from [PORTFOLIO PROJECT]..coviddeaths
--group by Location
order by Percentage_Of_Positive_test_per_Location desc



--GLOBAL NUMBERS

--This Shows The Global Fifure for Total Cases And Total Deaths

select SUM(TotalCases) as Total_Cases, SUM(totaldeaths) as Total_Deaths
from [PORTFOLIO PROJECT]..coviddeaths
--group by Location
order by Total_Cases desc

--Code Below shows the Global Death Percentage
select SUM(TotalCases) as Total_Cases, SUM(totaldeaths) as Total_Deaths, sum(totaldeaths)/sum(totalcases)*100 as Global_Death_Percentage
from [PORTFOLIO PROJECT]..coviddeaths
--group by Location
order by Total_Cases desc


select * from [PORTFOLIO PROJECT]..CovidRecovered



--Loooking for total cases vs total recovered by location(country)

select dea.Location,dea.Population,dea.TotalCases, rec.TotalRecovered
from [PORTFOLIO PROJECT]..CovidRecovered rec
join [PORTFOLIO PROJECT]..CovidDeaths dea
on rec.Location = dea.Location
order by 4 desc


--Loooking for percentage of Persons recovered by Location (country)

select dea.Location,dea.Population,dea.TotalCases, rec.TotalRecovered, (TotalRecovered/TotalCases)*100 as Percentage_of_Recovered_by_Country
from [PORTFOLIO PROJECT]..CovidRecovered rec
join [PORTFOLIO PROJECT]..CovidDeaths dea
on rec.Location = dea.Location
order by 5 desc


--Code Below shows the Global Recovered Percentage

select sum(dea.Population) as Sum_Of_Population,sum(dea.TotalCases) as Sum_Of_TotalCases, sum(rec.TotalRecovered) as Sum_of_TotalRecovered, sum(TotalRecovered)/sum(TotalCases)*100 as Percentage_of_Global_Recovery
from [PORTFOLIO PROJECT]..CovidRecovered rec
join [PORTFOLIO PROJECT]..CovidDeaths dea
on rec.Location = dea.Location



--select *
--from [PORTFOLIO PROJECT]..CovidDeaths


--CREATING VIEW TO STORE DATA FOR FUTURE VISUALIZATIONS

create view Percentage_of_Recovered_by_Country as
select dea.Location,dea.Population,dea.TotalCases, rec.TotalRecovered, (TotalRecovered/TotalCases)*100 as Percentage_of_Recovered_by_Country
from [PORTFOLIO PROJECT]..CovidRecovered rec
join [PORTFOLIO PROJECT]..CovidDeaths dea
on rec.Location = dea.Location
--order by 5 desc


