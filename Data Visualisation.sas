PROC FORMAT;
    /* Age Group */
    VALUE AgeGroupFmt
        1 = 'Below 18'
        2 = '18 - 24'
        3 = '25 - 34'
        4 = '35 - 44'
        5 = '45 and above';

    /* Gender */
    VALUE GenderFmt
        1 = 'Male'
        2 = 'Female';

    /* Occupation */
    VALUE OccupationFmt
        1 = 'Student'
        2 = 'Working Adult'
        3 = 'Unemployed'
        4 = 'Retired';

    /* Income */
    VALUE IncomeFmt
        1 = 'RM 0'
        2 = '< RM 3,000'
        3 = 'RM 3,000 - RM 5,000'
        4 = 'RM 5,001 - RM 8,000'
        5 = 'RM 8,001 - RM 12,000'
        6 = '> RM 12,000';

    /* Health Consciousness */
    VALUE HealthConsciousFmt
        0 = 'No'
        1 = 'Yes';

    /* Beverage Preference (Natural vs. Artificial) */
    VALUE BeveragePrefFmt
        1 = 'Natural Ingredients'
        2 = 'Artificial Flavored'
        3 = 'Both';

    /* Importance of Natural Ingredients */
    VALUE NaturalIngredientFmt
        1 = 'Not important at all'
        2 = 'Not very important'
        3 = 'Neutral'
        4 = 'Somewhat important'
        5 = 'Very important';

    /* Brand Reputation Impact */
    VALUE ReputationImpactFmt
        1 = 'Not aware of negative info'
        2 = 'Considered alternatives'
        3 = 'Stopped buying immediately';

    /* Promotion Influence */
    VALUE PromoImpactFmt
        1 = 'Loyal (buy without promo)'
        2 = 'Buy less without promo'
        3 = 'Switch brands without promo';
        
    /* Choosing Factors */
    value ChoosingFactorFmt
        1 = "Taste"
        2 = "Environment"
        3 = "Health Risks"
        4 = "No Additives";
        
	/* Price Group */
	VALUE PriceFmt
		1 = "Below RM 5"
		2 = "RM 5 - RM 10"
		3 = "RM 11 - RM 15"
		4 = "RM 16 - RM 20"
		5 = "Above RM 20";

RUN;

DATA Formatted_Survey;
    SET Cleaned_Survey;
    
    FORMAT 
        Age_Group AgeGroupFmt.
        Gender_Num GenderFmt.
        Occupation_Num OccupationFmt.
        Income_Group IncomeFmt.
        Health_Conscious_Num HealthConsciousFmt.
        Prefer_Beverages BeveragePrefFmt.
        Natural_Ingredients_Importance NaturalIngredientFmt.
        Reputation_Impact ReputationImpactFmt.
        Promo_Impact PromoImpactFmt.
        Choosing_Factor ChoosingFactorFmt.
        Price_Group PriceFmt.
RUN;

proc sql;
    create table RankMeans as
    select 
        Gender_Num,
        mean(case when S2_Q1_Brand_Rank = '1st' then 1
                  when S2_Q1_Brand_Rank = '2nd' then 2
                  when S2_Q1_Brand_Rank = '3rd' then 3
                  when S2_Q1_Brand_Rank = '4th' then 4
                  when S2_Q1_Brand_Rank = '5th' then 5
                  when S2_Q1_Brand_Rank = '6th' then 6 end) as Brand_Rank,
        mean(case when S2_Q1_Taste_Rank = '1st' then 1
                  when S2_Q1_Taste_Rank = '2nd' then 2
                  when S2_Q1_Taste_Rank = '3rd' then 3
                  when S2_Q1_Taste_Rank = '4th' then 4
                  when S2_Q1_Taste_Rank = '5th' then 5
                  when S2_Q1_Taste_Rank = '6th' then 6 end) as Taste_Rank,
        mean(case when S2_Q1_Packaging_Rank = '1st' then 1
                  when S2_Q1_Packaging_Rank = '2nd' then 2
                  when S2_Q1_Packaging_Rank = '3rd' then 3
                  when S2_Q1_Packaging_Rank = '4th' then 4
                  when S2_Q1_Packaging_Rank = '5th' then 5
                  when S2_Q1_Packaging_Rank = '6th' then 6 end) as Packaging_Rank
    from Formatted_Survey
    group by Gender_Num;
quit;

/* ========== HYPOTHESIS 1 ========== */
/* Customers prefer natural ingredients over artificial flavors */

/* Health Consciousness and Preference for Natural Ingredients */
PROC SGPLOT DATA=Formatted_Survey;
    VBAR Prefer_Beverages / GROUP=Health_Conscious_Num stat=sum;
    format Prefer_Beverages BeveragePrefFmt. Health_Conscious_Num HealthConsciousFmt.;
    xaxis label='Beverage Preference';
    yaxis label='Count';
RUN;

/* Price Sensitivity and Preference for Natural Ingredients */
PROC SGPLOT DATA=Formatted_Survey;
    VBOX Price_Group / CATEGORY=Prefer_Beverages;
    format Prefer_Beverages BeveragePrefFmt. Price_Group PriceFmt.;
    xaxis label='Beverage Preference';
    yaxis label='Price Range';
RUN;

/* Natural Ingredients Preference and Choosing Factors Relationship */
PROC SGPLOT DATA=Formatted_Survey;
    VBAR Choosing_Factor / GROUP=Prefer_Beverages GROUPDISPLAY=CLUSTER 
                          STAT=PERCENT DATALABEL;
    FORMAT Choosing_Factor ChoosingFactorFmt. Prefer_Beverages BeveragePrefFmt.;
    XAXIS LABEL='Primary Factor in Beverage Choice';
    YAXIS LABEL='Percentage (%)' GRID;
    KEYLEGEND / TITLE='Beverage Preference';
    TITLE 'Relationship Between Choice Factors and Natural Ingredient Preference';
    FOOTNOTE 'Shows what factors drive preference for natural vs artificial beverages';
RUN;

/* ========== HYPOTHESIS 5 ========== */
/* Brand reputation > taste/packaging */

/* Rank Importance of Factors */
proc transpose data=RankMeans out=PlotData(rename=(col1=MeanRank _NAME_=Factor));
    by Gender_Num;
    var Brand_Rank Taste_Rank Packaging_Rank;
run;
proc sgplot data=PlotData;
    vbar Factor / response=MeanRank group=Gender_Num
        groupdisplay=cluster
        datalabel;
    yaxis reverse label="Mean Rank (1=Most Important)" values=(1 to 6);
    xaxis display=(nolabel);
    format Gender_Num GenderFmt.;
    title "Brand vs. Taste vs. Packaging Importance";
run;

/* Brand Reputation Impact by Purchase Behavior */
data BrandImpactAnalysis;
    set Formatted_Survey;
    
    Brand_Rank_Num = input(substr(S2_Q1_Brand_Rank, 1, 1), 8.);
    Taste_Rank_Num = input(substr(S2_Q1_Taste_Rank, 1, 1), 8.);
    Packaging_Rank_Num = input(substr(S2_Q1_Packaging_Rank, 1, 1), 8.);
    
    Brand_vs_Taste_Diff = Taste_Rank_Num - Brand_Rank_Num;
    Brand_vs_Package_Diff = Packaging_Rank_Num - Brand_Rank_Num;
    
    Brand_Importance = 7 - Brand_Rank_Num;
run;
proc sgplot data=BrandImpactAnalysis;
    vbox Brand_Importance / category=S2_Q2;
    xaxis label="Response to Negative Brand Information";
    yaxis label="Brand Importance Score (Higher = More Important)" 
          grid;
    format Reputation_Impact ReputationImpactFmt.;
    title "Brand Importance by Reputation Sensitivity";
run;

/* Distribution of Top-Ranked Factors */
data TopFactorCounts;
    set Formatted_Survey;
    length TopFactor $20;
    
    if S2_Q1_Brand_Rank = '1st' then TopFactor = 'Brand';
    else if S2_Q1_Taste_Rank = '1st' then TopFactor = 'Taste';
    else if S2_Q1_Packaging_Rank = '1st' then TopFactor = 'Packaging';
    else if S2_Q1_Health_Rank = '1st' then TopFactor = 'Health';
    else if S2_Q1_Env_Rank = '1st' then TopFactor = 'Environment';
    else if S2_Q1_Price_Rank = '1st' then TopFactor = 'Price';
run;
proc freq data=TopFactorCounts;
    tables TopFactor / plots=freqplot(orient=horizontal scale=percent);
    title "Distribution of Top-Ranked Purchase Decision Factors";
run;

/* ========== HYPOTHESIS 9 ========== */
/* Promotions increase loyalty */

/* Promo Impact by Purchase Frequency */
data PromoFreqAnalysis;
    set Formatted_Survey;
    
    /* Higher frequency = higher loyalty */
    if Frequency_Num >= 4 then Loyalty_Level = 'High';
    else if Frequency_Num >= 2 then Loyalty_Level = 'Medium';
    else Loyalty_Level = 'Low';
run;
proc sgplot data=PromoFreqAnalysis;
    vbar Loyalty_Level / group=Promo_Impact groupdisplay=cluster
                      stat=percent;
    xaxis label="Purchase Frequency Level (Loyalty Proxy)";
    yaxis label="Percentage of Respondents (%)";
    keylegend / title="Response to No Promotions";
    title "Impact of Promotions by Purchase Frequency Level";
    footnote "Higher Promo_Impact values indicate greater dependency on promotions";
    format Promo_Impact PromoImpactFmt.;
run;



/* Analyzing promotion frequency impact */
data PromoFrequencyAnalysis;
    set Formatted_Survey;
    
    /* Create loyalty score based on frequency and promo impact */
    Loyalty_Score = (5 - Promo_Impact) + Frequency_Num;
    keep Promo_Frequency Loyalty_Score Gender_Num Age_Group;
run;
proc means data=PromoFrequencyAnalysis noprint;
    class Promo_Frequency;
    var Loyalty_Score;
    output out=MeanScores mean=Mean_Loyalty_Score;
run;
proc sgplot data=MeanScores;
    vbar Promo_Frequency / response=Mean_Loyalty_Score datalabel;
    yaxis label="Mean Loyalty Score" grid;
    xaxis label="Frequency of Buying During Promotions";
    title "Brand Loyalty Score by Promotion Purchase Frequency";
    footnote "Higher loyalty score indicates stronger brand loyalty";
run;


/* Promotion impact vs price perception */
data PromoPriceAnalysis;
    set Formatted_Survey;
    
    Price_Rank_Num = Price_Rank;
    
    Price_Sensitivity = 7 - Price_Rank_Num;
    
    Price_Jitter = Price_Sensitivity + (ranuni(123) - 0.5) * 0.3;
    Promo_Jitter = Promo_Impact + (ranuni(456) - 0.5) * 0.3;
run;
proc sgplot data=PromoPriceAnalysis;
    heatmap x=Price_Sensitivity y=Promo_Impact / colorresponse=Frequency_Num;
    xaxis label="Price Sensitivity (Higher = More Sensitive)" grid;
    yaxis label="Promotion Dependency (Higher = More Dependent)" grid;
    title "Relationship Between Price Sensitivity and Promotion Dependency";
    footnote "Color intensity indicates purchase frequency (darker = higher frequency)";
run;


/* ========== HYPOTHESIS 4 ========== */
/* Ages 25-40 are primary market for healthy beverages */

/* Age-Based Bubble Chart with Multiple Health Dimensions */
proc means data=Formatted_Survey noprint;
    class Age_Group;
    var Health_Conscious_Num Natural_Ingredients_Importance Frequency_Num;
    output out=BubbleData mean= n=Count;
run;
proc sgplot data=BubbleData;
    bubble x=Health_Conscious_Num y=Natural_Ingredients_Importance size=Count / 
           group=Age_Group
           datalabel=Age_Group
           datalabelattrs=(size=8);
    xaxis label="Health Consciousness (Mean)" grid
          min=0 max=1 valueattrs=(size=9);
    yaxis label="Natural Ingredient Importance (Mean)" grid
          min=1 max=5 valueattrs=(size=9);
    keylegend / title="Age Group" position=bottom;
    title "Age Group Analysis: Health Consciousness vs Natural Preference";
    footnote "Bubble size represents number of respondents in each age group";
    format Age_Group AgeGroupFmt.;
run;

/* Beverage Preference by Age Group */
proc sgplot data=Formatted_Survey;
    vbar Age_Group / group=Prefer_Beverages groupdisplay=cluster 
                     stat=percent datalabel;
    xaxis label="Age Group";
    yaxis label="Percentage (%)";
    keylegend / title="Beverage Preference";
    title "Beverage Preference for Natural Ingredients by Age Group";
    footnote "Comparing beverage preference (Natural, Artificial) by age groups.";
    format Age_Group AgeGroupFmt. Prefer_Beverages BeveragePrefFmt.; 
run;

/* Age vs. Health Consciousness with Target Highlighting */
proc sgplot data=Formatted_Survey;
    scatter x=Age_Group y=Health_Conscious_Num / jitter markerattrs=(symbol=circlefilled)
                                              group=Target_Age_Group
                                              transparency=0.3;
    loess x=Age_Group y=Health_Conscious_Num / lineattrs=(thickness=2 color=blue) nomarkers;
    refline 3 4 / axis=x lineattrs=(color=red pattern=dash);
    xaxis label="Age Group" valueattrs=(size=9) grid min=0.5 max=5.5;
    yaxis label="Health Consciousness (1=Yes, 0=No)" grid;
    keylegend / title="Target Age Group (25-44)" position=top;
    title "Relationship Between Age and Health Consciousness";
    footnote "Target age groups (25-44) highlighted between red dashed lines";
    format Age_Group AgeGroupFmt.;
run;


