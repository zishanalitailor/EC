ALTER PROCEDURE [dbo].[Sp_GetUserList]
(
	@currentIndex int,
	@pageSize int,
	@orderByClause varchar(100),
	@search varchar(max),
	@totalRecords int OUTPUT
)
AS
BEGIN
    DECLARE @Start int = (@currentIndex)*@pageSize;
    DECLARE @End int = @Start+@pageSize;
	DECLARE @SQL varchar(max)
    SET NOCOUNT ON;
	
    DECLARE @tblUserList AS TABLE
        ([UserId]               [int] ,
		[RoleId]               [int] ,
		[UserName]             [varchar](50) , 
		[Password]             [varchar](50) , 
		[FirstName]            [varchar](50) ,
		[LastName]             [varchar](50) , 
		[EmailId]              [varchar](150), 
		[MobileNumber]         [varchar](20) , 
		[AlternateNumber]      [varchar](20) , 
		[RegistrationDate]     [datetime] , 
		[Status]               [bit],
		[RoleName]             [varchar](20),
		[RowNumber]			   [INT])

   SET  @SQL = 'SELECT u.UserId,u.RoleId,u.UserName,u.Password,u.FirstName,u.LastName,u.EmailId,u.MobileNumber,u.AlternateNumber,
		u.RegistrationDate,u.Status,r.RoleName,ROW_NUMBER() OVER (ORDER BY '+ @orderByClause +') AS RowNumber
		FROM dbo.Users u INNER JOIN dbo.Roles r ON r.RoleId = u.RoleId WHERE 1 = 1' + @search

    print @sql
	INSERT INTO @tblUserList
	exec (@sql)

	select  @totalRecords= COUNT(*) from @tblUserList
	print @totalRecords

	select * from @tblUserList where RowNumber > @Start and [RowNumber] <= @End order by [RowNumber] 

END