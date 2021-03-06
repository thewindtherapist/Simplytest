#require_relative 'DBRefreshCore'


 class String
  { :reset          =>  0,
    :bold           =>  1,
    :dark           =>  2,
    :underline      =>  4,
    :blink          =>  5,
    :negative       =>  7,
    :black          => 30,
    :red            => 31,
    :green          => 32,
    :yellow         => 33,
    :blue           => 34,
    :magenta        => 35,
    :cyan           => 36,
    :white          => 37,
  }.each do |key, value|
		define_method key do
		  "\e[#{value}m" + self + "\e[0m"
		end
	end
	end

def getenv() 
configuration=Hash.new
configuration["server"]="FFX-CWS-TSTDB1"
configuration["databasename"]="Medigap"
# valid = false
   # until valid
   
	puts '  MEDIGAP MENU SELECTION
	1  Medigap_orgs
	2  Medigap_orgstate
	3  MEDIGAP_OOP
	4  Medigap_pms
	5  Medigap_plan_info
	6  Medigap_benefits
	7  Medigap_plan_type_basics
	8  Medigap_state
	9  Medigap_plan_type
	10 Medigap_prm_year
	11 Medigap_plan_cnty_xwalk
	12 Medigap_plan_state_xwalk
	13 Medigap_plan_zip_xwalk
	14 Medigap_simple_plantype_lkp
	0  Exit'
	puts
	print "Enter the number of the file to be tested or 0 to 14:".green.bold
	
	filenumber = gets.strip!
	case filenumber
		when "1" # medigap_orgs
			configuration["sql"]="SELECT [org_id]
				  ,[name]
				  ,[org_type]
				  ,[addrs1]
				  ,[addrs2]
				  ,[city]
				  ,[state_cd]
				  ,[zip]
				  ,[web_addr]
				  ,[last_id]
				  FROM [MEDIGAP_ORGS]
					where cast(org_id as varchar)='key'"
			keyarray=[0]
			configuration["keys"]=keyarray
			configuration["filename"]="../current/MEDIGAP_ORGS.txt"
			configuration["delimiter"]="\t"
			configuration["table"]="Medigap_ORGS"
			configuration["prior"]="../prior/MEDIGAP_ORGS.txt"
			configuration["titles"]=["org_id"]
			configuration["heading"]="\tOrd ID\tName \tOrg Type \tAddr1 \tAddr2 \tcity \tState \tZip"
			valid = true
			
		when "2" #medigap_orgstate
		configuration["sql"]="		SELECT  [org_id]
			,[split_state_code]
			,[phone]
			,[ext]
			,[src_of_data]
			FROM [MEDIGAP_ORGSTATE]
			where cast(org_id as varchar)='key' and cast(split_state_code as varchar)='key'"
			keyarray=[0,1]
			configuration["keys"]=[0,1]
			configuration["filename"]="../current/MEDIGAP_orgstate.txt"
			configuration["delimiter"]="\t"
			configuration["table"]="Medigap_ORGSstate"
			configuration["prior"]="../prior/MEDIGAP_orgstate.txt"
			configuration["titles"]=["org_id","split state code"]
			configuration["heading"]="\tOrd ID\tState Code \tPhone \tExt \tSrc of Data"
			valid = true
			
		when "3" #MEDIGAP_OOP
				configuration["sql"]="SELECT 
				[state_cd]
				,[simple_plan_type]
					,[cntrct_yr]
					,[hlth_ctgry]
					,[dbts]
					,[chf]
					,[ahc]
					,[dbts_drugs]
					,[chf_drugs]
					,[ahc_drugs]
					,[drugs]
					,[dental_services]
					,[medigap_prm]
					,[inpatient_care]    
					,[part_b_prm]
					,[plan_ddctbl]
					,[all_other_utilization]
					,[brkdwn_tot]
					FROM [Medigap].[dbo].[MEDIGAP_OOP]
					where cast(simple_plan_type as varchar)='key' and cast(state_cd as varchar)='key' and cast(cntrct_yr as varchar)='key' and cast(hlth_ctgry as varchar)='key'"
			keyarray=[1,0,2,3]
			configuration["keys"]=keyarray
			configuration["filename"]="../current/MEDIGAP_OOP.txt"
			configuration["delimiter"]="\t"
			configuration["table"]="Medigap_OOP"
			configuration["prior"]="../prior/MEDIGAP_OOP.txt"
			configuration["titles"]=["simple_plan_type","state_cd","ontrct year","health category"]
			configuration["titles"]
			valid = true

		when "4" #Medigap_pms
		configuration["sql"]="SELECT 
					[state_cd]
					,[plan_type]
					,[age_ctgry]   
					,[prm_rng]
					,[cntrct_yr]
					,[seq_id]
					,[lang_id]
					FROM [Medigap].[dbo].[MEDIGAP_PRMS]
					where cast(state_cd as varchar)='key' and cast(cntrct_yr as varchar)='key' and cast(lang_id as varchar)='key' and  cast(seq_id as varchar)='key'"
			keyarray=[0,4,6,5]
			configuration["keys"]=keyarray
			configuration["filename"]="../current/Medigap_prms.txt"
			configuration["delimiter"]="\t"
			configuration["table"]="Medigap_prms"
			configuration["prior"]="../prior/Medigap_prms.txt"
		when "5" #Medigap_plan_info
		configuration["sql"]="SELECT [plan_id]
					,[status]
					,[plan_type]
					,[org_id]
					,[abbrev]
					,[split_state_code]
					,cast(over65 as varchar) as over65
					,cast(under65 as varchar) as under65
					,cast(na_available as varchar) as na_available
					,cast(community as varchar) as community	
					,cast(issue as varchar) as issue					
					,cast(attained as varchar) as attained
					,cast(na_rating as varchar) as na_rating
					,cast(statewide as varchar) as statewide
					,[textcond]
					,[last_id]
					,last_mod
					,[sp_textcond]
					FROM [Medigap].[dbo].[MEDIGAP_PLAN_INFO]
					where cast(plan_id as varchar)='key'"
			keyarray=[0]
			configuration["keys"]=keyarray
			configuration["filename"]="../current/Medigap_plan_info.txt"
			configuration["delimiter"]="\t"
			configuration["table"]="Medigap_plan_info"
			configuration["prior"]="../prior/Medigap_plan_info.txt"
<<<<<<< HEAD
=======
			
>>>>>>> 73f7bac3950ce2db324c12cecd8439c33448a58d
		when "6" # Medigap_benefits'
		configuration["sql"]="SELECT [ctry_cd]
				,[cntrct_yr]
				,[lang_id]
				,[simple_plantype]
				,[sentence_text]
				FROM [Medigap].[dbo].[MEDIGAP_BENEFITS]
				where cast(ctry_cd as varchar)='key' and cast(cntrct_yr as varchar)='key' and cast(lang_id as varchar) ='key' and cast(simple_plantype as varchar)='key'"
			keyarray=[0,1,2,3]
			configuration["keys"]=keyarray
			configuration["filename"]="../current/Medigap_benefits.txt"
			configuration["delimiter"]="\t"
			configuration["table"]="Medigap_benefits"
			configuration["prior"]="../prior/Medigap_benefits.txt"
<<<<<<< HEAD
=======
			
>>>>>>> 73f7bac3950ce2db324c12cecd8439c33448a58d
		when "7" # Medigap_benefits'
		configuration["sql"]="SELECT 
				[group_id]
				,[plan_type]
				,[lang_id]
				,[description]
				FROM [Medigap].[dbo].[MEDIGAP_PLAN_TYPE_BASICS]
				where 
				cast(plan_type as varchar)='key' 
				and cast(group_id as varchar)='key' 
				and cast(lang_id as varchar)='key'"
			keyarray=[1,0,2]
			configuration["keys"]=keyarray
			configuration["filename"]="../current/Medigap_plan_type_basics.txt"
			configuration["delimiter"]="\t"
			configuration["table"]="Medigap_plan_type_basics"
<<<<<<< HEAD
			configuration["prior"]="../prior/Medigap_plan_type_basics.txt"
=======
				configuration["prior"]="../prior/Medigap_plan_type_basics.txt"
		
>>>>>>> 73f7bac3950ce2db324c12cecd8439c33448a58d
		when "8" # Medigap_state'
		configuration["sql"]="SELECT [split_state_code]
				,[group_id]
				,[abbrev]
				,[name]
				FROM [Medigap].[dbo].[MEDIGAP_STATE]
				where cast(split_state_code as varchar)='key'"
			keyarray=[0]
			configuration["keys"]=keyarray
			configuration["filename"]="../current/Medigap_state.txt"
			configuration["delimiter"]="\t"
			configuration["table"]="MEDIGAP_STATE"
<<<<<<< HEAD
			configuration["prior"]="../prior/Medigap_state.txt"
=======
				configuration["prior"]="../prior/Medigap_state.txt"
			
>>>>>>> 73f7bac3950ce2db324c12cecd8439c33448a58d
		when "9" # Medigap_plan_type'
		configuration["sql"]="SELECT [plan_type]
				,[description]
				,cast([base] as varchar) as base
				,[sp_dscription]
				FROM [Medigap].[dbo].[MEDIGAP_PLAN_TYPE]
				where cast(plan_type as varchar) = 'key'"
			keyarray=[0]
			configuration["keys"]=keyarray
			configuration["filename"]="../current/Medigap_plan_type.txt"
			configuration["delimiter"]="\t"
			configuration["table"]="MEDIGAP_PLAN_TYPE"
			configuration["prior"]="../prior/Medigap_plan_type.txt"
		when "10" # Medigap_prm_year'
				configuration["sql"]="SELECT [state_cd]
				,[prm_yr]
				FROM [Medigap].[dbo].[MEDIGAP_PRM_YR]
				where CAST(state_cd as varchar)='key'"
			keyarray=[0]
			configuration["keys"]=keyarray
			configuration["filename"]="../current/Medigap_prm_yr.txt"
			configuration["delimiter"]="\t"
			configuration["table"]="MEDIGAP_prm_yr"
			configuration["prior"]="../prior/Medigap_prm_yr.txt"
		when "11" # Medigap_plan_cnty_xwalk'
		configuration["sql"]="SELECT 
				[plan_id]
				,[county_fips_code]
				FROM [Medigap].[dbo].[MEDIGAP_PLAN_CNTY_XWALK]
				where cast(county_fips_code as varchar)='key' and cast(plan_id as varchar)='key'"
			keyarray=[1,0]
			configuration["keys"]=keyarray
			configuration["filename"]="../current/Medigap_plan_cnty_xwalk.txt"
			configuration["delimiter"]="\t"
			configuration["table"]="Medigap_plan_cnty_xwalk"
			configuration["prior"]="../prior/Medigap_plan_cnty_xwalk.txt"
		
			when "12" # Medigap_plan_state_xwalk'
				configuration["sql"]="SELECT [plan_id],[split_state_code]
					FROM [Medigap].[dbo].[MEDIGAP_PLAN_STATE_XWALK]
					where cast(plan_id as varchar)='key' and cast(split_state_code as varchar)='key'"
			keyarray=[0,1]
			configuration["keys"]=keyarray
			configuration["filename"]="../current/Medigap_plan_state_xwalk.txt"
			configuration["delimiter"]="\t"
			configuration["table"]="Medigap_plan_state_xwalk"
			configuration["prior"]="../prior/Medigap_plan_state_xwalk.txt"
<<<<<<< HEAD
=======
			
>>>>>>> 73f7bac3950ce2db324c12cecd8439c33448a58d
			when "13" # Medigap_plan_zip_xwalk'
				configuration["sql"]="SELECT [plan_id]
				,[zip]
				,[county_fips_code]
				FROM [Medigap].[dbo].[MEDIGAP_PLAN_ZIP_XWALK]
					where cast([county_fips_code] as varchar)='key' and cast([zip] as varchar)='key'
					and cast([plan_id] as varchar)='key'"
			keyarray=[2,1,0]
			configuration["keys"]=keyarray
			configuration["filename"]="../current/Medigap_plan_zip_xwalk.txt"
			configuration["delimiter"]="\t"
			configuration["table"]="Medigap_plan_zip_xwalk"
			configuration["prior"]="../prior/Medigap_plan_zip_xwalk.txt"
			when "14" # Medigap_plan_zip_xwalk'
				configuration["sql"]="SELECT [simple_plan_type]
						,[cntrct_yr]
						,[lang_id]
						,[simple_plantype_name]
						FROM [Medigap].[dbo].[MEDIGAP_SIMPLE_PLANTYPE_LKP]
						where cast(simple_plan_type as varchar)='key' and cast(cntrct_yr as varchar)='key' and cast(lang_id as varchar)='key'"
			keyarray=[0,1,2]
			configuration["keys"]=keyarray
			configuration["filename"]="../current/Medigap_simple_plantype_lkp.txt"
			configuration["delimiter"]="\t"
			configuration["table"]="Medigap_simple_plantype_lkp"
			configuration["prior"]="../prior/Medigap_simple_plantype_lkp.txt"
		else
		valid = true
		 configuration["sql"]=""
	  end
   # end #end until

	return configuration
   end