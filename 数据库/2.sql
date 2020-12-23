create index index1
on costTable(budgetDate);

create index index2
on materialCostDetail(invoice);

create index index3
on departTable(departName);

select invoice,oilWall,budgetAmount,budgetDate
from costTable,departTable
where departID = departmentID 
           and departName = 'oilOneSecond'
           and budgetDate between '2016-05-01' and '2016-05-28';

select *
from costTable
where settleDate between '2016-5-1' and '2016-5-28' 
      and departmentId in(
	      select departID
	      from departTable
		  where departName='oilOneSecond'
		  );


select *
from materialCostDetail
where invoice in 
        (select invoice
         from costTable
         where budgetDate between '2016-05-01' and '2016-05-28' and
         	   departmentId in(
	     		  select departID
	     		  from departTable
		 		  where departName='oilOneSecond')
		 );

select sum(budgetAmount)
from costTable
where budgetDate between '2016-05-01' and '2016-05-28' and
	  departmentId in
	    (select departID
		 from departTable
		 where departName='oilOneSecond');

select sum(allCost) as total
from costTable
where budgetDate between '2016-05-01' and '2016-05-28' and
	  departmentId in 
	  (select departID
		from departTable
		where departName='oilOneSecond'
	  );

select distinct recordPerson
from costTable;


select allCost
from costTable
where departmentId in
	  (select departID
	   from departTable
	   where departName = 'oilOneSecond'
	   )
order by allCost desc;


select departTable.departName,costTable.allCost
from departTable,costTable
where departTable.departID = costTable.departmentId;

select constructionUnit,sum(allcost)
from costTable
group by constructionUnit;

select invoice
from costTable
where constructionUnit = 'companySecond';

select invoice
from costTable
where constructionUnit = 'companyFirst'
union
select invoice
from costTable
where constructionUnit = 'companySecond';



select *
from materialCostDetail
where materialId in 
		(select materialId
		 from materiaTable
		 where materialName = 'third'
		)
	and consumeQuantity * 
	(
		select Price
		from materiaTable
		where materialName = 'third'
	) > 2000;

select distinct constructionUnit
from costTable
where departmentId in(
	      select departID
	      from departTable
		  where departName like 'oilOne%'
		  );


CREATE TABLE sumCostALL(
	Unit varchar(16),
	Date varchar(16),
	Cost decimal(10,2)
)


insert into sumCostALL
select constructionUnit,MONTH(settleDate),sum(allCost)
from costTable
group by constructionUnit,MONTH(settleDate)

update costTable
set settlePreson='DogJiaojiao'
where departmentId in(
	      select departID
	      from departTable
		  where departName like 'oilOne%'
		  );


delete 
from costTable
where departmentId in(
	      select departID
	      from departTable
		  where departName like 'oilOne%'
		  );
