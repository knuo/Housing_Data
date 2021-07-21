 \*Exploratory Data Analysis\*

select *
from PortfolioProject.dbo.NashvilleHousing

--Query to find types of land use with Count

select distinct(landuse)
from PortfolioProject.dbo.NashvilleHousing

select landuse,count(landuse) as count_of_landuse
from PortfolioProject.dbo.NashvilleHousing
group by landuse
order by count_of_landuse desc

--Query to calculate Saleprice by type of landuse

select landuse,round(avg(SalePrice),2) as saleprice
from PortfolioProject.dbo.NashvilleHousing
group by landuse
order by saleprice desc


--Query to find out how many properties were sold vacantly and not vacantly
select soldasvacant,count(soldasvacant) as count_of_vacant
from PortfolioProject.dbo.NashvilleHousing
group by soldasvacant
order by count(soldasvacant) 


--Query to find avg_acreage,avg_landvalue,avg_buildingvalue for landuse
select landuse,
	   round(avg(acreage),2) as avg_acreage,
	   round(avg(landvalue),2) as avg_landvalue,
	   round(avg(buildingvalue),2) as avg_buildingvalue
from 
	PortfolioProject.dbo.NashvilleHousing
where
	 not landuse='RESIDENTIAL CONDO' and
	 not landuse='CONDOMINIUM OFC  OR OTHER COM CONDO' and
	 not landuse='CONDO' and
	 not landuse='SMALL SERVICE SHOP' and
	 not landuse='RESTURANT/CAFETERIA' and 
	 not landuse='NIGHTCLUB/LOUNGE' and
	 buildingvalue>0
group by
	landuse
order by
	avg_acreage desc

select * 
from 
	PortfolioProject.dbo.NashvilleHousing
where
	landuse = 'NIGHTCLUB/LOUNGE'

select top(500)
	landuse,
	count(landuse) as num_of_lands,
	yearbuilt,
	year(cast(saledateconverted as date)) as saleyear,
	propertySplitcity
from 
	PortfolioProject.dbo.NashvilleHousing
where
	yearbuilt is not null --and 
	--landuse ='CHURCH'
group by
	landuse,
	yearbuilt,
	year(cast(saledateconverted as date)),
	propertySplitcity
order by
	2 desc,
	yearbuilt,
	year(cast(saledateconverted as date))


--Query to find average bedrooms and fullbath 
select
	landuse,
	cast(avg(bedrooms) as int) as bed_rooms,
	cast(avg(FullBath) as int) as fullbath
	--cast(avg(HalfBath) as int) as bed_rooms
from 
	PortfolioProject.dbo.NashvilleHousing
where
	yearbuilt is not null
group by 
	landuse
order by
	2 desc,
	3 desc
