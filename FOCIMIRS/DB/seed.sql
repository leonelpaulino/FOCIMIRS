USE [FOCIMIRS]
GO

INSERT INTO [dbo].[amb_usuarios]
           ([usuario_id]
           ,[Pass]
           ,[nombre]
           ,[rol_id]
           ,[COD_PERIODO]
           ,[COD_REGION]
           ,[COD_PROVINCIA])
     VALUES
           ('marialeon'
           ,CONVERT(varbinary(128),'123456789')
           ,'Maria De Leon'
           ,3
           ,'2005'
           ,'01'
           ,'01'),
		   ('annynovas'
           ,CONVERT(varbinary(128),'123456789')
           ,'Anny Novas'
           ,3
           ,'2005'
           ,'01'
           ,'01'),
		   ('anamarte'
           ,CONVERT(varbinary(128),'123456789')
           ,'Ana Karen Marte'
           ,3
           ,'2005'
           ,'01'
           ,'01'),
		   ('Samana0404'
           ,CONVERT(varbinary(128),'123456789')
           ,'Samaná'
           , 2
           ,'2005'
           ,'04'
           ,'04')
GO


