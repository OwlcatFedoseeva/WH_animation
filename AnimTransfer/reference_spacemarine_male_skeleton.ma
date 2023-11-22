//Maya ASCII 2019 scene
//Name: reference_spacemarine_male_skeleton.ma
//Last modified: Thu, Aug 17, 2023 04:16:09 PM
//Codeset: 1252
requires maya "2019";
requires "stereoCamera" "10.0";
requires "Mayatomr" "2012.0m - 3.9.1.36 ";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2019";
fileInfo "version" "2019";
fileInfo "cutIdentifier" "201812112215-434d8d9c04";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 19045)\n";
createNode transform -n "Reference_UMA_Male_Rig";
	rename -uid "B2A10724-4864-3D31-E923-5586A0EC459A";
	addAttr -is true -ci true -h true -k true -sn "MaxHandle" -ln "MaxHandle" -smn 
		0 -smx 0 -at "long";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.7794805449999999e-06 1.080887481 -1.0013355340000001 ;
	setAttr ".r" -type "double3" -90 0 -8.6514237410000003e-06 ;
	setAttr ".rp" -type "double3" 6.3290441367519381e-14 -1.0013355343887649 -1.0808874811779814 ;
	setAttr ".rpt" -type "double3" -1.6320950156333396e-07 -0.079551946789204311 2.082223015566746 ;
	setAttr ".sp" -type "double3" 6.3290441367519381e-14 -1.0013355343887649 -1.0808874811779814 ;
	setAttr ".liw" yes;
createNode locator -n "Reference_UMA_Male_RigShape" -p "Reference_UMA_Male_Rig";
	rename -uid "DB107E02-47B2-34CB-7ED8-C88A5AD71FE1";
	setAttr -k off ".v";
	setAttr ".lp" -type "double3" -1.5823969882699748e-14 -1.0013355322051949 -1.0808873874283023 ;
createNode transform -n "Reference_Global" -p "Reference_UMA_Male_Rig";
	rename -uid "8B7142E6-4B23-C940-81F5-B1886387BF4E";
	addAttr -is true -ci true -h true -k true -sn "MaxHandle" -ln "MaxHandle" -smn 
		0 -smx 0 -at "long";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -6.1555105459955468e-10 0 0 ;
	setAttr ".r" -type "double3" 90.000045779999994 -89.999977110000003 0 ;
	setAttr ".rp" -type "double3" -1.0808873937059043 3.6844513184682549e-07 1.0013355344012336 ;
	setAttr ".rpt" -type "double3" 1.0808873935187577 -1.00133590284634 -2.0822229281072233 ;
	setAttr ".sp" -type "double3" -1.0808873937059043 3.6844513184682549e-07 1.0013355344012336 ;
	setAttr ".liw" yes;
createNode locator -n "Reference_GlobalShape" -p "Reference_Global";
	rename -uid "3D0F9A07-4630-0987-0B9D-C58E26DB68BB";
	setAttr -k off ".v";
	setAttr ".lp" -type "double3" -1.0808873874282148 3.6841188431937251e-07 1.0013355322052202 ;
createNode transform -n "Reference_Position" -p "Reference_Global";
	rename -uid "D31BE88B-4BA1-8B6C-2324-279F747807F2";
	addAttr -is true -ci true -h true -k true -sn "MaxHandle" -ln "MaxHandle" -smn 
		0 -smx 0 -at "long";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0 -4.2351647362715017e-22 0 ;
	setAttr ".rp" -type "double3" -1.080887387428215 3.68411884461856e-07 1.0013355426825994 ;
	setAttr ".sp" -type "double3" -1.080887387428215 3.68411884461856e-07 1.0013355426825994 ;
	setAttr ".liw" yes;
createNode locator -n "Reference_PositionShape" -p "Reference_Position";
	rename -uid "5F8B9B8A-4113-5689-C640-E1BB764B1FB4";
	setAttr -k off ".v";
	setAttr ".lp" -type "double3" -1.0808873874282148 3.6841188431937251e-07 1.0013355426825992 ;
createNode joint -n "Reference_Pelvis" -p "Reference_Position";
	rename -uid "B80F003D-481C-3C36-3178-CC86A439484D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0.18379385826422978 2.7955937231690451e-07 1.0013355321065771 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.999962875058188 -7.2820907214341327e-05 -89.999968458576262 ;
	setAttr ".bps" -type "matrix" 0.99999999999988864 1.2977958972002906e-16 4.7195286367909807e-07 0
		 4.7195286360815811e-07 6.479529088993899e-07 -0.99999999999967859 0 -3.0591609007936022e-13 0.99999999999978995 6.4795290892611061e-07 0
		 2.4005632894841256e-06 1.2646813392639158 -1.8935195633673629e-09 1;
	setAttr ".radi" 1.1;
	setAttr ".liw" yes;
createNode joint -n "Reference_Spine_1" -p "Reference_Pelvis";
	rename -uid "08882D7D-41A5-2C63-642C-E59069A6F38F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 5.3935896530678219e-14 0.0020127582722605868 0.04494774211166952 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.999999999999204 -86.834388706153362 -89.999999999999204 ;
	setAttr ".bps" -type "matrix" -2.6062596461442728e-08 0.99847405241376119 0.055222881638328385 0
		 4.7123268821694168e-07 0.055222881638334505 -0.99847405241364984 0 -0.99999999999988864 6.4737645782823164e-16 -4.7195286357154469e-07 0
		 2.4015132567001291e-06 1.3096290826797485 -0.0020127310417592521 1;
	setAttr ".radi" 1.0540203030448205;
createNode joint -n "Reference_Spine_2" -p "Reference_Spine_1";
	rename -uid "6600CF5E-4976-BF96-E05C-9DAA25497649";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.19088786559174875 -3.7780569783762985e-09 -9.9171948576810094e-14 ;
	setAttr ".r" -type "double3" -3.0332133116374176e-21 2.0853341517507255e-21 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 8.038 ;
	setAttr ".pa" -type "double3" -3.0332133116374176e-21 2.0853341517507255e-21 0 ;
	setAttr ".bps" -type "matrix" 4.0085846117549382e-08 0.99638639862845313 -0.084936120868683629 0
		 4.7024741394240283e-07 -0.084936120868693149 -0.996386398628342 0 -0.99999999999988864 6.4737645782823164e-16 -4.7195286357154469e-07 0
		 2.3965383206814299e-06 1.5002256631851201 0.0085286507382988878 1;
	setAttr ".radi" 1.1300319085430464;
createNode joint -n "Reference_Spine_3" -p "Reference_Spine_2";
	rename -uid "6575DF46-4D71-25D2-3B3E-DE9A9BCBB05B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0.17381942288694074 -2.2749385153453261e-09 5.8658020931842692e-14 ;
	setAttr ".r" -type "double3" -3.0332133116374191e-21 -2.009503818959789e-20 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 5.502 ;
	setAttr ".pa" -type "double3" -3.0332133116374191e-21 -2.009503818959789e-20 0 ;
	setAttr ".bps" -type "matrix" 8.4988721090018017e-08 0.98365218154092993 -0.18007883204242014 0
		 4.6423746366052846e-07 -0.18007883204244027 -0.98365218154082024 0 -0.99999999999988864 6.4737645782823164e-16 -4.7195286357154469e-07 0
		 2.4035059595917123e-06 1.6734169721603396 -0.0062348945066333511 1;
	setAttr ".radi" 1.4808243322106183;
createNode joint -n "Reference_Neck" -p "Reference_Spine_3";
	rename -uid "6C1A8C19-438B-420B-9088-0580D650EEA3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.34419371715051827 8.0418545156391019e-09 5.4720699237847167e-14 ;
	setAttr ".r" -type "double3" -4.5498199674561264e-21 1.0047519094798945e-20 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -19.824000000000005 ;
	setAttr ".pa" -type "double3" -4.5498199674561264e-21 1.0047519094798945e-20 0 ;
	setAttr ".bps" -type "matrix" -7.7485595017394559e-08 0.9864302646493448 0.16418079358992457 0
		 4.6554858816591602e-07 0.16418079358994284 -0.98643026464923489 0 -0.99999999999988864 6.4737645782823164e-16 -4.7195286357154469e-07 0
		 2.432758492432185e-06 2.0119838714599609 -0.068216904997825539 1;
	setAttr ".radi" 0.93551839605165443;
createNode joint -n "Reference_Head" -p "Reference_Neck";
	rename -uid "2DD255CD-4233-9A01-E3EF-038BD6D4435C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 0.12396249784561664 -1.7557297837811348e-09 -1.3517736463606461e-13 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" -7.7485595017394559e-08 0.9864302646493448 0.16418079358992457 0
		 4.6554858816591602e-07 0.16418079358994284 -0.98643026464923489 0 -0.99999999999988864 6.4737645782823164e-16 -4.7195286357154469e-07 0
		 2.423153318886762e-06 2.1342642307281494 -0.047864641994237886 1;
	setAttr ".radi" 1.2465017953717901;
createNode joint -n "Reference_Skull_Scale" -p "Reference_Head";
	rename -uid "4BA91623-4C24-A65E-1BDF-6FB2D3D2AFF4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0.16924844301844999 -0.058209612783349463 3.4277889407947009e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 80.550326030152348 89.999986405363757 0 ;
	setAttr ".bps" -type "matrix" 0.99999999999984224 2.3405145540467123e-07 5.1090823139893944e-07 0
		 -2.3405122771354258e-07 0.99999999999987321 -4.4594978570416497e-07 0 -5.1090833558366087e-07 4.4594966616684495e-07 0.99999999999977007 0
		 -1.0448493412695825e-06 2.2916591167449951 0.037342425435781493 1;
	setAttr ".radi" 1.2;
createNode joint -n "Reference_R_Clavicle" -p "Reference_Spine_3";
	rename -uid "578FA4AF-4B34-19A2-6B2C-F68ED562C50F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.24000889353283483 -0.025055562130319065 0.10651173271019795 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -117.00701075142995 -72.042794177008616 105.49233571935288 ;
	setAttr ".bps" -type "matrix" -0.95128692464149855 -0.13450758637927454 -0.27741826942820874 0
		 0.27468648545594587 0.038835948954527369 -0.96074924084105395 0 0.14000186325181774 -0.99015124010184596 3.2857231984079665e-06 0
		 -0.1065093204379082 1.9140142202377322 -0.024809507653117159 1;
	setAttr ".radi" 1.1989134246320896;
createNode joint -n "Reference_R_Up_arm" -p "Reference_R_Clavicle";
	rename -uid "3B86EFBF-4048-53BB-E34E-2BB96343A241";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 0.19121875772499375 7.1679828739235063e-11 -1.5830259325610996e-08 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -4.26 -26 -6.463 ;
	setAttr ".bps" -type "matrix" -0.815994380374234 -0.55810905723525472 -0.15055713676091678 0
		 0.12426998664305342 0.084996599047694757 -0.98860130920915756 0 0.56454418925129823 -0.82540284611957859 -5.4208584863510888e-07 0
		 -0.28841322660446167 1.8882938623428347 -0.077857084572315202 1;
	setAttr ".radi" 1.821;
createNode joint -n "Reference_R_ForeArm" -p "Reference_R_Up_arm";
	rename -uid "C3EA08ED-4308-9363-36D3-46A96DCCB095";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0.35474376921337186 -9.8524782776721054e-09 6.891785520046767e-08 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.624 -1.336 146.311 ;
	setAttr ".bps" -type "matrix" 0.7608467712502891 0.49214316252670676 -0.42297434704272763 0
		 0.35515539086056097 0.22972145441575165 0.90614165654371825 0 0.54311770273182292 -0.83965657322462695 -4.4703673799977201e-06 0
		 -0.57788211107253995 1.690308094024658 -0.13126628100872037 1;
	setAttr ".radi" 1.6637163937552266;
createNode joint -n "Reference_R_Hand" -p "Reference_R_ForeArm";
	rename -uid "92FBDE68-4742-8B19-B3BC-53B911907799";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" -0.28723676928455638 0.0049322159217079333 -0.002070620243133071 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.8550000000000013 -4.649 -168.831 ;
	setAttr ".bps" -type "matrix" -0.76852868608781622 -0.59364026760489796 0.2386522393318786 0
		 -0.24143210600290838 -0.076354113043911501 -0.96740921414480963 0 0.59251514482849776 -0.80110004500016285 -0.084643493840942663 0
		 -0.79579816700325645 1.5518181277078282 -0.0053032005117615855 1;
	setAttr ".radi" 0.88059310248425771;
createNode joint -n "Reference_R_Toe_1_01" -p "Reference_R_Hand";
	rename -uid "9C39680A-4C7C-757B-768E-219B707E9FA5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0.14886246908948123 -0.069029644667605167 0.030846488405123162 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -6.313 -35.199 0.9890000000000001 ;
	setAttr ".bps" -type "matrix" -0.28978231398273879 -0.94786928522361502 0.13255198464181128 0
		 -0.32895599503199413 -0.031417743194609132 -0.94382248264441571 0 0.89878482621555222 -0.31710683301094478 -0.30270297755794984 0
		 -0.87526026074683916 1.4440069457641129 0.094392120838165269 1;
	setAttr ".radi" 0.88059310248425771;
createNode joint -n "Reference_R_Toe_1_02" -p "Reference_R_Toe_1_01";
	rename -uid "AD6D4BAD-4C10-5837-4597-CABBD0A0A925";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 0.058277060197086339 -0.00030250170537249321 -0.0035271205268054828 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" -0.28978231398273879 -0.94786928522361502 0.13255198464181128 0
		 -0.32895599503199413 -0.031417743194609132 -0.94382248264441571 0 0.89878482621555222 -0.31710683301094478 -0.30270297755794984 0
		 -0.89521853476309865 1.3898958883109656 0.10347003862261799 1;
	setAttr ".radi" 0.88059310248425771;
createNode joint -n "Reference_R_Toe_2_01" -p "Reference_R_Hand";
	rename -uid "6758C6C1-44E0-1A89-8AE4-69919B996C3D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0.15097421591533705 0.034314419684801367 0.027883437187224969 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 9.09 -38.8 13.922 ;
	setAttr ".bps" -type "matrix" -0.2553476342714372 -0.96534522355934049 -0.053909043982874306 0
		 0.10373815985840329 0.028080646410444041 -0.99420816305558657 0 0.9612679022318249 -0.25946112743210453 0.092972810490425356 0
		 -0.90358942658127306 1.4372362839053132 -0.0048291031271219193 1;
	setAttr ".radi" 0.88059310248425771;
createNode joint -n "Reference_R_Toe_2_02" -p "Reference_R_Toe_2_01";
	rename -uid "0A6795F1-4212-F869-4B6F-388A18848807";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 0.053401161250587803 -0.0073655210734287144 -0.0021077024251185961 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 3.003 8.871 -1.902 ;
	setAttr ".bps" -type "matrix" -0.40379349500249695 -0.91418158810112016 -0.034969091646518513 0
		 0.14274242396297368 -0.02520142639491918 -0.98943897664728964 0 0.90364562401133997 -0.40452059537751056 0.1406686678709273 0
		 -0.92001543906523664 1.3860257662141571 -0.00058100651949640793 1;
	setAttr ".radi" 0.88059310248425771;
createNode joint -n "Reference_R_Toe_3_01" -p "Reference_R_Hand";
	rename -uid "AB55CC1B-4CDD-1AB3-A9D2-6289B739F9EA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0.051071062609961027 -0.10995490849469124 0.064076869439364526 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -59.167 -29.694 -28.745 ;
	setAttr ".bps" -type "matrix" -0.19096424842264892 -0.81707822584719869 0.54398145985940283 0
		 -0.97711340348674125 0.21113928028547213 -0.025876650615762289 0 -0.093712606147359878 -0.53647309081344163 -0.83869814014467836 0
		 -0.77053458294874622 1.4785638149547766 0.10783272445964015 1;
	setAttr ".radi" 0.88059310248425771;
createNode joint -n "Reference_R_Toe_3_02" -p "Reference_R_Toe_3_01";
	rename -uid "26692148-425E-900C-1523-608BB22C3163";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 0.050107699142497797 0.0013255561251857007 0.0077715446347583761 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" -0.19096424842264892 -0.81707822584719869 0.54398145985940283 0
		 -0.97711340348674125 0.21113928028547213 -0.025876650615762289 0 -0.093712606147359878 -0.53647309081344163 -0.83869814014467836 0
		 -0.7821268724141881 1.4337325574337856 0.12853810280542563 1;
	setAttr ".radi" 0.88059310248425771;
createNode joint -n "Reference_L_Clavicle" -p "Reference_Spine_3";
	rename -uid "C8FC79EF-4A95-1C64-79DC-429CE8E5D54F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.24000475901319818 -0.025054710789436774 -0.10651158772769015 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -117.00693422149371 -72.042745513550202 -74.507737082574877 ;
	setAttr ".bps" -type "matrix" -0.95128692464149844 0.13450758637927454 0.27741826942820863 0
		 0.27468648545594565 -0.038835948954528812 0.96074924084105384 0 0.14000186325181804 0.99015124010184585 -3.2857231970526439e-06 0
		 0.10651400000000001 1.91401 -0.02480949999999995 1;
	setAttr ".radi" 1.1989134246320896;
createNode joint -n "Reference_L_Up_arm" -p "Reference_L_Clavicle";
	rename -uid "C2463877-4A1B-E4F2-AFFC-959AF3441504";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -0.19121880525098187 -1.0370951167293363e-08 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -4.2599999999996614 -25.999999999999975 -6.4630000000000267 ;
	setAttr ".bps" -type "matrix" -0.81599438037423411 0.5581090572352545 0.15055713676091689 0
		 0.12426998664305608 -0.084996599047691246 0.98860130920915745 0 0.56454418925129735 0.82540284611957904 5.4208584431265994e-07 0
		 0.28841794633206802 1.8882896204381276 -0.077857099998740451 1;
	setAttr ".radi" 1.821;
createNode joint -n "Reference_L_ForeArm" -p "Reference_L_Up_arm";
	rename -uid "0B3B1EC2-45C2-3620-95F2-4ABD8DB5E10E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -0.35474059950553494 -1.7302038035627021e-07 4.7574914210368746e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.62400000000016675 -1.3359999999998564 146.311 ;
	setAttr ".bps" -type "matrix" 0.76084677125028943 -0.49214316252670681 0.42297434704272729 0
		 0.3551553908605603 -0.22972145441575201 -0.90614165654371825 0 0.5431177027318228 0.83965657322462683 4.4703673793781688e-06 0
		 0.57788694633206816 1.6903096204381278 -0.1312659999987405 1;
	setAttr ".radi" 1.6637163937552266;
createNode joint -n "Reference_L_Hand" -p "Reference_L_ForeArm";
	rename -uid "3E8AFA49-4110-FB33-5252-18A79106B586";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" 0.28723662466377536 -0.0049319738780778249 0.0020705615826213108 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.8550000000000395 -4.6490000000000036 -168.83100000000002 ;
	setAttr ".bps" -type "matrix" -0.76852868608781622 0.59364026760489808 -0.23865223933187865 0
		 -0.2414321060029084 0.07635411304391157 0.9674092141448094 0 0.59251514482849754 0.80110004500016274 0.084643493840942691 0
		 0.79580294633206816 1.5518196204381276 -0.0053031999987404321 1;
	setAttr ".radi" 0.88059310248425771;
createNode joint -n "Reference_L_Toe_1_01" -p "Reference_L_Hand";
	rename -uid "6C77F59B-400F-657C-3C1F-BF8332079E6C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -0.14886284249071419 0.069029762151128299 -0.030848890000751972 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -6.3129999999997848 -35.198999999999991 0.98900000000000421 ;
	setAttr ".bps" -type "matrix" -0.28978231398273918 0.9478692852236148 -0.13255198464181134 0
		 -0.32895599503199069 0.031417743194610354 0.94382248264441659 0 0.89878482621555322 0.31710683301094467 0.30270297755794628 0
		 0.87526387569913355 1.4440063018803884 0.094392120839424817 1;
	setAttr ".radi" 0.88059310248425771;
createNode joint -n "Reference_L_Toe_1_02" -p "Reference_L_Toe_1_01";
	rename -uid "F2E793B8-46E7-9D8A-D39C-98BE540AACC8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -0.058277061174753619 0.00030250689150948529 0.0035271039284070493 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" -0.28978231398273918 0.9478692852236148 -0.13255198464181134 0
		 -0.32895599503199069 0.031417743194610354 0.94382248264441659 0 0.89878482621555322 0.31710683301094467 0.30270297755794628 0
		 0.89522213337430434 1.3898952384000114 0.10347003862387733 1;
	setAttr ".radi" 0.88059310248425771;
createNode joint -n "Reference_L_Toe_2_01" -p "Reference_L_Hand";
	rename -uid "D589D52A-4638-ABC6-1763-8E8A0D931FD4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -0.15097459282386533 -0.034314302360848287 -0.027885846847908624 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 9.0899999999999217 -38.800000000000004 13.922000000000006 ;
	setAttr ".bps" -type "matrix" -0.2553476342714372 0.96534522355934049 0.053909043982874418 0
		 0.10373815985840203 -0.028080646410444499 0.99420816305558668 0 0.96126790223182468 0.2594611274321042 -0.092972810490423996 0
		 0.9035930394888827 1.4372356314664172 -0.0048291031258624328 1;
	setAttr ".radi" 0.88059310248425771;
createNode joint -n "Reference_L_Toe_2_02" -p "Reference_L_Toe_2_01";
	rename -uid "CF50DD60-4773-9AF7-5592-4396E1247758";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -0.053401162090209064 0.0073655196083970212 0.0021076862719053846 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 3.0030000000000086 8.8709999999999951 -1.9019999999999908 ;
	setAttr ".bps" -type "matrix" -0.40379349500249673 0.91418158810112027 0.034969091646518555 0
		 0.1427424239629726 0.025201426394918611 0.98943897664728975 0 0.90364562401133974 0.40452059537751017 -0.14066866787092608 0
		 0.92001903650769656 1.3860251088147448 -0.0005810065182369397 1;
	setAttr ".radi" 0.88059310248425771;
createNode joint -n "Reference_L_Toe_3_01" -p "Reference_L_Hand";
	rename -uid "A64CF555-4BAE-6DD0-DD7B-928858FF7169";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -0.051071425256842447 0.10995502587345182 -0.064079239515755879 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -59.166999999999994 -29.693999999999996 -28.745000000000033 ;
	setAttr ".bps" -type "matrix" -0.19096424842264886 0.81707822584719847 -0.54398145985940327 0
		 -0.97711340348674114 -0.21113928028547191 0.025876650615761887 0 -0.093712606147360211 0.53647309081344208 0.83869814014467825 0
		 0.77053820833693154 1.4785632026973317 0.10783272446089973 1;
	setAttr ".radi" 0.88059310248425771;
createNode joint -n "Reference_L_Toe_3_02" -p "Reference_L_Toe_3_01";
	rename -uid "518CF9D3-4EC0-6903-D913-16B3FCAB1900";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -0.050107699417501608 -0.0013255421572228748 -0.0077715452440849505 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.2074182697257333e-06 1.5918479391670594e-22 4.0215107069805742e-22 ;
	setAttr ".bps" -type "matrix" -0.19096424842264886 0.81707822584719847 -0.54398145985940327 0
		 -0.97711340546158643 -0.21113926898014682 0.02587666829000361 0 -0.093712585556234906 0.53647309526286957 0.83869813959936834 0
		 0.78213048426370724 1.4337319416755681 0.12853810280668523 1;
	setAttr ".radi" 0.88059310248425771;
createNode joint -n "Reference_R_Pre_Up_Leg" -p "Reference_Pelvis";
	rename -uid "46AD53AC-4E66-7496-E0FB-628C03A54160";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -0.013186522724663221 -0.0032019907933626014 -0.052418587517251591 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999236361637 -3.6605642685089013e-06 -4.5198400492033725e-29 ;
	setAttr ".bps" -type "matrix" 0.99999999999988665 6.3888899096104241e-08 4.7195290507609505e-07 0
		 -4.7195287212330966e-07 -5.1467287154804818e-07 0.99999999999975631 0 6.3889141980525187e-08 -0.99999999999986566 -5.146728414222334e-07 0
		 -0.013184123672544958 1.212262749671936 0.0032019487116485834 1;
	setAttr ".radi" 1.670775873907681;
createNode joint -n "Reference_R_Up_leg" -p "Reference_R_Pre_Up_Leg";
	rename -uid "5C83D39B-4F38-56AC-8112-FD981C3BCB6F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -0.18 1.8996054517207348e-08 -1.1680406309667149e-08 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -17.906 -80.308 -156.805 ;
	setAttr ".bps" -type "matrix" -0.15474373350917275 -0.98572696079551236 -0.06630788565837982 0
		 0.096213504244607603 0.051761317621015504 -0.99401394738660964 0 0.98325853087609427 -0.16019714341703775 0.086830505586493162 0
		 -0.19318412367253426 1.2122627498523306 0.0032018827561861984 1;
	setAttr ".radi" 2;
createNode joint -n "Reference_R_leg" -p "Reference_R_Up_leg";
	rename -uid "1EFB5D4A-4588-1A30-C669-12A67A018203";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0.60146016878681952 4.6812829201661969e-05 -0.010602259555528468 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.395 2.532 3.208 ;
	setAttr ".bps" -type "matrix" -0.19240922653210524 -0.97325056577211777 -0.12554690665074189 0
		 0.11144639342616694 0.10543766823359392 -0.9881612214156974 0 0.97496584090808902 -0.20412308625365141 0.088178085263104514 0
		 -0.29667657387585877 0.6210881204228258 -0.037646801506508898 1;
	setAttr ".radi" 2;
createNode joint -n "Reference_R_foot" -p "Reference_R_leg";
	rename -uid "0B503D65-49B5-979A-E605-B19C444CECC9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.48716912069374496 -3.1348949077765144e-09 0.010612861215146707 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.54 -11.286 -66.911 ;
	setAttr ".bps" -type "matrix" 0.016274278076923221 -0.50935431224453021 0.86040300584724649 0
		 -0.15987504791357646 -0.85077102547459771 -0.50062823658632483 0 0.98700309874270753 -0.12940960864944806 -0.095278729323443764 0
		 -0.38006523076917442 0.14478416776517999 -0.097873552746474218 1;
	setAttr ".radi" 1.1666001913027237;
createNode joint -n "Reference_R_toe" -p "Reference_R_foot";
	rename -uid "45505664-4D85-344B-3F22-A3B2EA5A984B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 0.1999959555100724 5.6540701334821487e-07 -0.023885201040008883 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -85.082 1.8630000000000002 -29.373000000000005 ;
	setAttr ".bps" -type "matrix" 0.060463579569841969 -0.022355810410354414 0.99792002349211228 0
		 -0.99710864179803893 0.044747345823575882 0.061416866522285674 0 -0.046027296219442987 -0.99874816284318746 -0.019585587049819983 0
		 -0.40038529880999818 0.04600585888185578 0.076479037077695239 1;
	setAttr ".radi" 0.90867284863003894;
createNode joint -n "Reference_L_Pre_Up_Leg" -p "Reference_Pelvis";
	rename -uid "4CE5759F-444C-8703-DA02-E484970D7F9F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 0.013186500947879405 -0.0032019796366716297 -0.052421337189194839 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 5.4628171518015264e-05 5.1563845634794116e-11 -3.4901425743999639e-12 ;
	setAttr ".bps" -type "matrix" 0.99999999999988864 1.2977958972002906e-16 4.7195286367909807e-07 0
		 4.719528636076519e-07 1.6013943662323057e-06 -0.99999999999860623 0 -7.558955161504599e-13 0.99999999999871758 1.6013943662589203e-06 0
		 0.0131889 1.2122599999999999 0.0032019500000000003 1;
	setAttr ".radi" 1.670775873907681;
createNode joint -n "Reference_L_Up_leg" -p "Reference_L_Pre_Up_Leg";
	rename -uid "203C85CA-4567-9183-4861-69B9787D2E0B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.18000009999994696 1.5495156265770207e-07 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -17.905668610139898 -80.308027888223791 -156.80527257812852 ;
	setAttr ".bps" -type "matrix" -0.15474373350917389 0.98572696079551181 0.066307885658379931 0
		 0.096213504244604328 -0.051761317621016066 0.99401394738660942 0 0.98325853087609427 0.16019714341703886 -0.086830505586489623 0
		 0.19318900000000006 1.2122600000002481 0.0032018800000000003 1;
	setAttr ".radi" 2;
createNode joint -n "Reference_L_leg" -p "Reference_L_Up_leg";
	rename -uid "F25CFD72-4E2B-3FD6-C171-468B0652300B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -0.60145726477127792 -4.7004318169229257e-05 0.010601248624887483 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.39499999999405744 2.5319999999998588 3.207999999999894 ;
	setAttr ".bps" -type "matrix" -0.19240922653210432 0.97325056577211777 0.12554690665073978 0
		 0.11144639342606234 -0.10543766823361379 0.9881612214157065 0 0.97496584090810101 0.20412308625363917 -0.088178085262998876 0
		 0.29667998839511672 0.62108808110067804 -0.037646714266650512 1;
	setAttr ".radi" 2;
createNode joint -n "Reference_L_foot" -p "Reference_L_leg";
	rename -uid "7603C83F-4E00-22BE-0C2A-9CBDDC016985";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" -0.48716952324499085 3.4754174289122061e-08 -0.010611554776411902 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.5399999999973679 -11.285999999994354 -66.911000000000371 ;
	setAttr ".bps" -type "matrix" 0.016274278076923471 0.50935431224452987 -0.86040300584724605 0
		 -0.15987504791357224 0.85077102547459793 0.50062823658632494 0 0.98700309874270808 0.12940960864944454 0.095278729323441835 0
		 0.38007000000000002 0.14478400000024794 -0.097873600000000033 1;
	setAttr ".radi" 1.1666001913027237;
createNode joint -n "Reference_L_toe" -p "Reference_L_foot";
	rename -uid "FE2D2C86-40F6-E3E7-693B-2CB5FE429A10";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -0.199995858977081 -3.7172279526188901e-07 0.023885161884554473 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -85.082000000000306 1.8629999999998561 -29.373000000000012 ;
	setAttr ".bps" -type "matrix" 0.060463579569842545 0.022355810410354345 -0.99792002349211173 0
		 -0.9971086417980386 -0.04474734582357795 -0.06141686652228634 0 -0.046027296219444624 0.99874816284318702 0.019585587049819851 0
		 0.40039000000000002 0.046005900000247957 0.076478999999999936 1;
	setAttr ".radi" 0.90867284863003894;
createNode displayLayer -n "RIGBone_layer";
	rename -uid "EEE80E12-4838-7A0C-DAAD-9D8BBC27988C";
	setAttr ".c" 18;
	setAttr ".do" 1;
createNode displayLayerManager -n "layerManager";
	rename -uid "21769181-474E-A46E-438C-8387CB7857E0";
	setAttr ".cdl" 5;
	setAttr -s 43 ".dli[1:42]"  4 8 1 24 6 3 15 22 
		43 5 2 10 11 12 13 14 16 17 18 19 20 21 9 23 25 
		26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42;
	setAttr -s 2 ".dli";
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 0;
	setAttr -av -k on ".unw";
	setAttr -av -k on ".etw";
	setAttr -av -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr -k on ".hwi";
	setAttr -av ".ta" 5;
	setAttr -av ".tq";
	setAttr -av ".etmr";
	setAttr -av ".tmr";
	setAttr -av ".aoon";
	setAttr -av ".aoam";
	setAttr -av ".aora";
	setAttr -k on ".hff";
	setAttr -av -k on ".hfd";
	setAttr -av -k on ".hfs";
	setAttr -av -k on ".hfe";
	setAttr -av ".hfc";
	setAttr -av -k on ".hfcr";
	setAttr -av -k on ".hfcg";
	setAttr -av -k on ".hfcb";
	setAttr -av -k on ".hfa";
	setAttr -av ".mbe";
	setAttr -av -k on ".mbsof";
	setAttr -k on ".blen";
	setAttr -k on ".blat";
	setAttr -av ".msaa";
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 53 ".st";
	setAttr -k on ".an";
	setAttr -k on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 33 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 74 ".u";
select -ne :defaultRenderingList1;
	setAttr -k on ".ihi";
select -ne :defaultTextureList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 64 ".tx";
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -cb on ".ai_override";
	setAttr -k on ".ai_surface_shader";
	setAttr -cb on ".ai_surface_shaderr";
	setAttr -cb on ".ai_surface_shaderg";
	setAttr -cb on ".ai_surface_shaderb";
	setAttr -k on ".ai_volume_shader";
	setAttr -cb on ".ai_volume_shaderr";
	setAttr -cb on ".ai_volume_shaderg";
	setAttr -cb on ".ai_volume_shaderb";
lockNode -l 0 -lu 1;
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -cb on ".ai_override";
	setAttr -cb on ".ai_surface_shader";
	setAttr -cb on ".ai_surface_shaderr";
	setAttr -cb on ".ai_surface_shaderg";
	setAttr -cb on ".ai_surface_shaderb";
	setAttr -cb on ".ai_volume_shader";
	setAttr -cb on ".ai_volume_shaderr";
	setAttr -cb on ".ai_volume_shaderg";
	setAttr -cb on ".ai_volume_shaderb";
lockNode -l 0 -lu 1;
select -ne :initialMaterialInfo;
	setAttr -s 9 ".t";
select -ne :defaultRenderGlobals;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -k on ".macc";
	setAttr -av -k on ".macd";
	setAttr -av -k on ".macq";
	setAttr -av -k on ".mcfr";
	setAttr -cb on ".ifg";
	setAttr -av -k on ".clip";
	setAttr -av -k on ".edm";
	setAttr -av -k on ".edl";
	setAttr -av -k on ".ren";
	setAttr -av -k on ".esr";
	setAttr -av -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -av -k on ".outf";
	setAttr -av -cb on ".imfkey";
	setAttr -av -k on ".gama";
	setAttr -k on ".exrc";
	setAttr -k on ".expt";
	setAttr -av -k on ".an";
	setAttr -cb on ".ar";
	setAttr -av -k on ".fs" 1;
	setAttr -av -k on ".ef" 10;
	setAttr -av -k on ".bfs";
	setAttr -av -cb on ".me";
	setAttr -cb on ".se";
	setAttr -av -k on ".be";
	setAttr -av -cb on ".ep";
	setAttr -av -k on ".fec";
	setAttr -av -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -cb on ".umfn";
	setAttr -cb on ".ufe";
	setAttr -av -cb on ".pff";
	setAttr -av -cb on ".peie";
	setAttr -av -cb on ".ifp";
	setAttr -k on ".rv";
	setAttr -av -k on ".comp";
	setAttr -av -k on ".cth";
	setAttr -av -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -av -k on ".rd";
	setAttr -av -k on ".lp";
	setAttr -av -k on ".sp";
	setAttr -av -k on ".shs";
	setAttr -av -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -av -k on ".mm";
	setAttr -av -k on ".npu";
	setAttr -av -k on ".itf";
	setAttr -av -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -av -k on ".uf";
	setAttr -av -k on ".oi";
	setAttr -av -k on ".rut";
	setAttr -av -k on ".mot";
	setAttr -av -k on ".mb";
	setAttr -av -k on ".mbf";
	setAttr -av -k on ".mbso";
	setAttr -av -k on ".mbsc";
	setAttr -av -k on ".afp";
	setAttr -av -k on ".pfb";
	setAttr -av -k on ".pram";
	setAttr -av -k on ".poam";
	setAttr -av -k on ".prlm";
	setAttr -av -k on ".polm";
	setAttr -av -cb on ".prm";
	setAttr -av -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -av -k on ".bls";
	setAttr -av -k on ".smv";
	setAttr -av -k on ".ubc";
	setAttr -av -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -av -k on ".udbx";
	setAttr -av -k on ".smc";
	setAttr -av -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -av -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -av -k on ".tlwd";
	setAttr -av -k on ".tlht";
	setAttr -av -k on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -av -k on ".ope";
	setAttr -av -k on ".oppf";
	setAttr -av -k on ".rcp";
	setAttr -av -k on ".icp";
	setAttr -av -k on ".ocp";
	setAttr -cb on ".hbl";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".w";
	setAttr -av -k on ".h";
	setAttr -av -k on ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av -k on ".dar";
	setAttr -av -k on ".ldar";
	setAttr -av -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -av -k on ".isu";
	setAttr -av -k on ".pdu";
select -ne :hardwareRenderGlobals;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -k off -cb on ".ctrs" 256;
	setAttr -av -k off -cb on ".btrs" 512;
	setAttr -av -k off -cb on ".fbfm";
	setAttr -av -k off -cb on ".ehql";
	setAttr -av -k off -cb on ".eams";
	setAttr -av -k off -cb on ".eeaa";
	setAttr -av -k off -cb on ".engm";
	setAttr -av -k off -cb on ".mes";
	setAttr -av -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -av -k off -cb on ".mbs";
	setAttr -av -k off -cb on ".trm";
	setAttr -av -k off -cb on ".tshc";
	setAttr -av -k off -cb on ".enpt";
	setAttr -av -k off -cb on ".clmt";
	setAttr -av -k off -cb on ".tcov";
	setAttr -av -k off -cb on ".lith";
	setAttr -av -k off -cb on ".sobc";
	setAttr -av -k off -cb on ".cuth";
	setAttr -av -k off -cb on ".hgcd";
	setAttr -av -k off -cb on ".hgci";
	setAttr -av -k off -cb on ".mgcs";
	setAttr -av -k off -cb on ".twa";
	setAttr -av -k off -cb on ".twz";
	setAttr -cb on ".hwcc";
	setAttr -cb on ".hwdp";
	setAttr -cb on ".hwql";
	setAttr -k on ".hwfr";
	setAttr -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -k on ".bswa";
	setAttr -k on ".shml";
	setAttr -k on ".hwel";
select -ne :defaultHideFaceDataSet;
	setAttr -s 4 ".dnsm";
connectAttr "RIGBone_layer.di" "Reference_UMA_Male_Rig.do";
connectAttr "Reference_Pelvis.s" "Reference_Spine_1.is";
connectAttr "Reference_Spine_1.s" "Reference_Spine_2.is";
connectAttr "Reference_Spine_2.s" "Reference_Spine_3.is";
connectAttr "Reference_Spine_3.s" "Reference_Neck.is";
connectAttr "Reference_Neck.s" "Reference_Head.is";
connectAttr "Reference_Head.s" "Reference_Skull_Scale.is";
connectAttr "Reference_Spine_3.s" "Reference_R_Clavicle.is";
connectAttr "Reference_R_Clavicle.s" "Reference_R_Up_arm.is";
connectAttr "Reference_R_Up_arm.s" "Reference_R_ForeArm.is";
connectAttr "Reference_R_ForeArm.s" "Reference_R_Hand.is";
connectAttr "Reference_R_Hand.s" "Reference_R_Toe_1_01.is";
connectAttr "Reference_R_Toe_1_01.s" "Reference_R_Toe_1_02.is";
connectAttr "Reference_R_Hand.s" "Reference_R_Toe_2_01.is";
connectAttr "Reference_R_Toe_2_01.s" "Reference_R_Toe_2_02.is";
connectAttr "Reference_R_Hand.s" "Reference_R_Toe_3_01.is";
connectAttr "Reference_R_Toe_3_01.s" "Reference_R_Toe_3_02.is";
connectAttr "Reference_Spine_3.s" "Reference_L_Clavicle.is";
connectAttr "Reference_L_Clavicle.s" "Reference_L_Up_arm.is";
connectAttr "Reference_L_ForeArm.s" "Reference_L_Hand.is";
connectAttr "Reference_L_Hand.s" "Reference_L_Toe_1_01.is";
connectAttr "Reference_L_Toe_1_01.s" "Reference_L_Toe_1_02.is";
connectAttr "Reference_L_Hand.s" "Reference_L_Toe_2_01.is";
connectAttr "Reference_L_Toe_2_01.s" "Reference_L_Toe_2_02.is";
connectAttr "Reference_L_Hand.s" "Reference_L_Toe_3_01.is";
connectAttr "Reference_L_Toe_3_01.s" "Reference_L_Toe_3_02.is";
connectAttr "Reference_Pelvis.s" "Reference_R_Pre_Up_Leg.is";
connectAttr "Reference_R_Pre_Up_Leg.s" "Reference_R_Up_leg.is";
connectAttr "Reference_R_Up_leg.s" "Reference_R_leg.is";
connectAttr "Reference_R_leg.s" "Reference_R_foot.is";
connectAttr "Reference_R_foot.s" "Reference_R_toe.is";
connectAttr "Reference_Pelvis.s" "Reference_L_Pre_Up_Leg.is";
connectAttr "Reference_L_Pre_Up_Leg.s" "Reference_L_Up_leg.is";
connectAttr "Reference_L_Up_leg.s" "Reference_L_leg.is";
connectAttr "Reference_L_leg.s" "Reference_L_foot.is";
connectAttr "Reference_L_foot.s" "Reference_L_toe.is";
connectAttr "layerManager.dli[10]" "RIGBone_layer.id";
// End of reference_spacemarine_male_skeleton.ma
