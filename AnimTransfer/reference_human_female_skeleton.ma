//Maya ASCII 2019 scene
//Name: reference_human_female_skeleton.ma
//Last modified: Mon, Oct 16, 2023 09:30:10 PM
//Codeset: 1252
requires maya "2019";
requires -nodeType "gameFbxExporter" "gameFbxExporter" "1.0";
requires "stereoCamera" "10.0";
requires -nodeType "ngst2SkinLayerData" -dataType "ngst2SkinLayerDataStorage" "ngSkinTools2" "2.0.34";
requires -nodeType "aiOptions" "mtoa" "3.1.2";
requires "Mayatomr" "2012.0m - 3.9.1.36 ";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2019";
fileInfo "version" "2019";
fileInfo "cutIdentifier" "201812112215-434d8d9c04";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 19045)\n";
createNode transform -s -n "persp";
	rename -uid "0D2973EE-4135-DB39-1CA7-41AC57E859C9";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.20089846696262123 1.8286694097664287 0.57206280288296718 ;
	setAttr ".r" -type "double3" -50.138352719065772 -378.99999999976086 -8.409551021890162e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "37E9ACFA-46BF-712B-C4B8-69952A8797D8";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 1.105711247314354;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -4.76837158203125e-06 1.397674560546875 0.091498613357543945 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "DD33D812-4FB3-733C-50B1-13A8E38C031D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "7A9DB152-4A9A-E2C5-CC5A-878F9C9B4224";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "1A07675F-4058-21E3-D4AE-4E9FE20C8C68";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.18040226399898529 1.3382711410522461 1000.100038365606 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "53118C48-400C-7543-E95A-9380AACC9AB0";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1463018536156;
	setAttr ".ow" 0.71297506859546589;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" 0.18040226399898529 1.3382711410522461 -0.046263488009572029 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "B75CA9E3-4543-C52A-9B43-3FB07DDE0E1F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 1.5062117075011243 -0.060884406307575509 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "BD3074E7-43AC-55E3-6397-0B86C3AA1E56";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 0.62879488941376094;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "Reference_UMA_Male_Rig";
	rename -uid "B969DFC6-42FB-BF0D-BAF7-B795587FC931";
	addAttr -is true -ci true -h true -k true -sn "MaxHandle" -ln "MaxHandle" -smn 
		0 -smx 0 -at "long";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.779480544559006e-06 1.0808874811777249 -1.0013355343887649 ;
	setAttr ".r" -type "double3" -89.999999999999972 0 -8.6514237409574471e-06 ;
	setAttr ".rp" -type "double3" 6.3291529169581893e-14 -1.746856007067692e-09 -7.4999743304715594e-08 ;
	setAttr ".rpt" -type "double3" -1.632095015644216e-07 -1.080887479431113 1.0013356093885082 ;
	setAttr ".sp" -type "double3" 6.3291529169581893e-14 -1.7468560070676986e-09 -7.4999743304715594e-08 ;
	setAttr ".spt" -type "double3" -3.6734198463196485e-40 6.6174449004242214e-24 0 ;
	setAttr ".liw" yes;
createNode locator -n "Reference_UMA_Male_RigShape" -p "Reference_UMA_Male_Rig";
	rename -uid "6E593AB5-4853-6C7D-8D3F-B4AA86C588DE";
	setAttr -k off ".v";
createNode transform -n "Reference_Global" -p "Reference_UMA_Male_Rig";
	rename -uid "1B8D467E-4534-1F2E-00A3-0DB8482FD4E1";
	addAttr -is true -ci true -h true -k true -sn "MaxHandle" -ln "MaxHandle" -smn 
		0 -smx 0 -at "long";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -6.1555105457244963e-10 0 -1.3234889800848443e-22 ;
	setAttr ".r" -type "double3" 90.000045776367188 -89.999977111816406 0 ;
	setAttr ".liw" yes;
createNode locator -n "Reference_GlobalShape" -p "Reference_Global";
	rename -uid "E87B12F8-414F-2670-7C65-9C87DD595765";
	setAttr -k off ".v";
createNode transform -n "Reference_Position" -p "Reference_Global";
	rename -uid "F763D00B-4D8D-5B02-8122-F9887002B5CC";
	addAttr -is true -ci true -h true -k true -sn "MaxHandle" -ln "MaxHandle" -smn 
		0 -smx 0 -at "long";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0 2.1175823681357508e-21 0 ;
	setAttr ".rp" -type "double3" -1.4791141972893971e-31 -1.0339757656912846e-25 8.3819031715393066e-09 ;
	setAttr ".sp" -type "double3" -1.4791141972893971e-31 -1.0339757656912846e-25 8.3819031715393066e-09 ;
	setAttr ".liw" yes;
createNode locator -n "Reference_PositionShape" -p "Reference_Position";
	rename -uid "DBB3BCC3-4549-5B72-8CF5-1DB8D5920F36";
	setAttr -k off ".v";
	setAttr ".lp" -type "double3" 0 0 8.3819031715393066e-09 ;
createNode joint -n "Reference_Pelvis" -p "Reference_Position";
	rename -uid "BC21444C-4794-AA53-F0FF-0BBC267CB29F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.95947471151231778 -3.5758109185693766e-07 1.6787493686069368e-09 ;
	setAttr ".r" -type "double3" -89.999983036069892 -3.7124948056464686e-05 -89.999978942097144 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr -k on ".ssc";
	setAttr ".bps" -type "matrix" 0.99999999999997169 -1.8294025414811405e-07 -1.5099574884878858e-07 0
		 -1.5099569455835847e-07 2.9607675621607326e-07 -0.9999999999999446 0 1.8294029896234176e-07 0.99999999999993927 2.9607672867303669e-07 0
		 2.5013986340984517e-06 0.95947478651147489 -6.8391901184022601e-11 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Pre_Up_Leg" -p "Reference_Pelvis";
	rename -uid "CAB914F2-4D6C-71CE-716D-629D3202D138";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.0099992603935610547 -0.002428050041187181 -0.039748505825889291 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -7.6294093648864808e-06 -1.8302821342551471e-06 -2.2599200246016826e-29 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.99999999999997702 -1.5099580466493467e-07 -1.5099573939078039e-07 0
		 -1.5099571466470977e-07 1.6291844281631984e-07 -0.99999999999997513 0 1.5099582937282804e-07 0.99999999999997524 1.6291842009675927e-07 0
		 0.010001754887216432 0.91972627813743157 0.00242803669434176 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Up_leg" -p "Reference_L_Pre_Up_Leg";
	rename -uid "40F9FA13-497A-FB93-5A52-23AD6A1F4E42";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.096277245112815796 -3.7843155263096728e-08 -2.6360021054827598e-07 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -22.821475367863684 -79.991345021978503 -151.81636243745734 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.15319112859145514 0.98478152061193891 0.082084315079758496 0
		 0.09865379992603672 -0.067409246389017366 0.99283604953759508 0 0.98325983640186854 0.16019160453189041 -0.086825940573475521 0
		 0.10627899999999593 0.9197259999997548 0.0024280600000002655 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_leg" -p "Reference_L_Up_leg";
	rename -uid "D1F352D4-475E-396B-63D6-6598753E0161";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.39968156923173176 -3.1732561697028761e-05 -0.00021920973687766798 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.28826960764621851 2.5465290655501591 0.79616400010653499 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.19534251699237662 0.9756608733185973 0.099635141041073433 0
		 0.10567981578512403 -0.080060409996805609 0.9911720876249317 0 0.97502465486299617 0.20414747372018824 -0.087468459360845088 0
		 0.16728799999999591 0.5260939999997547 -0.030391999999999232 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_foot" -p "Reference_L_leg";
	rename -uid "4BE584E1-4515-3A69-8592-34AC187A5028";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.44246250177823987 3.7180286655003059e-08 2.6388941931632104e-07 ;
	setAttr ".r" -type "double3" -14.709 -18.652 0.645 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 13.258606923028765 6.3831868063060826 -60.513915949289178 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.025033081645243482 0.52811141640872938 -0.84880603006936028 0
		 -0.14999686831468645 0.84144429076604488 0.51910735405406694 0 0.98836950798733603 0.11432338954034393 0.10027900221321306 0
		 0.25371999999999706 0.094400699999755089 -0.074476799999998983 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_toe" -p "Reference_L_foot";
	rename -uid "05459142-40F5-8270-9FCB-449E20CB2D42";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.12751269912385643 -4.6917746898689217e-07 -1.1869053769819615e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -85.102271502625001 1.9151892503702426 -29.9859007693967 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.063563399935808881 0.033038749958747685 -0.99743076711607581 0
		 -0.99745280540083547 -0.030311178277780779 -0.064568827381447216 0 -0.032366575144784165 0.99899433105127067 0.031027912285893675 0
		 0.25052686146609177 0.027059257377606727 0.033756385351588952 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_A" -p "Reference_L_Up_leg";
	rename -uid "AD922F45-42E5-F235-0156-03BF1B0EB4B2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.027464961621785799 -0.043268472433213717 -0.0079358599029700494 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -166.90316862527129 -84.885594122187214 72.126361081373091 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.98352383668862886 0.18077849060460388 -2.3037127760971998e-15 0
		 -0.18077849060460396 0.98352383668862897 -1.1740825325845528e-14 0 -1.8041124150158794e-16 1.2000817006807551e-14 1 0
		 0.08999999999999958 0.94841842365713536 -0.037586958176367126 1;
	setAttr ".radi" 1.2000000000000002;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Sceart_____Front_00" -p "Reference_L_Up_leg";
	rename -uid "690C743F-43AC-AC6F-09B1-9991E5601518";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.076367245661115857 0.040546482368656836 -0.021307844703341405 ;
	setAttr ".jo" -type "double3" 178.84633930345402 16.16331244979764 115.89698634694179 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.1242147920651977 -0.51594310322870651 0.8475691120274097 0
		 -0.074814447192810329 0.85662285413753236 0.51049004325305103 0 -0.98943088890706932 -3.6082248300317588e-16 -0.1450052277559884 0
		 0.10102670121246134 0.83837440204031433 0.038265589980884085 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Sceart_Front_01" -p "Reference_L_Sceart_____Front_00";
	rename -uid "F2502AF1-44F3-4536-7613-5B99FBBF50BE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.084056137148565413 0.051000019430109012 -1.5427629689035438e-07 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -158.37641385657867 -8.5704287501212786 125.72892655269035 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.13577989848138874 0.985552881725691 -0.10123900676404353 0
		 0.22683586974658729 0.13039588567839952 0.96516444256637146 0 0.96442174766265643 0.10808529187790576 -0.24126388522730668 0
		 0.086770299999995915 0.83869399999975536 0.13554400000000022 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Sceart_Font_02" -p "Reference_L_Sceart_Front_01";
	rename -uid "46027925-4F9C-3231-AA53-7FA963700F17";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.34512469907573412 0.0012009657881922875 -0.0022663515503676124 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.13577989848138874 0.985552881725691 -0.10123900676404353 0
		 0.22683586974658729 0.13039588567839952 0.96516444256637146 0 0.96442174766265643 0.10808529187790576 -0.24126388522730668 0
		 0.13171799999999592 0.49846699999975502 0.17219000000000145 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Sceart_____Back_00" -p "Reference_L_Up_leg";
	rename -uid "B2897A4B-4559-68A9-18DF-B5AB1DAB7EFE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.068 -0.033324899023157807 -0.01 ;
	setAttr ".jo" -type "double3" 8.6640821402008203 3.3147730852885795 -120.93553815308729 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.062712120734534138 -0.45694219285386367 -0.88728294376871619 0
		 -0.032215773112077961 0.88949639256710955 -0.4558051245575116 0 0.99751157079793706 -3.3306690738754696e-16 -0.07050295117391675 0
		 0.10357577045941022 0.85340534688196523 -0.035371575117079813 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Sceart_Back_01" -p "Reference_L_Sceart_____Back_00";
	rename -uid "35FE34AF-419C-E0DC-E871-DBB249BC14E0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.081615722354875853 0.041675627435646456 3.1515556742953144e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -2.9191575918076662 6.7123026480055046 127.47350184572602 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.10409325504850769 0.9771920651797531 0.18509527817622615 0
		 0.018753544802592732 -0.1841447154037352 0.98272021875313731 0 0.99439071737961382 0.10576573896402194 0.00084240765126911143 0
		 0.09714629999999598 0.85318199999975453 -0.12678599999999982 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Sceart_Back_02" -p "Reference_L_Sceart_Back_01";
	rename -uid "06014AA8-459A-3E74-12B3-B1A4801AC587";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.3348230050919665 0.011165516206969039 -0.0040612903992303662 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.10409325504850769 0.9771920651797531 0.18509527817622615 0
		 0.018753544802592732 -0.1841447154037352 0.98272021875313731 0 0.99439071737961382 0.10576573896402194 0.00084240765126911143 0
		 0.12816999999999568 0.52350999999975456 -0.17779099999999937 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Pre_Up_Leg" -p "Reference_Pelvis";
	rename -uid "F1FCA478-4092-8B88-1CE0-1591279DB7EF";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.0099992589811724823 -0.0024280499304019237 -0.039748711508191703 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999236361637 -3.6605642685089013e-06 -4.5198400492033725e-29 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.99999999999998135 -1.1905135518177949e-07 -1.5099572993277209e-07 0
		 1.5099571042553222e-07 -1.6279671886471323e-07 0.99999999999997535 0 -1.1905137987129229e-07 -0.99999999999997979 -1.6279670096862873e-07 0
		 -0.0099967644875541811 0.91972607611366342 0.0024280396031870137 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Up_leg" -p "Reference_R_Pre_Up_Leg";
	rename -uid "A0F36E8B-491C-935E-05C0-66A350CA3091";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -0.096276874044815899 1.7966384643040845e-09 -4.8721513490335155e-09 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -22.821517450522219 -79.991358656793651 -151.81630369239821 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.15319112859145523 -0.98478152061193924 -0.082084315079759274 0
		 0.098653799926038427 0.067409246389017921 -0.99283604953759508 0 0.98325983640186843 -0.16019160453189063 0.086825940573476881 0
		 -0.10627363853236743 0.91972609244770676 0.002428055937223143 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_leg" -p "Reference_R_Up_leg";
	rename -uid "50BCDDA5-44D8-8851-1C8A-E89F841FBD7E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0.39968194584525846 3.1626161781810047e-05 0.00021886618967276172 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.28826960765100518 2.5465290655502399 0.79616400010654587 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.19534251699237803 -0.9756608733185973 -0.099635141041074585 0
		 0.10567981578520723 0.080060409996789303 -0.99117208762492426 0 0.97502465486298695 -0.20414747372019651 0.087468459360929063 0
		 -0.16728304451914308 0.52609376942670483 -0.030391959167977746 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_foot" -p "Reference_R_leg";
	rename -uid "63BDC1E7-426E-697C-5267-4DB76D585DDB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.44246220003967879 4.9786316812239217e-08 -1.9721412114481751e-08 ;
	setAttr ".r" -type "double3" -14.709 -18.652 0.645 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 13.258606923026498 6.3831868063017323 -60.513915949289391 ;
	setAttr -k on ".ssc" no;
	setAttr ".pa" -type "double3" -14.709 -18.652 0.645 ;
	setAttr ".bps" -type "matrix" 0.025033081645244315 -0.52811141640873083 0.84880603006935951 0
		 -0.14999686831468484 -0.84144429076604432 -0.51910735405406816 0 0.98836950798733636 -0.11432338954034196 -0.1002790022132133 0
		 -0.25371473831633323 0.094400720937513338 -0.074476793946084405 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_toe" -p "Reference_R_foot";
	rename -uid "428DA39E-46DB-548B-7D16-E8AF7985D591";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 0.12751294480759978 4.3471307165088291e-07 4.8551875214686291e-07 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -85.102271502625001 1.9151892503701882 -29.98590076939675 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.063563399935809839 -0.033038749958748413 0.9974307671160757 0
		 -0.99745280540083547 0.030311178277778836 0.06456882738144834 0 -0.032366575144782264 -0.99899433105127067 -0.031027912285894306 0
		 -0.25052228169180824 0.027059257751741797 0.033756688168419285 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_A" -p "Reference_R_Up_leg";
	rename -uid "FEE653CE-49F4-B34A-A975-EEADC79986FE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -0.027464049584964512 0.043267933238540585 0.0079306033493262151 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 13.095656552098754 -84.885618583538232 72.127540600018875 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.98352417730575048 -0.18077663747024017 -1.9428902930940239e-16 0
		 0.1807766374702402 0.98352417730575059 4.8982085748550119e-15 0 -8.3266726846886741e-16 -4.603956105242446e-15 1 0
		 -0.09000000000000026 0.94841842365713558 -0.037586958176367126 1;
	setAttr ".radi" 1.2000000000000002;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Sceart_____Front_00" -p "Reference_R_Up_leg";
	rename -uid "F0E546DE-47D5-D88B-519E-ABACD000CFAE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0.076 -0.040587032252631439 0.021358018984509369 ;
	setAttr ".jo" -type "double3" -178.84623545898833 -16.163168790992408 -64.103078650408122 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.12421241873064243 -0.51594212681509144 0.84757005422006493 0
		 0.074812824792564236 0.85662344222973508 0.51048929417671141 0 -0.98943130953070246 2.0816681711721685e-15 0.14500235763724462 0
		 -0.10091974701218412 0.83872538029313159 0.038340346842435195 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Sceart_Front_01" -p "Reference_R_Sceart_____Front_00";
	rename -uid "06344E68-43BB-5065-BC93-35BCA5532739";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.084161441991012664 0.050653734837815434 8.9938936231839794e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -158.37658137808896 -8.5704152230418593 -54.271113790474921 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.13577989848138891 -0.98555288172569122 0.10123900676404142 0
		 0.22683586974658407 -0.13039588567839686 -0.9651644425663729 0 0.96442174766265742 -0.10808529187790672 0.24126388522730285 0
		 -0.086765290148564961 0.83869412361502527 0.13554429549656435 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Sceart_Font_02" -p "Reference_R_Sceart_Front_01";
	rename -uid "83142F72-4D56-E489-1FBE-429B9C6C1165";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 0.34512464929854608 -0.0012010830610064693 0.0022664515878428326 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.4787793291936192e-06 0 0 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.13577989848138891 -0.98555288172569122 0.10123900676404142 0
		 0.22683589463789286 -0.13039588846803152 -0.96516443633945592 0 0.96442174180812124 -0.10808528851244517 0.24126391013778029 0
		 -0.13171291351318759 0.49846717715238875 0.17219042778015206 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Sceart_____Back_00" -p "Reference_R_Up_leg";
	rename -uid "E9E26029-4086-A14D-CED9-AD91AFEA3084";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0.068 0.032798812384837776 0.01 ;
	setAttr ".jo" -type "double3" -8.6641363955374437 -3.3146695519016505 59.064375606402777 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.062710073914620662 -0.45694327208468749 -0.88728253263893464 0
		 0.032214817808062401 0.88949583815582833 -0.4558062739992223 0 0.99751173032862916 -3.8857805861880479e-16 0.070500694016327414 0
		 -0.10362230943774224 0.85336997622609267 -0.034849261400152806 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Sceart_Back_01" -p "Reference_R_Sceart_____Back_00";
	rename -uid "9A0EF999-41E4-4F4F-68A6-6B976340054E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.082022267775836044 0.042018016041274753 -4.163336342344337e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -2.9190291457959701 6.7122795032612377 -52.526413623713985 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.10409325504850844 -0.97719206517975354 -0.18509527817622698 0
		 0.018753544802588978 0.18414471540373648 -0.98272021875313742 0 0.99439071737961382 -0.10576573896402192 -0.00084240765127328865 0
		 -0.097125084231452996 0.85326530320107441 -0.12677826221769878 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Sceart_Back_02" -p "Reference_R_Sceart_Back_01";
	rename -uid "B32EEE66-41B6-3ACA-4108-69A05FE03044";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 0.33482362779094299 -0.011165506473845288 0.004061554165147363 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.10409325504850844 -0.97719206517975354 -0.18509527817622698 0
		 0.018753544802588978 0.18414471540373648 -0.98272021875313742 0 0.99439071737961382 -0.10576573896402192 -0.00084240765127328865 0
		 -0.12814858658130629 0.52359266859948161 -0.17778338726347481 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_Spine_1" -p "Reference_Pelvis";
	rename -uid "5551A098-4157-1CC4-69FC-CEBB21CCE64D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0 0.0015262621265289896 0.034083574638656744 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000000000000455 -86.834388706153334 -90.000000000000696 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 1.9099946721416929e-07 0.99847407184529768 0.055222530299095601 0
		 -1.4066291218240629e-07 0.055222530299122809 -0.99847407184530457 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5074034344226795e-06 0.99355836160202027 -0.0015262521035675255 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_Stomach" -p "Reference_Spine_1";
	rename -uid "2496106B-459B-B786-FE07-5C998B549385";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.061115573774179532 -0.028953674733701616 1.2736977869377345e-10 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 2.5027866421503311 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 1.8467480778841807e-07 0.99993308254271895 0.011568510560203409 0
		 -1.4886929404025099e-07 0.011568510560230887 -0.99993308254272473 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5230218148797669e-06 1.0529817822212342 0.0307581980271673 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_Spine_2" -p "Reference_Spine_1";
	rename -uid "C18F9385-4ACF-0FA2-F841-D38D95187484";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.11178850278288222 9.0205620750793969e-17 -1.4893295608277637e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 8.0377951375686809 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 1.6945472294488251e-07 0.99638667242739731 -0.084932908869468166 0
		 -1.6598779536883122e-07 -0.084932908869440243 -0.99638667242740042 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5287549790438125e-06 1.105176283161134 0.0046469918784506304 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_Spine_3" -p "Reference_Spine_2";
	rename -uid "956B4F87-4D2B-AF31-2E7C-AB807E1154C6";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.11916307417334115 1.2699880730382418e-09 -7.621089115076511e-14 ;
	setAttr ".jo" -type "double3" 0 0 5.5019838778232151 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 1.5275907850020733e-07 0.98365281271709404 -0.18007538430814429 0
		 -1.8147042534666462e-07 -0.1800753843081162 -0.98365281271709437 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5489478007632051e-06 1.2239087820050647 -0.0054738759063186196 1;
	setAttr -k on ".liw" yes;
	setAttr ".fbxID" 5;
createNode joint -n "Reference_R_B" -p "Reference_Spine_3";
	rename -uid "3FA27E30-4BBC-7C13-43C0-7E8181BFC924";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.048247482426039712 -0.084855629795413334 0.068297627635209107 ;
	setAttr ".jo" -type "double3" -8.9932938678382204 0 0 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 1.5275907850020733e-07 0.98365281271709404 -0.18007538430814429 0
		 0.15631868165005183 -0.17786168201954136 -0.97156044167945066 0 -0.9877066719260158 -0.028148998257997895 -0.15376333805528802 0
		 -0.068295055918378228 1.2866479764404588 0.069306429389701787 1;
	setAttr -k on ".liw" yes;
	setAttr ".fbxID" 5;
createNode joint -n "Reference_L_B" -p "Reference_Spine_3";
	rename -uid "C9696E64-469C-FDFA-369A-CC80F2F5CFA7";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.048249499064359824 -0.084855990067367271 -0.068297628282795425 ;
	setAttr ".jo" -type "double3" -8.9932730728591039 1.7504901008125531e-05 -179.99999999999682 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 1.5275907932726171e-07 -0.98365281271709382 0.18007538430814446 0
		 0.15631868165004908 0.17786168201954181 0.97156044167945088 0 -0.98770667192601624 0.028148998257996393 0.15376333805528566 0
		 0.068300199999995884 1.2866499999997545 0.069306399999999727 1;
	setAttr -k on ".liw" yes;
	setAttr ".fbxID" 5;
createNode joint -n "Reference_L_Clavicle" -p "Reference_Spine_3";
	rename -uid "160531B8-4BBB-3B5E-C27F-AB8DAA6D47A8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.15735811436386626 -0.015468368216285583 -0.033641324207264262 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -117.00694803783951 -72.042842018401387 -74.507723939282357 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.95128724650677166 0.13450615265011098 0.27741786087566422 0
		 0.27468561553524995 -0.038839183191062644 0.9607493588168935 0 0.14000138303454407 0.99015130800717321 3.1430042408913212e-07 0
		 0.03364389999999598 1.3814799999997547 -0.01859470000000054 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Up_arm" -p "Reference_L_Clavicle";
	rename -uid "49183C0D-452E-4E8D-4831-84B3A6347995";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.6559915413500637 -24.871877718164974 -7.8987578856050424 ;
	setAttr -k on ".ssc";
	setAttr ".bps" -type "matrix" -0.8302313574713035 0.54216366200546373 0.12951624095912284 0
		 0.10668056664112087 -0.07351128430683726 0.99157215964380963 0 0.54711529842665318 0.83705116610657948 0.0031930466845564143 0
		 0.14779836958080858 1.3653392616817415 -0.051884843305080246 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_ForeArm" -p "Reference_L_Up_arm";
	rename -uid "A0A99177-433D-10D8-B974-7EA710DE151A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.2408564528256989 -0.00032512178276392079 9.5234753917150528e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.58399405252764214 -0.18689608549253453 148.00558215904994 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.76242286913840851 -0.4960247526686955 0.41553677737923128 0
		 0.35494420561457446 -0.21635345693317737 -0.90950854453034291 0 0.54104156911959733 0.84092248537723335 0.011108288418149675 0
		 0.34778236958080888 1.2348592616817418 -0.083401743305080281 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Hand" -p "Reference_L_ForeArm";
	rename -uid "FD5C54E7-40EA-E13B-D4F5-85B90906A1A1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 7;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.22174829516515565 -1.3600842065641938e-06 2.7933669530799676e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.8549895097368396 -4.6486431641011778 -168.83091672131351 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.77020140754512911 0.59495272147322864 -0.22982830771491225 0
		 -0.2407882510503162 0.062439744370431635 0.96856713576245446 0 0.59060207413421051 0.80133172752272441 0.09516644626030013 0
		 0.51684936958080874 1.1248692616817411 0.0087440966949199894 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Toe_2_01" -p "Reference_L_Hand";
	rename -uid "EA1DF7DA-4833-126D-553E-899AF978F939";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.084168033016549265 -0.014726827678484301 -0.017838380597151593 ;
	setAttr ".r" -type "double3" 0.569 8.45 -6.091 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -4.2469893148261431 -55.538782259704128 24.28462193657484 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.11615866541956366 0.98971641398843957 0.083478046993261931 0
		 0.036648232435356781 -0.079718897418660617 0.99614346579883617 0 0.99255431665340599 0.1187700184230705 -0.027011316452065379 0
		 0.57468636958080832 1.0595792616817412 0.012126756694919983 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Toe_2_02" -p "Reference_L_Toe_2_01";
	rename -uid "0937786A-4354-2822-8BE0-0E9E4079945C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.04315226739266298 8.578789190416547e-07 -1.5564560928993387e-07 ;
	setAttr ".r" -type "double3" 0 20.439 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.45545568675615739 0.88593265644212016 0.087655265962090487 0
		 0.036648232435356781 -0.079718897418660617 0.99614346579883617 0 0.88950380800806061 0.45691161688422965 0.0038405592558958535 0
		 0.57969875632399281 1.0168706674672112 0.0085253484643219163 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Toe_1_01" -p "Reference_L_Hand";
	rename -uid "55F11AEC-4202-90AC-56B9-A093254E749A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.083915379297889447 0.028846179114232463 -0.027910369694658321 ;
	setAttr ".r" -type "double3" 4.259 11.917 3.5909999999999997 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -7.6524879976732709 -45.34641193649658 -3.3185085081846175 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.31998431244120268 0.93455790837144059 -0.15560062882883371 0
		 -0.33666171711770637 0.041356127155785523 0.94071704511719767 0 0.88558959344545585 0.35339947176965664 0.30139655826508638 0
		 0.55805136958080859 1.0543792616817413 0.05331355669491996 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Toe_1_02" -p "Reference_L_Toe_1_01";
	rename -uid "12FEBDBA-4732-99F5-ADB0-2CABCA0BC5E5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.04297708924443977 2.0787860587068163e-07 3.4970896778396821e-07 ;
	setAttr ".r" -type "double3" 0 14.525 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.53186507774956804 0.8160544075152022 -0.22621835258320183 0
		 -0.33666171711770637 0.041356127155785523 0.94071704511719767 0 0.77703180584696985 0.57649360336580191 0.25273839831040762 0
		 0.57180360364726901 1.0142148152335835 0.060001119762614838 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Toe_3_01" -p "Reference_L_Hand";
	rename -uid "F2815ADD-4165-469B-349D-E38F2D00401B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.033512186269922473 0.046450601970531982 -0.03518168109509312 ;
	setAttr ".r" -type "double3" 0 0 2.711 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -57.721453579615741 -52.360142820075808 -24.247525694534279 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.052027759925012629 0.95351096687868353 -0.29683319935489549 0
		 -0.99863172036379955 0.048106325333105437 -0.020505329701894288 0 -0.0052725022923861553 0.29749389490378336 0.95470916158511498 0
		 0.51069736958080847 1.079639261681741 0.058088556694919975 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Toe_3_02" -p "Reference_L_Toe_3_01";
	rename -uid "1D257381-4BAA-DD41-E8F0-B095BC975336";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.029078489221788351 -6.6934553949460351e-07 -1.5938323247866037e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 3.0200699003046635e-06 0 0 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.052027759925012629 0.95351096687868353 -0.29683319935489549 0
		 -0.99863172064171257 0.048106341014057176 -0.020505279379018349 0 -0.0052724496543449899 0.29749389236809065 0.95470916266595296 0
		 0.5091851577577674 1.0519120969533617 0.066718509761858724 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_WeaponBone" -p "Reference_L_Hand";
	rename -uid "0D51BBF5-4B7E-52B4-3E63-BE86D393D5E0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.06 3.4694469519536142e-17 -0.041 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -5.4660000000000064 0 0 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.77020140754512911 0.59495272147322864 -0.22982830771491225 0
		 -0.29595119604120484 -0.014175073773188468 0.95509787814930502 0 0.56498024866120933 0.80363569264631551 0.18699463128013766 0
		 0.53884676899401385 1.0563174975649157 0.01863197086114245 1;
	setAttr ".radi" 2.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_Neck" -p "Reference_Spine_3";
	rename -uid "0CA22591-4B4B-9FE9-986A-8DB66F718063";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.21781902398372943 -2.8435689636285844e-09 7.5886162859226808e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -19.823824727444091 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 2.0524845718774885e-07 0.98643019143286004 0.16418123348814512 0
		 -1.1891140467499624e-07 0.16418123348817143 -0.98643019143286992 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5822215587766349e-06 1.4381670781220091 -0.044697717562728986 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_Head" -p "Reference_Neck";
	rename -uid "BEC6EF15-48E2-0A76-6926-9CBCD279671F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.079581973492034219 0 -1.20249879389904e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 2.0524845718774885e-07 0.98643019143286004 0.16418123348814512 0
		 -1.1891140467499624e-07 0.16418123348817143 -0.98643019143286992 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5985556361760812e-06 1.5166691394683611 -0.031631850991385942 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_Jaw_Scale" -p "Reference_Head";
	rename -uid "C8E605E4-4541-E936-CD1C-7E8E4B58EDEE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.0075038591181066927 -0.053131384575175966 1.7148054962221222e-16 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999967 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 80.500000000000014 90 0 ;
	setAttr ".bps" -type "matrix" 0.99999999999997169 -1.8294025370402609e-07 -1.5099574467157432e-07 0
		 1.8280755541086927e-07 0.99999961424632022 -0.00087835481270495674 0 1.5115637275495145e-07 0.00087835481267739546 0.99999961424632544 0
		 2.6064137190837081e-06 1.5153479963982335 0.022010543712130341 1;
	setAttr ".radi" 1.2;
	setAttr ".liw" yes;
createNode joint -n "Reference_Skull_Scale" -p "Reference_Head";
	rename -uid "7B961061-4080-0249-8E8A-2AAE9ABF7376";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.12835201785126871 -0.026326570153564599 2.6330773054109973e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 80.550300479111314 89.999958627890123 0 ;
	setAttr ".bps" -type "matrix" 0.99999999999985922 5.2934080083643703e-07 -3.2443835838722501e-08 0
		 -5.2934081530812633e-07 0.99999999999976041 -4.4594975956581215e-07 0 3.2443599762747184e-08 4.4594977692246147e-07 0.99999999999990008 0
		 -5.0470861566992686e-09 1.6389571162473386 0.015410465256876969 1;
	setAttr ".radi" 1.2;
	setAttr ".liw" yes;
createNode joint -n "Reference_Face_Scale" -p "Reference_Head";
	rename -uid "A139E323-4ACE-ACCF-FB7D-68A15BB91664";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.065319685473054445 -0.056294554965123034 2.6293057754101307e-06 ;
	setAttr ".s" -type "double3" 1.0568583523819695 1 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99463009514182 89.981575411470132 99.476998561523814 ;
	setAttr ".bps" -type "matrix" 1.0568582976872687 -3.5541951639561768e-07 -0.00034001319497607062 0
		 1.5271573657106874e-07 0.99999983719263041 -0.00057062657602008468 0 0.0003217208263196034 0.0005706264973571525 0.99999978544053214 0
		 -1.0649309960185102e-08 1.5718599398415198 0.034623064171909364 1;
	setAttr ".radi" 1.2;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_eyelish_top" -p "Reference_Face_Scale";
	rename -uid "4E1BE160-45FE-2097-DCF4-A8A7078FA2EC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90.069807204163652 -74.707755502777218 90.067316820280283 ;
	setAttr ".bps" -type "matrix" 4.9897501426369745e-07 0.26429268349309304 0.96444252159046284 0
		 3.6081489362519727e-07 0.96444252159047272 -0.26429268349328233 0 -0.99999999999981004 4.7986067121757821e-07 3.8587198466458628e-07 0
		 0.037394633549827007 1.5853041693576744 0.066242895541019253 1;
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_eyelish_top_end" -p "Reference_L_eyelish_top";
	rename -uid "68C910DB-41F3-B470-03BC-7FB327E05AF8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.024091543708911645 -0.0010717872006749118 -6.9388939039072284e-18 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 2.7493991180225975e-05 1.5166066558187088e-21 65.225397849231626 ;
	setAttr ".bps" -type "matrix" 5.3670199228378633e-07 0.98643019143262045 0.16418123348883606 0
		 -7.8171232920951636e-07 0.16418123348922337 -0.98643019143239197 0 -0.99999999999955003 4.010765544140389e-07 8.5922103783460098e-07 0
		 0.037394645184188592 1.5906377109435665 0.089761070220048977 1;
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_eye" -p "Reference_Face_Scale";
	rename -uid "708E9D86-44C8-4970-3E7A-9DB507C83751";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.035373197515654216 0.013426373544768611 0.031638413187116313 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 98.995205439988098 -89.882225462206293 -98.995186747001668 ;
	setAttr ".bps" -type "matrix" 3.3122999526578704e-07 -0.0014596460313448661 0.99999893471610923 0
		 1.5338851954763608e-07 0.99999893471615242 0.0014596460312941591 0 -0.99999999999993316 1.529048775003811e-07 3.3145353548494566e-07 0
		 0.037394627447692397 1.5853043523449499 0.066241781771236546 1;
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_eye_end" -p "Reference_L_eye";
	rename -uid "DCB33BFC-4BB2-DDCE-0F47-9590B8996FDF";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.0226124757121835 3.3006245204969531e-05 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 80.633957616980112 ;
	setAttr ".bps" -type "matrix" 2.0524843795826051e-07 0.98643019143272537 0.16418123348895353 0
		 -3.0185166292151331e-07 0.16418123348901059 -0.98643019143269106 0 -0.99999999999993316 1.529048775003811e-07 3.3145353548494566e-07 0
		 0.037394634942685398 1.5853043523445618 0.088854281572148766 1;
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_eyelish_bottom" -p "Reference_Face_Scale";
	rename -uid "C81ABF66-46C1-3D3F-821C-A1B90F5D270D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.035373199827749953 0.013428192200802602 0.031631219121535492 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.035150740262651 -58.408117211637901 -90.029941442353163 ;
	setAttr ".bps" -type "matrix" 2.0240434167487047e-07 -0.52337901757124272 0.85209999645940582 0
		 3.0376608899069331e-07 0.85209999645941636 0.52337901757117689 0 -0.99999999999993305 1.5290489784190845e-07 3.3145353613947852e-07 0
		 0.037394627577046986 1.5853061668955626 0.066234586668639669 1;
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_eyelish_bottom_end" -p "Reference_L_eyelish_bottom";
	rename -uid "7CAF5EA1-4F58-5D4C-F3FA-2C97E6051B26";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.023259400696694521 -0.0001217631301004829 4.163336342344337e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 92.653639710915812 ;
	setAttr ".bps" -type "matrix" 2.9406939411204389e-07 0.87541776193144427 0.48336708834472214 0
		 -2.1625111744477734e-07 0.48336708834478737 -0.87541776193143073 0 -0.99999999999993305 1.5290489784190845e-07 3.3145353613947852e-07 0
		 0.037394632247863123 1.5730289302469032 0.08599019365253259 1;
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_eyebrow" -p "Reference_Face_Scale";
	rename -uid "D913AFDA-41B5-8BC9-33C2-689F07900907";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -6.137673526732871 -0.018405608862237421 1.4432909925189895e-06 ;
	setAttr ".bps" -type "matrix" 0.99999999999987532 -1.2780078250255367e-07 -4.8228354135689726e-07 0
		 7.5222054094155647e-08 0.99420668564519554 -0.10748519069336789 0 4.9322621255369061e-07 0.10748519069331824 0.99420668564508141 0
		 -0.03075553150909285 1.5994467767280758 0.087398998492908081 1;
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_eyebrow" -p "Reference_Face_Scale";
	rename -uid "95EABB9A-4131-317E-5023-81A71C452B98";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -6.0980542300299447 -0.044383878388844958 0.0027744606929126598 ;
	setAttr ".bps" -type "matrix" 0.9999998962649026 4.8529186383005928e-05 0.00045289634740355438 0
		 1.1663193898372998e-07 0.99428077541112725 -0.10679765750162283 0 -0.00045548893490355603 0.10679764647577966 0.99428067226365435 0
		 0.030753624257374754 1.5994467667161469 0.087397914578391467 1;
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_eyelish_bottom" -p "Reference_Face_Scale";
	rename -uid "1BCEF69F-4942-C8F9-11C7-1D9C237FB6BB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.035347247894109 -58.609750070074334 -90.030192537537474 ;
	setAttr ".bps" -type "matrix" 7.9801690699825029e-08 -0.52037710835607287 0.85393656971637255 0
		 6.1056952441532197e-07 0.85393656971624166 0.52037710835593587 0 -0.99999999999980982 4.7986067213414536e-07 3.85871985774213e-07 0
		 -0.037394051335242109 1.5853069355249281 0.066236160959218568 1;
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_eyelish_bottom_end" -p "Reference_R_eyelish_bottom";
	rename -uid "DBABE68F-4B4A-624B-8C3A-CEBB9B40D693";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.023258826356405415 -0.00020361814288549773 -8.4134990641082652e-12 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.516606655818822e-21 2.2108836157778215e-05 92.452006809943981 ;
	setAttr ".bps" -type "matrix" 9.9246835858038276e-07 0.87541776193109455 0.48336708834442593 0
		 -1.058503340734074e-07 0.48336708834475312 -0.87541776193146992 0 -0.99999999999950129 8.1765986140474898e-07 5.7238980351035724e-07 0
		 -0.037394049595057974 1.5730296977433582 0.085991765133232603 1;
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_eye" -p "Reference_Face_Scale";
	rename -uid "AB86A3BC-489D-36B0-BF2F-20A58DC40DC9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.035391897408792908 0.01342714993417049 0.03161579972007772 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 93.950054866054302 -89.732687548166197 -93.950012012337794 ;
	setAttr ".bps" -type "matrix" 3.3082634453093394e-07 -0.0040837616643982864 0.99999166141051343 0
		 1.5425720441241031e-07 0.9999916614105564 0.0040837616643474659 0 -0.99999999999993316 1.5290490208435436e-07 3.3145353569294985e-07 0
		 -0.037394057584941499 1.5853051409816779 0.066243228932039516 1;
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_eye_end" -p "Reference_R_eye";
	rename -uid "DEC61201-467D-7AF3-7E17-88A54C6F53AB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.0226123112462129 9.2344060204974099e-05 -2.5817884266657321e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 80.784308988374235 ;
	setAttr ".bps" -type "matrix" 2.0524846224309181e-07 0.98643019143272548 0.16418123348895317 0
		 -3.0185165909048514e-07 0.16418123348901023 -0.98643019143269117 0 -0.99999999999993316 1.5290490208435436e-07 3.3145353569294985e-07 0
		 -0.037391468301521825 1.5853051409816581 0.088855728733748848 1;
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_eyelish_top" -p "Reference_Face_Scale";
	rename -uid "60F44501-4F0B-9642-BCD1-0ABDA137873D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.03539189776109488 0.013426980873064043 0.031616895904520201 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90.068569595470564 -74.422094522262199 90.066050775707126 ;
	setAttr ".bps" -type "matrix" 3.6037353437772153e-07 0.26909782695394213 0.96311284880253567 0
		 5.8071245855506777e-08 0.96311284880259107 -0.26909782695397927 0 -0.99999999999993305 1.5290489792479507e-07 3.3145353547329049e-07 0
		 -0.037394057604635218 1.585304972546111 0.066244325212837338 1;
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_eyelish_top_end" -p "Reference_R_eyelish_top";
	rename -uid "6700EBAC-44E8-3A1C-ECDE-C4AFA269D7DB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.023907575835353023 -0.0015416931201883699 -2.7755575615628914e-17 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 64.939736670118052 ;
	setAttr ".bps" -type "matrix" 2.0524845809018961e-07 0.9864301914327257 0.16418123348895247 0
		 -3.0185165947316118e-07 0.16418123348900959 -0.98643019143269117 0 -0.99999999999993305 1.5290489792479507e-07 3.3145353547329049e-07 0
		 -0.037394049078505631 1.5902536247981771 0.089684884952059438 1;
	setAttr ".radi" 0.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_Neck_Muscl" -p "Reference_Spine_3";
	rename -uid "17F84229-4510-7D0B-E83C-68882E7CAAD9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.20894722221534301 0.018938149775890423 -0.05601762257032579 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 5.4630561415494765e-05 -1.9908851153540454e-05 -19.823824727442098 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -1.4222654573100281e-07 0.9864301914328697 0.16418123348815328 0
		 -1.072394573588146e-06 0.16418123348791008 -0.98643019143233757 0 -0.99999999999941469 -3.1636362272553445e-07 1.0344914549251238e-06 0
		 0.056020199999995995 1.4260299999997543 -0.061728700000000601 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Neck_Muscl" -p "Reference_Spine_3";
	rename -uid "264EE2A3-479D-A764-D75E-A6AFBC7DB9E9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.20894543857588199 0.018938451333547879 0.056017657209175342 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 3.6108895531108602e-06 160.17617527255592 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -1.4222654556009906e-07 -0.9864301914328697 -0.16418123348815405 0
		 1.1891140467499633e-07 -0.1641812334881711 0.98643019143287003 0 -0.99999999999998268 1.2077353735269701e-07 1.406487294837654e-07 0
		 -0.056015079779829155 1.426028211710433 -0.061728658521626636 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Clavicle" -p "Reference_Spine_3";
	rename -uid "C4B21A9F-40E7-3016-0CFA-8C9220935CBC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.15735810408582296 -0.015468356006465345 0.033641375792733887 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -117.00698473632877 -72.042817303266617 105.4923109715226 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.95128724650677121 -0.13450615265011126 -0.27741786087566511 0
		 0.27468561553525156 0.038839183191059695 -0.96074935881689294 0 0.14000138303454332 -0.99015130800717321 -3.1430042097759677e-07 0
		 -0.033638800000004049 1.3814799999997545 -0.018594700000000571 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Up_arm" -p "Reference_R_Clavicle";
	rename -uid "DF322826-46CF-D6E8-C0E9-66B715513E18";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.6559915413499873 -24.871877718164974 -7.8987578856050389 ;
	setAttr -k on ".ssc";
	setAttr ".bps" -type "matrix" -0.83023135747130361 -0.54216366200546362 -0.12951624095912245 0
		 0.10668056664112335 0.073511284306833208 -0.99157215964380951 0 0.5471152984266523 -0.83705116610657981 -0.0031930466845518347 0
		 -0.14780600000000405 1.3653399999997546 -0.051888600000000631 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_ForeArm" -p "Reference_R_Up_arm";
	rename -uid "8754F074-4FDB-E020-79B3-3B97D32A841F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 6;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.24085645282569895 0.00032512178276367099 -9.5234753916484394e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.58399405252767367 -0.18689608549245373 148.00558215904994 ;
	setAttr -k on ".ssc" no;
	setAttr ".pa" -type "double3" 0 1.049 2.131 ;
	setAttr ".bps" -type "matrix" 0.76242286913840907 0.49602475266869445 -0.41553677737923145 0
		 0.35494420561457268 0.21635345693318031 0.90950854453034269 0 0.54104156911959733 -0.84092248537723324 -0.011108288418146177 0
		 -0.3477900000000041 1.2348599999997543 -0.08340550000000034 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Hand" -p "Reference_R_ForeArm";
	rename -uid "F7C8DF75-40F8-AA39-8837-D79BDC681805";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 7;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.22168470728889489 3.8528612344732112e-05 0.00085295613297412074 ;
	setAttr ".r" -type "double3" 5.466 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.8549895097369964 -4.6486431641010979 -168.83091672131354 ;
	setAttr -k on ".ssc" no;
	setAttr ".pa" -type "double3" 5.466 0 0 ;
	setAttr ".bps" -type "matrix" -0.77020140754513056 -0.5949527214732272 0.22982830771491336 0
		 -0.18343552912296365 -0.13848672288091177 -0.97322804842497446 0 0.61085284518521987 -0.79174028999243573 -0.0024727983773980746 0
		 -0.51633233034303516 1.1241899637035615 0.008738216080488595 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Toe_2_01" -p "Reference_R_Hand";
	rename -uid "6C35F229-4DF7-85C1-8EF8-BE8FB14E057C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.084168033016549598 0.014726827678484357 0.017838380597151593 ;
	setAttr ".r" -type "double3" 0.569 8.45 -6.091 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -4.246989314825826 -55.538782259704163 24.284621936574943 ;
	setAttr -k on ".ssc" no;
	setAttr ".pa" -type "double3" 0.569 8.45 -6.091 ;
	setAttr ".bps" -type "matrix" -0.091540753958193832 -0.9956665789547825 -0.016381511445700735 0
		 0.092256810880831985 0.0079001114213965995 -0.9957039063324139 0 0.99151851783557943 -0.092658792308175753 0.091133841119127715 0
		 -0.57296346572892531 1.0579511286687073 0.013705740192756869 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Toe_2_02" -p "Reference_R_Toe_2_01";
	rename -uid "15DE6E71-4A13-57F4-4E7A-EC989B3D3064";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.043152267392663202 -8.5787891906941027e-07 1.5564560940095618e-07 ;
	setAttr ".r" -type "double3" 0 20.439 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.7075472925031873e-06 0 0 ;
	setAttr -k on ".ssc" no;
	setAttr ".pa" -type "double3" 0 20.439 0 ;
	setAttr ".bps" -type "matrix" -0.43202589583183537 -0.90062652583081038 -0.047175060154975683 0
		 0.092256840430386469 0.0079001086599493949 -0.99570390361641337 0 0.89713003557148996 -0.43452209294014732 0.079675906159962701 0
		 -0.57691358164072459 1.0149858370204392 0.012999709208529133 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Toe_1_01" -p "Reference_R_Hand";
	rename -uid "4E5E493A-4EF4-5EB2-8E3B-4C9597901DAD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.08391537929788967 -0.028846179114232484 0.027910369694658543 ;
	setAttr ".r" -type "double3" 4.259 11.917 3.5909999999999997 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -7.652487997673445 -45.34641193649658 -3.3185085081845704 ;
	setAttr -k on ".ssc" no;
	setAttr ".pa" -type "double3" 4.259 11.917 3.5909999999999997 ;
	setAttr ".bps" -type "matrix" -0.3098235609056188 -0.92816552070076408 0.2061992417300374 0
		 -0.28115003918185932 -0.11773777488821874 -0.95241402332830594 0 0.9082752977901587 -0.35305322905569198 -0.22447583584329878 0
		 -0.55862353072580473 1.0561613290341447 0.056029239582745867 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Toe_1_02" -p "Reference_R_Toe_1_01";
	rename -uid "06B733AE-462F-46FB-D8FD-71ACFCEE4955";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.042977089244439437 -2.0787860584292606e-07 -3.497089676729459e-07 ;
	setAttr ".r" -type "double3" 0 14.525 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.909095910416422e-06 0 0 ;
	setAttr -k on ".ssc" no;
	setAttr ".pa" -type "double3" 0 14.525 0 ;
	setAttr ".bps" -type "matrix" -0.52771871288247951 -0.80995317091829599 0.25590783691215352 0
		 -0.2811500089181177 -0.11773778665195557 -0.95241403080784237 0 0.80154078658481365 -0.57455519709919645 -0.16558590799733486 0
		 -0.57193910473981413 1.0162716245584211 0.064891359284425604 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Toe_3_01" -p "Reference_R_Hand";
	rename -uid "5D8A7066-4C14-1B72-63B5-2C8C75508693";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.033512186269922556 -0.046450601970531934 0.03518168109509312 ;
	setAttr ".r" -type "double3" 0 0 2.711 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -57.721453579615705 -52.360142820075822 -24.247525694534257 ;
	setAttr -k on ".ssc" no;
	setAttr ".pa" -type "double3" 0 0 2.711 ;
	setAttr ".bps" -type "matrix" 0.053758183989068786 -0.92786976662078779 0.36900915143839286 0
		 -0.9970102025471117 -0.070416509691694662 -0.031814637822976638 0 0.055504177060515747 -0.36619559166369642 -0.92888108763980715 0
		 -0.51213194263216266 1.0828298345298475 0.06156029663875183 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_Toe_3_02" -p "Reference_R_Toe_3_01";
	rename -uid "6FB7FFC6-4459-A1AA-30CE-AC901D3CA3E8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.029078489221788573 6.6934553955011467e-07 1.5938323247866037e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 3.8181918208328448e-06 0 0 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.053758183989068786 -0.92786976662078779 0.36900915143839286 0
		 -0.9970101988483101 -0.0704165340949756 -0.031814699723629665 0 0.055504243501294209 -0.36619558697113808 -0.92888108551967696 0
		 -0.51056931473843403 1.0558481527345935 0.0722890234959052 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_WeaponBone" -p "Reference_R_Hand";
	rename -uid "B8387E2E-4021-E201-F1EB-C28D4BDDD98D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.061 0 0.049 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -5.4660000000000117 0 0 ;
	setAttr -k on ".ssc" no;
	setAttr ".pa" -type "double3" 5.466 0 0 ;
	setAttr ".bps" -type "matrix" -0.77020140754513056 -0.5949527214732272 0.22982830771491336 0
		 -0.24078825105031654 -0.062439744370432607 -0.96856713576245468 0 0.59060207413420884 -0.80133172752272563 -0.095166446260299256 0
		 -0.53338282678921234 1.0491025734840653 0.022636575730605804 1;
	setAttr ".radi" 2.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_back_w_____slot_10" -p "Reference_Spine_3";
	rename -uid "690D54CC-496C-8FC5-1E82-3BB939E289A9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.11026547808894938 0.0077551002628059584 -0.13421574049914495 ;
	setAttr ".jo" -type "double3" 149.77102240194893 40.156924961686009 37.526131822694786 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.64488329067583539 0.51239145799056396 -0.56708071311358332 0
		 -0.38478244053910143 0.85875199783074951 0.33835998533288325 0 0.66035446152795763 1.6780193053091212e-15 0.75095404995253934 0
		 0.13421830488367339 1.3309752024592205 -0.032958320701525282 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_back_weapon_slot_10" -p "Reference_L_back_w_____slot_10";
	rename -uid "3928C64B-4479-C1CE-7007-808BF01BD39D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.051808186971804226 -0.030999956896802461 -0.067990421310209104 ;
	setAttr ".r" -type "double3" 180 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -65.702835819307168 -34.519322969172663 -69.366365708428106 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.85815140097985432 -0.51339670138822557 4.5935470038838133e-08 0
		 -1.50995803027687e-07 -1.6291843958903164e-07 0.99999999999997535 0 -0.51339670138820581 -0.85815140097983977 -2.1732943444874309e-07 0
		 0.13465899999999595 1.3308999999997546 -0.12388457151642093 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_back_w_____slot_07" -p "Reference_Spine_3";
	rename -uid "B8B135CF-4CE4-2BD9-8099-EEA820DAA085";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.13359146076750106 0.0052584688303747296 -0.072994162620050498 ;
	setAttr ".jo" -type "double3" 159.73029907097367 21.640437849346018 34.584764567041226 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.36878069380942413 0.65773844472574527 -0.65679596390598904 0
		 -0.32202110777895049 0.75324639948011518 0.57351745205796478 0 0.871953671944936 9.2458045470176684e-16 0.489588392409116 0
		 0.072996731020901054 1.3543694639949297 -0.034702928221703969 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_back_weapon_slot_07" -p "Reference_L_back_w_____slot_07";
	rename -uid "3CCCCD25-4311-704F-3474-FE8B20BD499E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.065905881243753295 -0.058000006177095442 -0.049337338962601528 ;
	setAttr ".r" -type "double3" 180 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -60.761092608364088 -55.869866178852185 -75.195957496019588 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.9493225870886921 -0.31430339744142716 9.2137906915201739e-08 0
		 -1.5099580369382082e-07 -1.6291844200630652e-07 0.99999999999997524 0 -0.31430339744140456 -0.94932258708868256 -2.021206508273643e-07 0
		 0.072958899999995788 1.354029999999754 -0.1354086492507463 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_C_back_w_____slot_08" -p "Reference_Spine_3";
	rename -uid "BFE0F05A-47A4-6DB7-6845-7BA35FD20532";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.14440698729984836 0.0024600960090983004 1.539708443810719e-07 ;
	setAttr ".jo" -type "double3" -179.99981912928521 -0.00018449878047102999 32.869736841078449 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -3.1902974257692068e-06 0.72844406210287393 -0.68510528269521176 0
		 3.3921147812943603e-06 0.68510528270263971 0.72844406209497603 0 0.99999999998915767 -2.5399391762075348e-12 -4.656655490314222e-06 0
		 2.416590000021889e-06 1.3655121185043171 -0.033897900000000515 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_C_back_weapon_slot_08" -p "Reference_C_back_w_____slot_08";
	rename -uid "58C2F7DE-472F-3CFD-4E6A-02BB0BBF7C1D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.071879403913751361 -0.076307896143120058 -3.3728084869688547e-12 ;
	setAttr ".r" -type "double3" 180 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.94155330307936 -89.746927372113447 43.302343059145954 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.9999902452996966 0.0044169339399481545 -1.5027472902858586e-07 0
		 1.5099571497105406e-07 -1.628987836174068e-07 0.99999999999997524 0 0.0044169339399234122 -0.9999902452996946 -1.6356413279893108e-07 0
		 1.9284248075049836e-06 1.3655933007132075 -0.13872889317471038 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_back_w_____slot_09" -p "Reference_Spine_3";
	rename -uid "E3B2D66F-4B42-0A10-E966-D3A2621A0A40";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.13345737923113377 0.0057026922337278518 0.072839103478154241 ;
	setAttr ".jo" -type "double3" -159.73030964399373 -21.640426617894455 34.584729343754134 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.36878046929314118 0.657739034582416 -0.65679549926481806 0
		 0.32202142071368084 0.75324588441397489 0.57351795282706852 0 0.87195365133100611 -9.2327332404547584e-17 -0.48958842912238748 0
		 -0.072836535178395126 1.354157607293246 -0.035115723017494445 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_back_weapon_slot_09" -p "Reference_R_back_w_____slot_09";
	rename -uid "B582385E-4778-9604-BF03-DA8501973900";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.065831286804661993 -0.05765349955702137 0.048999997999323058 ;
	setAttr ".r" -type "double3" -180 180 180 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -60.761095016940601 -55.869864180478551 104.80399963018162 ;
	setAttr -k on ".ssc" no;
	setAttr ".pa" -type "double3" -180 180 180 ;
	setAttr ".bps" -type "matrix" 0.94932258708869321 0.31430339744142555 -9.2137906138045622e-08 0
		 1.5099580308319815e-07 -1.6291844407910239e-07 0.99999999999997546 0 0.31430339744140268 -0.94932258708868344 -2.0212065302005477e-07 0
		 -0.072953762686135598 1.3540301530580732 -0.13540856498835577 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_back_w_____slot_06" -p "Reference_Spine_3";
	rename -uid "D11EF7A2-482F-E20E-314D-4482D8EBC7CE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.11013733875373011 0.007826930643483665 0.13428494632165161 ;
	setAttr ".jo" -type "double3" -149.77074608388017 -40.156968459888724 37.525823050196941 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.64488385468624998 0.51239442175333072 -0.56707739376655908 0
		 0.38478579509330724 0.85875022943581769 0.33836065867405729 0 0.66035195605026809 -1.3431728346389521e-15 -0.75095625314700254 0
		 -0.13428238196972508 1.3308362720778906 -0.033005861575021694 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_back_weapon_slot_06" -p "Reference_R_back_w_____slot_06";
	rename -uid "C22039C8-439B-0F21-DB13-60BD7DCB8012";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 5;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.051807906229560219 -0.030837335804792199 0.067999997038314011 ;
	setAttr ".r" -type "double3" 180 180 180 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -65.702980385064023 -34.519173454552359 110.63351847261364 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.85815140097985476 0.51339670138822535 -4.593546942821547e-08 0
		 1.5099580319422046e-07 -1.6291844167235095e-07 0.99999999999997535 0 0.51339670138820526 -0.85815140097984011 -2.1732943650265568e-07 0
		 -0.13465430196281086 1.330900785035082 -0.12388411826074512 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_C_back_w_____slot_11" -p "Reference_Spine_2";
	rename -uid "1EEC7AE6-4A6C-1589-A3E8-8AAA3D2B3C3C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 3;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.030938827079179498 0.035916293793965631 -4.0594177640619945e-09 ;
	setAttr ".jo" -type "double3" 179.99998888646223 0 104.54102631125011 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -2.0321642794047193e-07 -0.33237831388487676 -0.9431461479850326 0
		 -7.1616140755350792e-08 0.94314614798505447 -0.33237831388486894 0 0.9999999999999768 -2.4626995971589494e-13 -2.154664434523828e-07 0
		 2.5216100000122527e-06 1.071298772891172 -0.028511800000000104 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_C_back_weapon_slot_11" -p "Reference_C_back_w_____slot_11";
	rename -uid "7CACDBC6-488E-76B1-CA24-B1A216D266D7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 4;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.059322256190993683 0.020930176031780379 2.1573802111624941e-16 ;
	setAttr ".r" -type "double3" 0 180 180 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.9991636957439 -89.746927503928504 109.41403882052111 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.99999024529969682 0.0044169339399489508 -1.5027472947095605e-07 0
		 1.5099571451939635e-07 -1.6289855492289195e-07 0.99999999999997524 0 0.0044169339399242908 -0.99999024529969482 -1.6356390424985462e-07 0
		 2.5080558047947612e-06 1.0713215563035856 -0.091418094035073699 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_front_w____scale_05" -p "Reference_Pelvis";
	rename -uid "66E073FD-4899-00A4-BF78-17960968E691";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.040997495256495708 -0.0070000027720906006 0.012506271644896483 ;
	setAttr ".s" -type "double3" 1.204009629727991 1.204009629727991 1.204009629727991 ;
	setAttr ".jo" -type "double3" 89.999985128948083 -4.2000003068257605 -10.236880830287197 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 1.1816616250598557 0.088179221679685671 0.21339966542288305 0
		 -0.086775535406455329 1.2007762544877787 -0.015671043071797706 0 -0.21397429470279047 -2.1141074260575519e-14 1.1848435296207585 0
		 0.041000000000000009 0.97198104858374035 0.0070000002160668104 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_front_weapon_slot_05" -p "Reference_L_front_w____scale_05";
	rename -uid "D146BC43-4629-3689-6BC2-67B91D14D891";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.12870963205513908 -0.0094267965325253167 0.00039742784866459894 ;
	setAttr ".r" -type "double3" 180 0 -105.00000000000001 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -59.400743917819923 20.335382456738152 13.631541245986135 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.04449215684320218 -0.5465060628451065 1.0719098654880987 0
		 -1.1838393937737537 -0.21147155413577004 -0.058679298040503203 0 0.21490445832174798 -1.0517842428666997 -0.54516526735339033 0
		 0.19382420894779609 0.9720110903288971 0.035085210182807497 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_front_w____scale_04" -p "Reference_Pelvis";
	rename -uid "B09F2BFE-46A6-CB01-6BFC-E6944CBB40DD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.025997483861166217 -0.024560186190272625 0.060302285071024864 ;
	setAttr ".jo" -type "double3" 89.999994482793809 -23.228656090636399 -43.559759317842001 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.66591426874672666 0.39440125021529993 0.63325021950893967 0
		 -0.2858052729283112 0.91893832972001344 -0.27178611468904179 0 -0.68911068243489404 1.7480064878369714e-15 0.72465610281989212 0
		 0.026000000000000013 1.0197770595548095 0.02456020005047312 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_L_front_weapon_slot_04" -p "Reference_L_front_w____scale_04";
	rename -uid "60D99CB6-4212-F3F4-3B8C-14A063D3A5BF";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.096356382324940537 -0.04130868849686653 0.00011745567148796482 ;
	setAttr ".r" -type "double3" -180 0 -105.00000000000001 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.816735744782946 3.2948129044774142 -18.483859758538312 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.82110333458844986 -0.019860369737398135 0.57043393977008561 0
		 -0.56740125680282394 -0.080172191954390098 -0.81952927550869326 0 0.062009093738770803 -0.99658315526157781 0.054560855405446383 0
		 0.10189039090721541 1.0198199999997546 0.096890143227446851 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_front_w____scale_02" -p "Reference_Pelvis";
	rename -uid "5F9380C4-4D5C-3FF3-CE7B-61B5DCE259E8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.025855416138822078 -0.024560178310251 0.060302220291522213 ;
	setAttr ".jo" -type "double3" 90.000021237929303 -23.215108706431007 -136.47165671434067 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.66632864690864668 0.39418420331932102 0.63294940410936806 0
		 0.28579677618568189 0.91903145422423482 -0.27147999717909072 0 -0.68871353771416666 -1.1517261037934004e-15 -0.72503355989170348 0
		 -0.025852899999999856 1.0197770042612919 0.024560199999999775 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_front_weapon_slot_02" -p "Reference_R_front_w____scale_02";
	rename -uid "9F268119-4720-053E-603C-1A88E1414186";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.096533847755917779 -0.041362619192490957 2.2602735100241134e-09 ;
	setAttr ".r" -type "double3" 0 0 -105.00000000000001 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.819335968598054 3.2635279481549095 161.52952364795013 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.82110333385492562 0.01986038152626456 -0.57043394041550244 0
		 0.56740125699937205 -0.080172188795573765 -0.81952927568163136 0 -0.06200910165337533 -0.99658315528076125 0.054560846060002381 0
		 -0.10199747293257674 1.0198155740653088 0.096890363516415501 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_front_w____scale_01" -p "Reference_Pelvis";
	rename -uid "02DCBF00-41A3-4D7F-A268-968233520192";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -0.041002504743505995 -0.0069999901743702762 0.012506278719198627 ;
	setAttr ".s" -type "double3" 1.204009629727991 1.204009629727991 1.204009629727991 ;
	setAttr ".jo" -type "double3" 90.000018606063122 -4.1982361449426016 -169.76750309291688 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -1.1816805243057205 0.088142681594272757 0.21331009032781839 0
		 0.086740770485195434 1.2007789372566062 -0.015657939017125273 0 -0.21388400054685247 -2.2230770924031625e-15 -1.1848598325489001 0
		 -0.040999999999999988 0.97198107065914696 0.0069999999999999863 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_R_front_weapon_slot_01" -p "Reference_R_front_w____scale_01";
	rename -uid "85B02211-413E-7825-BE56-8B9EE70FC99C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.12877672824613404 -0.0094277117392046472 -0.00039514754876282185 ;
	setAttr ".r" -type "double3" 0 0 -105.00000000000001 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -59.402171518247776 20.331225858381767 -166.3672106935895 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 0.044492150656783053 0.54650603256756902 -1.0719098811816798 0
		 1.1838393921161081 -0.21147156224861194 -0.058679302245586651 0 -0.21490446873397384 -1.0517842569677116 -0.54516523604388245 0
		 -0.19390620299390218 0.9720111991307343 0.035085188528246491 1;
	setAttr ".liw" yes;
createNode joint -n "Reference_C_front_w____scale_03" -p "Reference_Pelvis";
	rename -uid "F87F59B7-4EC1-D7DC-3BA0-84AFC73C747C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 1;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -1.1550502273161603e-08 -0.026716376831228718 0.078483583966893811 ;
	setAttr ".s" -type "double3" 0.8234027316381245 0.8234027316381245 0.8234027316381245 ;
	setAttr ".jo" -type "double3" 90.0000120855738 -29.854722288168492 -90.000000000003539 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" 1.8281616120116629e-07 0.40989174600250688 0.7141294105609346 0
		 -1.0493172329079944e-07 0.7141294105609578 -0.40989174600249345 0 -0.82340273163809719 7.0208347859636457e-15 2.1078997935354176e-07 0
		 2.5082400000155441e-06 1.0379583625682678 0.026716399999999876 1;
	setAttr ".radi" 1.5;
	setAttr ".liw" yes;
createNode joint -n "Reference_C_front_weapon_slot_03" -p "Reference_C_front_w____scale_03";
	rename -uid "16B075B9-47F9-9AE5-7621-E9B639FE377D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".oc" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.095564865501694629 -0.054768539397500815 1.9862497059525478e-12 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.0013697113414335039 89.746927503896302 60.143915643262204 ;
	setAttr -k on ".ssc" no;
	setAttr ".bps" -type "matrix" -0.82339469959124834 -0.0036369154716206615 1.2325224849225581e-07 0
		 -1.2384597721269956e-07 1.3414747501716488e-07 -0.82340273163810418 0 0.0036369154716005101 -0.82339469959124656 -1.3469318627770495e-07 0
		 2.5314561236099357e-06 1.0380177873880303 0.11741125331070801 1;
	setAttr ".liw" yes;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "5596AEA3-43A4-CD9C-C416-3B9C9280932A";
	setAttr -s 67 ".lnk";
	setAttr -s 67 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "0E875EF3-4636-5640-08ED-4DAA305103E1";
	setAttr ".bsdt[0].bscd" -type "Int32Array" 0 ;
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "AB9C9B8B-4932-42FF-E468-C8BC3A60245B";
createNode displayLayerManager -n "layerManager";
	rename -uid "93D3A48E-43A4-13D5-4BC6-33ADE7F87A89";
	setAttr ".cdl" 6;
	setAttr -s 70 ".dli[1:69]"  6 41 8 1 30 20 22 24 
		2 9 25 3 10 26 4 11 27 12 5 28 13 23 29 15 16 
		31 7 17 18 19 14 32 21 33 34 44 35 37 36 55 38 42 
		40 39 45 46 47 48 43 49 50 52 53 54 51 70 56 57 59 
		60 61 62 63 64 65 66 67 68 69;
createNode displayLayer -n "defaultLayer";
	rename -uid "A5B5B26C-49E1-D3FF-FC11-6E858C9E7185";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "1665BABF-4534-E269-CDE2-8BBF3AB3964B";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "3F40517C-4313-12C8-29BA-FC9AD20F92B9";
	setAttr ".g" yes;
createNode materialInfo -n "materialInfo6";
	rename -uid "A6F8C56F-4FE0-DD99-8EC4-42BD73391D35";
createNode shadingEngine -n "FT_RebelClothes3_M_HMSG";
	rename -uid "1F562282-47A5-16CF-9BD1-3898F7E9E50C";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode lambert -n "lambert2";
	rename -uid "297BD896-4D2B-CD43-5CDF-3183478F09C4";
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "C4B2DAD8-4FD8-5B98-3FDB-52B92C18F0C8";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 262.5 -ast 0 -aet 262.5 ";
	setAttr ".st" 6;
createNode animLayer -n "BaseAnimation";
	rename -uid "81A75D63-4071-64F9-A36F-60BF68F9EA09";
	setAttr ".pref" yes;
	setAttr ".slct" yes;
	setAttr ".ovrd" yes;
createNode reference -n "_UNKNOWN_REF_NODE_";
	rename -uid "F9879C58-40A4-8989-6021-9D9D86FE185F";
	setAttr ".ed" -type "dataReferenceEdits" 
		"_UNKNOWN_REF_NODE_"
		"_UNKNOWN_REF_NODE_" 1
		2 ":modelPanel2ViewSelectedSet" "ihi" " 0";
createNode nodeGraphEditorInfo -n "HM_F_BaseBodyAndHaicuts_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "B5D0297C-4D5F-C27C-1CCE-02A7DD791A39";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -626.19045130790334 -427.97617346994531 ;
	setAttr ".tgi[0].vh" -type "double2" 888.69044087709108 416.6666501098216 ;
createNode blinn -n "ChaosCultist4_F_HM_scale_x001:atlas_1";
	rename -uid "B83041E3-44E0-25F6-1D9D-4C9FAA611D4C";
createNode shadingEngine -n "ChaosCultist4_F_HM_scale_x001:blinn1SG";
	rename -uid "7D67E34E-4912-5349-5BAD-7097BC1AA3BD";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "ChaosCultist4_F_HM_scale_x001:materialInfo1";
	rename -uid "89F40E92-4887-B9F6-D3EF-6AA6E8B4BCD5";
createNode nodeGraphEditorInfo -n "ChaosCultist4_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "DB094329-445C-51B5-C4C5-22B38E7386DC";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -622.61902287839052 -389.28569881689037 ;
	setAttr ".tgi[0].vh" -type "double2" 592.85711929911758 407.14284096445425 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 45.714286804199219;
	setAttr ".tgi[0].ni[0].y" 195.71427917480469;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -261.42855834960938;
	setAttr ".tgi[0].ni[1].y" 195.71427917480469;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode blinn -n "ChaosCultist4_F_HM_scale_x002:atlas_1";
	rename -uid "65EA2840-4628-8386-B729-FEB41DD252EA";
createNode shadingEngine -n "ChaosCultist4_F_HM_scale_x002:blinn1SG";
	rename -uid "61C092DD-4EE1-DA60-A4EF-CB84856AEE97";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "ChaosCultist4_F_HM_scale_x002:materialInfo1";
	rename -uid "523A2CE6-403E-7CDA-52FF-0F89429C4258";
createNode nodeGraphEditorInfo -n "ChaosCultist4_F_HM_scale_x002:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "FF2A1AEE-46C7-B8E3-FB4F-13A9BB473129";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -622.61902287839052 -389.28569881689037 ;
	setAttr ".tgi[0].vh" -type "double2" 592.85711929911758 407.14284096445425 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 45.714286804199219;
	setAttr ".tgi[0].ni[0].y" 195.71427917480469;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -261.42855834960938;
	setAttr ".tgi[0].ni[1].y" 195.71427917480469;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode groupId -n "groupId53667";
	rename -uid "12AAC96E-4C87-E5B8-6352-0DA194EEA1F9";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts9863";
	rename -uid "C1D3B1B2-4E04-7E96-9A0E-F6A4BEE4328D";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 3 "f[73:252]" "f[517:526]" "f[544:553]";
	setAttr ".gi" 987;
createNode groupId -n "groupId53670";
	rename -uid "F64348CE-4581-8515-148A-8D9329C2E067";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts9866";
	rename -uid "114743FF-4D0A-7C27-29F2-BDA788852061";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 7 "f[109:144]" "f[219:220]" "f[224]" "f[231:232]" "f[239:240]" "f[247:248]" "f[517:521]";
	setAttr ".gi" 993;
createNode blinn -n "Seneshal_F_HM_scale_x001:atlas_1";
	rename -uid "11567218-4DB9-CAB8-009A-6A8BAA7D60A7";
createNode shadingEngine -n "Seneshal_F_HM_scale_x001:blinn1SG";
	rename -uid "8C898250-4010-944D-5AB4-789DCD120A11";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "Seneshal_F_HM_scale_x001:materialInfo1";
	rename -uid "0D3C3269-4F6D-EB88-8649-C8B3ED1C63D0";
createNode nodeGraphEditorInfo -n "Seneshal_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "C3BACC11-4686-4EDB-2B30-9891B2781509";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -622.61902287839052 -389.28569881689037 ;
	setAttr ".tgi[0].vh" -type "double2" 592.85711929911758 407.14284096445425 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -261.42855834960938;
	setAttr ".tgi[0].ni[0].y" 195.71427917480469;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 45.714286804199219;
	setAttr ".tgi[0].ni[1].y" 195.71427917480469;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode gameFbxExporter -n "Seneshal_F_HM_scale_x001:gameExporterPreset1";
	rename -uid "B1518874-4D0D-053B-205D-89B3ADDD3FAA";
	setAttr ".pn" -type "string" "Model Default";
	setAttr ".ils" yes;
	setAttr ".ilu" yes;
	setAttr ".esi" 2;
	setAttr ".mfm" 2;
	setAttr ".mto" yes;
	setAttr ".ebm" yes;
	setAttr ".inc" yes;
	setAttr ".ft" 1;
	setAttr ".fv" -type "string" "FBX201800";
	setAttr ".exp" -type "string" "C:/ttt";
createNode gameFbxExporter -n "Seneshal_F_HM_scale_x001:gameExporterPreset2";
	rename -uid "427F8A30-446C-7DAB-6BA3-3EA1B90A5BF1";
	setAttr ".pn" -type "string" "Anim Default";
	setAttr ".ils" yes;
	setAttr ".eti" 2;
	setAttr ".spt" 2;
	setAttr ".ic" no;
	setAttr ".ebm" yes;
	setAttr ".fv" -type "string" "FBX201800";
createNode gameFbxExporter -n "Seneshal_F_HM_scale_x001:gameExporterPreset3";
	rename -uid "FFDF250A-44AC-9701-FCC8-47845EDC9AEF";
	setAttr ".pn" -type "string" "TE Anim Default";
	setAttr ".ils" yes;
	setAttr ".eti" 3;
	setAttr ".ebm" yes;
	setAttr ".fv" -type "string" "FBX201800";
createNode blinn -n "ImperialNavy_F_HM_scale_x001:atlas_1";
	rename -uid "71C90DF5-4131-E527-5605-5D93428BBB25";
createNode shadingEngine -n "ImperialNavy_F_HM_scale_x001:blinn1SG";
	rename -uid "09F9EE32-4443-4BAA-9699-778C7FBAB974";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "ImperialNavy_F_HM_scale_x001:materialInfo1";
	rename -uid "D67EB0C4-4DC5-A775-6C03-97A021B8F4A7";
createNode nodeGraphEditorInfo -n "ImperialNavy_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "FDA34D6A-432C-4CF3-16D0-18BEC76C2AAE";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -822.02377685951944 -799.40473013927203 ;
	setAttr ".tgi[0].vh" -type "double2" 393.45236531798867 -2.9761903579273103 ;
	setAttr -s 10 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 307.14285278320313;
	setAttr ".tgi[0].ni[0].y" -235.71427917480469;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -614.28570556640625;
	setAttr ".tgi[0].ni[1].y" -348.57144165039063;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" -921.4285888671875;
	setAttr ".tgi[0].ni[2].y" -371.42855834960938;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -68.571426391601563;
	setAttr ".tgi[0].ni[3].y" 147.14285278320313;
	setAttr ".tgi[0].ni[3].nvs" 1923;
	setAttr ".tgi[0].ni[4].x" -682.85711669921875;
	setAttr ".tgi[0].ni[4].y" 11.428571701049805;
	setAttr ".tgi[0].ni[4].nvs" 1923;
	setAttr ".tgi[0].ni[5].x" -375.71429443359375;
	setAttr ".tgi[0].ni[5].y" 34.285713195800781;
	setAttr ".tgi[0].ni[5].nvs" 1923;
	setAttr ".tgi[0].ni[6].x" -990;
	setAttr ".tgi[0].ni[6].y" -11.428571701049805;
	setAttr ".tgi[0].ni[6].nvs" 1923;
	setAttr ".tgi[0].ni[7].x" 238.57142639160156;
	setAttr ".tgi[0].ni[7].y" 124.28571319580078;
	setAttr ".tgi[0].ni[7].nvs" 1923;
	setAttr ".tgi[0].ni[8].y" -212.85714721679688;
	setAttr ".tgi[0].ni[8].nvs" 1923;
	setAttr ".tgi[0].ni[9].x" -307.14285278320313;
	setAttr ".tgi[0].ni[9].y" -325.71429443359375;
	setAttr ".tgi[0].ni[9].nvs" 1923;
createNode blinn -n "CrimeLordRogueTrader_F_HM_Scale_x001:atlas_1";
	rename -uid "76081867-45A5-6914-923F-40AE5B70650D";
createNode shadingEngine -n "CrimeLordRogueTrader_F_HM_Scale_x001:blinn1SG";
	rename -uid "8746A0D6-410A-1041-CEF7-C3B7CC6093EB";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "CrimeLordRogueTrader_F_HM_Scale_x001:materialInfo1";
	rename -uid "E5366C8E-4BE5-ADBC-F6A5-0E980BF46731";
createNode nodeGraphEditorInfo -n "CrimeLordRogueTrader_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "386AFC1E-4075-B14D-6588-3685C2B54F61";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -622.61902287839052 -389.28569881689037 ;
	setAttr ".tgi[0].vh" -type "double2" 592.85711929911758 407.14284096445425 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -261.42855834960938;
	setAttr ".tgi[0].ni[0].y" 191.42857360839844;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 45.714286804199219;
	setAttr ".tgi[0].ni[1].y" 191.42857360839844;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode blinn -n "CriminalCostume_F_HM_Scale_x001:atlas_1";
	rename -uid "326B99BD-410E-5B4B-801E-A1B82B17C947";
createNode shadingEngine -n "CriminalCostume_F_HM_Scale_x001:blinn1SG";
	rename -uid "F1D1DD36-41A6-1D2F-D74D-0285519FC2F8";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "CriminalCostume_F_HM_Scale_x001:materialInfo3";
	rename -uid "A3F278A2-4294-F5B5-9E55-C787077F34B6";
createNode nodeGraphEditorInfo -n "CriminalCostume_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "AFCC1863-489D-5556-1A82-CDA6042A527F";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1212.2023327837881 -932.14282010282943 ;
	setAttr ".tgi[0].vh" -type "double2" 338.39284369633367 308.33332108126797 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -682.85711669921875;
	setAttr ".tgi[0].ni[0].y" -128.57142639160156;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -375.71429443359375;
	setAttr ".tgi[0].ni[1].y" -128.57142639160156;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode file -n "CriminalCostume_F_HM_Scale_x001:file1";
	rename -uid "EC75AE56-4692-E155-47B8-8681CB4A4BAC";
	setAttr ".ftn" -type "string" "E:/Work/ArtCharacters/ArmorsAndClothes/Criminal/CriminalCostume/Texturing/AT_CriminalCostume1_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "CriminalCostume_F_HM_Scale_x001:place2dTexture1";
	rename -uid "59DD0459-4FEF-D18B-7E66-64BC733F2F96";
createNode file -n "CriminalCostume_F_HM_Scale_x001:file5";
	rename -uid "6A617A0F-4323-4E10-CE82-B7990EB5779B";
	setAttr ".ail" yes;
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "CriminalCostume_F_HM_Scale_x001:place2dTexture5";
	rename -uid "C0E414B8-4698-ABF3-B9FB-C4A626BF4403";
createNode bump2d -n "CriminalCostume_F_HM_Scale_x001:bump2d2";
	rename -uid "5B82208F-4DA0-0A8A-6B73-02B35928A751";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "CriminalCostume_F_HM_Scale_x001:file6";
	rename -uid "A9AB3728-4305-CC04-DAB3-5EA188652CE7";
	setAttr ".ftn" -type "string" "E:/Work/ArtCharacters/Races/Human/Female/Texturing/AT_BaseBody_F_HM_n.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "CriminalCostume_F_HM_Scale_x001:place2dTexture6";
	rename -uid "2C969F4A-44AE-E387-365F-FB9598FD9AD7";
createNode blinn -n "AdeptasSororittas_F_HM_Scale_x001:atlas_1";
	rename -uid "181611E0-42A2-00FE-BF33-928240BD11E6";
createNode shadingEngine -n "AdeptasSororittas_F_HM_Scale_x001:blinn1SG";
	rename -uid "3FC1AD71-41A2-813C-7F3F-0D85F42AB3FB";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "AdeptasSororittas_F_HM_Scale_x001:materialInfo1";
	rename -uid "6CB3274F-4AB0-8490-AE2A-A0B66BB40B4A";
createNode nodeGraphEditorInfo -n "AdeptasSororittas_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "90DCC413-4D9D-3BD5-9295-D4A2154941FD";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1758.2164490655605 -1215.4323367783006 ;
	setAttr ".tgi[0].vh" -type "double2" 1850.8287933549675 745.78949829737314 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -221.42857360839844;
	setAttr ".tgi[0].ni[0].y" -47.142856597900391;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 85.714286804199219;
	setAttr ".tgi[0].ni[1].y" -47.142856597900391;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode nodeGraphEditorInfo -n "RebelClothes3_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "0B59076E-4908-EAE4-1C0A-9A8486BD8814";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -698.80949604132934 -395.23807953274502 ;
	setAttr ".tgi[0].vh" -type "double2" 516.66664613617877 401.19046024859961 ;
createNode blinn -n "MilitarumTempestusCarapace_F_HM_scale_x001:atlas_1";
	rename -uid "E2AF3250-4E70-00F0-3991-30A93EC057ED";
createNode shadingEngine -n "MilitarumTempestusCarapace_F_HM_scale_x001:blinn1SG";
	rename -uid "96F4BFF3-46E9-4200-5291-0AA8FD1EC6D0";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "MilitarumTempestusCarapace_F_HM_scale_x001:materialInfo1";
	rename -uid "D0228B89-42E6-7B33-8016-719C3BF0CE39";
createNode nodeGraphEditorInfo -n "MilitarumTempestusCarapace_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "B986E1BF-4C9A-A2AF-D82F-18BD0D9C5246";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -908.92853531099661 -487.4999806284913 ;
	setAttr ".tgi[0].vh" -type "double2" 180.35713569039413 383.92855617262126 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -611.4285888671875;
	setAttr ".tgi[0].ni[0].y" 135.71427917480469;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -304.28570556640625;
	setAttr ".tgi[0].ni[1].y" 135.71427917480469;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode lambert -n "LowLifer1_F_HM_Scale_x001:atlas1";
	rename -uid "58BF68D3-47FF-3413-09A7-E3BA331DB442";
createNode shadingEngine -n "LowLifer1_F_HM_Scale_x001:HM_F_Brows05_F_HMSG";
	rename -uid "C84849B0-4E1B-F5AF-C9D3-1B9AD19F3966";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "LowLifer1_F_HM_Scale_x001:materialInfo1";
	rename -uid "11A4079A-4EC5-A1FA-56E2-B9A74A293BB6";
createNode file -n "LowLifer1_F_HM_Scale_x001:file2";
	rename -uid "55F965CC-4FEC-F3EA-7159-3EAF217CDEBD";
	setAttr ".ftn" -type "string" "F:\\WHArtSvn\\Art\\Characters\\atlasWH.png";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "LowLifer1_F_HM_Scale_x001:place2dTexture1";
	rename -uid "38E1A72F-4256-1A96-D38C-C7A7CB365107";
createNode checker -n "BalefulEye1_F_HM_scale_x001:_Checker_tex";
	rename -uid "5FB7B9FE-4124-27A9-B0E4-A9A418F8DCF3";
	setAttr ".c1" -type "float3" 0.61445785 0.61445785 0.61445785 ;
	setAttr ".c2" -type "float3" 0.39759037 0.39759037 0.39759037 ;
createNode place2dTexture -n "BalefulEye1_F_HM_scale_x001:_Checker";
	rename -uid "712727BF-41B5-C36F-C112-FBA9F43606DB";
	setAttr ".re" -type "float2" 120 120 ;
createNode objectSet -n "BalefulEye1_F_HM_scale_x001:TS_TorsoBase_M_HMShapeHiddenFacesSet";
	rename -uid "4C5BE086-4F20-EE42-8BC7-97809AE2A4A2";
	setAttr ".ihi" 0;
createNode blinn -n "BalefulEye1_F_HM_scale_x001:atlas_1";
	rename -uid "2B35D3E4-4821-192E-86C5-29B9644CD757";
createNode shadingEngine -n "BalefulEye1_F_HM_scale_x001:blinn1SG";
	rename -uid "EAB20F2F-4B7C-F2D2-F4DD-878F755B5A79";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "BalefulEye1_F_HM_scale_x001:materialInfo5";
	rename -uid "5026DEBA-4665-35CD-2EE0-4D91BAD10082";
createNode polyCylinder -n "BalefulEye1_F_HM_scale_x001:polyCylinder1";
	rename -uid "5063FC84-4BD0-F555-39DA-359DD309DB39";
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polyCylinder -n "BalefulEye1_F_HM_scale_x001:polyCylinder2";
	rename -uid "C269E3F2-4256-25C3-FBD6-F2BFEB791943";
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polyCylinder -n "BalefulEye1_F_HM_scale_x001:polyCylinder3";
	rename -uid "2130BB55-4224-6AEF-0940-6EA829B8D81E";
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polyCylinder -n "BalefulEye1_F_HM_scale_x001:polyCylinder4";
	rename -uid "49067907-44A9-4C84-C1EE-8BA64C031B73";
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polyCylinder -n "BalefulEye1_F_HM_scale_x001:polyCylinder5";
	rename -uid "204D2E72-4744-1948-E740-4D84506D4E95";
	setAttr ".r" 8.0377;
	setAttr ".sa" 12;
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polyCylinder -n "BalefulEye1_F_HM_scale_x001:polyCylinder6";
	rename -uid "8ADDBB89-4344-B4D1-F033-3E9A98E8A0F1";
	setAttr ".r" 8.0377;
	setAttr ".sa" 12;
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polyCylinder -n "BalefulEye1_F_HM_scale_x001:polyCylinder7";
	rename -uid "F39F090B-4DD2-CEA8-6783-A1AB38890159";
	setAttr ".r" 8.0377;
	setAttr ".sa" 12;
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polyCylinder -n "BalefulEye1_F_HM_scale_x001:polyCylinder8";
	rename -uid "F0420BD0-45CC-0C17-C5E9-30A0AC127151";
	setAttr ".r" 10;
	setAttr ".h" 3.434;
	setAttr ".sa" 12;
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polyPlane -n "BalefulEye1_F_HM_scale_x001:polyPlane1";
	rename -uid "63D753BE-43E2-63A7-A722-84BAF4038B22";
	setAttr ".cuv" 2;
createNode polyCylinder -n "BalefulEye1_F_HM_scale_x001:polyCylinder9";
	rename -uid "C97B2BCA-4C9D-3C4D-A8D1-488B047C9666";
	setAttr ".r" 10;
	setAttr ".h" 3.434;
	setAttr ".sa" 12;
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode groupId -n "BalefulEye1_F_HM_scale_x001:groupId16";
	rename -uid "2544C8F0-44FF-D4B7-2E89-4387A430B8DF";
	setAttr ".ihi" 0;
createNode polyCube -n "BalefulEye1_F_HM_scale_x001:polyCube1";
	rename -uid "72805D89-4253-5A91-7C90-79816B55758A";
	setAttr ".cuv" 4;
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "57CA4BDB-42A0-F434-296A-D5BB4182CCC6";
	setAttr ".version" -type "string" "3.1.2";
createNode blinn -n "IndustrialWorker1_F_HM_Scale_x001:atlas_1";
	rename -uid "9A728422-4D3D-55C7-1863-0AB5E5808F62";
createNode shadingEngine -n "IndustrialWorker1_F_HM_Scale_x001:blinn1SG";
	rename -uid "22A60043-41E2-9C73-6AC4-CBA2627EB675";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "IndustrialWorker1_F_HM_Scale_x001:materialInfo1";
	rename -uid "4454C576-40A0-3CF0-0C35-5E8F35BB8B2B";
createNode nodeGraphEditorInfo -n "IndustrialWorker1_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "89C87CC7-44F8-CF60-7863-16BBFD986772";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -684.52378232327828 -426.1904592551889 ;
	setAttr ".tgi[0].vh" -type "double2" 651.19045031449252 445.2380775459236 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 42.857143402099609;
	setAttr ".tgi[0].ni[0].y" 197.14285278320313;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -264.28570556640625;
	setAttr ".tgi[0].ni[1].y" 197.14285278320313;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode blinn -n "AgriWorker1_F_HM_Scale_x001:atlas_1";
	rename -uid "2C5AF190-470A-058C-2321-03B2723D8B34";
createNode shadingEngine -n "AgriWorker1_F_HM_Scale_x001:blinn1SG";
	rename -uid "CB144CBC-4B4D-D9DE-5BAD-B08CA0D4E49D";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "AgriWorker1_F_HM_Scale_x001:materialInfo1";
	rename -uid "ACB9294F-47C3-173C-4D03-FEA4DE908D40";
createNode nodeGraphEditorInfo -n "AgriWorker1_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "93603EC5-4032-08D5-35DC-AEA9A866475F";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1193.4718495311931 -703.57140061401299 ;
	setAttr ".tgi[0].vh" -type "double2" 700.61472625843282 532.14283599740077 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -492.85714721679688;
	setAttr ".tgi[0].ni[0].y" 97.142860412597656;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -185.71427917480469;
	setAttr ".tgi[0].ni[1].y" 97.142860412597656;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode blinn -n "GangMember4_F_HM_Scale_x001:atlas_1";
	rename -uid "50A95EF9-4B18-DC27-0C0B-499ED1BFF6FF";
createNode shadingEngine -n "GangMember4_F_HM_Scale_x001:blinn1SG";
	rename -uid "C6677CA5-4546-958E-BF23-2AA2D40010C4";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "GangMember4_F_HM_Scale_x001:materialInfo1";
	rename -uid "2128A753-4F87-2B3A-5A33-2EB72A704058";
createNode groupId -n "GangMember4_F_HM_Scale_x001:groupId363";
	rename -uid "D3AF223E-4D79-B8F7-C28F-29B786F20166";
	setAttr ".ihi" 0;
createNode groupId -n "GangMember4_F_HM_Scale_x001:groupId365";
	rename -uid "CE286111-4385-EB1E-A87E-CBAAA3497A4D";
	setAttr ".ihi" 0;
createNode groupId -n "GangMember4_F_HM_Scale_x001:groupId367";
	rename -uid "A43D697A-4342-F95B-B319-A195909C0FD1";
	setAttr ".ihi" 0;
createNode file -n "GangMember4_F_HM_Scale_x001:file1";
	rename -uid "7AFCA401-49D7-7766-63DA-BA988CAD0A00";
	setAttr ".ftn" -type "string" "D:/wh-art/Art/Characters/ArmorsAndClothes/GangMembers/GangMember4/GangMember4_Texturing/AT_GangMember4_d.tga";
	setAttr ".uvt" 1;
	setAttr ".cs" -type "string" "sRGB";
	setAttr ".ifr" yes;
	setAttr ".autotx" no;
createNode place2dTexture -n "GangMember4_F_HM_Scale_x001:place2dTexture1";
	rename -uid "6C789E1D-43BD-C8AA-4B0F-24A435091BEE";
createNode nodeGraphEditorInfo -n "GangMember4_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo1";
	rename -uid "5FC326D1-47C4-0BE8-4E34-E2958B3D8DF8";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -2127.9761059180173 -476.78569533995307 ;
	setAttr ".tgi[0].vh" -type "double2" -912.4999637405092 248.21427585113656 ;
	setAttr -s 4 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -820;
	setAttr ".tgi[0].ni[0].y" -18.571428298950195;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -1434.2857666015625;
	setAttr ".tgi[0].ni[1].y" 48.571430206298828;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" -1127.142822265625;
	setAttr ".tgi[0].ni[2].y" 15.714285850524902;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -1741.4285888671875;
	setAttr ".tgi[0].ni[3].y" 127.14286041259766;
	setAttr ".tgi[0].ni[3].nvs" 1923;
createNode nodeGraphEditorInfo -n "GangMember4_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "4966B8B1-4459-4955-79E8-B392C37E3A60";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 16.78590909919324 -445.2380775459236 ;
	setAttr ".tgi[0].vh" -type "double2" 1461.785460719088 416.66665010982149 ;
	setAttr -s 4 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 131.42857360839844;
	setAttr ".tgi[0].ni[0].y" 54.285713195800781;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 438.57144165039063;
	setAttr ".tgi[0].ni[1].y" 77.142860412597656;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" 1148.5714111328125;
	setAttr ".tgi[0].ni[2].y" 54.285713195800781;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" 841.4285888671875;
	setAttr ".tgi[0].ni[3].y" 77.142860412597656;
	setAttr ".tgi[0].ni[3].nvs" 1923;
createNode groupId -n "GangMember4_F_HM_Scale_x002:groupId363";
	rename -uid "82C5D39D-4C51-809D-CD0C-37910DBFF9A0";
	setAttr ".ihi" 0;
createNode groupId -n "GangMember4_F_HM_Scale_x002:groupId365";
	rename -uid "BABEFE67-4B63-80B3-708C-E5BBDF281A60";
	setAttr ".ihi" 0;
createNode groupId -n "GangMember4_F_HM_Scale_x002:groupId367";
	rename -uid "8BBD449B-4659-2728-D278-FF9B447C88CF";
	setAttr ".ihi" 0;
createNode blinn -n "FootfallWorker1_F_HM_Scale_x001:atlas_1";
	rename -uid "DADE9546-4B53-CB70-F304-528D97C3991B";
createNode shadingEngine -n "FootfallWorker1_F_HM_Scale_x001:blinn1SG";
	rename -uid "1574DEB4-47EB-7DFA-F342-B4A47677DC99";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "FootfallWorker1_F_HM_Scale_x001:materialInfo1";
	rename -uid "3B37EAA0-44F3-1253-4633-C08A2C344D1F";
createNode nodeGraphEditorInfo -n "FootfallWorker1_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "84B39891-4F71-2F31-234C-0987A1301000";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -684.52378232327828 -426.1904592551889 ;
	setAttr ".tgi[0].vh" -type "double2" 651.19045031449252 445.2380775459236 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -264.28570556640625;
	setAttr ".tgi[0].ni[0].y" 192.85714721679688;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 42.857143402099609;
	setAttr ".tgi[0].ni[1].y" 192.85714721679688;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode file -n "file1";
	rename -uid "53A6E088-4A96-AE50-1DF9-9A8F0B71D530";
	setAttr ".ftn" -type "string" "D:/wh-art/Art/Characters/ArmorsAndClothes/IndustrialWorker1/IndustrialWorker1_Texturing/AT_IndustrialWorker1_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture1";
	rename -uid "F9216D99-4673-F2C1-A45D-88A8A1E4B890";
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "2F7FBA45-4D61-C95B-BBB3-479102EBF955";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1617.5562885544134 -347.40250123496622 ;
	setAttr ".tgi[0].vh" -type "double2" 364.86010001941105 229.12860581153333 ;
	setAttr -s 3 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -330;
	setAttr ".tgi[0].ni[0].y" -122.85713958740234;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -635.65728759765625;
	setAttr ".tgi[0].ni[1].y" -34.285713195800781;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" -330;
	setAttr ".tgi[0].ni[2].y" 52.857143402099609;
	setAttr ".tgi[0].ni[2].nvs" 1923;
createNode file -n "file2";
	rename -uid "1CB88F8B-40A4-904D-5BE7-9B833240D241";
	setAttr ".ftn" -type "string" "D:/wh-art/Art/Characters/ArmorsAndClothes/AgriWorker1/AgriWorker1_Texturing/AT_AgriWorker1_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture2";
	rename -uid "4FE0FBBA-4771-6BA9-09F3-29A5689E6DF7";
createNode file -n "file3";
	rename -uid "B1810FB3-49C3-1796-2DF1-B2884D5D3972";
	setAttr ".ftn" -type "string" "D:/wh-art/Art/Characters/ArmorsAndClothes/FootfallWorkers/FootfallWorker1/FootfallWorker1_Texturing/FootfallWorker1_perekras/AT_FootfallWorker1_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture3";
	rename -uid "ED307133-41B5-0BEB-3635-9D86C02F8939";
createNode animCurveTL -n "R_eyelish_bottom_translateX_Base_AnimLayer_inputA";
	rename -uid "DCA5F786-4CE3-B4B0-99E7-85932B538D62";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.035391889344317085;
	setAttr -l on ".ktv[0]";
createNode animCurveTL -n "R_eyelish_bottom_translateY_Base_AnimLayer_inputA";
	rename -uid "33520AB3-4FF2-46C4-A200-3BBB08DF4684";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.013428948510302741;
	setAttr -l on ".ktv[0]";
createNode animCurveTL -n "R_eyelish_bottom_translateZ_Base_AnimLayer_inputA";
	rename -uid "C57C4F4B-4684-9DDE-63A0-A58B1FBF2A6F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.031608732774797865;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "R_eyelish_bottom_visibility_Base_AnimLayer_inputA";
	rename -uid "0B2352CD-40C6-F103-6B01-C6AE4F974263";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "R_eyelish_bottom_rotate_Base_AnimLayer_inputAX";
	rename -uid "C51C79D9-45F2-D953-8EA0-E6918095051F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr -l on ".ktv[0]";
createNode animCurveTA -n "R_eyelish_bottom_rotate_Base_AnimLayer_inputAY";
	rename -uid "0D2A0D6F-4996-26A0-4095-BBB7D79C9FD9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr -l on ".ktv[0]";
createNode animCurveTA -n "R_eyelish_bottom_rotate_Base_AnimLayer_inputAZ";
	rename -uid "7FA6CD21-4948-0539-F5C2-E1BEE4CE9CFD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "R_eyelish_bottom_scaleX_Base_AnimLayer_inputA";
	rename -uid "8D68E2EC-4B17-7179-B458-FA858C47BD8F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "R_eyelish_bottom_scaleY_Base_AnimLayer_inputA";
	rename -uid "6DAA6F6A-459C-835A-D7EF-12B668D6AEC9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "R_eyelish_bottom_scaleZ_Base_AnimLayer_inputA";
	rename -uid "4B377B0F-49B3-12CB-E846-FF8697EA94DF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
createNode animCurveTL -n "R_eyebrow_translateX_Base_AnimLayer_inputA";
	rename -uid "B842DD2A-491C-719E-C0B0-7D9E6B96D495";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -0.029116964999142167;
	setAttr -l on ".ktv[0]";
createNode animCurveTL -n "R_eyebrow_translateY_Base_AnimLayer_inputA";
	rename -uid "479743B3-4FED-B940-FA41-A3A224D9D2DE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.027556712347665657;
	setAttr -l on ".ktv[0]";
createNode animCurveTL -n "R_eyebrow_translateZ_Base_AnimLayer_inputA";
	rename -uid "FA26883B-402E-BF5B-E885-FB8FE3CE30C9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.052781770085943175;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "R_eyebrow_visibility_Base_AnimLayer_inputA";
	rename -uid "3143D7B5-49D8-76A9-C371-80A9B1521C3D";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "R_eyebrow_rotate_Base_AnimLayer_inputAX";
	rename -uid "906A3E32-45D8-1FDE-96D6-16B2626C441E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr -l on ".ktv[0]";
createNode animCurveTA -n "R_eyebrow_rotate_Base_AnimLayer_inputAY";
	rename -uid "1CA2BA00-4A0B-C72A-ECE2-F6967E394627";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr -l on ".ktv[0]";
createNode animCurveTA -n "R_eyebrow_rotate_Base_AnimLayer_inputAZ";
	rename -uid "9F913606-4473-C0CC-94E9-1C8FE4379A7E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "R_eyebrow_scaleX_Base_AnimLayer_inputA";
	rename -uid "B4B48D34-44D3-E46A-0447-6D899A874032";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "R_eyebrow_scaleY_Base_AnimLayer_inputA";
	rename -uid "21182BA1-41C2-6B24-CE82-BDB14DEA57E9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "R_eyebrow_scaleZ_Base_AnimLayer_inputA";
	rename -uid "96EA03C0-4A0C-B9BF-6B43-B6840DB43700";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
createNode animCurveTL -n "L_eyebrow_translateX_Base_AnimLayer_inputA";
	rename -uid "187B3921-41EA-C9FC-9163-1AAC09364E4B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.029083031995087518;
	setAttr -l on ".ktv[0]";
createNode animCurveTL -n "L_eyebrow_translateY_Base_AnimLayer_inputA";
	rename -uid "D3B9CB44-447C-72A1-C2EE-029531C883B7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.027556712347664991;
	setAttr -l on ".ktv[0]";
createNode animCurveTL -n "L_eyebrow_translateZ_Base_AnimLayer_inputA";
	rename -uid "4CF0D79B-4DEF-C947-FFF7-1E82EBE167AC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.052800474942365477;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "L_eyebrow_visibility_Base_AnimLayer_inputA";
	rename -uid "203D5327-4E30-34FC-6756-E7A8FD69B0BD";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "L_eyebrow_rotate_Base_AnimLayer_inputAX";
	rename -uid "60B35394-47A3-13A0-FEE2-AF9E22379C4B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr -l on ".ktv[0]";
createNode animCurveTA -n "L_eyebrow_rotate_Base_AnimLayer_inputAY";
	rename -uid "0E035848-4EE7-6249-FEA0-06A2E40EEBF0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr -l on ".ktv[0]";
createNode animCurveTA -n "L_eyebrow_rotate_Base_AnimLayer_inputAZ";
	rename -uid "121216BA-4CEB-5E45-4471-82B433A712B7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "L_eyebrow_scaleX_Base_AnimLayer_inputA";
	rename -uid "149F60CE-4DC7-C322-0BC8-C78157D2E75D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "L_eyebrow_scaleY_Base_AnimLayer_inputA";
	rename -uid "A88A285D-4E0C-96A1-892E-B3A0B6BA616E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "L_eyebrow_scaleZ_Base_AnimLayer_inputA";
	rename -uid "315A05E5-4147-4F71-26D3-8E94D4124DEA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
createNode animCurveTA -n "L_eyelish_top_rotate_Base_AnimLayer_inputAX";
	rename -uid "8FDA3709-4438-A822-E45D-EC97BAC60958";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr -l on ".ktv[0]";
createNode animCurveTA -n "L_eyelish_top_rotate_Base_AnimLayer_inputAY";
	rename -uid "AFE1593E-4999-05C9-8E5B-009C2406729C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr -l on ".ktv[0]";
createNode animCurveTA -n "L_eyelish_top_rotate_Base_AnimLayer_inputAZ";
	rename -uid "7712F0E0-4B7D-7933-DF88-3B95ADDE7136";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "L_eyelish_top_visibility_Base_AnimLayer_inputA";
	rename -uid "C7A1CD1E-4B2B-5809-67D7-05A7A8D1B2A7";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "L_eyelish_top_translateX_Base_AnimLayer_inputA";
	rename -uid "3DABBFAE-4473-D784-F88F-45835B206BCE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.035373202950510309;
	setAttr -l on ".ktv[0]";
createNode animCurveTL -n "L_eyelish_top_translateY_Base_AnimLayer_inputA";
	rename -uid "564A1D8C-4972-5C64-F918-798B5DFEA685";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.013426189921976972;
	setAttr -l on ".ktv[0]";
createNode animCurveTL -n "L_eyelish_top_translateZ_Base_AnimLayer_inputA";
	rename -uid "6108A25B-453A-62FC-7342-EEBCE80B4757";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0.031639526854205846;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "L_eyelish_top_scaleX_Base_AnimLayer_inputA";
	rename -uid "E3E21E96-462B-732B-E642-EB9B6B1460B0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "L_eyelish_top_scaleY_Base_AnimLayer_inputA";
	rename -uid "67572626-4AF5-9577-AF42-1FA2E7C31636";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
createNode animCurveTU -n "L_eyelish_top_scaleZ_Base_AnimLayer_inputA";
	rename -uid "D6D35B82-4B68-A406-4376-6F95F8683185";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr -l on ".ktv[0]";
createNode shadingEngine -n "Drukhari_Medusae_F_HM_scale_x001:blinn1SG";
	rename -uid "6AAA36D7-4EF3-C6D3-90CC-E5A2AE2057EF";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "Drukhari_Medusae_F_HM_scale_x001:materialInfo3";
	rename -uid "C15112DB-439C-4418-B522-1EAAF2EFA236";
createNode blinn -n "Drukhari_Medusae_F_HM_scale_x001:Atlas_1";
	rename -uid "80D7C79F-487D-74CD-07C6-3A918FB6B6A9";
createNode nodeGraphEditorInfo -n "Drukhari_Medusae_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "66B8B615-4A67-F47A-765C-8282913E72F5";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -786.3094925643918 -598.21426194338676 ;
	setAttr ".tgi[0].vh" -type "double2" 572.02378679362653 391.07141303164684 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 127.14286041259766;
	setAttr ".tgi[0].ni[0].y" 55.714286804199219;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -180;
	setAttr ".tgi[0].ni[1].y" 78.571426391601563;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode file -n "file4";
	rename -uid "A2DD4236-4C27-68FC-9858-3690CFA51E10";
	setAttr ".ftn" -type "string" "D:/wh-art/Art/Characters/ArmorsAndClothes/Medusae/Drukhari/Texturing_DrukhariMedusaeArmor1/AT_DrukhariMedusaeArmor1_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture4";
	rename -uid "F2D5AD53-47C9-F0D9-5B97-BB8F06DF2544";
createNode blindDataTemplate -n "Cloak1_F_HM_Scale_x001:blindDataTemplate1";
	rename -uid "5F48597A-478F-446D-120C-71AC65A23280";
	addAttr -ci true -sn "IslandGroupIDs" -ln "IslandGroupIDs" -at "long";
createNode polyUnite -n "Cloak1_F_HM_Scale_x001:polyUnite1";
	rename -uid "61943F69-448D-CC43-D774-99AAB90C78FA";
createNode phong -n "Cloak1_F_HM_Scale_x001:atlas_1";
	rename -uid "0D69D735-4622-3671-05F1-13A9B63323BF";
	setAttr ".cp" 6.311790943145752;
createNode shadingEngine -n "Cloak1_F_HM_Scale_x001:atlas_1SG";
	rename -uid "4BCA9682-40A3-DDF5-213F-EEA6DF5704BB";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "Cloak1_F_HM_Scale_x001:materialInfo16";
	rename -uid "184C8267-4926-4880-FB87-54ACACF456CD";
createNode blinn -n "Cloak1_F_HM_Scale_x001:CP_Cloak1";
	rename -uid "63B8FB43-481F-6C31-AFBB-17B001D6709E";
createNode shadingEngine -n "Cloak1_F_HM_Scale_x001:blinn1SG";
	rename -uid "1F646A76-436A-EC81-1C2F-C1BAE00D7162";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "Cloak1_F_HM_Scale_x001:materialInfo18";
	rename -uid "36C427D9-4337-8E7A-D614-08B400697B9E";
createNode nodeGraphEditorInfo -n "Cloak1_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "A7CA4493-4DED-0CA4-6CBB-3789549094E7";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -333.63093912365002 -337.79760562474826 ;
	setAttr ".tgi[0].vh" -type "double2" 334.82141526682091 336.60712948157726 ;
createNode objectSet -n "Eyewear1_F_HM_Scale_x001:TS_TorsoBase_M_HMShapeHiddenFacesSet";
	rename -uid "6B4B9709-4699-8E41-2208-3B9455327D85";
	setAttr ".ihi" 0;
createNode lambert -n "lambert3";
	rename -uid "4B103E84-46C4-5CA8-0024-40A80CF7416A";
createNode shadingEngine -n "lambert3SG";
	rename -uid "6B89C030-486B-BC74-4BBC-6DB122C2E4F5";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo7";
	rename -uid "92C00189-41CD-6C76-158C-42AC8D3513FA";
createNode blinn -n "GangMember3_F_HM_Scale_x001:atlas_1";
	rename -uid "791A20D8-468D-239B-2515-48AB09394152";
createNode shadingEngine -n "GangMember3_F_HM_Scale_x001:blinn1SG";
	rename -uid "97A0EB60-4F45-3DDC-90C5-63BE4F97E9C5";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "GangMember3_F_HM_Scale_x001:materialInfo1";
	rename -uid "809B9902-486D-045F-79B5-0198AE59A7E4";
createNode nodeGraphEditorInfo -n "GangMember3_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "DE7FF4B8-4EE4-4BA4-9ABE-65820E57ACF1";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -684.52378232327828 -426.1904592551889 ;
	setAttr ".tgi[0].vh" -type "double2" 651.19045031449252 445.2380775459236 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -264.28570556640625;
	setAttr ".tgi[0].ni[0].y" 192.85714721679688;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 42.857143402099609;
	setAttr ".tgi[0].ni[1].y" 192.85714721679688;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode blinn -n "TheodoraClothes_F_HM_Scale_x001:atlas_1";
	rename -uid "E0D5B4C6-4463-8582-5B13-20AAF51C7712";
createNode shadingEngine -n "TheodoraClothes_F_HM_Scale_x001:blinn2SG";
	rename -uid "A33C370D-4677-6343-259B-6EA12AB2A8C3";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "TheodoraClothes_F_HM_Scale_x001:materialInfo5";
	rename -uid "BC0F8D74-46DF-F8F4-B09B-8B81FDBEBA1F";
createNode file -n "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1";
	rename -uid "26568279-4D45-44B2-3AB5-AA91992F260B";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/Karonami/03_Owlcat Games/Warhammer 40000/043_Theodora Clothes/v2/BaseNormal/TheodoraClothes_bn.tga";
	setAttr ".cs" -type "string" "Raw";
createNode place2dTexture -n "TheodoraClothes_F_HM_Scale_x001:place2dTexture1";
	rename -uid "762C0E3C-430A-1BA3-DC76-66AC217E4225";
createNode bump2d -n "TheodoraClothes_F_HM_Scale_x001:bump2d1";
	rename -uid "2D16FD68-4CFC-6317-8010-B5A87061E8F1";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode nodeGraphEditorInfo -n "TheodoraClothes_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "41C9D10D-40E2-B8E5-15E8-85B3AA8E9F3B";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1452.9761327401066 -1366.3273849641198 ;
	setAttr ".tgi[0].vh" -type "double2" 476.19045726836737 580.01789239972788 ;
	setAttr -s 4 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -734.28570556640625;
	setAttr ".tgi[0].ni[0].y" -364.28570556640625;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -1041.4285888671875;
	setAttr ".tgi[0].ni[1].y" -387.14285278320313;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" -427.14285278320313;
	setAttr ".tgi[0].ni[2].y" -341.42855834960938;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -120;
	setAttr ".tgi[0].ni[3].y" -205.71427917480469;
	setAttr ".tgi[0].ni[3].nvs" 1923;
createNode lambert -n "lambert4";
	rename -uid "FCB22C23-42C7-BF30-C4FC-FFA79510B692";
createNode shadingEngine -n "lambert4SG";
	rename -uid "E879DA28-4BD6-4FEA-0F29-8DA53BA9F1E2";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo8";
	rename -uid "E4CBA580-49DF-A635-D909-DEA4473A6AF3";
createNode file -n "file5";
	rename -uid "12659886-428F-3007-CA73-629316875FE0";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture5";
	rename -uid "14799D3D-48C8-536F-E591-BF9F6C84FA55";
createNode lambert -n "Jay_Body:Jay_body1";
	rename -uid "8962AB30-49F1-E2B5-61ED-40BC66492272";
createNode shadingEngine -n "SP_Jae_F_HMSG1";
	rename -uid "B763703B-4577-178C-BAC3-06AD2B3E6C24";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo10";
	rename -uid "45A5EF66-42D9-DFC3-1263-268695EE56B0";
createNode file -n "Jay_Body:AT_Djai_F_HM_d_Recovered_2";
	rename -uid "A70CB062-4F99-EBCD-82E4-75A97E1E42E1";
	setAttr ".ftn" -type "string" "D:/wh-art/Art/Characters/ArmorsAndClothes/Jae/Texturing/Jae_hand_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture7";
	rename -uid "83D6056C-47CC-F85D-6148-1CBCF486CA8C";
createNode blinn -n "FlakArmor_F_HM_scale_x001:atlas_1";
	rename -uid "B2DF2716-403D-6BDD-82BD-E5A950C21CFB";
createNode shadingEngine -n "FlakArmor_F_HM_scale_x001:blinn1SG";
	rename -uid "FE4053C1-41F6-9F18-EF29-7DBB2F9BDD23";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "FlakArmor_F_HM_scale_x001:materialInfo8";
	rename -uid "55F4A14F-46E9-1AC2-F16A-1E8EAE72A78A";
createNode file -n "FlakArmor_F_HM_scale_x001:file13";
	rename -uid "8618A909-4D71-E105-0BCD-FE9F291A0374";
	setAttr ".ftn" -type "string" "E:/Work/ArtCharacters/Characters/ArmorsAndClothes/AstraMilitarium_FlakArmor/AT_AstraMilitarum/AT_AstraMilitarum_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "FlakArmor_F_HM_scale_x001:place2dTexture13";
	rename -uid "88D056B1-4004-2849-A910-619F5B1B8230";
createNode nodeGraphEditorInfo -n "FlakArmor_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "860CCC00-4E20-3220-E69E-A2B274F49E8A";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1024.4047211985755 -660.27962435861332 ;
	setAttr ".tgi[0].vh" -type "double2" 214.88094384235103 590.04153191152898 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 114.28571319580078;
	setAttr ".tgi[0].ni[0].y" 131.42857360839844;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -192.85714721679688;
	setAttr ".tgi[0].ni[1].y" 154.28572082519531;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode lambert -n "lambert5";
	rename -uid "86CA3F3D-4CD5-167C-737E-B1A646D50C04";
createNode shadingEngine -n "EY_Eyes02_F_HMSG";
	rename -uid "0A18F0D0-4D72-2CC3-5602-9FA4B2F5947B";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo11";
	rename -uid "140E6D50-48BB-DE02-4CE1-E5BB9179D972";
createNode file -n "HD_Head01_F_HM_1";
	rename -uid "5167808C-4B9B-3163-F4ED-D7BF32802983";
	setAttr ".ftn" -type "string" "D:/WORK/WH/PERS/Idira/HumanFemaleFace02.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture8";
	rename -uid "3F550032-44D7-FE3A-E420-5CB659FBFA12";
createNode lambert -n "lambert6";
	rename -uid "F9D8C774-48A5-5ADF-6AD3-679BB77283F7";
createNode shadingEngine -n "HH_Hair02_F_HMSG";
	rename -uid "688B0896-4C12-B430-6A49-178464EC9A0B";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo12";
	rename -uid "2B813D69-4685-0DA3-3DC7-0988A52F2CF0";
createNode objectSet -n "Eyewear1_F_HM_Scale_x002:TS_TorsoBase_M_HMShapeHiddenFacesSet";
	rename -uid "6DA40A31-41F5-0168-B02F-3EB7C4C9908D";
	setAttr ".ihi" 0;
createNode lambert -n "Eyewear1_F_HM_Scale_x002:Atlas1";
	rename -uid "8C31B678-40FC-AE29-1912-009E12EDD8BC";
createNode shadingEngine -n "Eyewear1_F_HM_Scale_x002:lambert2SG";
	rename -uid "581C5898-4062-F51D-624D-54B71F89B863";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "Eyewear1_F_HM_Scale_x002:materialInfo8";
	rename -uid "875F73DE-44F5-9707-FB95-6AAFD78A793D";
createNode nodeGraphEditorInfo -n "Eyewear1_F_HM_Scale_x002:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "882F9220-4BDB-2274-4115-F79730702322";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -617.95142124820438 -766.07139813048616 ;
	setAttr ".tgi[0].vh" -type "double2" 898.30855296495565 763.69044584414451 ;
	setAttr -s 6 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -245.71427917480469;
	setAttr ".tgi[0].ni[0].y" 138.57142639160156;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 368.57144165039063;
	setAttr ".tgi[0].ni[1].y" 115.71428680419922;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" -552.85711669921875;
	setAttr ".tgi[0].ni[2].y" 120;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -552.85711669921875;
	setAttr ".tgi[0].ni[3].y" 115.71428680419922;
	setAttr ".tgi[0].ni[3].nvs" 1923;
	setAttr ".tgi[0].ni[4].x" 202.85714721679688;
	setAttr ".tgi[0].ni[4].y" -261.42855834960938;
	setAttr ".tgi[0].ni[4].nvs" 1923;
	setAttr ".tgi[0].ni[5].x" -104.28571319580078;
	setAttr ".tgi[0].ni[5].y" -261.42855834960938;
	setAttr ".tgi[0].ni[5].nvs" 1923;
createNode file -n "Eyewear1_F_HM_Scale_x002:file7";
	rename -uid "D06D7D84-48B7-D4FF-1279-159668F6553A";
	setAttr ".ftn" -type "string" "E:/Work/ArtCharacters/Characters/ArmorsAndClothes/Eyewear1/Texturing_Eyewear1/AT_Eyewear1_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "Eyewear1_F_HM_Scale_x002:place2dTexture8";
	rename -uid "355D6870-4B87-B4F2-DDEB-A6AA13DEDA44";
createNode lambert -n "lambert8";
	rename -uid "993270C4-437A-D609-A3BA-9EB760E6D932";
createNode shadingEngine -n "HH_Hair09_F_HMSG";
	rename -uid "6B65D057-4DEE-B67C-CF0E-78A524BD7E92";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo14";
	rename -uid "E7FEC654-4CD2-FA43-63FE-AC8D6CF2F21B";
createNode file -n "AT_Jay_F_HH_d_3";
	rename -uid "00FB987F-4BE5-6F72-B235-B6A91F8C1114";
	setAttr ".ftn" -type "string" "D:/WORK/WH/PERS/ДЖАЙ/AT_Jay_F_HH_Texturing/AT_Jay_F_HH_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture9";
	rename -uid "9D763EA9-4DE4-A1C3-8ECD-D184479A2EE8";
createNode lambert -n "lambert9";
	rename -uid "D6C66A6E-4D78-127F-00C5-85B1B5B06D3C";
createNode shadingEngine -n "HD_Head09_F_HMSG";
	rename -uid "6C52FA56-4AAB-5E18-9823-9A9B22E7A693";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo15";
	rename -uid "63929B2B-4ECE-7B30-EB16-9B9772C1A7F1";
createNode file -n "AT_Djai_F_HM_d_Recovered_1";
	rename -uid "FDE96454-4EB4-0F91-C6F7-4C9C35E624A1";
	setAttr ".ftn" -type "string" "D:/WORK/WH/PERS/ДЖАЙ/AT_Djai_F_HM_d-Recovered.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture10";
	rename -uid "5BA3ACE0-42BD-4FFE-1614-1399D5CEB941";
createNode blinn -n "FlakArmor_F_HM_scale_x002:atlas_1";
	rename -uid "0D4F64A7-4290-731A-C475-B9BE80E155A7";
createNode shadingEngine -n "FlakArmor_F_HM_scale_x002:blinn1SG";
	rename -uid "7778C834-47CC-35D5-85F3-C19A528925B8";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "FlakArmor_F_HM_scale_x002:materialInfo8";
	rename -uid "739F3689-41D5-050B-F80E-7F9BB8155553";
createNode file -n "FlakArmor_F_HM_scale_x002:file13";
	rename -uid "51342249-4E9D-0B95-72D3-C98FDBCA9A7B";
	setAttr ".ftn" -type "string" "E:/Work/ArtCharacters/Characters/ArmorsAndClothes/AstraMilitarium_FlakArmor/AT_AstraMilitarum/AT_AstraMilitarum_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "FlakArmor_F_HM_scale_x002:place2dTexture13";
	rename -uid "28E3F1C2-4A04-880D-FB50-13AE264C6744";
createNode nodeGraphEditorInfo -n "FlakArmor_F_HM_scale_x002:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "CC8E9CAC-4807-9149-6AC2-1B9FB213A61E";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1024.4047211985755 -660.27962435861332 ;
	setAttr ".tgi[0].vh" -type "double2" 214.88094384235103 590.04153191152898 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 114.28571319580078;
	setAttr ".tgi[0].ni[0].y" 131.42857360839844;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -192.85714721679688;
	setAttr ".tgi[0].ni[1].y" 154.28572082519531;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode blinn -n "Eyewear2_F_HM_Scale_x001:Atlas_1";
	rename -uid "6531BC44-42D9-6796-5544-759A631D837A";
createNode shadingEngine -n "Eyewear2_F_HM_Scale_x001:blinn1SG";
	rename -uid "95DE7743-4879-5B01-132C-22B46F45D08C";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "Eyewear2_F_HM_Scale_x001:materialInfo2";
	rename -uid "8DF31DE1-43DD-AF97-1E4A-338D5FC26FE8";
createNode nodeGraphEditorInfo -n "Eyewear2_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "954CCD86-4D5A-02B2-2D86-0188A172CFA4";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -933.9285343175859 -567.26188222094277 ;
	setAttr ".tgi[0].vh" -type "double2" 424.4047450404326 422.02379275409072 ;
	setAttr -s 5 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -961.4285888671875;
	setAttr ".tgi[0].ni[0].y" -44.285713195800781;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -654.28570556640625;
	setAttr ".tgi[0].ni[1].y" -21.428571701049805;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" -40;
	setAttr ".tgi[0].ni[2].y" 114.28571319580078;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" 267.14285278320313;
	setAttr ".tgi[0].ni[3].y" 91.428573608398438;
	setAttr ".tgi[0].ni[3].nvs" 1923;
	setAttr ".tgi[0].ni[4].x" -347.14285278320313;
	setAttr ".tgi[0].ni[4].y" 1.4285714626312256;
	setAttr ".tgi[0].ni[4].nvs" 1923;
createNode objectSet -n "Boots1_F_HM_Scale_x001:ImperialNavy:textureEditorIsolateSelectSet";
	rename -uid "30A475F4-482D-AFB3-5B39-099BA13F9D32";
	setAttr ".ihi" 0;
	setAttr ".fo" yes;
createNode nodeGraphEditorInfo -n "Boots1_F_HM_Scale_x001:ImperialNavy:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "99BAB6BF-49B7-E568-9B95-039917773753";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -622.61902287839052 -405.95236482128331 ;
	setAttr ".tgi[0].vh" -type "double2" 592.85711929911758 424.99998311201801 ;
createNode objectSet -n "Boots1_F_HM_Scale_x001:ImperialNavy1:textureEditorIsolateSelectSet";
	rename -uid "D4979806-4949-833D-5A1D-308BA182B530";
	setAttr ".ihi" 0;
	setAttr ".fo" yes;
createNode nodeGraphEditorInfo -n "Boots1_F_HM_Scale_x001:ImperialNavy1:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "BF268BEF-4414-8172-A94F-E4943E9FB136";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -622.61902287839052 -405.95236482128331 ;
	setAttr ".tgi[0].vh" -type "double2" 592.85711929911758 424.99998311201801 ;
createNode objectSet -n "Boots1_F_HM_Scale_x001:ImperialNavy2:textureEditorIsolateSelectSet";
	rename -uid "2442C43E-45FB-B847-AC26-27B4FCE31FA4";
	setAttr ".ihi" 0;
	setAttr ".fo" yes;
createNode nodeGraphEditorInfo -n "Boots1_F_HM_Scale_x001:ImperialNavy2:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "9240B38A-4B84-A753-97CD-12A6501844F4";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -622.61902287839052 -405.95236482128331 ;
	setAttr ".tgi[0].vh" -type "double2" 592.85711929911758 424.99998311201801 ;
createNode nodeGraphEditorInfo -n "Boots1_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo2";
	rename -uid "DA691C86-49B3-2070-0F0C-97B5AFC1B95E";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -626.19045130790334 -427.97617346994531 ;
	setAttr ".tgi[0].vh" -type "double2" 888.69044087709108 416.6666501098216 ;
createNode lambert -n "Boots1_F_HM_Scale_x001:Atlas1";
	rename -uid "D0077808-4FA3-FD5D-3FA2-6DAA89060EB8";
	setAttr ".dc" 0.78020131587982178;
	setAttr ".tcf" 0.51006710529327393;
	setAttr ".trsd" 0;
createNode shadingEngine -n "Boots1_F_HM_Scale_x001:lambert2SG";
	rename -uid "D8D6E40A-4FF2-5753-1346-19B80AB866F8";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "Boots1_F_HM_Scale_x001:materialInfo14";
	rename -uid "E32CAB0B-4E79-6752-BA44-D8A1238F95BA";
createNode file -n "Boots1_F_HM_Scale_x001:file11";
	rename -uid "F1935AA9-45CA-1270-7D93-E190891E0B76";
	setAttr ".ftn" -type "string" "E:/Work/ArtCharacters Backup/ArmorsAndClothes/ImperialNavyNPC/ImperialNavyNPC_Texture/AT_ImperialNavyNPC_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "Boots1_F_HM_Scale_x001:place2dTexture15";
	rename -uid "BF6FD2B2-459F-8A30-3EDE-64B2F59666F5";
createNode file -n "Boots1_F_HM_Scale_x001:file12";
	rename -uid "133DD790-4596-A313-C1A9-6DBB25E50151";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "E:/Work/ArtCharacters Backup/ArmorsAndClothes/ImperialNavyNPC/ImperialNavyNPC_Texture/AT_ImperialNavyNPC_n.tga";
	setAttr ".cs" -type "string" "Raw";
createNode place2dTexture -n "Boots1_F_HM_Scale_x001:place2dTexture16";
	rename -uid "23A83C0C-4507-5C40-4587-5D9DBA5E0682";
createNode bump2d -n "Boots1_F_HM_Scale_x001:bump2d7";
	rename -uid "5C627A2D-4725-9F28-A1B4-589337228F3C";
	setAttr ".bi" 1;
	setAttr ".vc1" -type "float3" 0 3.9999999e-05 0 ;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "Boots1_F_HM_Scale_x001:file13";
	rename -uid "3699A8E2-48D4-7D80-4F45-88AD41A67A49";
	setAttr ".ftn" -type "string" "E:/Work/ArtCharacters Backup/ArmorsAndClothes/ImperialNavyNPC/ImperialNavyNPC_Texture/AT_ImperialNavyNPC_n.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "Boots1_F_HM_Scale_x001:place2dTexture17";
	rename -uid "53D02294-41DF-34D1-E045-DEA56A3B4552";
createNode nodeGraphEditorInfo -n "Boots1_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "A26298D7-4648-35ED-37BD-89BABC52E983";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -338.09522466054096 -333.33332008785732 ;
	setAttr ".tgi[0].vh" -type "double2" 330.35712972992997 341.07141501846826 ;
createNode groupId -n "GangMember1_F_HM_Scale_x001:groupId4";
	rename -uid "27B442E2-4A32-9E1A-1F74-718685ADABE5";
	setAttr ".ihi" 0;
createNode groupId -n "GangMember1_F_HM_Scale_x001:groupId12";
	rename -uid "477EFBCC-475D-97B8-F054-F1B6D86411DA";
	setAttr ".ihi" 0;
createNode materialInfo -n "GangMember1_F_HM_Scale_x001:materialInfo11";
	rename -uid "5E289499-40F4-D70A-71AC-D8AD95542FC2";
createNode shadingEngine -n "GangMember1_F_HM_Scale_x001:atlas_1SG";
	rename -uid "81A0A16A-4D4A-D133-DA16-9E9C6CDD1126";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode phong -n "GangMember1_F_HM_Scale_x001:atlas_1";
	rename -uid "451F118A-4143-2422-C847-ADB695ADE758";
	setAttr ".cp" 6.311790943145752;
createNode file -n "GangMember1_F_HM_Scale_x001:file21";
	rename -uid "BD48FD85-4AB7-10DF-A39B-EBB3E09E23AF";
	setAttr ".ftn" -type "string" "E:/Work/ArtCharacters/Characters/ArmorsAndClothes/GangMembers/GangMember1/GangMember1_Texturing/AT_GangMember1_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "GangMember1_F_HM_Scale_x001:place2dTexture21";
	rename -uid "D7D62750-4C60-F729-8CE8-ABBC3CD65153";
createNode nodeGraphEditorInfo -n "GangMember1_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "D6673CF5-41B9-3F65-E5AB-2196683212FB";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -9794.72179799064 -9897.6186543230178 ;
	setAttr ".tgi[0].vh" -type "double2" 9839.9598914311391 9911.9043680410705 ;
createNode blindDataTemplate -n "AdeptaSororitasPowerArmor_F_HM_Scale_x001:blindDataTemplate1";
	rename -uid "64BEF41B-4E30-C69C-EBA2-8F94DC4B6378";
	addAttr -ci true -sn "IslandGroupIDs" -ln "IslandGroupIDs" -at "long";
createNode phong -n "AdeptaSororitasPowerArmor_F_HM_Scale_x001:atlas_1";
	rename -uid "E7434C02-4AF4-32DE-478F-C6AC184D8C27";
	setAttr ".trsd" 0;
	setAttr ".sc" -type "float3" 0 0 0 ;
	setAttr ".cp" 6.311790943145752;
createNode shadingEngine -n "AdeptaSororitasPowerArmor_F_HM_Scale_x001:FA_AdeptaSororitasPowerArmor_F_FMSG";
	rename -uid "718F1D09-41C1-C6A7-F3A2-8982F2B50AF3";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "AdeptaSororitasPowerArmor_F_HM_Scale_x001:materialInfo1";
	rename -uid "5FD5FEB3-4D48-E735-9DE8-829F58505917";
createNode nodeGraphEditorInfo -n "AdeptaSororitasPowerArmor_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "F5B12B34-4286-87F9-5F10-8A9C166D0079";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -780.43454119118257 -2193.8249225038985 ;
	setAttr ".tgi[0].vh" -type "double2" 779.24406504801163 2208.1106362219489 ;
createNode file -n "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1";
	rename -uid "FAA52FD0-4CD1-1826-81BA-6C829B06DB94";
	setAttr ".ftn" -type "string" "D:/wh-art/Art/Characters/ArmorsAndClothes/AdeptasSororittasPowerArmor/Texturing/AT_AdeptaSororitasPowerArmor_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1";
	rename -uid "81C436D5-4049-F523-0B27-E08816DA82FA";
createNode groupId -n "AdeptaSororitasPowerArmor_F_HM_Scale_x001:groupId5";
	rename -uid "C908F039-40FA-3599-7F53-FCBEF0B6E02B";
	setAttr ".ihi" 0;
createNode blinn -n "ImperialNobiliti_F_HM_Scale_x001:Atlas_1";
	rename -uid "51F3342B-41A5-0A0E-ACAF-4B8DC798FFBF";
createNode shadingEngine -n "ImperialNobiliti_F_HM_Scale_x001:blinn1SG";
	rename -uid "82B2AE5A-4138-2EF6-9BB6-AA82B13B3C39";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "ImperialNobiliti_F_HM_Scale_x001:materialInfo3";
	rename -uid "1250C2B9-4585-0E92-6D40-6FAE1752DB6A";
createNode nodeGraphEditorInfo -n "ImperialNobiliti_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "D9579756-4414-054E-BF9E-37A29C61013B";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1117.900792206887 -1128.5713837260307 ;
	setAttr ".tgi[0].vh" -type "double2" 805.99604269610631 272.61903678614044 ;
	setAttr -s 4 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 177.14285278320313;
	setAttr ".tgi[0].ni[0].y" 102.85713958740234;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -130;
	setAttr ".tgi[0].ni[1].y" 125.71428680419922;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" 365.71429443359375;
	setAttr ".tgi[0].ni[2].y" -524.28570556640625;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" 58.571430206298828;
	setAttr ".tgi[0].ni[3].y" -500;
	setAttr ".tgi[0].ni[3].nvs" 1923;
createNode file -n "file6";
	rename -uid "2FAB4C42-46E6-57D7-8D51-63B892862E25";
	setAttr ".ftn" -type "string" "D:/wh-art/Art/Characters/ArmorsAndClothes/ImperialNobility/Female/Texturing/AT_ImperialNobilityFemale_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture11";
	rename -uid "DA8B9B9F-472C-751E-5548-A3BF3C198961";
createNode lambert -n "DefaultMaterial";
	rename -uid "B666FB43-452D-D1E4-61CD-6E8A4BB42509";
createNode shadingEngine -n "BW_Brows01_F_HMSG";
	rename -uid "D0C9F343-48B5-F573-6C0C-008871F82DDE";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo16";
	rename -uid "905B9FB2-456A-9486-58B7-EBA82E1E6A25";
createNode materialInfo -n "pasted__materialInfo426";
	rename -uid "F022B778-490B-53A2-7FE3-EB98613DE0AC";
createNode shadingEngine -n "pasted__lambert3SG";
	rename -uid "A8867F04-4CAF-9A2C-62B9-8B9B3DD7D842";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode lambert -n "pasted__DefaultMaterial";
	rename -uid "A70E02C7-45EA-C35B-3A7F-9D8C857C6507";
createNode materialInfo -n "materialInfo426";
	rename -uid "DB394BF9-4782-7E82-7837-E1BB2F839D85";
createNode shadingEngine -n "heads_lambert3SG";
	rename -uid "CB2E5586-4D1F-F14F-B8D8-EAAB755161E9";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode lambert -n "heads_DefaultMaterial";
	rename -uid "F45D8BF8-473B-BF36-1268-52BD5DEF324A";
createNode materialInfo -n "pasted__materialInfo6";
	rename -uid "E805A518-4A10-797E-0AF9-D0879B62C62A";
createNode shadingEngine -n "pasted__FT_RebelClothes3_M_HMSG";
	rename -uid "35275739-4113-BCAC-5EFF-3FB6912BCBBF";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode lambert -n "pasted__lambert2";
	rename -uid "052FCC73-4431-3209-8F3B-7DB2986FA0E4";
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo1";
	rename -uid "CD615305-4041-20F7-03FB-A2BFCFC4D488";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -330.95236780151544 -323.80951094248991 ;
	setAttr ".tgi[0].vh" -type "double2" 317.85713022663526 338.09522466054096 ;
createNode blinn -n "Atlas_1";
	rename -uid "FB84E741-462C-33CF-C6D0-B9B978E61FE3";
createNode shadingEngine -n "blinn1SG";
	rename -uid "1D1D8E82-4128-505A-35F6-0E967C778134";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "B87F4209-4F11-1A72-C41E-B297C67476C7";
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "42620C98-4745-9E81-1635-2584F0C13FF6";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -514.28569384983689 -420.23807853933437 ;
	setAttr ".tgi[0].vh" -type "double2" 491.66664712958942 439.28569683006907 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 48.571430206298828;
	setAttr ".tgi[0].ni[0].y" 197.14285278320313;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -258.57144165039063;
	setAttr ".tgi[0].ni[1].y" 197.14285278320313;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode file -n "add_file1";
	rename -uid "4D6FD319-4191-1ACF-AA96-8B8554A28A16";
	setAttr ".ftn" -type "string" "E:/!ArtCharactersWH/ArmorsAndClothes/RogueTraderCuirass/Texturing-RogueTraderCuirass/AT_RogueTraderShirt_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "add_place2dTexture1";
	rename -uid "B2B9C261-4D90-CC3E-E50A-3E94D0B98645";
createNode file -n "add_file2";
	rename -uid "38022458-4BA9-8BB6-2E6A-FF9840754257";
	setAttr ".ail" yes;
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "add_place2dTexture2";
	rename -uid "BFDAC159-49B2-7303-42BA-C6B0F6EE7640";
createNode bump2d -n "bump2d1";
	rename -uid "962D9235-49BD-0357-EE68-58A3373CDCA8";
	setAttr ".bi" 1;
	setAttr ".vc1" -type "float3" 0 9.9999997e-06 0 ;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode blinn -n "add_Atlas_1";
	rename -uid "EC9C8D59-405C-3F70-9988-C18B2E3C323C";
createNode shadingEngine -n "add_blinn1SG";
	rename -uid "67FEB236-4866-CA95-17F6-33985B0D2901";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo1";
	rename -uid "43EC66D9-4419-091F-F5DE-A7A894071AE9";
createNode file -n "AT_Boots4_n_1";
	rename -uid "AE27E693-4F8D-8235-7738-4584EC48A9DF";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/Karonami/03_Owlcat Games/Warhammer 40000/115_Boots4/v1/AT_Boots4_n.tga";
	setAttr ".cs" -type "string" "Raw";
createNode place2dTexture -n "add_place2dTexture3";
	rename -uid "01C03348-4491-96F0-F6EF-1F9FBAFDE616";
createNode bump2d -n "add_bump2d1";
	rename -uid "41A21A2E-4ACB-0D02-6CFE-BCA262EF0735";
	setAttr ".bi" 1;
	setAttr ".vc1" -type "float3" 0 0.00014000002 0 ;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo1";
	rename -uid "33D5FF5A-43EB-39ED-2127-64BAFBCE1658";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1042.2618633461395 -486.30950448532036 ;
	setAttr ".tgi[0].vh" -type "double2" 4.1666665010981374 337.49998658895549 ;
	setAttr -s 5 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -304.28570556640625;
	setAttr ".tgi[0].ni[0].y" 112.85713958740234;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 2.8571429252624512;
	setAttr ".tgi[0].ni[1].y" 90;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" -918.5714111328125;
	setAttr ".tgi[0].ni[2].y" -22.857143402099609;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -1225.7142333984375;
	setAttr ".tgi[0].ni[3].y" -45.714286804199219;
	setAttr ".tgi[0].ni[3].nvs" 1923;
	setAttr ".tgi[0].ni[4].x" -611.4285888671875;
	setAttr ".tgi[0].ni[4].nvs" 1923;
createNode blinn -n "pasted__Atlas_1";
	rename -uid "BBB465BB-4E89-07E1-3165-CCBC210B61F0";
createNode blinn -n "add_Atlas_2";
	rename -uid "296C6751-4A04-66BF-1F0C-0BBA2938B2EA";
createNode shadingEngine -n "add_blinn1SG1";
	rename -uid "DBF23634-4CA7-D125-3CF4-BDAFBC4379C4";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo2";
	rename -uid "45AD7C78-4D77-850B-C4C3-B2BA96D0CCD0";
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo2";
	rename -uid "C0E29766-4F65-2818-3985-219524036412";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1160.041691714747 -1532.3002616313045 ;
	setAttr ".tgi[0].vh" -type "double2" 1611.1401370794038 220.39555185695173 ;
	setAttr ".tgi[0].ni[0].x" 128.57142639160156;
	setAttr ".tgi[0].ni[0].y" 325.71429443359375;
	setAttr ".tgi[0].ni[0].nvs" 1923;
createNode blinn -n "atlas_1";
	rename -uid "B593B266-430B-DE2E-3B46-24B2811F9C63";
createNode blinn -n "ImperialNavyCape_mat";
	rename -uid "A43FC8F8-40FC-83FE-32C3-6AB3EEC703BB";
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo3";
	rename -uid "71B0B545-40CA-0F40-F0CC-3CA179720E02";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -822.02377685951944 -799.40473013927203 ;
	setAttr ".tgi[0].vh" -type "double2" 393.45236531798867 -2.9761903579273103 ;
	setAttr -s 10 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 307.14285278320313;
	setAttr ".tgi[0].ni[0].y" -235.71427917480469;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -614.28570556640625;
	setAttr ".tgi[0].ni[1].y" -348.57144165039063;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" -921.4285888671875;
	setAttr ".tgi[0].ni[2].y" -371.42855834960938;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -68.571426391601563;
	setAttr ".tgi[0].ni[3].y" 147.14285278320313;
	setAttr ".tgi[0].ni[3].nvs" 1923;
	setAttr ".tgi[0].ni[4].x" -682.85711669921875;
	setAttr ".tgi[0].ni[4].y" 11.428571701049805;
	setAttr ".tgi[0].ni[4].nvs" 1923;
	setAttr ".tgi[0].ni[5].x" -375.71429443359375;
	setAttr ".tgi[0].ni[5].y" 34.285713195800781;
	setAttr ".tgi[0].ni[5].nvs" 1923;
	setAttr ".tgi[0].ni[6].x" -990;
	setAttr ".tgi[0].ni[6].y" -11.428571701049805;
	setAttr ".tgi[0].ni[6].nvs" 1923;
	setAttr ".tgi[0].ni[7].x" 238.57142639160156;
	setAttr ".tgi[0].ni[7].y" 124.28571319580078;
	setAttr ".tgi[0].ni[7].nvs" 1923;
	setAttr ".tgi[0].ni[8].y" -212.85714721679688;
	setAttr ".tgi[0].ni[8].nvs" 1923;
	setAttr ".tgi[0].ni[9].x" -307.14285278320313;
	setAttr ".tgi[0].ni[9].y" -325.71429443359375;
	setAttr ".tgi[0].ni[9].nvs" 1923;
createNode phong -n "CP_ImperialRogueTrader";
	rename -uid "42DCB544-4757-6F45-F70A-7BADF2EF480D";
	setAttr ".cp" 6.311790943145752;
createNode file -n "add_file5";
	rename -uid "E926F96B-4630-B3F8-BD37-DA9E8F05C90D";
	setAttr ".ftn" -type "string" "E:/!ArtCharactersWH//ArmorsAndClothes/ImperialNavyRogueTrader/Texturing/Texturing/Cape4k/RebakeForNewGeometry/CP_ImperialNavyRogueTrader_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "add_place2dTexture6";
	rename -uid "6C70700B-4B99-92AC-E5F9-F6BC761A4D43";
createNode materialInfo -n "add_materialInfo7";
	rename -uid "4805D2F9-4769-DA25-25FA-DF89166525B5";
createNode shadingEngine -n "SP_ImperialNavy_M_HM_LPSG";
	rename -uid "048D2ABE-4C40-C157-5295-4096C6A0E0BE";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode phong -n "SP_ImperialNavy";
	rename -uid "D120B21C-4783-FF18-1ED0-C5A92B963319";
	setAttr ".dc" 1;
	setAttr ".sc" -type "float3" 0.25 0.25 0.25 ;
	setAttr ".rfl" 0;
	setAttr ".cp" 6.3117918968200684;
createNode file -n "add_file4";
	rename -uid "3560CCBF-4E63-D4C9-1BB3-88A33E2EC69A";
	setAttr ".ftn" -type "string" "E:/!ArtCharactersWH//ArmorsAndClothes/ImperialNavyRogueTrader/Texturing/Texturing/Cape4k/RebakeForNewGeometry/SP/AT_ImperialNavyRogueTrader_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "add_place2dTexture5";
	rename -uid "43454164-4FF1-15F2-7F71-45AA3BD0B877";
createNode file -n "add_file3";
	rename -uid "007E6DAC-4C48-11AD-2227-C6BDB7512261";
	setAttr ".ftn" -type "string" "E:/!ArtCharactersWH//ArmorsAndClothes/ImperialNavyRogueTrader/Texturing/Texturing/AT_ImperialNavy_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "add_place2dTexture4";
	rename -uid "9E35899F-4452-3DED-E03D-D584F4497FA5";
createNode blinn -n "add_Atlas_3";
	rename -uid "A1A18B74-40E0-BEAC-FEA2-90AC3C70E65E";
createNode file -n "EnforcerLightCarapace_bn_P";
	rename -uid "35BB1873-4E24-860A-749A-71A42446387A";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/Karonami/03_Owlcat Games/Warhammer 40000/075_Enforcer Light Carapace/v2/BaseNormal/EnforcerLightCarapace_bn.tga";
	setAttr ".cs" -type "string" "Raw";
createNode place2dTexture -n "add_place2dTexture7";
	rename -uid "5B1EBA28-426B-BFCB-07C7-ABAD331E416D";
createNode bump2d -n "add_bump2d2";
	rename -uid "DB29A7AF-44F5-36EE-A10F-B0ADC13221EF";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode blinn -n "Character_human_atlas_layout_4k_WH_M";
	rename -uid "2FC1495B-45A9-301C-F32D-F1AB4E8F1B20";
createNode file -n "Character_human_atlas_layout_4k_WH_P";
	rename -uid "ABB95843-407F-2509-18AF-E38DBF853E4D";
	setAttr ".ftn" -type "string" "E:/Work/ArtCharacters/Characters/Character_human_atlas_layout_4k_WH.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "add_place2dTexture8";
	rename -uid "34734FC3-417E-E6DE-DFC0-64A4ED9B2EBD";
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo4";
	rename -uid "24240384-4B92-A19E-FDC0-A0882C6815A0";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1038.6904349166264 -1201.2884863786405 ;
	setAttr ".tgi[0].vh" -type "double2" 320.23808251297709 169.74090832103977 ;
	setAttr -s 5 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 167.14285278320313;
	setAttr ".tgi[0].ni[0].y" -350;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -767.14288330078125;
	setAttr ".tgi[0].ni[1].y" -462.85714721679688;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" -1074.2857666015625;
	setAttr ".tgi[0].ni[2].y" -485.71429443359375;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -447.14285278320313;
	setAttr ".tgi[0].ni[3].y" -440;
	setAttr ".tgi[0].ni[3].nvs" 1923;
	setAttr ".tgi[0].ni[4].x" -140;
	setAttr ".tgi[0].ni[4].y" -327.14285278320313;
	setAttr ".tgi[0].ni[4].nvs" 1923;
createNode shadingEngine -n "blinn1SG2";
	rename -uid "98AE7A28-4014-6EF4-A037-04BE7ACCD131";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo10";
	rename -uid "F32C6CC9-411C-63DE-A893-B2947D7E3C1D";
createNode blinn -n "Atlas_3";
	rename -uid "3A467437-441F-4083-6FE4-A589F741F172";
createNode bump2d -n "bump2d3";
	rename -uid "FBCF717F-41FA-A783-9745-ED943F73F8C0";
	setAttr ".bi" 1;
	setAttr ".vc1" -type "float3" 0 0.00018000003 0 ;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "LL_EnforcerLightCarapace_n_1";
	rename -uid "DAFCDECE-4E5A-08B4-4013-C8A8FB3939F9";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "E:/Owlcat Games/Warhammer 40000/119_MilitarumTempestusCarapace_EnforcerLightCarapace 2/v1/EnforcerLightCarapace/LL_EnforcerLightCarapace_n.tga";
	setAttr ".cs" -type "string" "Raw";
createNode place2dTexture -n "add_place2dTexture9";
	rename -uid "D8D8E3B6-43DD-5A55-75B7-4B829492D8C1";
createNode shadingEngine -n "blinn1SG1";
	rename -uid "90AE84BB-4DB0-7DC0-27D2-B5910C0ABBFB";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo9";
	rename -uid "D4A62A6C-4813-FC64-0D45-33BBB74AF967";
createNode blinn -n "Atlas_2";
	rename -uid "760A6618-455E-B155-4D2B-D0A14311A514";
createNode bump2d -n "bump2d2";
	rename -uid "FAB54AF7-432B-FA4A-9CDD-0789540C9D44";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "EnforcerLightCarapace_bn_P1";
	rename -uid "061D1F0D-44B3-C640-A662-EEBD8C5F6CB0";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/Karonami/03_Owlcat Games/Warhammer 40000/075_Enforcer Light Carapace/v2/BaseNormal/EnforcerLightCarapace_bn.tga";
	setAttr ".cs" -type "string" "Raw";
createNode place2dTexture -n "place2dTexture6";
	rename -uid "657D9EA2-4344-FB58-9628-7980D107E718";
createNode blinn -n "add_atlas_1";
	rename -uid "DD2161AE-4367-F869-B00C-DE8065FB886E";
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo5";
	rename -uid "CD832947-45EB-5E3F-F6B4-E19AB78C6C59";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -908.92853531099661 -487.4999806284913 ;
	setAttr ".tgi[0].vh" -type "double2" 180.35713569039413 383.92855617262126 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -611.4285888671875;
	setAttr ".tgi[0].ni[0].y" 135.71427917480469;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -304.28570556640625;
	setAttr ".tgi[0].ni[1].y" 135.71427917480469;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode materialInfo -n "add_materialInfo12";
	rename -uid "15CE43F4-4206-3156-4AAC-4D9932CB571A";
createNode shadingEngine -n "add_blinn1SG5";
	rename -uid "3A525EB9-4CC1-8E97-5B9C-848CD21C7F9B";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode blinn -n "add_Atlas_4";
	rename -uid "DB94D5E1-4A27-FF5D-F02F-128854D77B77";
createNode blinn -n "add_Atlas_5";
	rename -uid "E6405C36-4F66-BCFE-E9C9-5F810E173D31";
createNode shadingEngine -n "add_blinn1SG6";
	rename -uid "6FD56182-4CEB-EA40-548E-C5A87661C634";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo13";
	rename -uid "601DFE62-4BF5-36F5-6D86-8193D4999976";
createNode blinn -n "CP_CloakAstraMilitariumRT_M1";
	rename -uid "FFE41407-4361-C223-9B36-C3A3322B259F";
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo6";
	rename -uid "E24FBA73-4031-DB1F-6311-889F9A36F6C2";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1337.3998709695754 -2027.5345428441337 ;
	setAttr ".tgi[0].vh" -type "double2" 1036.6135046254137 -526.0367842574874 ;
	setAttr ".tgi[0].ni[0].x" 301.42855834960938;
	setAttr ".tgi[0].ni[0].y" 57.142856597900391;
	setAttr ".tgi[0].ni[0].nvs" 1923;
createNode file -n "add_file6";
	rename -uid "88244C82-4AC1-2541-F358-C396E8A1EB16";
	setAttr ".ftn" -type "string" "F:\\WHArtSvn\\Art\\Characters\\atlasWH.png";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "add_place2dTexture10";
	rename -uid "E08728BD-46B7-0FC3-6F77-F49B8B039AB7";
createNode phong -n "add_atlas_2";
	rename -uid "C4611A6A-4557-32CD-7257-F9B7380A9775";
	setAttr ".cp" 6.311790943145752;
createNode shadingEngine -n "CL_NavyRenegade_M_HMSG";
	rename -uid "6BDE8A67-4C21-6BE3-834A-A79C2757F755";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
	rename -uid "FC624C1C-411E-0DEE-F896-2FAFD8840963";
createNode bump2d -n "add_bump2d3";
	rename -uid "74F4D711-4CD8-382A-EBD5-A5A799152753";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "Seneshal_N_1";
	rename -uid "3364DE7B-4EAC-C5C3-4B09-4F8463EB3DA4";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "E:/Work/ArtCharacters//ArmorsAndClothes/Seneshal/Seneshal/Seneshal_N.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "add_place2dTexture11";
	rename -uid "A1954FBE-450B-5E6A-1DF7-2E8098AB5A95";
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo7";
	rename -uid "440445F1-440A-6F88-5B25-81994106B6B0";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -622.61902287839052 -384.52379424420673 ;
	setAttr ".tgi[0].vh" -type "double2" 592.85711929911758 402.3809363917706 ;
createNode phong -n "pasted__atlas_1";
	rename -uid "304D2D9A-47E4-607E-8B64-AC98783526C1";
	setAttr ".cp" 6.311790943145752;
createNode bump2d -n "pasted__bump2d1";
	rename -uid "052604C9-47E7-F963-81FE-879E9903403C";
	setAttr ".bi" 1;
createNode file -n "pasted__Seneshal_N_1";
	rename -uid "35DCD87B-413C-EF44-157A-EC8B0CD2C65F";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "E:/Work/ArtCharacters//ArmorsAndClothes/Seneshal/Seneshal/Seneshal_N.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "pasted__place2dTexture1";
	rename -uid "784B4E46-4B33-BA22-2705-B387ED034B92";
createNode animCurveTU -n "L_Up_arm_visibility";
	rename -uid "0900425D-46B9-243C-ABD1-F29150F3884B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "L_Up_arm_translateX";
	rename -uid "1EAC5FE0-4C9C-C5EF-E4CB-FC8F9B369E8E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 -0.12 20 -0.12;
createNode animCurveTL -n "L_Up_arm_translateY";
	rename -uid "507D62BE-4173-2F11-F77C-2E881585799C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 20 0;
createNode animCurveTL -n "L_Up_arm_translateZ";
	rename -uid "CA138388-4811-7860-92A5-9BB5A194A842";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 20 0;
createNode animCurveTA -n "L_Up_arm_rotateX";
	rename -uid "5369CAF7-437A-7827-8CD4-06807CD447A1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 20 0;
createNode animCurveTA -n "L_Up_arm_rotateY";
	rename -uid "9FC4EC28-4DE7-6589-32D5-CF8DBDCC524C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 20 -50.855953544985837;
createNode animCurveTA -n "L_Up_arm_rotateZ";
	rename -uid "310C2821-4B07-61DA-F5D3-ABB99644FDC3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 20 0;
createNode animCurveTU -n "L_Up_arm_scaleX";
	rename -uid "8053DB6D-4241-23C4-0E00-18A8FD219F24";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 20 1;
createNode animCurveTU -n "L_Up_arm_scaleY";
	rename -uid "10CB5B4A-4C56-07A5-91E4-FA8B01383A62";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 20 1;
createNode animCurveTU -n "L_Up_arm_scaleZ";
	rename -uid "130E8BE6-4890-3688-CA21-7DAAF905E50D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 20 1;
createNode animCurveTU -n "L_Up_arm_segmentScaleCompensate";
	rename -uid "F63A28ED-4B46-15B7-9F2D-6E83717FFF5B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 20 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTU -n "R_Up_arm_visibility";
	rename -uid "AFDD45A6-4269-782F-C875-C6A62BB84816";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "R_Up_arm_translateX";
	rename -uid "604694CF-4322-8DC7-4427-F289C8968CF2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0.12001305315136901 20 0.12001305315136901;
createNode animCurveTL -n "R_Up_arm_translateY";
	rename -uid "F1A8C0A1-4AA3-F2E6-AFB0-D4B9A88993FF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1.4105487395471572e-07 20 1.4105487395471572e-07;
createNode animCurveTL -n "R_Up_arm_translateZ";
	rename -uid "A09BEA8A-4338-A4C8-D940-51A72453553A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 -2.5133216590145224e-06 20 -2.5133216590145224e-06;
createNode animCurveTA -n "R_Up_arm_rotateX";
	rename -uid "6FA79AA9-48EB-27B6-AFB0-C0BAFE5AE6BF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 20 0;
createNode animCurveTA -n "R_Up_arm_rotateY";
	rename -uid "32169255-4A4D-08C7-A96F-AD8DFF6A3564";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 20 -50.855953544985837;
createNode animCurveTA -n "R_Up_arm_rotateZ";
	rename -uid "18466F72-45E8-78E6-FA74-89823879BD9A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 20 0;
createNode animCurveTU -n "R_Up_arm_scaleX";
	rename -uid "EA8B2137-49E9-9FC2-3094-BCA5EFFE09AF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 20 1;
createNode animCurveTU -n "R_Up_arm_scaleY";
	rename -uid "233B0CA2-42A4-F5FD-3DB3-BA90D17AA737";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 20 1;
createNode animCurveTU -n "R_Up_arm_scaleZ";
	rename -uid "D63508F7-4567-6C6F-1482-EEABD4068D86";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 20 1;
createNode animCurveTU -n "R_Up_arm_segmentScaleCompensate";
	rename -uid "6C2727CD-4509-7732-0216-EC9B579B97CE";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 20 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode shadingEngine -n "add_blinn1SG7";
	rename -uid "4CE1ACD5-4679-9E48-5F44-DDAEBF857427";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo6";
	rename -uid "83F73D1D-4A42-DFD1-9FE1-A3AD1B5F2D5D";
createNode blinn -n "add_Atlas_6";
	rename -uid "22080770-44AD-5A6E-FD71-8BB11EE4451B";
createNode materialInfo -n "materialInfo32";
	rename -uid "614B37CA-4A2A-5EBA-BAAA-E8B1C3F20914";
createNode shadingEngine -n "add_blinn1SG9";
	rename -uid "865DA41B-41CF-2C0B-262F-4B9001C6DE16";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode blinn -n "Atlas1";
	rename -uid "23C394EC-454B-15A8-C0EE-57B1A772B277";
createNode materialInfo -n "add_materialInfo15";
	rename -uid "79AAF57A-4708-61FB-C6DB-049AD3976E8C";
createNode shadingEngine -n "add_blinn1SG8";
	rename -uid "03A97500-42AB-0D72-750F-79A4F4376AE0";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode blinn -n "add_Atlas_7";
	rename -uid "0DA9D26D-4CDD-8207-103A-62884C96D624";
createNode blinn -n "add_Atlas_8";
	rename -uid "AFD88DE4-4156-063B-D7E0-01B7D5D98F22";
createNode shadingEngine -n "add_blinn1SG10";
	rename -uid "1E32AD25-4C94-1880-C5AB-49A8C853F4B4";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo16";
	rename -uid "842B1E90-46E6-4A04-C33B-999E4EE6A677";
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo8";
	rename -uid "62919782-4821-33C6-6860-78AB688FFB94";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1030.3571019144301 -954.20850213319693 ;
	setAttr ".tgi[0].vh" -type "double2" 583.3333101537504 673.85137041644555 ;
	setAttr ".tgi[0].ni[0].x" 237.14285278320313;
	setAttr ".tgi[0].ni[0].y" 24.285715103149414;
	setAttr ".tgi[0].ni[0].nvs" 1923;
createNode blinn -n "add_Atlas_9";
	rename -uid "862A2A6F-4B12-296F-FFCF-A1B364E1768B";
createNode shadingEngine -n "add_blinn1SG11";
	rename -uid "0E44F73E-42AA-9BC9-B5D6-6DA8A8D2CC18";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo17";
	rename -uid "9806C1A4-4A69-BA93-84D5-3EA0A0B47883";
createNode blinn -n "BP_AdeptusAdministratum_M";
	rename -uid "F20697FD-4616-BBEE-016E-7E87DBD3732D";
createNode shadingEngine -n "blinn2SG";
	rename -uid "2956281A-40B7-34A9-0A7E-45B3D3716B45";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo18";
	rename -uid "ECEEC13F-4064-76F9-6260-B5ACE9436011";
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo9";
	rename -uid "A5934F94-4EC4-D2FE-B139-A6ADF65CE1F8";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -579.73911564659909 -905.01134707735162 ;
	setAttr ".tgi[0].vh" -type "double2" 1224.8709435495914 236.35457228141991 ;
	setAttr -s 4 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 74.285713195800781;
	setAttr ".tgi[0].ni[0].y" -382.85714721679688;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 381.42855834960938;
	setAttr ".tgi[0].ni[1].y" -382.85714721679688;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" 467.14285278320313;
	setAttr ".tgi[0].ni[2].y" 122.85713958740234;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" 160;
	setAttr ".tgi[0].ni[3].y" 145.71427917480469;
	setAttr ".tgi[0].ni[3].nvs" 1923;
createNode lambert -n "pasted__DefaultMaterial1";
	rename -uid "DF9ADD3D-449D-9AF5-8B6E-A6824836C466";
createNode phong -n "ChaosCultist4__scale_x001:Atlas_1";
	rename -uid "CC75D769-4AD9-C492-B410-73A96B9F00A6";
	setAttr ".cp" 6.311790943145752;
createNode bump2d -n "ChaosCultist4__scale_x001:bump2d1";
	rename -uid "9F2437FE-4C41-3D08-4257-BEAB8763C725";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "ChaosCultist4__scale_x001:ChaosCultist4_N_1";
	rename -uid "503D368E-4E3D-C130-DF51-0ABD1C452336";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "E:/Work/ArtCharacters/ArmorsAndClothes/ChaosCultist4/ChaosCultist4/ChaosCultist4_N.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "ChaosCultist4__scale_x001:place2dTexture2";
	rename -uid "556DFA75-4B50-9FF7-6E31-4199625BAF6D";
createNode blinn -n "CrimeLordRogueTrader_M_HM_Scale_x001:atlas_1";
	rename -uid "D38CAD02-47CB-BE87-5E1F-21B2F810E434";
createNode bump2d -n "CrimeLordRogueTrader_M_HM_Scale_x001:bump2d1";
	rename -uid "7ECFC6EA-4782-0F90-4BB6-1DA9F35F8CBB";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1";
	rename -uid "1D4988F3-4DAB-2976-7AFE-D3977122E120";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/Karonami/03_Owlcat Games/Warhammer 40000/012_Crime Lord Rogue Trader/v1/CrimeLordRogueTrader_N.tga";
	setAttr ".cs" -type "string" "Raw";
createNode place2dTexture -n "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1";
	rename -uid "5CD33192-459E-F18F-9AF5-E4B8FC8F0797";
createNode blinn -n "CrimeLordRogueTrader_M_HM_Scale_x002:atlas_1";
	rename -uid "6CBF2BF4-4534-7669-C214-449B0173AD6A";
createNode bump2d -n "CrimeLordRogueTrader_M_HM_Scale_x002:bump2d1";
	rename -uid "BD162F5E-40A3-8BC9-D05F-CF9A96F16627";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1";
	rename -uid "BC28B4C9-4E85-AB2C-FF1C-31A4509C7498";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/Karonami/03_Owlcat Games/Warhammer 40000/012_Crime Lord Rogue Trader/v1/CrimeLordRogueTrader_N.tga";
	setAttr ".cs" -type "string" "Raw";
createNode place2dTexture -n "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1";
	rename -uid "5EA0BB78-4E00-74F2-AE71-B1ADF788E692";
createNode lambert -n "pasted__DefaultMaterial2";
	rename -uid "D145FFE5-4255-3C84-A47C-96BA51FB4F2D";
createNode phong -n "ChaosCultist4__scale_x002:Atlas_1";
	rename -uid "3B89CBD3-4E18-EB5B-B358-1B8594DEA191";
	setAttr ".cp" 6.311790943145752;
createNode bump2d -n "ChaosCultist4__scale_x002:bump2d1";
	rename -uid "5B53E240-47C2-AC95-C44D-A2AC650E2025";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "ChaosCultist4__scale_x002:ChaosCultist4_N_1";
	rename -uid "0868AA1B-4585-3609-35DA-61B009AF9995";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "E:/Work/ArtCharacters/ArmorsAndClothes/ChaosCultist4/ChaosCultist4/ChaosCultist4_N.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "ChaosCultist4__scale_x002:place2dTexture2";
	rename -uid "0D039BD9-4D81-CE5C-DE81-7795D311017B";
createNode blinn -n "CrimeLordRogueTrader_M_HM_Scale_x003:atlas_1";
	rename -uid "63C19D73-4288-A46D-AD92-5692B2FF86A5";
createNode bump2d -n "CrimeLordRogueTrader_M_HM_Scale_x003:bump2d1";
	rename -uid "29A1DDF8-4F0B-B92F-95B3-9B9110780C37";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1";
	rename -uid "46090FFC-4C50-1590-0A04-1B90F695B25C";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/Karonami/03_Owlcat Games/Warhammer 40000/012_Crime Lord Rogue Trader/v1/CrimeLordRogueTrader_N.tga";
	setAttr ".cs" -type "string" "Raw";
createNode place2dTexture -n "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1";
	rename -uid "D0ADD24C-4092-2D04-38B0-638CABC38189";
createNode blinn -n "CrimeLordRogueTrader_M_HM_Scale_x004:atlas_1";
	rename -uid "2219D169-4DE8-219A-E5B7-A99795791343";
createNode bump2d -n "CrimeLordRogueTrader_M_HM_Scale_x004:bump2d1";
	rename -uid "0BCB125F-4DF6-E5D4-8D4A-C6B7D0E6DDE4";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1";
	rename -uid "20E15294-4D2D-E411-9316-9AA2AF9B2D79";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "D:/Karonami/03_Owlcat Games/Warhammer 40000/012_Crime Lord Rogue Trader/v1/CrimeLordRogueTrader_N.tga";
	setAttr ".cs" -type "string" "Raw";
createNode place2dTexture -n "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1";
	rename -uid "E049B9CE-4106-5256-F62E-05BDB1A56AB7";
createNode dagPose -n "bindPose6";
	rename -uid "3B911405-4F8A-15D5-3AB9-659587518B9C";
	setAttr -s 166 ".wm";
	setAttr ".wm[0]" -type "matrix" 0.99999999999998856 -1.5099582926491191e-07 0 0 7.9409338805090657e-23 4.4408920985006262e-16 -1 0
		 1.5099582926491191e-07 0.99999999999998868 4.4408920985006262e-16 0 1.6162710543192327e-06 7.499949927770349e-08 -1.7468560070676653e-09 1;
	setAttr ".wm[1]" -type "matrix" 5.5046999290195441e-07 0.99999999999984845 4.4408920985002712e-16 0
		 -0.99999999999952927 5.5046999279088361e-07 7.9894832705207385e-07 0 7.989483269965051e-07 -4.4016005166177621e-13 0.9999999999996807 0
		 1.6156555032646602e-06 7.4999499370648997e-08 -1.7468560070676653e-09 1;
	setAttr ".wm[2]" -type "matrix" 5.5046999290195441e-07 0.99999999999984845 4.4408920985002712e-16 0
		 -0.99999999999952927 5.5046999279088361e-07 7.9894832705207385e-07 0 7.989483269965051e-07 -4.4016005166177621e-13 0.9999999999996807 0
		 1.6156555032646581e-06 7.4999499370648997e-08 -1.7468560070676653e-09 1;
	setAttr ".wm[3]" -type "matrix" 0.99999999999997158 -1.8294025414811402e-07 -1.5099574884878855e-07 0
		 -1.5099569455835849e-07 2.960767562232299e-07 -0.99999999999994482 0 1.8294029896234176e-07 0.99999999999993949 2.960767286827592e-07 0
		 2.5013986340984517e-06 0.959474786511475 -6.8391900432882013e-11 1;
	setAttr ".wm[4]" -type "matrix" 0.99999999999997702 -1.5099580466493467e-07 -1.5099573939078039e-07 0
		 -1.5099571466470977e-07 1.6291844281631984e-07 -0.99999999999997513 0 1.5099582937282804e-07 0.99999999999997524 1.6291842009675927e-07 0
		 0.010001754887216432 0.91972627813743157 0.00242803669434176 1;
	setAttr ".wm[5]" -type "matrix" -0.15319112859145514 0.98478152061193891 0.082084315079758496 0
		 0.09865379992603672 -0.067409246389017366 0.99283604953759508 0 0.98325983640186854 0.16019160453189041 -0.086825940573475521 0
		 0.10627899999999593 0.9197259999997548 0.0024280600000002655 1;
	setAttr ".wm[6]" -type "matrix" -0.19534251699237662 0.9756608733185973 0.099635141041073433 0
		 0.10567981578512403 -0.080060409996805609 0.9911720876249317 0 0.97502465486299617 0.20414747372018824 -0.087468459360845088 0
		 0.16728799999999591 0.5260939999997547 -0.030391999999999232 1;
	setAttr ".wm[7]" -type "matrix" 0.025033081645243482 0.52811141640872938 -0.84880603006936028 0
		 -0.14999686831468645 0.84144429076604488 0.51910735405406694 0 0.98836950798733603 0.11432338954034393 0.10027900221321306 0
		 0.25371999999999706 0.094400699999755089 -0.074476799999998983 1;
	setAttr ".wm[8]" -type "matrix" 0.063563399935808881 0.033038749958747685 -0.99743076711607581 0
		 -0.99745280540083547 -0.030311178277780779 -0.064568827381447216 0 -0.032366575144784165 0.99899433105127067 0.031027912285893675 0
		 0.25052686146609177 0.027059257377606727 0.033756385351588952 1;
	setAttr ".wm[9]" -type "matrix" 0.063563399935808881 0.033038749958747685 -0.99743076711607581 0
		 -0.99745280540083547 -0.030311178277780779 -0.064568827381447216 0 -0.032366575144784165 0.99899433105127067 0.031027912285893675 0
		 0.25052686146609165 0.027059257377607043 0.033756385351588772 1;
	setAttr ".wm[10]" -type "matrix" 0.025033081645243482 0.52811141640872938 -0.84880603006936028 0
		 -0.14999686831468645 0.84144429076604488 0.51910735405406694 0 0.98836950798733603 0.11432338954034393 0.10027900221321306 0
		 0.25371999999999684 0.094400699999755311 -0.074476799999999163 1;
	setAttr ".wm[11]" -type "matrix" -0.19534251699237662 0.9756608733185973 0.099635141041073433 0
		 0.10567981578512403 -0.080060409996805609 0.9911720876249317 0 0.97502465486299617 0.20414747372018824 -0.087468459360845088 0
		 0.24343799999999666 0.1629569999997551 -0.083483699999999023 1;
	setAttr ".wm[12]" -type "matrix" -0.19534251699237662 0.9756608733185973 0.099635141041073433 0
		 0.10567981578512403 -0.080060409996805609 0.9911720876249317 0 0.97502465486299617 0.20414747372018824 -0.087468459360845088 0
		 0.16728799999999575 0.52609399999975492 -0.030391999999999236 1;
	setAttr ".wm[13]" -type "matrix" -0.15319112859145514 0.98478152061193891 0.082084315079758496 0
		 0.09865379992603672 -0.067409246389017366 0.99283604953759508 0 0.98325983640186854 0.16019160453189041 -0.086825940573475521 0
		 0.10627899999999593 0.9197259999997548 0.0024280600000002516 1;
	setAttr ".wm[14]" -type "matrix" 0.98352383668862886 0.18077849060460388 -2.3037127760971998e-15 0
		 -0.18077849060460396 0.98352383668862897 -1.1740825325845528e-14 0 -1.8041124150158794e-16 1.2000817006807551e-14 1 0
		 0.08999999999999958 0.94841842365713536 -0.037586958176367126 1;
	setAttr ".wm[15]" -type "matrix" 0.98352383668862886 0.18077849060460388 -2.3037127760971998e-15 0
		 -0.18077849060460396 0.98352383668862897 -1.1740825325845528e-14 0 -1.8041124150158794e-16 1.2000817006807551e-14 1 0
		 0.089999999999999608 0.94841842365713547 -0.03758695817636714 1;
	setAttr ".wm[16]" -type "matrix" -0.1242147920651977 -0.51594310322870651 0.8475691120274097 0
		 -0.074814447192810329 0.85662285413753236 0.51049004325305103 0 -0.98943088890706932 -3.6082248300317588e-16 -0.1450052277559884 0
		 0.10102670121246134 0.83837440204031433 0.038265589980884085 1;
	setAttr ".wm[17]" -type "matrix" -0.13577989848138874 0.985552881725691 -0.10123900676404353 0
		 0.22683586974658729 0.13039588567839952 0.96516444256637146 0 0.96442174766265643 0.10808529187790576 -0.24126388522730668 0
		 0.086770299999995915 0.83869399999975536 0.13554400000000022 1;
	setAttr ".wm[18]" -type "matrix" -0.13577989848138874 0.985552881725691 -0.10123900676404353 0
		 0.22683586974658729 0.13039588567839952 0.96516444256637146 0 0.96442174766265643 0.10808529187790576 -0.24126388522730668 0
		 0.13171799999999592 0.49846699999975502 0.17219000000000145 1;
	setAttr ".wm[19]" -type "matrix" -0.13577989848138874 0.985552881725691 -0.10123900676404353 0
		 0.22683589007025631 0.13039588795612675 0.96516443748211489 0 0.96442174288244753 0.10808528913001786 -0.24126390556662683 0
		 0.13171799999999598 0.4984669999997553 0.1721900000000014 1;
	setAttr ".wm[20]" -type "matrix" -0.13577989848138874 0.985552881725691 -0.10123900676404353 0
		 0.22683586974658729 0.13039588567839952 0.96516444256637146 0 0.96442174766265643 0.10808529187790576 -0.24126388522730668 0
		 0.086770299999995942 0.83869399999975536 0.13554400000000022 1;
	setAttr ".wm[21]" -type "matrix" -0.062712120734534138 -0.45694219285386367 -0.88728294376871619 0
		 -0.032215773112077961 0.88949639256710955 -0.4558051245575116 0 0.99751157079793706 -3.3306690738754696e-16 -0.07050295117391675 0
		 0.10357577045941022 0.85340534688196523 -0.035371575117079813 1;
	setAttr ".wm[22]" -type "matrix" -0.10409325504850769 0.9771920651797531 0.18509527817622615 0
		 0.018753544802592732 -0.1841447154037352 0.98272021875313731 0 0.99439071737961382 0.10576573896402194 0.00084240765126911143 0
		 0.09714629999999598 0.85318199999975453 -0.12678599999999982 1;
	setAttr ".wm[23]" -type "matrix" -0.10409325504850769 0.9771920651797531 0.18509527817622615 0
		 0.018753544802592732 -0.1841447154037352 0.98272021875313731 0 0.99439071737961382 0.10576573896402194 0.00084240765126911143 0
		 0.12816999999999568 0.52350999999975456 -0.17779099999999937 1;
	setAttr ".wm[24]" -type "matrix" -0.10409325504850769 0.9771920651797531 0.18509527817622615 0
		 0.018753544802592732 -0.1841447154037352 0.98272021875313731 0 0.99439071737961382 0.10576573896402194 0.00084240765126911143 0
		 0.12816999999999545 0.52350999999975467 -0.17779099999999928 1;
	setAttr ".wm[25]" -type "matrix" -0.10409325504850769 0.9771920651797531 0.18509527817622615 0
		 0.018753544802592732 -0.1841447154037352 0.98272021875313731 0 0.99439071737961382 0.10576573896402194 0.00084240765126911143 0
		 0.097146299999995772 0.85318199999975464 -0.12678599999999973 1;
	setAttr ".wm[26]" -type "matrix" 0.99999999999998135 -1.1905135518177949e-07 -1.5099572993277209e-07 0
		 1.5099571042553222e-07 -1.6279671886471323e-07 0.99999999999997535 0 -1.1905137987129229e-07 -0.99999999999997979 -1.6279670096862873e-07 0
		 -0.0099967644875541811 0.91972607611366342 0.0024280396031870137 1;
	setAttr ".wm[27]" -type "matrix" -0.15319112859145523 -0.98478152061193924 -0.082084315079759274 0
		 0.098653799926038427 0.067409246389017921 -0.99283604953759508 0 0.98325983640186843 -0.16019160453189063 0.086825940573476881 0
		 -0.10627363853236743 0.91972609244770676 0.002428055937223143 1;
	setAttr ".wm[28]" -type "matrix" -0.19534251699237803 -0.9756608733185973 -0.099635141041074585 0
		 0.10567981578520723 0.080060409996789303 -0.99117208762492426 0 0.97502465486298695 -0.20414747372019651 0.087468459360929063 0
		 -0.16728304451914308 0.52609376942670483 -0.030391959167977746 1;
	setAttr ".wm[29]" -type "matrix" 0.025033081645244315 -0.52811141640873083 0.84880603006935951 0
		 -0.14999686831468484 -0.84144429076604432 -0.51910735405406816 0 0.98836950798733636 -0.11432338954034196 -0.1002790022132133 0
		 -0.25371473831633323 0.094400720937513338 -0.074476793946084405 1;
	setAttr ".wm[30]" -type "matrix" 0.063563399935809839 -0.033038749958748413 0.9974307671160757 0
		 -0.99745280540083547 0.030311178277778836 0.06456882738144834 0 -0.032366575144782264 -0.99899433105127067 -0.031027912285894306 0
		 -0.25052228169180824 0.027059257751741797 0.033756688168419285 1;
	setAttr ".wm[31]" -type "matrix" 0.063563399935809839 -0.033038749958748413 0.9974307671160757 0
		 -0.99745280540083547 0.030311178277778836 0.06456882738144834 0 -0.032366575144782264 -0.99899433105127067 -0.031027912285894306 0
		 -0.25052228169180835 0.027059257751742383 0.033756688168419299 1;
	setAttr ".wm[32]" -type "matrix" 0.025033081645244315 -0.52811141640873083 0.84880603006935951 0
		 -0.14999686831468484 -0.84144429076604432 -0.51910735405406816 0 0.98836950798733636 -0.11432338954034196 -0.1002790022132133 0
		 -0.25371473831633329 0.094400720937513838 -0.074476793946084405 1;
	setAttr ".wm[33]" -type "matrix" -0.19534251699237803 -0.9756608733185973 -0.099635141041074585 0
		 0.10567981578520723 0.080060409996789303 -0.99117208762492426 0 0.97502465486298695 -0.20414747372019651 0.087468459360929063 0
		 -0.24343273460001691 0.1629565005501078 -0.083483691442426886 1;
	setAttr ".wm[34]" -type "matrix" -0.19534251699237803 -0.9756608733185973 -0.099635141041074585 0
		 0.10567981578520723 0.080060409996789303 -0.99117208762492426 0 0.97502465486298695 -0.20414747372019651 0.087468459360929063 0
		 -0.167283044519143 0.52609376942670494 -0.03039195916797777 1;
	setAttr ".wm[35]" -type "matrix" -0.15319112859145523 -0.98478152061193924 -0.082084315079759274 0
		 0.098653799926038427 0.067409246389017921 -0.99283604953759508 0 0.98325983640186843 -0.16019160453189063 0.086825940573476881 0
		 -0.10627363853236746 0.91972609244770653 0.0024280559372231178 1;
	setAttr ".wm[36]" -type "matrix" 0.98352417730575048 -0.18077663747024017 -1.9428902930940239e-16 0
		 0.1807766374702402 0.98352417730575059 4.8982085748550119e-15 0 -8.3266726846886741e-16 -4.603956105242446e-15 1 0
		 -0.09000000000000026 0.94841842365713558 -0.037586958176367126 1;
	setAttr ".wm[37]" -type "matrix" 0.98352417730575048 -0.18077663747024017 -1.9428902930940239e-16 0
		 0.1807766374702402 0.98352417730575059 4.8982085748550119e-15 0 -8.3266726846886741e-16 -4.603956105242446e-15 1 0
		 -0.090000000000000246 0.94841842365713569 -0.037586958176367098 1;
	setAttr ".wm[38]" -type "matrix" 0.12421241873064243 -0.51594212681509144 0.84757005422006493 0
		 0.074812824792564236 0.85662344222973508 0.51048929417671141 0 -0.98943130953070246 2.0816681711721685e-15 0.14500235763724462 0
		 -0.10091974701218412 0.83872538029313159 0.038340346842435195 1;
	setAttr ".wm[39]" -type "matrix" -0.13577989848138891 -0.98555288172569122 0.10123900676404142 0
		 0.22683586974658407 -0.13039588567839686 -0.9651644425663729 0 0.96442174766265742 -0.10808529187790672 0.24126388522730285 0
		 -0.086765290148564961 0.83869412361502527 0.13554429549656435 1;
	setAttr ".wm[40]" -type "matrix" -0.13577989848138891 -0.98555288172569122 0.10123900676404142 0
		 0.22683589463789286 -0.13039588846803152 -0.96516443633945592 0 0.96442174180812124 -0.10808528851244517 0.24126391013778029 0
		 -0.13171291351318759 0.49846717715238875 0.17219042778015206 1;
	setAttr ".wm[41]" -type "matrix" -0.13577989848138891 -0.98555288172569122 0.10123900676404142 0
		 0.22683589463789286 -0.13039588846803152 -0.96516443633945592 0 0.96442174180812124 -0.10808528851244517 0.24126391013778029 0
		 -0.1317129135131877 0.4984671771523887 0.17219042778015203 1;
	setAttr ".wm[42]" -type "matrix" -0.13577989848138891 -0.98555288172569122 0.10123900676404142 0
		 0.22683586974658407 -0.13039588567839686 -0.9651644425663729 0 0.96442174766265742 -0.10808529187790672 0.24126388522730285 0
		 -0.08676529014856503 0.83869412361502516 0.13554429549656435 1;
	setAttr ".wm[43]" -type "matrix" 0.062710073914620662 -0.45694327208468749 -0.88728253263893464 0
		 0.032214817808062401 0.88949583815582833 -0.4558062739992223 0 0.99751173032862916 -3.8857805861880479e-16 0.070500694016327414 0
		 -0.10362230943774224 0.85336997622609267 -0.034849261400152806 1;
	setAttr ".wm[44]" -type "matrix" -0.10409325504850844 -0.97719206517975354 -0.18509527817622698 0
		 0.018753544802588978 0.18414471540373648 -0.98272021875313742 0 0.99439071737961382 -0.10576573896402192 -0.00084240765127328865 0
		 -0.097125084231452996 0.85326530320107441 -0.12677826221769878 1;
	setAttr ".wm[45]" -type "matrix" -0.10409325504850844 -0.97719206517975354 -0.18509527817622698 0
		 0.018753544802588978 0.18414471540373648 -0.98272021875313742 0 0.99439071737961382 -0.10576573896402192 -0.00084240765127328865 0
		 -0.12814858658130629 0.52359266859948161 -0.17778338726347481 1;
	setAttr ".wm[46]" -type "matrix" -0.10409325504850844 -0.97719206517975354 -0.18509527817622698 0
		 0.018753544802588978 0.18414471540373648 -0.98272021875313742 0 0.99439071737961382 -0.10576573896402192 -0.00084240765127328865 0
		 -0.12814858658130629 0.52359266859948161 -0.17778338726347487 1;
	setAttr ".wm[47]" -type "matrix" -0.10409325504850844 -0.97719206517975354 -0.18509527817622698 0
		 0.018753544802588978 0.18414471540373648 -0.98272021875313742 0 0.99439071737961382 -0.10576573896402192 -0.00084240765127328865 0
		 -0.097125084231452954 0.85326530320107452 -0.12677826221769875 1;
	setAttr ".wm[48]" -type "matrix" 1.9099946721416929e-07 0.99847407184529768 0.055222530299095601 0
		 -1.4066291218240629e-07 0.055222530299122809 -0.99847407184530457 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5074034344226795e-06 0.99355836160202027 -0.0015262521035675255 1;
	setAttr ".wm[49]" -type "matrix" 1.8467480778841807e-07 0.99993308254271895 0.011568510560203409 0
		 -1.4886929404025099e-07 0.011568510560230887 -0.99993308254272473 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5230218148797669e-06 1.0529817822212342 0.0307581980271673 1;
	setAttr ".wm[50]" -type "matrix" 1.8467480778841807e-07 0.99993308254271895 0.011568510560203409 0
		 -1.4886929404025099e-07 0.011568510560230887 -0.99993308254272473 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5230218149247702e-06 1.0529817822212342 0.030758198027167304 1;
	setAttr ".wm[51]" -type "matrix" 1.6945472294488251e-07 0.99638667242739731 -0.084932908869468166 0
		 -1.6598779536883122e-07 -0.084932908869440243 -0.99638667242740042 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5287549790438125e-06 1.105176283161134 0.0046469918784506304 1;
	setAttr ".wm[52]" -type "matrix" 1.5275907850020733e-07 0.98365281271709404 -0.18007538430814429 0
		 -1.8147042534666462e-07 -0.1800753843081162 -0.98365281271709437 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5489478007632051e-06 1.2239087820050647 -0.0054738759063186196 1;
	setAttr ".wm[53]" -type "matrix" 1.5275907850020733e-07 0.98365281271709404 -0.18007538430814429 0
		 0.15631868165005183 -0.17786168201954136 -0.97156044167945066 0 -0.9877066719260158 -0.028148998257997895 -0.15376333805528802 0
		 -0.068295055918378228 1.2866479764404588 0.069306429389701787 1;
	setAttr ".wm[54]" -type "matrix" 0.034239910041703708 0.92080756877216863 -0.38851132525606469 0
		 0.15252265009882834 -0.38900007093695865 -0.90852396006812686 0 -0.9877066719260158 -0.028148998257997895 -0.15376333805528802 0
		 -0.068295055918378089 1.2866479764404586 0.069306429389701912 1;
	setAttr ".wm[55]" -type "matrix" 1.5275907932726171e-07 -0.98365281271709382 0.18007538430814446 0
		 0.15631868165004908 0.17786168201954181 0.97156044167945088 0 -0.98770667192601624 0.028148998257996393 0.15376333805528566 0
		 0.068300199999995884 1.2866499999997545 0.069306399999999727 1;
	setAttr ".wm[56]" -type "matrix" 1.5275907932726171e-07 -0.98365281271709382 0.18007538430814446 0
		 0.15631868165004908 0.17786168201954181 0.97156044167945088 0 -0.98770667192601624 0.028148998257996393 0.15376333805528566 0
		 0.068300199999995967 1.2866499999997543 0.069306399999999643 1;
	setAttr ".wm[57]" -type "matrix" -0.95128724650677166 0.13450615265011098 0.27741786087566422 0
		 0.27468561553524995 -0.038839183191062644 0.9607493588168935 0 0.14000138303454407 0.99015130800717321 3.1430042408913212e-07 0
		 0.03364389999999598 1.3814799999997547 -0.01859470000000054 1;
	setAttr ".wm[58]" -type "matrix" -0.8302313574713035 0.54216366200546373 0.12951624095912284 0
		 0.10668056664112087 -0.07351128430683726 0.99157215964380963 0 0.54711529842665318 0.83705116610657948 0.0031930466845564143 0
		 0.14779836958080858 1.3653392616817415 -0.051884843305080246 1;
	setAttr ".wm[59]" -type "matrix" 0.76242286913840851 -0.4960247526686955 0.41553677737923128 0
		 0.35494420561457446 -0.21635345693317737 -0.90950854453034291 0 0.54104156911959733 0.84092248537723335 0.011108288418149675 0
		 0.34778236958080888 1.2348592616817418 -0.083401743305080281 1;
	setAttr ".wm[60]" -type "matrix" -0.77020140754512934 0.59495272147322875 -0.22982830771491236 0
		 -0.18343552912296338 0.1384867228809106 0.97322804842497457 0 0.61085284518522154 0.79174028999243473 0.0024727983773991345 0
		 0.51684936958080874 1.1248692616817411 0.0087440966949199894 1;
	setAttr ".wm[61]" -type "matrix" -0.091540753958192111 0.9956665789547825 0.016381511445700148 0
		 0.09225681088082488 -0.0079001114213968354 0.99570390633241457 0 0.9915185178355802 0.09265879230817442 -0.091133841119120887 0
		 0.57348050496669845 1.0586304266468871 0.013711620807188138 1;
	setAttr ".wm[62]" -type "matrix" -0.43202589679197545 0.90062652591302939 0.047175049792415713 0
		 0.09225681088082488 -0.0079001114213968354 0.99570390633241457 0 0.89713003814786485 0.43452209271952685 -0.079675878353827223 0
		 0.57743062087849772 1.0156651349986192 0.013005589822960394 1;
	setAttr ".wm[63]" -type "matrix" -0.43202589679197545 0.90062652591302939 0.047175049792415713 0
		 0.09225681088082488 -0.0079001114213968354 0.99570390633241457 0 0.89713003814786485 0.43452209271952685 -0.079675878353827223 0
		 0.57743062087849784 1.015665134998619 0.013005589822959997 1;
	setAttr ".wm[64]" -type "matrix" -0.091540753958192111 0.9956665789547825 0.016381511445700148 0
		 0.09225681088082488 -0.0079001114213968354 0.99570390633241457 0 0.9915185178355802 0.09265879230817442 -0.091133841119120887 0
		 0.57348050496669822 1.0586304266468873 0.01371162080718771 1;
	setAttr ".wm[65]" -type "matrix" -0.30982356090561686 0.92816552070076475 -0.20619924173003604 0
		 -0.28115003918185683 0.11773777488821871 0.95241402332830649 0 0.90827529779016003 0.35305322905568998 0.22447583584329675 0
		 0.55914056996357819 1.0568406270123245 0.056035120197177074 1;
	setAttr ".wm[66]" -type "matrix" -0.52771871053298069 0.80995316993439326 -0.25590784487122697 0
		 -0.28115003918185683 0.11773777488821871 0.95241402332830649 0 0.80154077751630859 0.5745552008968321 0.16558593871749067 0
		 0.57245614397758771 1.0169509225366007 0.064897239898856873 1;
	setAttr ".wm[67]" -type "matrix" -0.52771871053298069 0.80995316993439326 -0.25590784487122697 0
		 -0.28115003918185683 0.11773777488821871 0.95241402332830649 0 0.80154077751630859 0.5745552008968321 0.16558593871749067 0
		 0.57245614397758771 1.0169509225366007 0.064897239898856401 1;
	setAttr ".wm[68]" -type "matrix" -0.30982356090561686 0.92816552070076475 -0.20619924173003604 0
		 -0.28115003918185683 0.11773777488821871 0.95241402332830649 0 0.90827529779016003 0.35305322905568998 0.22447583584329675 0
		 0.55914056996357819 1.0568406270123243 0.056035120197176665 1;
	setAttr ".wm[69]" -type "matrix" 0.053758183989070618 0.92786976662078802 -0.36900915143839164 0
		 -0.99701020254711159 0.070416509691695939 0.031814637822975778 0 0.055504177060515469 0.36619559166369531 0.92888108763980726 0
		 0.51264898186993613 1.0835091325080271 0.061566177253183196 1;
	setAttr ".wm[70]" -type "matrix" 0.053758183989070618 0.92786976662078802 -0.36900915143839164 0
		 -0.99701019962147586 0.070416528993925309 0.031814686784449639 0 0.055504229613086077 0.366195587952029 0.92888108596285113 0
		 0.51108635397620739 1.0565274507127733 0.072294904110336455 1;
	setAttr ".wm[71]" -type "matrix" 0.043303268055174191 0.85018414343623983 -0.52470158111571286 0
		 -0.99701019962147586 0.070416528993925309 0.031814686784449639 0 0.06399600633232265 0.52175514821996238 0.85069152839291773 0
		 0.51108635397620739 1.0565274507127731 0.072294904110336122 1;
	setAttr ".wm[72]" -type "matrix" 0.053758183989070618 0.92786976662078802 -0.36900915143839164 0
		 -0.99701020254711159 0.070416509691695939 0.031814637822975778 0 0.055504177060515469 0.36619559166369531 0.92888108763980726 0
		 0.51264898186993613 1.0835091325080271 0.061566177253182648 1;
	setAttr ".wm[73]" -type "matrix" -0.77020140754512934 0.59495272147322875 -0.22982830771491236 0
		 -0.18343552912296338 0.1384867228809106 0.97322804842497457 0 0.61085284518522154 0.79174028999243473 0.0024727983773991345 0
		 0.51684936958080874 1.1248692616817413 0.0087440966949195748 1;
	setAttr ".wm[74]" -type "matrix" -0.77020140754512934 0.59495272147322875 -0.22982830771491236 0
		 -0.24078825105031637 0.062439744370431594 0.96856713576245468 0 0.59060207413421062 0.80133172752272452 0.095166446260300255 0
		 0.53801648738092245 1.0567107465036576 0.022432410424341399 1;
	setAttr ".wm[75]" -type "matrix" 0.76242286913840851 -0.4960247526686955 0.41553677737923128 0
		 0.35494420561457446 -0.21635345693317737 -0.90950854453034291 0 0.54104156911959733 0.84092248537723335 0.011108288418149675 0
		 0.34778236958080866 1.2348592616817413 -0.083401743305080392 1;
	setAttr ".wm[76]" -type "matrix" -0.77020140754512889 0.59495272147322942 -0.22982830771491233 0
		 -0.18343552912296321 0.13848672288091071 0.97322804842497457 0 0.6108528451852222 0.79174028999243418 0.0024727983773991501 0
		 0.43231627134729195 1.1798656565183534 -0.037328250612202463 1;
	setAttr ".wm[77]" -type "matrix" -0.8302313574713035 0.54216366200546373 0.12951624095912284 0
		 0.10668056664112087 -0.07351128430683726 0.99157215964380963 0 0.54711529842665318 0.83705116610657948 0.0031930466845564143 0
		 0.14779836958080864 1.3653392616817412 -0.051884843305080301 1;
	setAttr ".wm[78]" -type "matrix" -0.83642929926626897 0.54655314632285534 0.040812811389628043 0
		 0.032417241653975873 -0.025000071283955004 0.99916170807299509 0 0.54711529842665318 0.83705116610657948 0.0031930466845564143 0
		 0.23715036958080871 1.3003292616817412 -0.045107343305080351 1;
	setAttr ".wm[79]" -type "matrix" -0.95128724650677166 0.13450615265011098 0.27741786087566422 0
		 0.27468561553524995 -0.038839183191062644 0.9607493588168935 0 0.14000138303454407 0.99015130800717321 3.1430042408913212e-07 0
		 0.03364389999999598 1.3814799999997545 -0.018594700000000523 1;
	setAttr ".wm[80]" -type "matrix" 2.0524845718774885e-07 0.98643019143286004 0.16418123348814512 0
		 -1.1891140467499624e-07 0.16418123348817143 -0.98643019143286992 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5822215587766349e-06 1.4381670781220091 -0.044697717562728986 1;
	setAttr ".wm[81]" -type "matrix" 2.0524845718774885e-07 0.98643019143286004 0.16418123348814512 0
		 -1.1891140467499624e-07 0.16418123348817143 -0.98643019143286992 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5985556361760812e-06 1.5166691394683611 -0.031631850991385942 1;
	setAttr ".wm[82]" -type "matrix" 2.0524845718774885e-07 0.98643019143286004 0.16418123348814512 0
		 -1.1891140467499624e-07 0.16418123348817143 -0.98643019143286992 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5985556362158342e-06 1.5166691394683607 -0.031631850991385907 1;
	setAttr ".wm[83]" -type "matrix" 2.0524845718774885e-07 0.98643019143286004 0.16418123348814512 0
		 -1.1891140467499624e-07 0.16418123348817143 -0.98643019143286992 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5985556361849043e-06 1.5166691394683605 -0.031631850991386268 1;
	setAttr ".wm[84]" -type "matrix" 0.99999999999997169 -1.8294025370402609e-07 -1.5099574467157432e-07 0
		 1.8280755541086927e-07 0.99999961424632022 -0.00087835481270495674 0 1.5115637275495145e-07 0.00087835481267739546 0.99999961424632544 0
		 2.6064137190837081e-06 1.5153479963982335 0.022010543712130341 1;
	setAttr ".wm[85]" -type "matrix" 0.99999999999985922 5.2934080083643703e-07 -3.2443835838722501e-08 0
		 -5.2934081530812633e-07 0.99999999999976041 -4.4594975956581215e-07 0 3.2443599762747184e-08 4.4594977692246147e-07 0.99999999999990008 0
		 -5.0470861566992686e-09 1.6389571162473386 0.015410465256876969 1;
	setAttr ".wm[86]" -type "matrix" 1.0568582976872687 -3.5541951639561768e-07 -0.00034001319497607062 0
		 1.5271573657106874e-07 0.99999983719263041 -0.00057062657602008468 0 0.0003217208263196034 0.0005706264973571525 0.99999978544053214 0
		 -1.0649309960185102e-08 1.5718599398415198 0.034623064171909364 1;
	setAttr ".wm[87]" -type "matrix" 4.9897501426369745e-07 0.26429268349309304 0.96444252159046284 0
		 3.6081489362519727e-07 0.96444252159047272 -0.26429268349328233 0 -0.99999999999981004 4.7986067121757821e-07 3.8587198466458628e-07 0
		 0.037394633549827007 1.5853041693576744 0.066242895541019253 1;
	setAttr ".wm[88]" -type "matrix" 5.3670199228378633e-07 0.98643019143262045 0.16418123348883606 0
		 -7.8171232920951636e-07 0.16418123348922337 -0.98643019143239197 0 -0.99999999999955003 4.010765544140389e-07 8.5922103783460098e-07 0
		 0.037394645184188592 1.5906377109435665 0.089761070220048977 1;
	setAttr ".wm[89]" -type "matrix" 3.3122999526578704e-07 -0.0014596460313448661 0.99999893471610923 0
		 1.5338851954763608e-07 0.99999893471615242 0.0014596460312941591 0 -0.99999999999993316 1.529048775003811e-07 3.3145353548494566e-07 0
		 0.037394627447692397 1.5853043523449499 0.066241781771236546 1;
	setAttr ".wm[90]" -type "matrix" 2.0524843795826051e-07 0.98643019143272537 0.16418123348895353 0
		 -3.0185166292151331e-07 0.16418123348901059 -0.98643019143269106 0 -0.99999999999993316 1.529048775003811e-07 3.3145353548494566e-07 0
		 0.037394634942685398 1.5853043523445618 0.088854281572148766 1;
	setAttr ".wm[91]" -type "matrix" 2.0240434167487047e-07 -0.52337901757124272 0.85209999645940582 0
		 3.0376608899069331e-07 0.85209999645941636 0.52337901757117689 0 -0.99999999999993305 1.5290489784190845e-07 3.3145353613947852e-07 0
		 0.037394627577046986 1.5853061668955626 0.066234586668639669 1;
	setAttr ".wm[92]" -type "matrix" 2.9406939411204389e-07 0.87541776193144427 0.48336708834472214 0
		 -2.1625111744477734e-07 0.48336708834478737 -0.87541776193143073 0 -0.99999999999993305 1.5290489784190845e-07 3.3145353613947852e-07 0
		 0.037394632247863123 1.5730289302469032 0.08599019365253259 1;
	setAttr ".wm[93]" -type "matrix" 0.99999999999987532 -1.2780078250255367e-07 -4.8228354135689726e-07 0
		 7.5222054094155647e-08 0.99420668564519554 -0.10748519069336789 0 4.9322621255369061e-07 0.10748519069331824 0.99420668564508141 0
		 -0.03075553150909285 1.5994467767280758 0.087398998492908081 1;
	setAttr ".wm[94]" -type "matrix" 0.9999998962649026 4.8529186383005928e-05 0.00045289634740355438 0
		 1.1663193898372998e-07 0.99428077541112725 -0.10679765750162283 0 -0.00045548893490355603 0.10679764647577966 0.99428067226365435 0
		 0.030753624257374754 1.5994467667161469 0.087397914578391467 1;
	setAttr ".wm[95]" -type "matrix" 7.9801690699825029e-08 -0.52037710835607287 0.85393656971637255 0
		 6.1056952441532197e-07 0.85393656971624166 0.52037710835593587 0 -0.99999999999980982 4.7986067213414536e-07 3.85871985774213e-07 0
		 -0.037394051335242109 1.5853069355249281 0.066236160959218568 1;
	setAttr ".wm[96]" -type "matrix" 9.9246835858038276e-07 0.87541776193109455 0.48336708834442593 0
		 -1.058503340734074e-07 0.48336708834475312 -0.87541776193146992 0 -0.99999999999950129 8.1765986140474898e-07 5.7238980351035724e-07 0
		 -0.037394049595057974 1.5730296977433582 0.085991765133232603 1;
	setAttr ".wm[97]" -type "matrix" 3.3082634453093394e-07 -0.0040837616643982864 0.99999166141051343 0
		 1.5425720441241031e-07 0.9999916614105564 0.0040837616643474659 0 -0.99999999999993316 1.5290490208435436e-07 3.3145353569294985e-07 0
		 -0.037394057584941499 1.5853051409816779 0.066243228932039516 1;
	setAttr ".wm[98]" -type "matrix" 2.0524846224309181e-07 0.98643019143272548 0.16418123348895317 0
		 -3.0185165909048514e-07 0.16418123348901023 -0.98643019143269117 0 -0.99999999999993316 1.5290490208435436e-07 3.3145353569294985e-07 0
		 -0.037391468301521825 1.5853051409816581 0.088855728733748848 1;
	setAttr ".wm[99]" -type "matrix" 3.6037353437772153e-07 0.26909782695394213 0.96311284880253567 0
		 5.8071245855506777e-08 0.96311284880259107 -0.26909782695397927 0 -0.99999999999993305 1.5290489792479507e-07 3.3145353547329049e-07 0
		 -0.037394057604635218 1.585304972546111 0.066244325212837338 1;
	setAttr ".wm[100]" -type "matrix" 2.0524845809018961e-07 0.9864301914327257 0.16418123348895247 0
		 -3.0185165947316118e-07 0.16418123348900959 -0.98643019143269117 0 -0.99999999999993305 1.5290489792479507e-07 3.3145353547329049e-07 0
		 -0.037394049078505631 1.5902536247981771 0.089684884952059438 1;
	setAttr ".wm[101]" -type "matrix" 2.0524845718774885e-07 0.98643019143286004 0.16418123348814512 0
		 -1.1891140467499624e-07 0.16418123348817143 -0.98643019143286992 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5822215587936124e-06 1.4381670781220088 -0.04469771756272891 1;
	setAttr ".wm[102]" -type "matrix" -1.4222654573100281e-07 0.9864301914328697 0.16418123348815328 0
		 -1.072394573588146e-06 0.16418123348791008 -0.98643019143233757 0 -0.99999999999941469 -3.1636362272553445e-07 1.0344914549251238e-06 0
		 0.056020199999995995 1.4260299999997543 -0.061728700000000601 1;
	setAttr ".wm[103]" -type "matrix" -1.4222654573100281e-07 0.9864301914328697 0.16418123348815328 0
		 -1.072394573588146e-06 0.16418123348791008 -0.98643019143233757 0 -0.99999999999941469 -3.1636362272553445e-07 1.0344914549251238e-06 0
		 0.056020199999995975 1.4260299999997539 -0.061728700000000566 1;
	setAttr ".wm[104]" -type "matrix" -1.4222654556009906e-07 -0.9864301914328697 -0.16418123348815405 0
		 1.1891140467499633e-07 -0.1641812334881711 0.98643019143287003 0 -0.99999999999998268 1.2077353735269701e-07 1.406487294837654e-07 0
		 -0.056015079779829155 1.426028211710433 -0.061728658521626636 1;
	setAttr ".wm[105]" -type "matrix" -1.4222654556009906e-07 -0.9864301914328697 -0.16418123348815405 0
		 1.1891140467499633e-07 -0.1641812334881711 0.98643019143287003 0 -0.99999999999998268 1.2077353735269701e-07 1.406487294837654e-07 0
		 -0.056015079779829127 1.4260282117104328 -0.061728658521626512 1;
	setAttr ".wm[106]" -type "matrix" -0.95128724650677121 -0.13450615265011126 -0.27741786087566511 0
		 0.27468561553525156 0.038839183191059695 -0.96074935881689294 0 0.14000138303454332 -0.99015130800717321 -3.1430042097759677e-07 0
		 -0.033638800000004049 1.3814799999997545 -0.018594700000000571 1;
	setAttr ".wm[107]" -type "matrix" -0.83023135747130361 -0.54216366200546362 -0.12951624095912245 0
		 0.10668056664112335 0.073511284306833208 -0.99157215964380951 0 0.5471152984266523 -0.83705116610657981 -0.0031930466845518347 0
		 -0.14780600000000405 1.3653399999997546 -0.051888600000000631 1;
	setAttr ".wm[108]" -type "matrix" 0.76242286913840907 0.49602475266869445 -0.41553677737923145 0
		 0.35494420561457268 0.21635345693318031 0.90950854453034269 0 0.54104156911959733 -0.84092248537723324 -0.011108288418146177 0
		 -0.3477900000000041 1.2348599999997543 -0.08340550000000034 1;
	setAttr ".wm[109]" -type "matrix" -0.77020140754513056 -0.5949527214732272 0.22982830771491336 0
		 -0.18343552912296365 -0.13848672288091177 -0.97322804842497446 0 0.61085284518521987 -0.79174028999243573 -0.0024727983773980746 0
		 -0.51633233034303516 1.1241899637035615 0.008738216080488595 1;
	setAttr ".wm[110]" -type "matrix" -0.091540753958193832 -0.9956665789547825 -0.016381511445700735 0
		 0.092256810880831985 0.0079001114213965995 -0.9957039063324139 0 0.99151851783557943 -0.092658792308175753 0.091133841119127715 0
		 -0.57296346572892531 1.0579511286687073 0.013705740192756869 1;
	setAttr ".wm[111]" -type "matrix" -0.43202589583183537 -0.90062652583081038 -0.047175060154975683 0
		 0.092256840430386469 0.0079001086599493949 -0.99570390361641337 0 0.89713003557148996 -0.43452209294014732 0.079675906159962701 0
		 -0.57691358164072459 1.0149858370204392 0.012999709208529133 1;
	setAttr ".wm[112]" -type "matrix" -0.43202589583183537 -0.90062652583081038 -0.047175060154975683 0
		 0.092256813693819814 0.0079001216097208012 -0.99570390599094072 0 0.8971300383209585 -0.43452209270470549 0.079675876485664959 0
		 -0.57691236306406968 1.0149879370101451 0.012999381160938862 1;
	setAttr ".wm[113]" -type "matrix" -0.091540753958193832 -0.9956665789547825 -0.016381511445700735 0
		 0.092256810880831985 0.0079001114213965995 -0.9957039063324139 0 0.99151851783557943 -0.092658792308175753 0.091133841119127715 0
		 -0.57296343118929438 1.0579475459868781 0.013706366850808517 1;
	setAttr ".wm[114]" -type "matrix" -0.3098235609056188 -0.92816552070076408 0.2061992417300374 0
		 -0.28115003918185932 -0.11773777488821874 -0.95241402332830594 0 0.9082752977901587 -0.35305322905569198 -0.22447583584329878 0
		 -0.55862353072580473 1.0561613290341447 0.056029239582745867 1;
	setAttr ".wm[115]" -type "matrix" -0.52771871288247951 -0.80995317091829599 0.25590783691215352 0
		 -0.2811500089181177 -0.11773778665195557 -0.95241403080784237 0 0.80154078658481365 -0.57455519709919645 -0.16558590799733486 0
		 -0.57193910473981413 1.0162716245584211 0.064891359284425604 1;
	setAttr ".wm[116]" -type "matrix" -0.52771871288247951 -0.80995317091829599 0.25590783691215352 0
		 -0.2811500356254647 -0.11773776750777047 -0.95241402529051766 0 0.80154077721689199 -0.57455520102222035 -0.16558593973177999 0
		 -0.57193918233082286 1.0162716182441485 0.064891395724124348 1;
	setAttr ".wm[117]" -type "matrix" -0.3098235609056188 -0.92816552070076408 0.2061992417300374 0
		 -0.28115003918185932 -0.11773777488821874 -0.95241402332830594 0 0.9082752977901587 -0.35305322905569198 -0.22447583584329878 0
		 -0.55862262101144355 1.0561635127266393 0.056029094874168857 1;
	setAttr ".wm[118]" -type "matrix" 0.053758183989068786 -0.92786976662078779 0.36900915143839286 0
		 -0.9970102025471117 -0.070416509691694662 -0.031814637822976638 0 0.055504177060515747 -0.36619559166369642 -0.92888108763980715 0
		 -0.51213194263216266 1.0828298345298475 0.06156029663875183 1;
	setAttr ".wm[119]" -type "matrix" 0.053758183989068786 -0.92786976662078779 0.36900915143839286 0
		 -0.9970101988483101 -0.0704165340949756 -0.031814699723629665 0 0.055504243501294209 -0.36619558697113808 -0.92888108551967696 0
		 -0.51056931473843403 1.0558481527345935 0.0722890234959052 1;
	setAttr ".wm[120]" -type "matrix" 0.053758183989068786 -0.92786976662078779 0.36900915143839286 0
		 -0.9970101988483101 -0.0704165340949756 -0.031814699723629665 0 0.055504243501294209 -0.36619558697113808 -0.92888108551967696 0
		 -0.51056936003239139 1.0558524567461063 0.07228871617478741 1;
	setAttr ".wm[121]" -type "matrix" 0.053758183989068786 -0.92786976662078779 0.36900915143839286 0
		 -0.9970102025471117 -0.070416509691694662 -0.031814637822976638 0 0.055504177060515747 -0.36619559166369642 -0.92888108763980715 0
		 -0.51213167788978931 1.0828311038626677 0.061560249897150518 1;
	setAttr ".wm[122]" -type "matrix" -0.77020140754513056 -0.5949527214732272 0.22982830771491336 0
		 -0.18343552912296365 -0.13848672288091177 -0.97322804842497446 0 0.61085284518521987 -0.79174028999243573 -0.0024727983773980746 0
		 -0.51633236466042642 1.1241858786765895 0.0087385126700874772 1;
	setAttr ".wm[123]" -type "matrix" -0.77020140754513056 -0.5949527214732272 0.22982830771491336 0
		 -0.24078825105031654 -0.062439744370432607 -0.96856713576245468 0 0.59060207413420884 -0.80133172752272563 -0.095166446260299256 0
		 -0.53338282678921234 1.0491025734840653 0.022636575730605804 1;
	setAttr ".wm[124]" -type "matrix" 0.76242286913840907 0.49602475266869445 -0.41553677737923145 0
		 0.35494422173887918 0.21635343187171946 0.90950854419928917 0 0.54104155854142799 -0.84092249182507295 -0.011108315523632221 0
		 -0.34778997892904473 1.2348596782347583 -0.083405545334786765 1;
	setAttr ".wm[125]" -type "matrix" -0.77020140754513022 -0.59495272147322709 0.22982830771491417 0
		 -0.18343552912296432 -0.13848672288091221 -0.97322804842497412 0 0.61085284518521987 -0.79174028999243573 -0.0024727983773981683 0
		 -0.43232287319285606 1.1798637515723653 -0.037333275344855435 1;
	setAttr ".wm[126]" -type "matrix" -0.8364292992662693 -0.5465531463228549 -0.040812811389626363 0
		 0.032417241653977233 0.025000071283950265 -0.99916170807299498 0 0.5471152984266523 -0.83705116610657981 -0.0031930466845518347 0
		 -0.23715778239681656 1.3003292209239716 -0.045111110764805784 1;
	setAttr ".wm[127]" -type "matrix" -0.83023135747130361 -0.54216366200546362 -0.12951624095912245 0
		 0.10668056664112335 0.073511284306833208 -0.99157215964380951 0 0.5471152984266523 -0.83705116610657981 -0.0031930466845518347 0
		 -0.14780618682905652 1.3653376289374015 -0.051888603476920425 1;
	setAttr ".wm[128]" -type "matrix" -0.95128724650677121 -0.13450615265011126 -0.27741786087566511 0
		 0.27468561553525156 0.038839183191059695 -0.96074935881689294 0 0.14000138303454332 -0.99015130800717321 -3.1430042097759677e-07 0
		 -0.033638783081862959 1.3814801960668115 -0.018594688263005834 1;
	setAttr ".wm[129]" -type "matrix" 1.5275907850020733e-07 0.98365281271709404 -0.18007538430814429 0
		 -1.8147042534666462e-07 -0.1800753843081162 -0.98365281271709437 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5489478007930202e-06 1.2239087820050647 -0.0054738759063186742 1;
	setAttr ".wm[130]" -type "matrix" 0.64488329067583539 0.51239145799056396 -0.56708071311358332 0
		 -0.38478244053910143 0.85875199783074951 0.33835998533288325 0 0.66035446152795763 1.6780193053091212e-15 0.75095404995253934 0
		 0.13421830488367339 1.3309752024592205 -0.032958320701525282 1;
	setAttr ".wm[131]" -type "matrix" 0.85815140097985432 -0.51339670138822557 4.5935470038838133e-08 0
		 -1.50995803027687e-07 -1.6291843958903164e-07 0.99999999999997535 0 -0.51339670138820581 -0.85815140097983977 -2.1732943444874309e-07 0
		 0.13465899999999595 1.3308999999997546 -0.12388457151642093 1;
	setAttr ".wm[132]" -type "matrix" 0.85815140097985432 -0.51339670138822557 4.5935470038838133e-08 0
		 -1.50995803027687e-07 -1.6291843958903164e-07 0.99999999999997535 0 -0.51339670138820581 -0.85815140097983977 -2.1732943444874309e-07 0
		 0.13465899999999598 1.3308999999997551 -0.12388457151642093 1;
	setAttr ".wm[133]" -type "matrix" 0.36878069380942413 0.65773844472574527 -0.65679596390598904 0
		 -0.32202110777895049 0.75324639948011518 0.57351745205796478 0 0.871953671944936 9.2458045470176684e-16 0.489588392409116 0
		 0.072996731020901054 1.3543694639949297 -0.034702928221703969 1;
	setAttr ".wm[134]" -type "matrix" 0.9493225870886921 -0.31430339744142716 9.2137906915201739e-08 0
		 -1.5099580369382082e-07 -1.6291844200630652e-07 0.99999999999997524 0 -0.31430339744140456 -0.94932258708868256 -2.021206508273643e-07 0
		 0.072958899999995788 1.354029999999754 -0.1354086492507463 1;
	setAttr ".wm[135]" -type "matrix" 0.9493225870886921 -0.31430339744142716 9.2137906915201739e-08 0
		 -1.5099580369382082e-07 -1.6291844200630652e-07 0.99999999999997524 0 -0.31430339744140456 -0.94932258708868256 -2.021206508273643e-07 0
		 0.072958899999995927 1.3540299999997545 -0.13540864925074636 1;
	setAttr ".wm[136]" -type "matrix" -3.1902974257692068e-06 0.72844406210287393 -0.68510528269521176 0
		 3.3921147812943603e-06 0.68510528270263971 0.72844406209497603 0 0.99999999998915767 -2.5399391762075348e-12 -4.656655490314222e-06 0
		 2.416590000021889e-06 1.3655121185043171 -0.033897900000000515 1;
	setAttr ".wm[137]" -type "matrix" 0.9999902452996966 0.0044169339399481545 -1.5027472902858586e-07 0
		 1.5099571497105406e-07 -1.628987836174068e-07 0.99999999999997524 0 0.0044169339399234122 -0.9999902452996946 -1.6356413279893108e-07 0
		 1.9284248075049836e-06 1.3655933007132075 -0.13872889317471038 1;
	setAttr ".wm[138]" -type "matrix" 0.9999902452996966 0.0044169339399481545 -1.5027472902858586e-07 0
		 1.5099571497105406e-07 -1.628987836174068e-07 0.99999999999997524 0 0.0044169339399234122 -0.9999902452996946 -1.6356413279893108e-07 0
		 1.9284248074066325e-06 1.3655933007132082 -0.13872889317471057 1;
	setAttr ".wm[139]" -type "matrix" -0.36878046929314118 0.657739034582416 -0.65679549926481806 0
		 0.32202142071368084 0.75324588441397489 0.57351795282706852 0 0.87195365133100611 -9.2327332404547584e-17 -0.48958842912238748 0
		 -0.072836535178395126 1.354157607293246 -0.035115723017494445 1;
	setAttr ".wm[140]" -type "matrix" 0.94932258708869321 0.31430339744142555 -9.2137906138045622e-08 0
		 1.5099580308319815e-07 -1.6291844407910239e-07 0.99999999999997546 0 0.31430339744140268 -0.94932258708868344 -2.0212065302005477e-07 0
		 -0.072953762686135598 1.3540301530580732 -0.13540856498835577 1;
	setAttr ".wm[141]" -type "matrix" 0.94932258708869321 0.31430339744142555 -9.2137906138045622e-08 0
		 1.5099580308319815e-07 -1.6291844407910239e-07 0.99999999999997546 0 0.31430339744140268 -0.94932258708868344 -2.0212065302005477e-07 0
		 -0.07295376268613557 1.3540301530580727 -0.1354085649883556 1;
	setAttr ".wm[142]" -type "matrix" -0.64488385468624998 0.51239442175333072 -0.56707739376655908 0
		 0.38478579509330724 0.85875022943581769 0.33836065867405729 0 0.66035195605026809 -1.3431728346389521e-15 -0.75095625314700254 0
		 -0.13428238196972508 1.3308362720778906 -0.033005861575021694 1;
	setAttr ".wm[143]" -type "matrix" 0.85815140097985476 0.51339670138822535 -4.593546942821547e-08 0
		 1.5099580319422046e-07 -1.6291844167235095e-07 0.99999999999997535 0 0.51339670138820526 -0.85815140097984011 -2.1732943650265568e-07 0
		 -0.13465430196281086 1.330900785035082 -0.12388411826074512 1;
	setAttr ".wm[144]" -type "matrix" 0.85815140097985476 0.51339670138822535 -4.593546942821547e-08 0
		 1.5099580319422046e-07 -1.6291844167235095e-07 0.99999999999997535 0 0.51339670138820526 -0.85815140097984011 -2.1732943650265568e-07 0
		 -0.13465430196281095 1.3309007850350818 -0.12388411826074487 1;
	setAttr ".wm[145]" -type "matrix" 1.6945472294488251e-07 0.99638667242739731 -0.084932908869468166 0
		 -1.6598779536883122e-07 -0.084932908869440243 -0.99638667242740042 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5287549790691074e-06 1.1051762831611345 0.0046469918784506755 1;
	setAttr ".wm[146]" -type "matrix" -2.0321642794047193e-07 -0.33237831388487676 -0.9431461479850326 0
		 -7.1616140755350792e-08 0.94314614798505447 -0.33237831388486894 0 0.9999999999999768 -2.4626995971589494e-13 -2.154664434523828e-07 0
		 2.5216100000122527e-06 1.071298772891172 -0.028511800000000104 1;
	setAttr ".wm[147]" -type "matrix" 0.99999024529969682 0.0044169339399489508 -1.5027472947095605e-07 0
		 1.5099571451939635e-07 -1.6289855492289195e-07 0.99999999999997524 0 0.0044169339399242908 -0.99999024529969482 -1.6356390424985462e-07 0
		 2.5080558047947612e-06 1.0713215563035856 -0.091418094035073699 1;
	setAttr ".wm[148]" -type "matrix" 0.99999024529969682 0.0044169339399489508 -1.5027472947095605e-07 0
		 1.5099571451939635e-07 -1.6289855492289195e-07 0.99999999999997524 0 0.0044169339399242908 -0.99999024529969482 -1.6356390424985462e-07 0
		 2.5080558047211494e-06 1.0713215563035854 -0.091418094035073671 1;
	setAttr ".wm[149]" -type "matrix" 1.9099946721416929e-07 0.99847407184529768 0.055222530299095601 0
		 -1.4066291218240629e-07 0.055222530299122809 -0.99847407184530457 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5074034344280171e-06 0.99355836160202016 -0.0015262521035675177 1;
	setAttr ".wm[150]" -type "matrix" 0.99999999999997169 -1.8294025414811405e-07 -1.5099574884878858e-07 0
		 -1.5099569455835847e-07 2.9607675621607326e-07 -0.9999999999999446 0 1.8294029896234176e-07 0.99999999999993927 2.9607672867303669e-07 0
		 2.5013986340984517e-06 0.95947478651147489 -6.839190118407554e-11 1;
	setAttr ".wm[151]" -type "matrix" 1.1816616250598557 0.088179221679685671 0.21339966542288305 0
		 -0.086775535406455329 1.2007762544877787 -0.015671043071797706 0 -0.21397429470279047 -2.1141074260575519e-14 1.1848435296207585 0
		 0.041000000000000009 0.97198104858374035 0.0070000002160668104 1;
	setAttr ".wm[152]" -type "matrix" 0.04449215684320218 -0.5465060628451065 1.0719098654880987 0
		 -1.1838393937737537 -0.21147155413577004 -0.058679298040503203 0 0.21490445832174798 -1.0517842428666997 -0.54516526735339033 0
		 0.19382420894779609 0.9720110903288971 0.035085210182807497 1;
	setAttr ".wm[153]" -type "matrix" 0.035056948276990178 -0.43061150857984676 0.84459579796148243 0
		 -0.81862042069643426 -0.44002228953362538 -0.19036363731153894 0 0.47815158692029547 -0.72176965596392006 -0.38783623674616574 0
		 0.19382420894779603 0.9720110903288971 0.035085210182807434 1;
	setAttr ".wm[154]" -type "matrix" 0.66591426874672666 0.39440125021529993 0.63325021950893967 0
		 -0.2858052729283112 0.91893832972001344 -0.27178611468904179 0 -0.68911068243489404 1.7480064878369714e-15 0.72465610281989212 0
		 0.026000000000000013 1.0197770595548095 0.02456020005047312 1;
	setAttr ".wm[155]" -type "matrix" -0.82110333458844986 -0.019860369737398135 0.57043393977008561 0
		 -0.56740125680282394 -0.080172191954390098 -0.81952927550869326 0 0.062009093738770803 -0.99658315526157781 0.054560855405446383 0
		 0.10189039090721541 1.0198199999997546 0.096890143227446851 1;
	setAttr ".wm[156]" -type "matrix" -0.82110333458844986 -0.019860369737398135 0.57043393977008561 0
		 -0.56740125680282394 -0.080172191954390098 -0.81952927550869326 0 0.062009093738770803 -0.99658315526157781 0.054560855405446383 0
		 0.10189039090721538 1.0198199999997546 0.096890143227446823 1;
	setAttr ".wm[157]" -type "matrix" -0.66632864690864668 0.39418420331932102 0.63294940410936806 0
		 0.28579677618568189 0.91903145422423482 -0.27147999717909072 0 -0.68871353771416666 -1.1517261037934004e-15 -0.72503355989170348 0
		 -0.025852899999999856 1.0197770042612919 0.024560199999999775 1;
	setAttr ".wm[158]" -type "matrix" -0.82110333385492562 0.01986038152626456 -0.57043394041550244 0
		 0.56740125699937205 -0.080172188795573765 -0.81952927568163136 0 -0.06200910165337533 -0.99658315528076125 0.054560846060002381 0
		 -0.10199747293257674 1.0198155740653088 0.096890363516415501 1;
	setAttr ".wm[159]" -type "matrix" -0.82110333385492562 0.01986038152626456 -0.57043394041550244 0
		 0.56740125699937205 -0.080172188795573765 -0.81952927568163136 0 -0.06200910165337533 -0.99658315528076125 0.054560846060002381 0
		 -0.10199747293257684 1.0198155740653085 0.096890363516415445 1;
	setAttr ".wm[160]" -type "matrix" -1.1816805243057205 0.088142681594272757 0.21331009032781839 0
		 0.086740770485195434 1.2007789372566062 -0.015657939017125273 0 -0.21388400054685247 -2.2230770924031625e-15 -1.1848598325489001 0
		 -0.040999999999999988 0.97198107065914696 0.0069999999999999863 1;
	setAttr ".wm[161]" -type "matrix" 0.044492150656783053 0.54650603256756902 -1.0719098811816798 0
		 1.1838393921161081 -0.21147156224861194 -0.058679302245586651 0 -0.21490446873397384 -1.0517842569677116 -0.54516523604388245 0
		 -0.19390620299390218 0.9720111991307343 0.035085188528246491 1;
	setAttr ".wm[162]" -type "matrix" 0.035056943402491145 0.43061148472310118 -0.84459581032701159 0
		 0.93278904153685294 -0.16662594366756556 -0.046235503282140961 0 -0.16933085243432192 -0.82873811725994628 -0.42955502359116504 0
		 -0.19390620299390232 0.9720111991307343 0.035085188528246318 1;
	setAttr ".wm[163]" -type "matrix" 1.8281616120116629e-07 0.40989174600250688 0.7141294105609346 0
		 -1.0493172329079944e-07 0.7141294105609578 -0.40989174600249345 0 -0.82340273163809719 7.0208347859636457e-15 2.1078997935354176e-07 0
		 2.5082400000155441e-06 1.0379583625682678 0.026716399999999876 1;
	setAttr ".wm[164]" -type "matrix" -0.82339469959124834 -0.0036369154716206615 1.2325224849225581e-07 0
		 -1.2384597721269956e-07 1.3414747501716488e-07 -0.82340273163810418 0 0.0036369154716005101 -0.82339469959124656 -1.3469318627770495e-07 0
		 2.5314561236099357e-06 1.0380177873880303 0.11741125331070801 1;
	setAttr ".wm[165]" -type "matrix" -1.0225694853327321 -0.0045166659244466655 1.5306630995972423e-07 0
		 -1.5380365849062054e-07 1.665970336645167e-07 -1.0225794602888785 0 0.0045166659244216395 -1.0225694853327298 -1.6727474956808976e-07 0
		 2.5314561235742265e-06 1.0380177873880303 0.11741125331070801 1;
	setAttr -s 166 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 -1.5707963267948961 0 -1.5099582926491247e-07 0 1.779480544559006e-06
		 1.0808874811777249 -1.0013355343887649 0 0 0 6.3291529169581893e-14 -1.7468560070676986e-09
		 -7.4999743304715594e-08 -3.6734198463196485e-40 6.6174449004242214e-24 0 6.3291529169581893e-14
		 -1.746856007067692e-09 -7.4999743304715594e-08 -1.632095015644216e-07 -1.080887479431113
		 1.0013356093885082 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 1.5707971257432236 -1.570795927320733
		 0 0 -6.1555105457244963e-10 0 -1.4558378780933287e-22 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 2.3293406049493259e-21
		 0 0 0 0 -1.4791141972893971e-31 -1.0339757656912846e-25 8.3819031715393066e-09 0
		 0 0 -1.4791141972893971e-31 -1.0339757656912846e-25 8.3819031715393066e-09 0 0 0 
		0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 0.99999999999999978 1.0000000000000002 1 -1.5707960307184621
		 -6.4795257820331555e-07 -1.5707959592651579 0 0.95947471151231778 -3.575810918569374e-07
		 1.6787493693580773e-09 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.0099992603935610564
		 -0.0024280500411871819 -0.039748505825889291 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-6.6579156699879211e-08 -1.5972224741590568e-08 -1.0634172539160488e-15 0.99999999999999767 1
		 1 1 no;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.096277245112815796 -3.7843155263530409e-08
		 -2.6360021054827598e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.64796856537911884 -0.0063928751973328368 -0.75931204125087282 0.059507087297822919 1
		 1 1 no;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.3996815692317317 -3.1732561697028761e-05
		 -0.00021920973687755696 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.0023605573256060596 0.022237696361804025 0.0068901503100454384 0.99972618174094929 1
		 1 1 no;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 -0.25672047967584594 -0.32553881208198238
		 0.011257373675363426 0 -0.44246250177823987 3.7180286648064165e-08 2.6388941937183219e-07 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.12742981171544321 -0.010311062984590336 -0.50528538288793812 0.85342955591313097 1
		 1 1 no;
	setAttr ".xm[8]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.12751269912385643 -4.6917746899383106e-07
		 -1.1869053769819615e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.6499506466405458 0.18681352155558761 -0.17963412510689086 0.71442035678766758 1
		 1 1 no;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.8388068845354155e-16
		 1.1102230246251565e-16 3.1571967262777889e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.5673907444456745e-16
		 1.2490009027033011e-16 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.37446369424087517
		 -0.015502596047509101 0.0047584755073381557 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.2204460492503131e-16
		 -3.4694469519536142e-17 -1.1102230246251565e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 -1.3877787807814457e-17
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.027464961621785799
		 -0.043268472433213717 -0.0079358599029700494 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.54733883851457632 -0.49379465989442539 -0.4924294250889632 0.46270972652389353 1
		 1 1 no;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.5511151231257827e-17
		 1.1102230246251565e-16 -1.3877787807814457e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[16]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.076367245661115857
		 0.040546482368656836 -0.021307844703341405 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.52418485570955764 0.83986246277567278 -0.066153559087255648 0.12443868886010048 1
		 1 1 no;
	setAttr ".xm[17]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.084056137148565413
		 0.051000019430109123 -1.5427629687647659e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.43427451383049798 -0.87808184006932422 0.13299428499662014 0.15063349207925811 1
		 1 1 no;
	setAttr ".xm[18]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.34512469907573418
		 0.0012009657881922875 -0.0022663515503676401 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[19]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.3306690738754696e-16
		 0 1.1102230246251565e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.0536712349851209e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[20]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 2.7755575615628914e-17 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[21]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.068000000000000005
		 -0.033324899023157807 -0.01 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.062310513775560836 -0.051479368612188853 -0.86830669952917072 0.48939835515975588 1
		 1 1 no;
	setAttr ".xm[22]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.081615722354875853
		 0.041675627435646345 3.1515556742953144e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.063733856472236103 0.00309328495553398 0.89560178729127116 0.44025659078319401 1
		 1 1 no;
	setAttr ".xm[23]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.3348230050919665 0.011165516206969039
		 -0.0040612903992303662 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[24]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.2204460492503131e-16
		 5.5511151231257827e-17 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[25]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.1102230246251565e-16
		 5.5511151231257827e-17 -1.9428902930940239e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[26]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.0099992589811724823
		 -0.0024280499304019237 -0.039748711508191703 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.99999999999999722 -2.1287787101427752e-15 3.1944449483168973e-08 6.6640018675682264e-08 1
		 1 1 no;
	setAttr ".xm[27]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.096276874044815899
		 1.7966384643040845e-09 -4.8721512380112131e-09 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.64796866693523592 -0.0063929649567354696 -0.75931194477487995 0.059507202853309377 1
		 1 1 no;
	setAttr ".xm[28]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.3996819458452584 3.1626161781803108e-05
		 0.00021886618967276172 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.0023605573256478131 0.022237696361805014 0.0068901503100446022 0.99972618174094918 1
		 1 1 no;
	setAttr ".xm[29]" -type "matrix" "xform" 1 1 1 -0.25672047967584594 -0.32553881208198238
		 0.011257373675363426 0 0.44246220003967873 4.9786316812239217e-08 -1.9721412169992902e-08 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.12742981171540757 -0.010311062984613227 -0.50528538288793734 0.85342955591313674 1
		 1 1 no;
	setAttr ".xm[30]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.12751294480759978 4.3471307167516904e-07
		 4.8551875209135176e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.6499506466405458 0.18681352155558759 -0.1796341251068915 0.71442035678766735 1
		 1 1 no;
	setAttr ".xm[31]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.0408340855860843e-17
		 1.1102230246251565e-16 -5.7939764097625357e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[32]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.7061686225238191e-16
		 -4.163336342344337e-16 -1.1102230246251565e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[33]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.37446389924853796 0.015502639262867268
		 -0.004758121261067394 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[34]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1102230246251565e-16
		 4.163336342344337e-17 5.5511151231257827e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[35]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.2204460492503131e-16
		 6.9388939039072284e-18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[36]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.027464049584964512
		 0.043267933238540585 0.0079306033493262151 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.46270926261133005 -0.49242986100249925 0.49379517553612884 0.54733837331579649 1
		 1 1 no;
	setAttr ".xm[37]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 2.2204460492503131e-16
		 3.4694469519536142e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[38]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.075999999999999998
		 -0.040587032252631439 0.021358018984509369 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.83986236814211623 0.52418532343544899 -0.12443807534314749 -0.066152208417279423 1
		 1 1 no;
	setAttr ".xm[39]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.084161441991012664
		 0.050653734837815434 8.9938936231839794e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.87808187924087511 0.43427506678181416 -0.15063280188955658 0.13299300250526661 1
		 1 1 no;
	setAttr ".xm[40]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.34512464929854603 -0.0012010830610064693
		 0.0022664515878428049 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.290478410243088e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[41]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 5.5511151231257827e-17
		 -1.1102230246251565e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[42]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.1102230246251565e-16
		 0 -5.5511151231257827e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[43]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.068000000000000005
		 0.032798812384837776 0.01 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.051480272226639631 -0.06230992417752805 0.48939774437780215 0.86830703251694397 1
		 1 1 no;
	setAttr ".xm[44]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.0820222677758361 0.042018016041274753
		 -4.1494585545365226e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.0030941523627952168 0.063733184646246707 -0.44025601140112769 0.89560211691418712 1
		 1 1 no;
	setAttr ".xm[45]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.33482362779094299 -0.011165506473845288
		 0.0040615541651473908 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[46]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 2.7755575615628914e-17 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[47]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1102230246251565e-16
		 0 2.7755575615628914e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[48]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0.0015262621265289896
		 0.034083574638656744 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.019531460548441737 -0.70683698406976769 -0.019531460548444679 0.70683698406976725 1
		 1 1 no;
	setAttr ".xm[49]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.061115573774179532
		 -0.028953674733701622 1.2736977869334993e-10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.02183919728137243 0.99976149628904254 1 1 1 no;
	setAttr ".xm[50]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.2204460492503131e-16
		 -3.4694469519536142e-18 -4.5003707520568231e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[51]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.11178850278288222 9.0205620750793969e-17
		 -1.4893295608277637e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.070085491303234951 0.99754098858582452 1
		 1 1 no;
	setAttr ".xm[52]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.11916307417334115 1.2699880869160296e-09
		 -7.621089115076511e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.047995421176715014 0.9988475557091131 1
		 1 1 no;
	setAttr ".xm[53]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.048247482426039712
		 -0.084855629795413334 0.068297627635209135 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.078400753954303543 0 0 0.99692192361257492 1 1 1 no;
	setAttr ".xm[54]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.2204460492503131e-16
		 -1.1102230246251565e-16 -1.5612511283791264e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.11019009386523275 0.99391053078935188 1 1 1 no;
	setAttr ".xm[55]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.048249499064359824
		 -0.084855990067367271 -0.068297628282795425 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.5228887479247398e-07 0.078400573042454444 -0.99692193783996519 1.1976427055460339e-08 1
		 1 1 no;
	setAttr ".xm[56]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.2204460492503131e-16
		 -1.1102230246251565e-16 -1.1449174941446927e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[57]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.15735811436386626 -0.015468368216285583
		 -0.033641324207264262 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.73491532882595734 0.17291633932227338 -0.65492320047377461 0.032787200752847079 1
		 1 1 no;
	setAttr ".xm[58]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.11999999999999994
		 -6.9388939039072284e-18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.045901281053139981 -0.21258167647205312 -0.074077975288272369 0.97324948333056005 1
		 1 1 no;
	setAttr ".xm[59]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.24085645282569884
		 -0.00032512178276389303 9.5234753917150528e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.0029722823104971598 0.0044494523190715353 0.96126365096311006 0.27557859359717862 1
		 1 1 no;
	setAttr ".xm[60]" -type "matrix" "xform" 1 1 1 0.095399696914010054 0 0 0 0.22174829516515557
		 -1.3600842065086827e-06 2.7933669533020122e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.043611065060323848 0.029503159499579643 -0.9940049509360569 0.095821689081616077 1
		 1 1 no;
	setAttr ".xm[61]" -type "matrix" "xform" 1 1 1 0.0099309234438477341 0.14748032179352083
		 -0.10630800473897462 0 -0.084168033016549321 -0.014726827678484301 -0.017838380597151593 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.065880761515552722 -0.46207410206868255 0.16911031616555094 0.86807197306786665 1
		 1 1 no;
	setAttr ".xm[62]" -type "matrix" "xform" 1 1 1 0 0.35672784581512101 0 0 -0.043152267392662869
		 8.5787891901389912e-07 -1.5564560917891157e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[63]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.2204460492503131e-16
		 -4.0245584642661925e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[64]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.2204460492503131e-16
		 -4.4408920985006262e-16 -1.1102230246251565e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[65]" -type "matrix" "xform" 1 1 1 0.074333572842438494 0.20799088696016424
		 0.062674773439116371 0 -0.083915379297889447 0.028846179114232463 -0.027910369694658321 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.072684736018697668 -0.38267119719362891 -0.052370422405550961 0.91953087106706277 1
		 1 1 no;
	setAttr ".xm[66]" -type "matrix" "xform" 1 1 1 0 0.25350907385217636 0 0 -0.042977089244439881
		 2.0787860585680384e-07 3.497089676729459e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[67]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.1102230246251565e-16
		 -4.7184478546569153e-16 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[68]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1102230246251565e-16
		 -4.0245584642661925e-16 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[69]" -type "matrix" "xform" 1 1 1 0 0 0.047315876021566269 0 -0.033512186269922473
		 0.046450601970531982 -0.03518168109509312 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.50465587702149439 -0.28680242983121218 -0.37327491134516266 0.72369375608114783 1
		 1 1 no;
	setAttr ".xm[70]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.029078489221788351
		 -6.6934553949460351e-07 -1.5938323247866037e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		2.6355081700346636e-08 0 0 0.99999999999999967 1 1 1 no;
	setAttr ".xm[71]" -type "matrix" "xform" 1 1 1 7.045937527079172e-17 0.1745329251994335
		 2.0785515704883561e-16 0 0 0 -3.8857805861880479e-16 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[72]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.2204460492503131e-16
		 0 -4.9960036108132044e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[73]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.7755575615628914e-16
		 -3.6082248300317588e-16 2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[74]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.059999999999999998
		 3.4694469519536142e-17 -0.041000000000000002 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.047681762131597978 0 0 0.99886257791551369 1 1 1 no;
	setAttr ".xm[75]" -type "matrix" "xform" 1 1 1 0 0 0 0 -5.5511151231257827e-17
		 9.7144514654701197e-17 -4.4408920985006262e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[76]" -type "matrix" "xform" 1 1 1 0.028117437339260407 -0.081134128963893437
		 -2.9466553759472704 0 0.110874 -1.3600842065641938e-06 2.7933669530799676e-06 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[77]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.2204460492503131e-16
		 -2.7755575615628914e-17 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[78]" -type "matrix" "xform" 1 1 1 4.2687207031454291e-17 -2.039322072584867e-16
		 -0.089057403449433858 0 -0.10855109559665099 0.021031470895290796 -0.0055092092896660283 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[79]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.7755575615628914e-17
		 2.7755575615628914e-17 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[80]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.21781902398372943 -2.8435689636285844e-09
		 7.5886162859226808e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.1721339106110952 0.98507355908974203 1
		 1 1 no;
	setAttr ".xm[81]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.079581973492034441
		 0 -1.20249879389904e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[82]" -type "matrix" "xform" 1 1 1 0 0 0 0 -4.4408920985006262e-16
		 -1.1102230246251565e-16 -3.9752950280538824e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[83]" -type "matrix" "xform" 1 1 1 0 0 0 0 -6.6613381480000004e-16
		 2.2204460490000001e-16 -8.823118695e-18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 no;
	setAttr ".xm[84]" -type "matrix" "xform" 1 0.99999999999999989 0.99999999999999967 0
		 0 0 0 0.0075038591181066927 -0.053131384575175966 1.7148054962221222e-16 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.45687864749277862 0.53968685500498281 -0.45687864749277862 0.53968685500498281 1
		 1 1 yes;
	setAttr ".xm[85]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.12835201785126871 -0.026326570153564599
		 2.6330773054109973e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.45711566647316065 0.53948605930893612 -0.4571153363994116 0.53948644886092001 1
		 1 1 yes;
	setAttr ".xm[86]" -type "matrix" "xform" 1.0568583523819695 1 1 0 0 0 0 0.065319685473054445
		 -0.056294554965123034 2.6293057754101307e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.45703515529441274 0.53970329968244635 -0.45688819398686881 0.53952978910557747 1
		 1 1 yes;
	setAttr ".xm[87]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.035373202950510302
		 0.01342618992197675 0.031639526854205846 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.094098733603052709 -0.70093230463048295 0.094068272194658409 0.70070713770163162 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[88]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.024091543708911645
		 -0.0010717872006749118 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.0210123054151545e-07 1.2931225159662134e-07 0.538957491275314 0.84233296421199277 1
		 1 1 yes;
	setAttr ".xm[89]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.035373197515654216
		 0.013426373544768611 0.031638413187116313 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.00071792517399604794 -0.70722003593382909 -0.00071769447758879279 0.70699277950473793 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[90]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.022612475712183513
		 3.3006245205191576e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.64701575727517069 0.76247662904356439 1
		 1 1 yes;
	setAttr ".xm[91]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.035373199827749953
		 0.013428192200802602 0.031631219121535492 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.19251391232239953 -0.68051384130311787 -0.19245205035293939 0.68029516658002809 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[92]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.023259400696694743
		 -0.00012176313010092699 4.8572257327350599e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.72329046514415796 0.69054391824962702 1 1 1 yes;
	setAttr ".xm[93]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.029116964999142167
		 0.027556712347665657 0.052781770085943175 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.053535699141700727 -0.00016038957309533197 -8.5862862346796881e-06 0.99856592327140326 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[94]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.029083031995087518
		 0.027556712347664991 0.052800474942365477 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.053190435502520103 -0.00038806193064006006 3.5756086110283537e-06 0.99858431139599091 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[95]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.035391889344317085
		 0.013428948510302741 0.031608732774797865 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.19131608057274377 -0.68085154377043255 -0.19125483647084457 0.68063273517089429 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[96]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.023258826356405304
		 -0.00020361814288527569 -8.4134921252143613e-12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-1.3931411767861683e-07 1.3347611683999868e-07 0.7220742794970969 0.69181553530454276 1
		 1 1 yes;
	setAttr ".xm[97]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.035391897408792908
		 0.01342714993417049 0.03161579972007772 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.0016458416964825751 -0.70721848522780562 -0.0016453128255717875 0.70699122929701486 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[98]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.022612311246212907
		 9.2344060204752054e-05 -2.5817884266726709e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.64801561761706972 0.76162704739548726 1 1 1 yes;
	setAttr ".xm[99]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.03539189776109488
		 0.013426980873064043 0.031616895904520201 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.095845656477610286 -0.70069558638340079 0.095814857658956309 0.70047042650563918 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[100]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.023907575835352968
		 -0.0015416931201883699 -2.7755575615628914e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.53685599723676314 0.8436738932970016 1 1 1 yes;
	setAttr ".xm[101]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.2204460492503131e-16
		 -1.1102230246251565e-16 -1.6977504878291569e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[102]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.20894722221534301
		 0.018938149775890423 -0.05601762257032579 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		4.3971941382080326e-07 -2.5320761219337227e-07 -0.17213391061097427 0.98507355908963234 1
		 1 1 no;
	setAttr ".xm[103]" -type "matrix" "xform" 1 1 1 0 0 0 0 -4.4408920985006262e-16
		 -1.1102230246251565e-16 2.0816681711721685e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[104]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.20894543857588199
		 0.018938451333547879 0.056017657209175342 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-3.1040609393844762e-08 5.4241040513272183e-09 0.98507355908974159 0.17213391061109498 1
		 1 1 no;
	setAttr ".xm[105]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.2204460492503131e-16
		 1.1102230246251565e-16 -2.7755575615628914e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[106]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.15735810408582296
		 -0.015468356006465345 0.033641375792733887 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.17291646318000223 -0.73491542292149381 0.032787307703704416 0.65492305682956631 1
		 1 1 no;
	setAttr ".xm[107]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.12001305315136901
		 1.4105487395471572e-07 -2.5133216587924778e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.045901281053139328 -0.21258167647205317 -0.074077975288272202 0.97324948333056005 1
		 1 1 no;
	setAttr ".xm[108]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.24085645282569906
		 0.00032512178276364323 -9.5234753916484394e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.0029722823104965579 0.0044494523190719941 0.96126365096311006 0.27557859359717862 1
		 1 1 no;
	setAttr ".xm[109]" -type "matrix" "xform" 1 1 1 0.095399696914010054 0 0 0 -0.22168470728889489
		 3.8528612344740365e-05 0.00085295613297398098 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.043611065060323286 0.029503159499581089 -0.99400495093605679 0.095821689081615813 1
		 1 1 no;
	setAttr ".xm[110]" -type "matrix" "xform" 1 1 1 0.0099309234438477341 0.14748032179352083
		 -0.10630800473897462 0 0.08416803301654957 0.014726827678484385 0.017838380597151593 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.065880761515555608 -0.46207410206868232 0.16911031616555294 0.86807197306786621 1
		 1 1 no;
	setAttr ".xm[111]" -type "matrix" "xform" 1 1 1 0 0.35672784581512101 0 0 0.043152267392663091
		 -8.5787891906941027e-07 1.5564560928993387e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.4901161193847653e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[112]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.4022874393070381e-06
		 4.5565044507617225e-07 1.5459230662262513e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-1.4901165693720363e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[113]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.5537291704912377e-06
		 -6.4908293939680561e-07 4.2332341054773792e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[114]" -type "matrix" "xform" 1 1 1 0.074333572842438494 0.20799088696016424
		 0.062674773439116371 0 0.08391537929788967 -0.028846179114232484 0.027910369694658543 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.072684736018698889 -0.38267119719362885 -0.052370422405551155 0.91953087106706266 1
		 1 1 no;
	setAttr ".xm[115]" -type "matrix" "xform" 1 1 1 0 0.25350907385217636 0 0 0.042977089244439659
		 -2.0787860584986495e-07 -3.4970896778396821e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.6660004686562638e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[116]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.5385696917653604e-08
		 -1.2147539082268954e-08 -6.4598360438594682e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-1.6660005097701723e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[117]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.3385178229418102e-06
		 -3.7504684560762946e-07 8.7794974623633948e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[118]" -type "matrix" "xform" 1 1 1 0 0 0.047315876021566269 0 0.033512186269922556
		 -0.046450601970531934 0.03518168109509312 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.50465587702149406 -0.28680242983121246 -0.37327491134516244 0.72369375608114817 1
		 1 1 no;
	setAttr ".xm[119]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.029078489221788462
		 6.6934553955011467e-07 1.5938323247866037e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		3.3320009373125275e-08 0 0 0.99999999999999944 1 1 1 no;
	setAttr ".xm[120]" -type "matrix" "xform" 1 1 1 0 0 0 0 -4.109401383733946e-06
		 -2.4813770693743464e-07 -1.2931592555109894e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[121]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1807915569761462e-06
		 -3.51845766966008e-07 -4.0671238604739202e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[122]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.5249939029636792e-06
		 2.8336771056014509e-07 3.2125841571417624e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[123]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.060999999999999999
		 0 0.049000000000000002 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.047681762131598027 0 0 0.99886257791551369 1
		 1 1 no;
	setAttr ".xm[124]" -type "matrix" "xform" 1 1 1 2.9802343488871681e-08 4.6837533851373804e-17
		 -2.2204460492503136e-16 0 -1.2470015026133652e-07 -1.033683299095367e-07 2.8248327699209597e-07 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[125]" -type "matrix" "xform" 1 1 1 0.028117437339257451 -0.081134128963891244
		 -2.9466553759472718 0 -0.110874 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[126]" -type "matrix" "xform" 1 1 1 -6.3843628412371815e-17 -1.0303611805777494e-16
		 -0.089057403449435191 0 0.1085513387164575 -0.021031494278039728 0.0055099805043639094 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[127]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.4410655035934639e-06
		 -1.9078325105836846e-07 1.8824945766660051e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[128]" -type "matrix" "xform" 1 1 1 0 0 0 0 -4.5722289315763831e-08
		 9.8594417352604324e-10 -1.91767493440409e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[129]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 5.5511151231257827e-17
		 -2.9815136226877745e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[130]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.11026547808894938
		 0.0077551002628059584 -0.13421574049914495 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.82975234262291386 0.37641496248199702 -0.23504348248279525 0.33849281716725294 1
		 1 1 no;
	setAttr ".xm[131]" -type "matrix" "xform" 1 1 1 3.1415926535897931 0 0 0 0.051808186971804115
		 -0.030999956896802683 -0.067990421310209048 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.56782112654162542 0.089817512229353885 -0.58886256462474829 0.56811342417997268 1
		 1 1 no;
	setAttr ".xm[132]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 -1.3877787807814457e-17
		 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[133]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.13359146076750106
		 0.0052584688303747296 -0.072994162620050498 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.91337230120577606 0.31894801833471065 -0.12507040030932121 0.21995589548109928 1
		 1 1 no;
	setAttr ".xm[134]" -type "matrix" "xform" 1 1 1 3.1415926535897931 0 0 0 0.065905881243753184
		 -0.058000006177095553 -0.049337338962601548 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.60058755221426874 -0.047597708930259774 -0.65272757035941231 0.45932098702602514 1
		 1 1 no;
	setAttr ".xm[135]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.5511151231257827e-17
		 -5.5511151231257827e-17 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[136]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.14440698729984836
		 0.0024600960090983004 1.539708443810719e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.95914197271811463 -0.28292521302513812 -1.0977042272863142e-06 1.9694299726272351e-06 1
		 1 1 no;
	setAttr ".xm[137]" -type "matrix" "xform" 1 1 1 3.1415926535897931 0 0 0 0.071879403913751361
		 -0.076307896143120169 -3.3728084869688547e-12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.6588010485770327 0.26113147141888277 0.65589873733689152 -0.25997765170930115 1
		 1 1 no;
	setAttr ".xm[138]" -type "matrix" "xform" 1 1 1 0 0 0 0 -9.6277152916712794e-17
		 -1.9428902930940239e-16 -6.6613381477509392e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[139]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.13345737923113377
		 0.0057026922337278518 0.072839103478154241 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.91337244186842947 -0.31894771525075649 -0.12507040590087246 0.21995574768442791 1
		 1 1 no;
	setAttr ".xm[140]" -type "matrix" "xform" 1 1 1 -3.1415926535897931 3.1415926535897931
		 3.1415926535897931 0 0.065831286804661882 -0.057653499557021481 0.048999997999323072 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.04759745745236138 -0.60058757484127034 0.45932074052607919 0.65272774133855094 1
		 1 1 no;
	setAttr ".xm[141]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1102230246251565e-16
		 1.3877787807814457e-16 4.4408920985006262e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[142]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.11013733875373011
		 0.007826930643483665 0.13428494632165161 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.82975239164432313 -0.37641334099796447 -0.23504382373950672 0.33849426317322978 1
		 1 1 no;
	setAttr ".xm[143]" -type "matrix" "xform" 1 1 1 3.1415926535897931 3.1415926535897931
		 3.1415926535897931 0 0.051807906229560108 -0.030837335804792421 0.067999997038313997 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.089819809275797163 -0.56782132952494913 0.56811276471070382 0.58886265475995236 1
		 1 1 no;
	setAttr ".xm[144]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 2.6367796834847468e-16
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[145]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.4408920985006262e-16
		 -8.3266726846886741e-17 -2.5294944903855171e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[146]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.030938827079179498
		 0.035916293793965631 -4.0594177640619945e-09 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.6119341564574492 0.79090871038363253 7.6705421352971364e-08 5.9347768832354887e-08 1
		 1 1 no;
	setAttr ".xm[147]" -type "matrix" "xform" 1 1 1 0 3.1415926535897931 3.1415926535897931 0 0.059322256190993683
		 0.020930176031780379 2.1573802111624941e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.40944178825544753 0.57841670878380069 0.40763732443088796 -0.57586747152511053 1
		 1 1 no;
	setAttr ".xm[148]" -type "matrix" "xform" 1 1 1 0 0 0 0 -7.4593109467002705e-17
		 4.163336342344337e-17 2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[149]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1102230246251565e-16
		 -1.3877787807814457e-17 -5.3375781171229736e-18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[150]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 5.2939559203393771e-23
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[151]" -type "matrix" "xform" 1.204009629727991 1.204009629727991 1.204009629727991 0
		 0 0 0 0.040997495256495708 -0.0070000027720906006 0.012506271644896483 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.70150238153619227 -0.088849756742227864 -0.037234384849241284 0.70612585989382648 1
		 1 1 no;
	setAttr ".xm[152]" -type "matrix" "xform" 1 1 1 3.1415926535897931 0 -1.8325957145940464 0 0.12870963205513908
		 -0.0094267965325253167 0.00039742784866459747 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.50243449931104966 0.094378142180454316 0.18831356071303662 0.83856445371372512 0.83055814115533222
		 0.83055814115533222 0.83055814115533222 no;
	setAttr ".xm[153]" -type "matrix" "xform" 0.78793546468283704 0.78793546468283704
		 0.78793546468283704 0.3490658503988659 0 0 0 -5.5511151231257827e-17 5.5511151231257827e-17
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[154]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.025997483861166217
		 -0.024560186190272625 0.060302285071024864 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.59036589979613141 -0.38918897737995628 -0.12479939662341252 0.69600657672631228 1
		 1 1 no;
	setAttr ".xm[155]" -type "matrix" "xform" 1 1 1 -3.1415926535897931 0 -1.8325957145940464 0 0.096356382324940482
		 -0.041308688496866419 0.00011745567148795493 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.69325270710876641 0.1334318105135896 -0.09366591027834803 0.70201377000822507 1
		 1 1 no;
	setAttr ".xm[156]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.3877787807814457e-17
		 2.7755575615628914e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[157]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.025855416138822078
		 -0.024560178310251 0.060302220291522213 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.12469091780952368 -0.69602610967213829 -0.59051846876401426 0.3889572826405116 1
		 1 1 no;
	setAttr ".xm[158]" -type "matrix" "xform" 1 1 1 0 0 -1.8325957145940464 0 0.096533847755917834
		 -0.041362619192490957 2.260273503176699e-09 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.13316308277314309 -0.69332067741129655 0.70198351336571152 0.093771950086503769 1
		 1 1 no;
	setAttr ".xm[159]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.3266726846886741e-17
		 -2.7755575615628914e-17 2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[160]" -type "matrix" "xform" 1.204009629727991 1.204009629727991 1.204009629727991 0
		 0 0 0 -0.041002504743505995 -0.0069999901743702762 0.012506278719198627 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.037218244472472038 -0.70612673381712443 -0.7015071244927984 0.088812118277816127 1
		 1 1 no;
	setAttr ".xm[161]" -type "matrix" "xform" 1 1 1 0 0 -1.8325957145940464 0 0.12877672824613404
		 -0.0094277117392047582 -0.00039514754876282375 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.094339153543677362 0.50244544315757322 -0.83856376497018414 0.18830696439028008 0.83055814115533222
		 0.83055814115533222 0.83055814115533222 no;
	setAttr ".xm[162]" -type "matrix" "xform" 0.78793546468283704 0.78793546468283704
		 0.78793546468283704 0 0 0 0 5.5511151231257827e-17 -1.6653345369377348e-16 1.1102230246251565e-16 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[163]" -type "matrix" "xform" 0.8234027316381245 0.8234027316381245 0.8234027316381245 0
		 0 0 0 -1.1550502273161603e-08 -0.026716376831228718 0.078483583966893811 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.35432952872834911 -0.61192375059418425 -0.35432939965344878 0.61192367585436613 1
		 1 1 no;
	setAttr ".xm[164]" -type "matrix" "xform" 1 1 1 0 3.1415926535897931 0 0 0.095564865501694629
		 -0.054768539397500815 1.9862497055290313e-12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.35354614629834019 0.61057076204777805 0.35511113551773371 0.61327363256648659 1.2144725315770362
		 1.2144725315770362 1.2144725315770362 no;
	setAttr ".xm[165]" -type "matrix" "xform" 1.2418946658757442 1.2418946658757442 1.2418946658757442 0
		 0 0 0 4.3368086899420177e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 no;
	setAttr -s 99 ".m";
	setAttr -s 166 ".p";
	setAttr -s 166 ".g[0:165]" yes yes yes no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no;
	setAttr ".bp" yes;
createNode blinn -n "add_Atlas_10";
	rename -uid "727197B0-409F-B0D5-4346-2AB7C4362B75";
createNode shadingEngine -n "add_blinn1SG12";
	rename -uid "E4310F88-4BCE-3170-4895-548B53A8F4E9";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo19";
	rename -uid "F25526EE-4904-8B89-9C5F-49AC844E06E0";
createNode blinn -n "BA_AdeptasSororitasAnointedSaintArmor01_M";
	rename -uid "E261CEC0-4BB8-68F1-D8EC-81A76708AA40";
createNode blinn -n "BP_AdeptasSororitasAnointedSaintArmor_M";
	rename -uid "56279135-405A-F2D2-9117-3B9AC8D707A4";
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo10";
	rename -uid "5DC5FC71-4331-48E4-E2D9-3587A2FE8F66";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1016.4764318545587 -1832.4414600114667 ;
	setAttr ".tgi[0].vh" -type "double2" 410.90446380737279 -612.83316809677478 ;
	setAttr -s 15 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -141.42857360839844;
	setAttr ".tgi[0].ni[0].y" -541.4285888671875;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -1224.2857666015625;
	setAttr ".tgi[0].ni[1].y" -700;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" 347.14285278320313;
	setAttr ".tgi[0].ni[2].y" -1058.5714111328125;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -72.857139587402344;
	setAttr ".tgi[0].ni[3].y" -1035.7142333984375;
	setAttr ".tgi[0].ni[3].nvs" 1923;
	setAttr ".tgi[0].ni[4].x" 57.142856597900391;
	setAttr ".tgi[0].ni[4].y" -144.28572082519531;
	setAttr ".tgi[0].ni[4].nvs" 1923;
	setAttr ".tgi[0].ni[5].x" -557.14288330078125;
	setAttr ".tgi[0].ni[5].y" -234.28572082519531;
	setAttr ".tgi[0].ni[5].nvs" 1923;
	setAttr ".tgi[0].ni[6].x" -1288.5714111328125;
	setAttr ".tgi[0].ni[6].y" -280;
	setAttr ".tgi[0].ni[6].nvs" 1923;
	setAttr ".tgi[0].ni[7].x" -981.4285888671875;
	setAttr ".tgi[0].ni[7].y" -257.14285278320313;
	setAttr ".tgi[0].ni[7].nvs" 1923;
	setAttr ".tgi[0].ni[8].x" -448.57144165039063;
	setAttr ".tgi[0].ni[8].y" -654.28570556640625;
	setAttr ".tgi[0].ni[8].nvs" 1923;
	setAttr ".tgi[0].ni[9].x" -828.5714111328125;
	setAttr ".tgi[0].ni[9].y" -1171.4285888671875;
	setAttr ".tgi[0].ni[9].nvs" 1923;
	setAttr ".tgi[0].ni[10].x" -917.14288330078125;
	setAttr ".tgi[0].ni[10].y" -677.14288330078125;
	setAttr ".tgi[0].ni[10].nvs" 1923;
	setAttr ".tgi[0].ni[11].x" -250;
	setAttr ".tgi[0].ni[11].y" -121.42857360839844;
	setAttr ".tgi[0].ni[11].nvs" 1923;
	setAttr ".tgi[0].ni[12].x" 295.71429443359375;
	setAttr ".tgi[0].ni[12].y" -564.28570556640625;
	setAttr ".tgi[0].ni[12].nvs" 1923;
	setAttr ".tgi[0].ni[13].x" -1135.7142333984375;
	setAttr ".tgi[0].ni[13].y" -1194.2857666015625;
	setAttr ".tgi[0].ni[13].nvs" 1923;
	setAttr ".tgi[0].ni[14].x" -380;
	setAttr ".tgi[0].ni[14].y" -1148.5714111328125;
	setAttr ".tgi[0].ni[14].nvs" 1923;
createNode file -n "add_file7";
	rename -uid "2D9E6DB9-4EBF-0A75-1690-6EB944E4FC2E";
	setAttr ".ail" yes;
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "add_place2dTexture12";
	rename -uid "0ECB2461-4755-1C2E-E35E-D2974946E3B9";
createNode bump2d -n "add_bump2d4";
	rename -uid "0EB0C050-46D7-5D97-E539-449A25A6E2B0";
	setAttr ".vc1" -type "float3" 0 9.9999997e-06 0 ;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "add_file8";
	rename -uid "93584977-4E13-E93B-3720-A09223D0AB77";
	setAttr ".ftn" -type "string" "E:/!ArtCharactersWH//Character_human_atlas_layout_4k_WH.psd";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "add_place2dTexture13";
	rename -uid "0ABF725A-4467-3BC1-35C1-7B8179F1E842";
createNode blinn -n "add_Atlas_11";
	rename -uid "1B60C35C-4F60-07BF-8B93-91902F70ABBB";
createNode shadingEngine -n "add_blinn1SG13";
	rename -uid "761F86FD-4644-4C37-AC74-A798FDD91B23";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo20";
	rename -uid "F9EA9BA3-4C4C-B6B2-5DC2-7FA3263D8A4A";
createNode blinn -n "BP_AdeptaSororitasRelicArmor_n";
	rename -uid "09108D82-4EAA-5C18-6807-4BA27F4DB045";
createNode shadingEngine -n "add_blinn2SG1";
	rename -uid "F2122856-479B-8391-8642-238F736B123C";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo21";
	rename -uid "0BF97FBA-4FF8-2122-9DFC-EBA15C9EB949";
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo11";
	rename -uid "241A276D-4F16-0965-2C11-37908B249B71";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1186.0805389499799 -1151.1199880709426 ;
	setAttr ".tgi[0].vh" -type "double2" 241.30035671195159 68.488303843749108 ;
	setAttr -s 10 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -1216.4207763671875;
	setAttr ".tgi[0].ni[0].y" -152.24684143066406;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -994.99224853515625;
	setAttr ".tgi[0].ni[1].y" -152.24684143066406;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" -100;
	setAttr ".tgi[0].ni[2].y" -50;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -407.14285278320313;
	setAttr ".tgi[0].ni[3].y" -27.142856597900391;
	setAttr ".tgi[0].ni[3].nvs" 1923;
	setAttr ".tgi[0].ni[4].x" -714.28570556640625;
	setAttr ".tgi[0].ni[4].y" -140;
	setAttr ".tgi[0].ni[4].nvs" 1923;
	setAttr ".tgi[0].ni[5].x" 97.142860412597656;
	setAttr ".tgi[0].ni[5].y" -377.14285278320313;
	setAttr ".tgi[0].ni[5].nvs" 1923;
	setAttr ".tgi[0].ni[6].x" -244.28572082519531;
	setAttr ".tgi[0].ni[6].y" -354.28570556640625;
	setAttr ".tgi[0].ni[6].nvs" 1923;
	setAttr ".tgi[0].ni[7].x" -551.4285888671875;
	setAttr ".tgi[0].ni[7].y" -465.71429443359375;
	setAttr ".tgi[0].ni[7].nvs" 1923;
	setAttr ".tgi[0].ni[8].x" -1225.7142333984375;
	setAttr ".tgi[0].ni[8].y" -511.42855834960938;
	setAttr ".tgi[0].ni[8].nvs" 1923;
	setAttr ".tgi[0].ni[9].x" -918.5714111328125;
	setAttr ".tgi[0].ni[9].y" -488.57144165039063;
	setAttr ".tgi[0].ni[9].nvs" 1923;
createNode materialInfo -n "pasted__materialInfo1";
	rename -uid "F3888938-470C-D194-CB6D-4184B49A100A";
createNode shadingEngine -n "pasted__BC_ChestCommissar_F_HMSG";
	rename -uid "8BBF0061-45AF-CB3C-41D1-BA8C31564F25";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode phong -n "pasted__atlas_2";
	rename -uid "C0330E9C-48B2-1DE9-3971-598E6A2725B7";
	setAttr ".cp" 6.311790943145752;
createNode blinn -n "add_atlas_3";
	rename -uid "5637B941-49FD-D333-BA49-479C4FC171E8";
createNode shadingEngine -n "add_blinn1SG14";
	rename -uid "38E60EF5-4CBD-E58A-5E15-149C1ADF7700";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo22";
	rename -uid "2EB2A217-410E-8126-3E8D-CA95C5DF029F";
createNode shadingEngine -n "add_blinn1SG15";
	rename -uid "B86BF7C8-44E1-40D7-2C7A-0685934B73C6";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo23";
	rename -uid "3A82528B-44A9-1D72-628D-C19CB63337BE";
createNode materialInfo -n "materialInfo3";
	rename -uid "E4E82ECC-4027-FDEF-313F-8DB7BC0C9670";
createNode shadingEngine -n "add_blinn1SG2";
	rename -uid "6DE457DD-407D-3131-646F-EEB9CEDCFFA5";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo12";
	rename -uid "683E82A5-4AE9-37D4-D223-CC9E692A2FA7";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1115.5991061283798 -174.03308049791576 ;
	setAttr ".tgi[0].vh" -type "double2" -153.21372071710991 407.14284096445425 ;
	setAttr -s 2 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 45.714286804199219;
	setAttr ".tgi[0].ni[0].y" 195.71427917480469;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -261.42855834960938;
	setAttr ".tgi[0].ni[1].y" 195.71427917480469;
	setAttr ".tgi[0].ni[1].nvs" 1923;
createNode materialInfo -n "materialInfo4";
	rename -uid "59102774-40EA-3730-33F8-82B76AA787DA";
createNode shadingEngine -n "HM_F_Brows05_F_HMSG";
	rename -uid "25E68371-4010-90BA-9E7D-11AF8FC7C558";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode lambert -n "atlas";
	rename -uid "EE5C50C8-42EC-59CA-07D6-ACBCF020D48D";
createNode file -n "add_file9";
	rename -uid "66277F57-4A6F-B3D7-7097-8B95C103688E";
	setAttr ".ftn" -type "string" "F:\\WHArtSvn\\Art\\Characters\\atlasWH.png";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "add_place2dTexture14";
	rename -uid "599AD4F6-42E4-6BE2-F27D-838A5CF31C62";
createNode dagPose -n "bindPose7";
	rename -uid "C9D21EB7-403F-6502-944D-60A6348D5158";
	setAttr -s 166 ".wm";
	setAttr ".wm[0]" -type "matrix" 0.99999999999998856 -1.5099582926491191e-07 0 0 7.9409338805090657e-23 4.4408920985006262e-16 -1 0
		 1.5099582926491191e-07 0.99999999999998868 4.4408920985006262e-16 0 1.6162710543192327e-06 7.499949927770349e-08 -1.7468560070676653e-09 1;
	setAttr ".wm[1]" -type "matrix" 5.5046999290195441e-07 0.99999999999984845 4.4408920985002712e-16 0
		 -0.99999999999952927 5.5046999279088361e-07 7.9894832705207385e-07 0 7.989483269965051e-07 -4.4016005166177621e-13 0.9999999999996807 0
		 1.6156555032646602e-06 7.4999499370648997e-08 -1.7468560070676653e-09 1;
	setAttr ".wm[2]" -type "matrix" 5.5046999290195441e-07 0.99999999999984845 4.4408920985002712e-16 0
		 -0.99999999999952927 5.5046999279088361e-07 7.9894832705207385e-07 0 7.989483269965051e-07 -4.4016005166177621e-13 0.9999999999996807 0
		 1.6156555032646581e-06 7.4999499370648997e-08 -1.7468560070676653e-09 1;
	setAttr ".wm[3]" -type "matrix" 0.99999999999997169 -1.8294025414811405e-07 -1.5099574884878858e-07 0
		 -1.5099569455835847e-07 2.9607675621607326e-07 -0.9999999999999446 0 1.8294029896234176e-07 0.99999999999993927 2.9607672867303669e-07 0
		 2.5013986340984517e-06 0.95947478651147489 -6.8391901184022601e-11 1;
	setAttr ".wm[4]" -type "matrix" 0.99999999999997702 -1.5099580466493467e-07 -1.5099573939078039e-07 0
		 -1.5099571466470977e-07 1.6291844281631984e-07 -0.99999999999997513 0 1.5099582937282804e-07 0.99999999999997524 1.6291842009675927e-07 0
		 0.010001754887216432 0.91972627813743157 0.00242803669434176 1;
	setAttr ".wm[5]" -type "matrix" -0.15319112859145514 0.98478152061193891 0.082084315079758496 0
		 0.09865379992603672 -0.067409246389017366 0.99283604953759508 0 0.98325983640186854 0.16019160453189041 -0.086825940573475521 0
		 0.10627899999999593 0.9197259999997548 0.0024280600000002655 1;
	setAttr ".wm[6]" -type "matrix" -0.19534251699237662 0.9756608733185973 0.099635141041073433 0
		 0.10567981578512403 -0.080060409996805609 0.9911720876249317 0 0.97502465486299617 0.20414747372018824 -0.087468459360845088 0
		 0.16728799999999591 0.5260939999997547 -0.030391999999999232 1;
	setAttr ".wm[7]" -type "matrix" 0.025033081645243482 0.52811141640872938 -0.84880603006936028 0
		 -0.14999686831468645 0.84144429076604488 0.51910735405406694 0 0.98836950798733603 0.11432338954034393 0.10027900221321306 0
		 0.25371999999999706 0.094400699999755089 -0.074476799999998983 1;
	setAttr ".wm[8]" -type "matrix" 0.063563399935808881 0.033038749958747685 -0.99743076711607581 0
		 -0.99745280540083547 -0.030311178277780779 -0.064568827381447216 0 -0.032366575144784165 0.99899433105127067 0.031027912285893675 0
		 0.25052686146609177 0.027059257377606727 0.033756385351588952 1;
	setAttr ".wm[9]" -type "matrix" 0.063563399935808881 0.033038749958747685 -0.99743076711607581 0
		 -0.99745280540083547 -0.030311178277780779 -0.064568827381447216 0 -0.032366575144784165 0.99899433105127067 0.031027912285893675 0
		 0.25052686146609165 0.027059257377607043 0.033756385351588772 1;
	setAttr ".wm[10]" -type "matrix" 0.025033081645243482 0.52811141640872938 -0.84880603006936028 0
		 -0.14999686831468645 0.84144429076604488 0.51910735405406694 0 0.98836950798733603 0.11432338954034393 0.10027900221321306 0
		 0.25371999999999684 0.094400699999755311 -0.074476799999999163 1;
	setAttr ".wm[11]" -type "matrix" -0.19534251699237662 0.9756608733185973 0.099635141041073433 0
		 0.10567981578512403 -0.080060409996805609 0.9911720876249317 0 0.97502465486299617 0.20414747372018824 -0.087468459360845088 0
		 0.24343799999999666 0.1629569999997551 -0.083483699999999023 1;
	setAttr ".wm[12]" -type "matrix" -0.19534251699237662 0.9756608733185973 0.099635141041073433 0
		 0.10567981578512403 -0.080060409996805609 0.9911720876249317 0 0.97502465486299617 0.20414747372018824 -0.087468459360845088 0
		 0.16728799999999575 0.52609399999975492 -0.030391999999999236 1;
	setAttr ".wm[13]" -type "matrix" -0.15319112859145514 0.98478152061193891 0.082084315079758496 0
		 0.09865379992603672 -0.067409246389017366 0.99283604953759508 0 0.98325983640186854 0.16019160453189041 -0.086825940573475521 0
		 0.10627899999999593 0.9197259999997548 0.0024280600000002516 1;
	setAttr ".wm[14]" -type "matrix" 0.98352383668862886 0.18077849060460388 -2.3037127760971998e-15 0
		 -0.18077849060460396 0.98352383668862897 -1.1740825325845528e-14 0 -1.8041124150158794e-16 1.2000817006807551e-14 1 0
		 0.08999999999999958 0.94841842365713536 -0.037586958176367126 1;
	setAttr ".wm[15]" -type "matrix" 0.98352383668862886 0.18077849060460388 -2.3037127760971998e-15 0
		 -0.18077849060460396 0.98352383668862897 -1.1740825325845528e-14 0 -1.8041124150158794e-16 1.2000817006807551e-14 1 0
		 0.089999999999999608 0.94841842365713547 -0.03758695817636714 1;
	setAttr ".wm[16]" -type "matrix" -0.1242147920651977 -0.51594310322870651 0.8475691120274097 0
		 -0.074814447192810329 0.85662285413753236 0.51049004325305103 0 -0.98943088890706932 -3.6082248300317588e-16 -0.1450052277559884 0
		 0.10102670121246134 0.83837440204031433 0.038265589980884085 1;
	setAttr ".wm[17]" -type "matrix" -0.13577989848138874 0.985552881725691 -0.10123900676404353 0
		 0.22683586974658729 0.13039588567839952 0.96516444256637146 0 0.96442174766265643 0.10808529187790576 -0.24126388522730668 0
		 0.086770299999995915 0.83869399999975536 0.13554400000000022 1;
	setAttr ".wm[18]" -type "matrix" -0.13577989848138874 0.985552881725691 -0.10123900676404353 0
		 0.22683586974658729 0.13039588567839952 0.96516444256637146 0 0.96442174766265643 0.10808529187790576 -0.24126388522730668 0
		 0.13171799999999592 0.49846699999975502 0.17219000000000145 1;
	setAttr ".wm[19]" -type "matrix" -0.13577989848138874 0.985552881725691 -0.10123900676404353 0
		 0.22683589007025631 0.13039588795612675 0.96516443748211489 0 0.96442174288244753 0.10808528913001786 -0.24126390556662683 0
		 0.13171799999999598 0.4984669999997553 0.1721900000000014 1;
	setAttr ".wm[20]" -type "matrix" -0.13577989848138874 0.985552881725691 -0.10123900676404353 0
		 0.22683586974658729 0.13039588567839952 0.96516444256637146 0 0.96442174766265643 0.10808529187790576 -0.24126388522730668 0
		 0.086770299999995942 0.83869399999975536 0.13554400000000022 1;
	setAttr ".wm[21]" -type "matrix" -0.062712120734534138 -0.45694219285386367 -0.88728294376871619 0
		 -0.032215773112077961 0.88949639256710955 -0.4558051245575116 0 0.99751157079793706 -3.3306690738754696e-16 -0.07050295117391675 0
		 0.10357577045941022 0.85340534688196523 -0.035371575117079813 1;
	setAttr ".wm[22]" -type "matrix" -0.10409325504850769 0.9771920651797531 0.18509527817622615 0
		 0.018753544802592732 -0.1841447154037352 0.98272021875313731 0 0.99439071737961382 0.10576573896402194 0.00084240765126911143 0
		 0.09714629999999598 0.85318199999975453 -0.12678599999999982 1;
	setAttr ".wm[23]" -type "matrix" -0.10409325504850769 0.9771920651797531 0.18509527817622615 0
		 0.018753544802592732 -0.1841447154037352 0.98272021875313731 0 0.99439071737961382 0.10576573896402194 0.00084240765126911143 0
		 0.12816999999999568 0.52350999999975456 -0.17779099999999937 1;
	setAttr ".wm[24]" -type "matrix" -0.10409325504850769 0.9771920651797531 0.18509527817622615 0
		 0.018753544802592732 -0.1841447154037352 0.98272021875313731 0 0.99439071737961382 0.10576573896402194 0.00084240765126911143 0
		 0.12816999999999545 0.52350999999975467 -0.17779099999999928 1;
	setAttr ".wm[25]" -type "matrix" -0.10409325504850769 0.9771920651797531 0.18509527817622615 0
		 0.018753544802592732 -0.1841447154037352 0.98272021875313731 0 0.99439071737961382 0.10576573896402194 0.00084240765126911143 0
		 0.097146299999995772 0.85318199999975464 -0.12678599999999973 1;
	setAttr ".wm[26]" -type "matrix" 0.99999999999998135 -1.1905135518177949e-07 -1.5099572993277209e-07 0
		 1.5099571042553222e-07 -1.6279671886471323e-07 0.99999999999997535 0 -1.1905137987129229e-07 -0.99999999999997979 -1.6279670096862873e-07 0
		 -0.0099967644875541811 0.91972607611366342 0.0024280396031870137 1;
	setAttr ".wm[27]" -type "matrix" -0.15319112859145523 -0.98478152061193924 -0.082084315079759274 0
		 0.098653799926038427 0.067409246389017921 -0.99283604953759508 0 0.98325983640186843 -0.16019160453189063 0.086825940573476881 0
		 -0.10627363853236743 0.91972609244770676 0.002428055937223143 1;
	setAttr ".wm[28]" -type "matrix" -0.19534251699237803 -0.9756608733185973 -0.099635141041074585 0
		 0.10567981578520723 0.080060409996789303 -0.99117208762492426 0 0.97502465486298695 -0.20414747372019651 0.087468459360929063 0
		 -0.16728304451914308 0.52609376942670483 -0.030391959167977746 1;
	setAttr ".wm[29]" -type "matrix" 0.025033081645244315 -0.52811141640873083 0.84880603006935951 0
		 -0.14999686831468484 -0.84144429076604432 -0.51910735405406816 0 0.98836950798733636 -0.11432338954034196 -0.1002790022132133 0
		 -0.25371473831633323 0.094400720937513338 -0.074476793946084405 1;
	setAttr ".wm[30]" -type "matrix" 0.063563399935809839 -0.033038749958748413 0.9974307671160757 0
		 -0.99745280540083547 0.030311178277778836 0.06456882738144834 0 -0.032366575144782264 -0.99899433105127067 -0.031027912285894306 0
		 -0.25052228169180824 0.027059257751741797 0.033756688168419285 1;
	setAttr ".wm[31]" -type "matrix" 0.063563399935809839 -0.033038749958748413 0.9974307671160757 0
		 -0.99745280540083547 0.030311178277778836 0.06456882738144834 0 -0.032366575144782264 -0.99899433105127067 -0.031027912285894306 0
		 -0.25052228169180835 0.027059257751742383 0.033756688168419299 1;
	setAttr ".wm[32]" -type "matrix" 0.025033081645244315 -0.52811141640873083 0.84880603006935951 0
		 -0.14999686831468484 -0.84144429076604432 -0.51910735405406816 0 0.98836950798733636 -0.11432338954034196 -0.1002790022132133 0
		 -0.25371473831633329 0.094400720937513838 -0.074476793946084405 1;
	setAttr ".wm[33]" -type "matrix" -0.19534251699237803 -0.9756608733185973 -0.099635141041074585 0
		 0.10567981578520723 0.080060409996789303 -0.99117208762492426 0 0.97502465486298695 -0.20414747372019651 0.087468459360929063 0
		 -0.24343273460001691 0.1629565005501078 -0.083483691442426886 1;
	setAttr ".wm[34]" -type "matrix" -0.19534251699237803 -0.9756608733185973 -0.099635141041074585 0
		 0.10567981578520723 0.080060409996789303 -0.99117208762492426 0 0.97502465486298695 -0.20414747372019651 0.087468459360929063 0
		 -0.167283044519143 0.52609376942670494 -0.03039195916797777 1;
	setAttr ".wm[35]" -type "matrix" -0.15319112859145523 -0.98478152061193924 -0.082084315079759274 0
		 0.098653799926038427 0.067409246389017921 -0.99283604953759508 0 0.98325983640186843 -0.16019160453189063 0.086825940573476881 0
		 -0.10627363853236746 0.91972609244770653 0.0024280559372231178 1;
	setAttr ".wm[36]" -type "matrix" 0.98352417730575048 -0.18077663747024017 -1.9428902930940239e-16 0
		 0.1807766374702402 0.98352417730575059 4.8982085748550119e-15 0 -8.3266726846886741e-16 -4.603956105242446e-15 1 0
		 -0.09000000000000026 0.94841842365713558 -0.037586958176367126 1;
	setAttr ".wm[37]" -type "matrix" 0.98352417730575048 -0.18077663747024017 -1.9428902930940239e-16 0
		 0.1807766374702402 0.98352417730575059 4.8982085748550119e-15 0 -8.3266726846886741e-16 -4.603956105242446e-15 1 0
		 -0.090000000000000246 0.94841842365713569 -0.037586958176367098 1;
	setAttr ".wm[38]" -type "matrix" 0.12421241873064243 -0.51594212681509144 0.84757005422006493 0
		 0.074812824792564236 0.85662344222973508 0.51048929417671141 0 -0.98943130953070246 2.0816681711721685e-15 0.14500235763724462 0
		 -0.10091974701218412 0.83872538029313159 0.038340346842435195 1;
	setAttr ".wm[39]" -type "matrix" -0.13577989848138891 -0.98555288172569122 0.10123900676404142 0
		 0.22683586974658407 -0.13039588567839686 -0.9651644425663729 0 0.96442174766265742 -0.10808529187790672 0.24126388522730285 0
		 -0.086765290148564961 0.83869412361502527 0.13554429549656435 1;
	setAttr ".wm[40]" -type "matrix" -0.13577989848138891 -0.98555288172569122 0.10123900676404142 0
		 0.22683589463789286 -0.13039588846803152 -0.96516443633945592 0 0.96442174180812124 -0.10808528851244517 0.24126391013778029 0
		 -0.13171291351318759 0.49846717715238875 0.17219042778015206 1;
	setAttr ".wm[41]" -type "matrix" -0.13577989848138891 -0.98555288172569122 0.10123900676404142 0
		 0.22683589463789286 -0.13039588846803152 -0.96516443633945592 0 0.96442174180812124 -0.10808528851244517 0.24126391013778029 0
		 -0.1317129135131877 0.4984671771523887 0.17219042778015203 1;
	setAttr ".wm[42]" -type "matrix" -0.13577989848138891 -0.98555288172569122 0.10123900676404142 0
		 0.22683586974658407 -0.13039588567839686 -0.9651644425663729 0 0.96442174766265742 -0.10808529187790672 0.24126388522730285 0
		 -0.08676529014856503 0.83869412361502516 0.13554429549656435 1;
	setAttr ".wm[43]" -type "matrix" 0.062710073914620662 -0.45694327208468749 -0.88728253263893464 0
		 0.032214817808062401 0.88949583815582833 -0.4558062739992223 0 0.99751173032862916 -3.8857805861880479e-16 0.070500694016327414 0
		 -0.10362230943774224 0.85336997622609267 -0.034849261400152806 1;
	setAttr ".wm[44]" -type "matrix" -0.10409325504850844 -0.97719206517975354 -0.18509527817622698 0
		 0.018753544802588978 0.18414471540373648 -0.98272021875313742 0 0.99439071737961382 -0.10576573896402192 -0.00084240765127328865 0
		 -0.097125084231452996 0.85326530320107441 -0.12677826221769878 1;
	setAttr ".wm[45]" -type "matrix" -0.10409325504850844 -0.97719206517975354 -0.18509527817622698 0
		 0.018753544802588978 0.18414471540373648 -0.98272021875313742 0 0.99439071737961382 -0.10576573896402192 -0.00084240765127328865 0
		 -0.12814858658130629 0.52359266859948161 -0.17778338726347481 1;
	setAttr ".wm[46]" -type "matrix" -0.10409325504850844 -0.97719206517975354 -0.18509527817622698 0
		 0.018753544802588978 0.18414471540373648 -0.98272021875313742 0 0.99439071737961382 -0.10576573896402192 -0.00084240765127328865 0
		 -0.12814858658130629 0.52359266859948161 -0.17778338726347487 1;
	setAttr ".wm[47]" -type "matrix" -0.10409325504850844 -0.97719206517975354 -0.18509527817622698 0
		 0.018753544802588978 0.18414471540373648 -0.98272021875313742 0 0.99439071737961382 -0.10576573896402192 -0.00084240765127328865 0
		 -0.097125084231452954 0.85326530320107452 -0.12677826221769875 1;
	setAttr ".wm[48]" -type "matrix" 1.9099946721416929e-07 0.99847407184529768 0.055222530299095601 0
		 -1.4066291218240629e-07 0.055222530299122809 -0.99847407184530457 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5074034344226795e-06 0.99355836160202027 -0.0015262521035675255 1;
	setAttr ".wm[49]" -type "matrix" 1.8467480778841807e-07 0.99993308254271895 0.011568510560203409 0
		 -1.4886929404025099e-07 0.011568510560230887 -0.99993308254272473 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5230218148797669e-06 1.0529817822212342 0.0307581980271673 1;
	setAttr ".wm[50]" -type "matrix" 1.8467480778841807e-07 0.99993308254271895 0.011568510560203409 0
		 -1.4886929404025099e-07 0.011568510560230887 -0.99993308254272473 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5230218149247702e-06 1.0529817822212342 0.030758198027167304 1;
	setAttr ".wm[51]" -type "matrix" 1.6945472294488251e-07 0.99638667242739731 -0.084932908869468166 0
		 -1.6598779536883122e-07 -0.084932908869440243 -0.99638667242740042 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5287549790438125e-06 1.105176283161134 0.0046469918784506304 1;
	setAttr ".wm[52]" -type "matrix" 1.5275907850020733e-07 0.98365281271709404 -0.18007538430814429 0
		 -1.8147042534666462e-07 -0.1800753843081162 -0.98365281271709437 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5489478007632051e-06 1.2239087820050647 -0.0054738759063186196 1;
	setAttr ".wm[53]" -type "matrix" 1.5275907850020733e-07 0.98365281271709404 -0.18007538430814429 0
		 0.15631868165005183 -0.17786168201954136 -0.97156044167945066 0 -0.9877066719260158 -0.028148998257997895 -0.15376333805528802 0
		 -0.068295055918378228 1.2866479764404588 0.069306429389701787 1;
	setAttr ".wm[54]" -type "matrix" 0.034239910041703708 0.92080756877216863 -0.38851132525606469 0
		 0.15252265009882834 -0.38900007093695865 -0.90852396006812686 0 -0.9877066719260158 -0.028148998257997895 -0.15376333805528802 0
		 -0.068295055918378089 1.2866479764404586 0.069306429389701912 1;
	setAttr ".wm[55]" -type "matrix" 1.5275907932726171e-07 -0.98365281271709382 0.18007538430814446 0
		 0.15631868165004908 0.17786168201954181 0.97156044167945088 0 -0.98770667192601624 0.028148998257996393 0.15376333805528566 0
		 0.068300199999995884 1.2866499999997545 0.069306399999999727 1;
	setAttr ".wm[56]" -type "matrix" 1.5275907932726171e-07 -0.98365281271709382 0.18007538430814446 0
		 0.15631868165004908 0.17786168201954181 0.97156044167945088 0 -0.98770667192601624 0.028148998257996393 0.15376333805528566 0
		 0.068300199999995967 1.2866499999997543 0.069306399999999643 1;
	setAttr ".wm[57]" -type "matrix" -0.95128724650677166 0.13450615265011098 0.27741786087566422 0
		 0.27468561553524995 -0.038839183191062644 0.9607493588168935 0 0.14000138303454407 0.99015130800717321 3.1430042408913212e-07 0
		 0.03364389999999598 1.3814799999997547 -0.01859470000000054 1;
	setAttr ".wm[58]" -type "matrix" -0.8302313574713035 0.54216366200546373 0.12951624095912284 0
		 0.10668056664112087 -0.07351128430683726 0.99157215964380963 0 0.54711529842665318 0.83705116610657948 0.0031930466845564143 0
		 0.14779836958080858 1.3653392616817415 -0.051884843305080246 1;
	setAttr ".wm[59]" -type "matrix" 0.76242286913840851 -0.4960247526686955 0.41553677737923128 0
		 0.35494420561457446 -0.21635345693317737 -0.90950854453034291 0 0.54104156911959733 0.84092248537723335 0.011108288418149675 0
		 0.34778236958080888 1.2348592616817418 -0.083401743305080281 1;
	setAttr ".wm[60]" -type "matrix" -0.77020140754512911 0.59495272147322864 -0.22982830771491225 0
		 -0.2407882510503162 0.062439744370431635 0.96856713576245446 0 0.59060207413421051 0.80133172752272441 0.09516644626030013 0
		 0.51684936958080874 1.1248692616817411 0.0087440966949199894 1;
	setAttr ".wm[61]" -type "matrix" -0.11615866541956366 0.98971641398843957 0.083478046993261931 0
		 0.036648232435356781 -0.079718897418660617 0.99614346579883617 0 0.99255431665340599 0.1187700184230705 -0.027011316452065379 0
		 0.57468636958080832 1.0595792616817412 0.012126756694919983 1;
	setAttr ".wm[62]" -type "matrix" -0.45545568675615739 0.88593265644212016 0.087655265962090487 0
		 0.036648232435356781 -0.079718897418660617 0.99614346579883617 0 0.88950380800806061 0.45691161688422965 0.0038405592558958535 0
		 0.57969875632399281 1.0168706674672112 0.0085253484643219163 1;
	setAttr ".wm[63]" -type "matrix" -0.45545568675615739 0.88593265644212016 0.087655265962090487 0
		 0.036648232435356781 -0.079718897418660617 0.99614346579883617 0 0.88950380800806061 0.45691161688422965 0.0038405592558958535 0
		 0.57969875632399293 1.016870667467211 0.0085253484643215104 1;
	setAttr ".wm[64]" -type "matrix" -0.11615866541956366 0.98971641398843957 0.083478046993261931 0
		 0.036648232435356781 -0.079718897418660617 0.99614346579883617 0 0.99255431665340599 0.1187700184230705 -0.027011316452065379 0
		 0.57468636958080821 1.0595792616817414 0.012126756694919562 1;
	setAttr ".wm[65]" -type "matrix" -0.31998431244120268 0.93455790837144059 -0.15560062882883371 0
		 -0.33666171711770637 0.041356127155785523 0.94071704511719767 0 0.88558959344545585 0.35339947176965664 0.30139655826508638 0
		 0.55805136958080859 1.0543792616817413 0.05331355669491996 1;
	setAttr ".wm[66]" -type "matrix" -0.53186507774956804 0.8160544075152022 -0.22621835258320183 0
		 -0.33666171711770637 0.041356127155785523 0.94071704511719767 0 0.77703180584696985 0.57649360336580191 0.25273839831040762 0
		 0.57180360364726901 1.0142148152335835 0.060001119762614838 1;
	setAttr ".wm[67]" -type "matrix" -0.53186507774956804 0.8160544075152022 -0.22621835258320183 0
		 -0.33666171711770637 0.041356127155785523 0.94071704511719767 0 0.77703180584696985 0.57649360336580191 0.25273839831040762 0
		 0.57180360364726901 1.0142148152335835 0.060001119762614366 1;
	setAttr ".wm[68]" -type "matrix" -0.31998431244120268 0.93455790837144059 -0.15560062882883371 0
		 -0.33666171711770637 0.041356127155785523 0.94071704511719767 0 0.88558959344545585 0.35339947176965664 0.30139655826508638 0
		 0.55805136958080859 1.0543792616817411 0.05331355669491953 1;
	setAttr ".wm[69]" -type "matrix" 0.052027759925012629 0.95351096687868353 -0.29683319935489549 0
		 -0.99863172036379955 0.048106325333105437 -0.020505329701894288 0 -0.0052725022923861553 0.29749389490378336 0.95470916158511498 0
		 0.51069736958080847 1.079639261681741 0.058088556694919975 1;
	setAttr ".wm[70]" -type "matrix" 0.052027759925012629 0.95351096687868353 -0.29683319935489549 0
		 -0.99863172064171257 0.048106341014057176 -0.020505279379018349 0 -0.0052724496543449899 0.29749389236809065 0.95470916266595296 0
		 0.5091851577577674 1.0519120969533617 0.066718509761858724 1;
	setAttr ".wm[71]" -type "matrix" 0.052152892620327934 0.88736572048753304 -0.45810714237498362 0
		 -0.99863172064171257 0.048106341014057176 -0.020505279379018349 0 0.0038421764021055382 0.45854973346179168 0.88866044112620124 0
		 0.5091851577577674 1.0519120969533617 0.066718509761858377 1;
	setAttr ".wm[72]" -type "matrix" 0.052027759925012629 0.95351096687868353 -0.29683319935489549 0
		 -0.99863172036379955 0.048106325333105437 -0.020505329701894288 0 -0.0052725022923861553 0.29749389490378336 0.95470916158511498 0
		 0.51069736958080847 1.079639261681741 0.058088556694919434 1;
	setAttr ".wm[73]" -type "matrix" -0.77020140754512911 0.59495272147322864 -0.22982830771491225 0
		 -0.2407882510503162 0.062439744370431635 0.96856713576245446 0 0.59060207413421051 0.80133172752272441 0.09516644626030013 0
		 0.51684936958080874 1.1248692616817413 0.0087440966949195974 1;
	setAttr ".wm[74]" -type "matrix" -0.77020140754512911 0.59495272147322864 -0.22982830771491225 0
		 -0.29595119604120484 -0.014175073773188468 0.95509787814930502 0 0.56498024866120933 0.80363569264631551 0.18699463128013766 0
		 0.53884676899401385 1.0563174975649157 0.01863197086114245 1;
	setAttr ".wm[75]" -type "matrix" 0.76242286913840851 -0.4960247526686955 0.41553677737923128 0
		 0.35494420561457446 -0.21635345693317737 -0.90950854453034291 0 0.54104156911959733 0.84092248537723335 0.011108288418149675 0
		 0.34778236958080866 1.2348592616817413 -0.083401743305080392 1;
	setAttr ".wm[76]" -type "matrix" -0.77020140754512889 0.59495272147322942 -0.22982830771491233 0
		 -0.18343552912296321 0.13848672288091071 0.97322804842497457 0 0.6108528451852222 0.79174028999243418 0.0024727983773991501 0
		 0.43231627134729195 1.1798656565183534 -0.037328250612202463 1;
	setAttr ".wm[77]" -type "matrix" -0.8302313574713035 0.54216366200546373 0.12951624095912284 0
		 0.10668056664112087 -0.07351128430683726 0.99157215964380963 0 0.54711529842665318 0.83705116610657948 0.0031930466845564143 0
		 0.14779836958080864 1.3653392616817412 -0.051884843305080301 1;
	setAttr ".wm[78]" -type "matrix" -0.83642929926626897 0.54655314632285534 0.040812811389628043 0
		 0.032417241653975873 -0.025000071283955004 0.99916170807299509 0 0.54711529842665318 0.83705116610657948 0.0031930466845564143 0
		 0.23715036958080871 1.3003292616817412 -0.045107343305080351 1;
	setAttr ".wm[79]" -type "matrix" -0.95128724650677166 0.13450615265011098 0.27741786087566422 0
		 0.27468561553524995 -0.038839183191062644 0.9607493588168935 0 0.14000138303454407 0.99015130800717321 3.1430042408913212e-07 0
		 0.03364389999999598 1.3814799999997545 -0.018594700000000523 1;
	setAttr ".wm[80]" -type "matrix" 2.0524845718774885e-07 0.98643019143286004 0.16418123348814512 0
		 -1.1891140467499624e-07 0.16418123348817143 -0.98643019143286992 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5822215587766349e-06 1.4381670781220091 -0.044697717562728986 1;
	setAttr ".wm[81]" -type "matrix" 2.0524845718774885e-07 0.98643019143286004 0.16418123348814512 0
		 -1.1891140467499624e-07 0.16418123348817143 -0.98643019143286992 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5985556361760812e-06 1.5166691394683611 -0.031631850991385942 1;
	setAttr ".wm[82]" -type "matrix" 2.0524845718774885e-07 0.98643019143286004 0.16418123348814512 0
		 -1.1891140467499624e-07 0.16418123348817143 -0.98643019143286992 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5985556362158342e-06 1.5166691394683607 -0.031631850991385907 1;
	setAttr ".wm[83]" -type "matrix" 2.0524845718774885e-07 0.98643019143286004 0.16418123348814512 0
		 -1.1891140467499624e-07 0.16418123348817143 -0.98643019143286992 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5985556361849043e-06 1.5166691394683605 -0.031631850991386268 1;
	setAttr ".wm[84]" -type "matrix" 0.99999999999997169 -1.8294025370402609e-07 -1.5099574467157432e-07 0
		 1.8280755541086927e-07 0.99999961424632022 -0.00087835481270495674 0 1.5115637275495145e-07 0.00087835481267739546 0.99999961424632544 0
		 2.6064137190837081e-06 1.5153479963982335 0.022010543712130341 1;
	setAttr ".wm[85]" -type "matrix" 0.99999999999985922 5.2934080083643703e-07 -3.2443835838722501e-08 0
		 -5.2934081530812633e-07 0.99999999999976041 -4.4594975956581215e-07 0 3.2443599762747184e-08 4.4594977692246147e-07 0.99999999999990008 0
		 -5.0470861566992686e-09 1.6389571162473386 0.015410465256876969 1;
	setAttr ".wm[86]" -type "matrix" 1.0568582976872687 -3.5541951639561768e-07 -0.00034001319497607062 0
		 1.5271573657106874e-07 0.99999983719263041 -0.00057062657602008468 0 0.0003217208263196034 0.0005706264973571525 0.99999978544053214 0
		 -1.0649309960185102e-08 1.5718599398415198 0.034623064171909364 1;
	setAttr ".wm[87]" -type "matrix" 4.9897501426369745e-07 0.26429268349309304 0.96444252159046284 0
		 3.6081489362519727e-07 0.96444252159047272 -0.26429268349328233 0 -0.99999999999981004 4.7986067121757821e-07 3.8587198466458628e-07 0
		 0.037394633549827007 1.5853041693576744 0.066242895541019253 1;
	setAttr ".wm[88]" -type "matrix" 5.3670199228378633e-07 0.98643019143262045 0.16418123348883606 0
		 -7.8171232920951636e-07 0.16418123348922337 -0.98643019143239197 0 -0.99999999999955003 4.010765544140389e-07 8.5922103783460098e-07 0
		 0.037394645184188592 1.5906377109435665 0.089761070220048977 1;
	setAttr ".wm[89]" -type "matrix" 3.3122999526578704e-07 -0.0014596460313448661 0.99999893471610923 0
		 1.5338851954763608e-07 0.99999893471615242 0.0014596460312941591 0 -0.99999999999993316 1.529048775003811e-07 3.3145353548494566e-07 0
		 0.037394627447692397 1.5853043523449499 0.066241781771236546 1;
	setAttr ".wm[90]" -type "matrix" 2.0524843795826051e-07 0.98643019143272537 0.16418123348895353 0
		 -3.0185166292151331e-07 0.16418123348901059 -0.98643019143269106 0 -0.99999999999993316 1.529048775003811e-07 3.3145353548494566e-07 0
		 0.037394634942685398 1.5853043523445618 0.088854281572148766 1;
	setAttr ".wm[91]" -type "matrix" 2.0240434167487047e-07 -0.52337901757124272 0.85209999645940582 0
		 3.0376608899069331e-07 0.85209999645941636 0.52337901757117689 0 -0.99999999999993305 1.5290489784190845e-07 3.3145353613947852e-07 0
		 0.037394627577046986 1.5853061668955626 0.066234586668639669 1;
	setAttr ".wm[92]" -type "matrix" 2.9406939411204389e-07 0.87541776193144427 0.48336708834472214 0
		 -2.1625111744477734e-07 0.48336708834478737 -0.87541776193143073 0 -0.99999999999993305 1.5290489784190845e-07 3.3145353613947852e-07 0
		 0.037394632247863123 1.5730289302469032 0.08599019365253259 1;
	setAttr ".wm[93]" -type "matrix" 0.99999999999987532 -1.2780078250255367e-07 -4.8228354135689726e-07 0
		 7.5222054094155647e-08 0.99420668564519554 -0.10748519069336789 0 4.9322621255369061e-07 0.10748519069331824 0.99420668564508141 0
		 -0.03075553150909285 1.5994467767280758 0.087398998492908081 1;
	setAttr ".wm[94]" -type "matrix" 0.9999998962649026 4.8529186383005928e-05 0.00045289634740355438 0
		 1.1663193898372998e-07 0.99428077541112725 -0.10679765750162283 0 -0.00045548893490355603 0.10679764647577966 0.99428067226365435 0
		 0.030753624257374754 1.5994467667161469 0.087397914578391467 1;
	setAttr ".wm[95]" -type "matrix" 7.9801690699825029e-08 -0.52037710835607287 0.85393656971637255 0
		 6.1056952441532197e-07 0.85393656971624166 0.52037710835593587 0 -0.99999999999980982 4.7986067213414536e-07 3.85871985774213e-07 0
		 -0.037394051335242109 1.5853069355249281 0.066236160959218568 1;
	setAttr ".wm[96]" -type "matrix" 9.9246835858038276e-07 0.87541776193109455 0.48336708834442593 0
		 -1.058503340734074e-07 0.48336708834475312 -0.87541776193146992 0 -0.99999999999950129 8.1765986140474898e-07 5.7238980351035724e-07 0
		 -0.037394049595057974 1.5730296977433582 0.085991765133232603 1;
	setAttr ".wm[97]" -type "matrix" 3.3082634453093394e-07 -0.0040837616643982864 0.99999166141051343 0
		 1.5425720441241031e-07 0.9999916614105564 0.0040837616643474659 0 -0.99999999999993316 1.5290490208435436e-07 3.3145353569294985e-07 0
		 -0.037394057584941499 1.5853051409816779 0.066243228932039516 1;
	setAttr ".wm[98]" -type "matrix" 2.0524846224309181e-07 0.98643019143272548 0.16418123348895317 0
		 -3.0185165909048514e-07 0.16418123348901023 -0.98643019143269117 0 -0.99999999999993316 1.5290490208435436e-07 3.3145353569294985e-07 0
		 -0.037391468301521825 1.5853051409816581 0.088855728733748848 1;
	setAttr ".wm[99]" -type "matrix" 3.6037353437772153e-07 0.26909782695394213 0.96311284880253567 0
		 5.8071245855506777e-08 0.96311284880259107 -0.26909782695397927 0 -0.99999999999993305 1.5290489792479507e-07 3.3145353547329049e-07 0
		 -0.037394057604635218 1.585304972546111 0.066244325212837338 1;
	setAttr ".wm[100]" -type "matrix" 2.0524845809018961e-07 0.9864301914327257 0.16418123348895247 0
		 -3.0185165947316118e-07 0.16418123348900959 -0.98643019143269117 0 -0.99999999999993305 1.5290489792479507e-07 3.3145353547329049e-07 0
		 -0.037394049078505631 1.5902536247981771 0.089684884952059438 1;
	setAttr ".wm[101]" -type "matrix" 2.0524845718774885e-07 0.98643019143286004 0.16418123348814512 0
		 -1.1891140467499624e-07 0.16418123348817143 -0.98643019143286992 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5822215587936124e-06 1.4381670781220088 -0.04469771756272891 1;
	setAttr ".wm[102]" -type "matrix" -1.4222654573100281e-07 0.9864301914328697 0.16418123348815328 0
		 -1.072394573588146e-06 0.16418123348791008 -0.98643019143233757 0 -0.99999999999941469 -3.1636362272553445e-07 1.0344914549251238e-06 0
		 0.056020199999995995 1.4260299999997543 -0.061728700000000601 1;
	setAttr ".wm[103]" -type "matrix" -1.4222654573100281e-07 0.9864301914328697 0.16418123348815328 0
		 -1.072394573588146e-06 0.16418123348791008 -0.98643019143233757 0 -0.99999999999941469 -3.1636362272553445e-07 1.0344914549251238e-06 0
		 0.056020199999995975 1.4260299999997539 -0.061728700000000566 1;
	setAttr ".wm[104]" -type "matrix" -1.4222654556009906e-07 -0.9864301914328697 -0.16418123348815405 0
		 1.1891140467499633e-07 -0.1641812334881711 0.98643019143287003 0 -0.99999999999998268 1.2077353735269701e-07 1.406487294837654e-07 0
		 -0.056015079779829155 1.426028211710433 -0.061728658521626636 1;
	setAttr ".wm[105]" -type "matrix" -1.4222654556009906e-07 -0.9864301914328697 -0.16418123348815405 0
		 1.1891140467499633e-07 -0.1641812334881711 0.98643019143287003 0 -0.99999999999998268 1.2077353735269701e-07 1.406487294837654e-07 0
		 -0.056015079779829127 1.4260282117104328 -0.061728658521626512 1;
	setAttr ".wm[106]" -type "matrix" -0.95128724650677121 -0.13450615265011126 -0.27741786087566511 0
		 0.27468561553525156 0.038839183191059695 -0.96074935881689294 0 0.14000138303454332 -0.99015130800717321 -3.1430042097759677e-07 0
		 -0.033638800000004049 1.3814799999997545 -0.018594700000000571 1;
	setAttr ".wm[107]" -type "matrix" -0.83023135747130361 -0.54216366200546362 -0.12951624095912245 0
		 0.10668056664112335 0.073511284306833208 -0.99157215964380951 0 0.5471152984266523 -0.83705116610657981 -0.0031930466845518347 0
		 -0.14780600000000405 1.3653399999997546 -0.051888600000000631 1;
	setAttr ".wm[108]" -type "matrix" 0.76242286913840907 0.49602475266869445 -0.41553677737923145 0
		 0.35494420561457268 0.21635345693318031 0.90950854453034269 0 0.54104156911959733 -0.84092248537723324 -0.011108288418146177 0
		 -0.3477900000000041 1.2348599999997543 -0.08340550000000034 1;
	setAttr ".wm[109]" -type "matrix" -0.77020140754513056 -0.5949527214732272 0.22982830771491336 0
		 -0.18343552912296365 -0.13848672288091177 -0.97322804842497446 0 0.61085284518521987 -0.79174028999243573 -0.0024727983773980746 0
		 -0.51633233034303516 1.1241899637035615 0.008738216080488595 1;
	setAttr ".wm[110]" -type "matrix" -0.091540753958193832 -0.9956665789547825 -0.016381511445700735 0
		 0.092256810880831985 0.0079001114213965995 -0.9957039063324139 0 0.99151851783557943 -0.092658792308175753 0.091133841119127715 0
		 -0.57296346572892531 1.0579511286687073 0.013705740192756869 1;
	setAttr ".wm[111]" -type "matrix" -0.43202589583183537 -0.90062652583081038 -0.047175060154975683 0
		 0.092256840430386469 0.0079001086599493949 -0.99570390361641337 0 0.89713003557148996 -0.43452209294014732 0.079675906159962701 0
		 -0.57691358164072459 1.0149858370204392 0.012999709208529133 1;
	setAttr ".wm[112]" -type "matrix" -0.43202589583183537 -0.90062652583081038 -0.047175060154975683 0
		 0.092256813693819814 0.0079001216097208012 -0.99570390599094072 0 0.8971300383209585 -0.43452209270470549 0.079675876485664959 0
		 -0.57691236306406968 1.0149879370101451 0.012999381160938862 1;
	setAttr ".wm[113]" -type "matrix" -0.091540753958193832 -0.9956665789547825 -0.016381511445700735 0
		 0.092256810880831985 0.0079001114213965995 -0.9957039063324139 0 0.99151851783557943 -0.092658792308175753 0.091133841119127715 0
		 -0.57296343118929438 1.0579475459868781 0.013706366850808517 1;
	setAttr ".wm[114]" -type "matrix" -0.3098235609056188 -0.92816552070076408 0.2061992417300374 0
		 -0.28115003918185932 -0.11773777488821874 -0.95241402332830594 0 0.9082752977901587 -0.35305322905569198 -0.22447583584329878 0
		 -0.55862353072580473 1.0561613290341447 0.056029239582745867 1;
	setAttr ".wm[115]" -type "matrix" -0.52771871288247951 -0.80995317091829599 0.25590783691215352 0
		 -0.2811500089181177 -0.11773778665195557 -0.95241403080784237 0 0.80154078658481365 -0.57455519709919645 -0.16558590799733486 0
		 -0.57193910473981413 1.0162716245584211 0.064891359284425604 1;
	setAttr ".wm[116]" -type "matrix" -0.52771871288247951 -0.80995317091829599 0.25590783691215352 0
		 -0.2811500356254647 -0.11773776750777047 -0.95241402529051766 0 0.80154077721689199 -0.57455520102222035 -0.16558593973177999 0
		 -0.57193918233082286 1.0162716182441485 0.064891395724124348 1;
	setAttr ".wm[117]" -type "matrix" -0.3098235609056188 -0.92816552070076408 0.2061992417300374 0
		 -0.28115003918185932 -0.11773777488821874 -0.95241402332830594 0 0.9082752977901587 -0.35305322905569198 -0.22447583584329878 0
		 -0.55862262101144355 1.0561635127266393 0.056029094874168857 1;
	setAttr ".wm[118]" -type "matrix" 0.053758183989068786 -0.92786976662078779 0.36900915143839286 0
		 -0.9970102025471117 -0.070416509691694662 -0.031814637822976638 0 0.055504177060515747 -0.36619559166369642 -0.92888108763980715 0
		 -0.51213194263216266 1.0828298345298475 0.06156029663875183 1;
	setAttr ".wm[119]" -type "matrix" 0.053758183989068786 -0.92786976662078779 0.36900915143839286 0
		 -0.9970101988483101 -0.0704165340949756 -0.031814699723629665 0 0.055504243501294209 -0.36619558697113808 -0.92888108551967696 0
		 -0.51056931473843403 1.0558481527345935 0.0722890234959052 1;
	setAttr ".wm[120]" -type "matrix" 0.053758183989068786 -0.92786976662078779 0.36900915143839286 0
		 -0.9970101988483101 -0.0704165340949756 -0.031814699723629665 0 0.055504243501294209 -0.36619558697113808 -0.92888108551967696 0
		 -0.51056936003239139 1.0558524567461063 0.07228871617478741 1;
	setAttr ".wm[121]" -type "matrix" 0.053758183989068786 -0.92786976662078779 0.36900915143839286 0
		 -0.9970102025471117 -0.070416509691694662 -0.031814637822976638 0 0.055504177060515747 -0.36619559166369642 -0.92888108763980715 0
		 -0.51213167788978931 1.0828311038626677 0.061560249897150518 1;
	setAttr ".wm[122]" -type "matrix" -0.77020140754513056 -0.5949527214732272 0.22982830771491336 0
		 -0.18343552912296365 -0.13848672288091177 -0.97322804842497446 0 0.61085284518521987 -0.79174028999243573 -0.0024727983773980746 0
		 -0.51633236466042642 1.1241858786765895 0.0087385126700874772 1;
	setAttr ".wm[123]" -type "matrix" -0.77020140754513056 -0.5949527214732272 0.22982830771491336 0
		 -0.24078825105031654 -0.062439744370432607 -0.96856713576245468 0 0.59060207413420884 -0.80133172752272563 -0.095166446260299256 0
		 -0.53338282678921234 1.0491025734840653 0.022636575730605804 1;
	setAttr ".wm[124]" -type "matrix" 0.76242286913840907 0.49602475266869445 -0.41553677737923145 0
		 0.35494422173887918 0.21635343187171946 0.90950854419928917 0 0.54104155854142799 -0.84092249182507295 -0.011108315523632221 0
		 -0.34778997892904473 1.2348596782347583 -0.083405545334786765 1;
	setAttr ".wm[125]" -type "matrix" -0.77020140754513022 -0.59495272147322709 0.22982830771491417 0
		 -0.18343552912296432 -0.13848672288091221 -0.97322804842497412 0 0.61085284518521987 -0.79174028999243573 -0.0024727983773981683 0
		 -0.43232287319285606 1.1798637515723653 -0.037333275344855435 1;
	setAttr ".wm[126]" -type "matrix" -0.8364292992662693 -0.5465531463228549 -0.040812811389626363 0
		 0.032417241653977233 0.025000071283950265 -0.99916170807299498 0 0.5471152984266523 -0.83705116610657981 -0.0031930466845518347 0
		 -0.23715778239681656 1.3003292209239716 -0.045111110764805784 1;
	setAttr ".wm[127]" -type "matrix" -0.83023135747130361 -0.54216366200546362 -0.12951624095912245 0
		 0.10668056664112335 0.073511284306833208 -0.99157215964380951 0 0.5471152984266523 -0.83705116610657981 -0.0031930466845518347 0
		 -0.14780618682905652 1.3653376289374015 -0.051888603476920425 1;
	setAttr ".wm[128]" -type "matrix" -0.95128724650677121 -0.13450615265011126 -0.27741786087566511 0
		 0.27468561553525156 0.038839183191059695 -0.96074935881689294 0 0.14000138303454332 -0.99015130800717321 -3.1430042097759677e-07 0
		 -0.033638783081862959 1.3814801960668115 -0.018594688263005834 1;
	setAttr ".wm[129]" -type "matrix" 1.5275907850020733e-07 0.98365281271709404 -0.18007538430814429 0
		 -1.8147042534666462e-07 -0.1800753843081162 -0.98365281271709437 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5489478007930202e-06 1.2239087820050647 -0.0054738759063186742 1;
	setAttr ".wm[130]" -type "matrix" 0.64488329067583539 0.51239145799056396 -0.56708071311358332 0
		 -0.38478244053910143 0.85875199783074951 0.33835998533288325 0 0.66035446152795763 1.6780193053091212e-15 0.75095404995253934 0
		 0.13421830488367339 1.3309752024592205 -0.032958320701525282 1;
	setAttr ".wm[131]" -type "matrix" 0.85815140097985432 -0.51339670138822557 4.5935470038838133e-08 0
		 -1.50995803027687e-07 -1.6291843958903164e-07 0.99999999999997535 0 -0.51339670138820581 -0.85815140097983977 -2.1732943444874309e-07 0
		 0.13465899999999595 1.3308999999997546 -0.12388457151642093 1;
	setAttr ".wm[132]" -type "matrix" 0.85815140097985432 -0.51339670138822557 4.5935470038838133e-08 0
		 -1.50995803027687e-07 -1.6291843958903164e-07 0.99999999999997535 0 -0.51339670138820581 -0.85815140097983977 -2.1732943444874309e-07 0
		 0.13465899999999598 1.3308999999997551 -0.12388457151642093 1;
	setAttr ".wm[133]" -type "matrix" 0.36878069380942413 0.65773844472574527 -0.65679596390598904 0
		 -0.32202110777895049 0.75324639948011518 0.57351745205796478 0 0.871953671944936 9.2458045470176684e-16 0.489588392409116 0
		 0.072996731020901054 1.3543694639949297 -0.034702928221703969 1;
	setAttr ".wm[134]" -type "matrix" 0.9493225870886921 -0.31430339744142716 9.2137906915201739e-08 0
		 -1.5099580369382082e-07 -1.6291844200630652e-07 0.99999999999997524 0 -0.31430339744140456 -0.94932258708868256 -2.021206508273643e-07 0
		 0.072958899999995788 1.354029999999754 -0.1354086492507463 1;
	setAttr ".wm[135]" -type "matrix" 0.9493225870886921 -0.31430339744142716 9.2137906915201739e-08 0
		 -1.5099580369382082e-07 -1.6291844200630652e-07 0.99999999999997524 0 -0.31430339744140456 -0.94932258708868256 -2.021206508273643e-07 0
		 0.072958899999995927 1.3540299999997545 -0.13540864925074636 1;
	setAttr ".wm[136]" -type "matrix" -3.1902974257692068e-06 0.72844406210287393 -0.68510528269521176 0
		 3.3921147812943603e-06 0.68510528270263971 0.72844406209497603 0 0.99999999998915767 -2.5399391762075348e-12 -4.656655490314222e-06 0
		 2.416590000021889e-06 1.3655121185043171 -0.033897900000000515 1;
	setAttr ".wm[137]" -type "matrix" 0.9999902452996966 0.0044169339399481545 -1.5027472902858586e-07 0
		 1.5099571497105406e-07 -1.628987836174068e-07 0.99999999999997524 0 0.0044169339399234122 -0.9999902452996946 -1.6356413279893108e-07 0
		 1.9284248075049836e-06 1.3655933007132075 -0.13872889317471038 1;
	setAttr ".wm[138]" -type "matrix" 0.9999902452996966 0.0044169339399481545 -1.5027472902858586e-07 0
		 1.5099571497105406e-07 -1.628987836174068e-07 0.99999999999997524 0 0.0044169339399234122 -0.9999902452996946 -1.6356413279893108e-07 0
		 1.9284248074066325e-06 1.3655933007132082 -0.13872889317471057 1;
	setAttr ".wm[139]" -type "matrix" -0.36878046929314118 0.657739034582416 -0.65679549926481806 0
		 0.32202142071368084 0.75324588441397489 0.57351795282706852 0 0.87195365133100611 -9.2327332404547584e-17 -0.48958842912238748 0
		 -0.072836535178395126 1.354157607293246 -0.035115723017494445 1;
	setAttr ".wm[140]" -type "matrix" 0.94932258708869321 0.31430339744142555 -9.2137906138045622e-08 0
		 1.5099580308319815e-07 -1.6291844407910239e-07 0.99999999999997546 0 0.31430339744140268 -0.94932258708868344 -2.0212065302005477e-07 0
		 -0.072953762686135598 1.3540301530580732 -0.13540856498835577 1;
	setAttr ".wm[141]" -type "matrix" 0.94932258708869321 0.31430339744142555 -9.2137906138045622e-08 0
		 1.5099580308319815e-07 -1.6291844407910239e-07 0.99999999999997546 0 0.31430339744140268 -0.94932258708868344 -2.0212065302005477e-07 0
		 -0.07295376268613557 1.3540301530580727 -0.1354085649883556 1;
	setAttr ".wm[142]" -type "matrix" -0.64488385468624998 0.51239442175333072 -0.56707739376655908 0
		 0.38478579509330724 0.85875022943581769 0.33836065867405729 0 0.66035195605026809 -1.3431728346389521e-15 -0.75095625314700254 0
		 -0.13428238196972508 1.3308362720778906 -0.033005861575021694 1;
	setAttr ".wm[143]" -type "matrix" 0.85815140097985476 0.51339670138822535 -4.593546942821547e-08 0
		 1.5099580319422046e-07 -1.6291844167235095e-07 0.99999999999997535 0 0.51339670138820526 -0.85815140097984011 -2.1732943650265568e-07 0
		 -0.13465430196281086 1.330900785035082 -0.12388411826074512 1;
	setAttr ".wm[144]" -type "matrix" 0.85815140097985476 0.51339670138822535 -4.593546942821547e-08 0
		 1.5099580319422046e-07 -1.6291844167235095e-07 0.99999999999997535 0 0.51339670138820526 -0.85815140097984011 -2.1732943650265568e-07 0
		 -0.13465430196281095 1.3309007850350818 -0.12388411826074487 1;
	setAttr ".wm[145]" -type "matrix" 1.6945472294488251e-07 0.99638667242739731 -0.084932908869468166 0
		 -1.6598779536883122e-07 -0.084932908869440243 -0.99638667242740042 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5287549790691074e-06 1.1051762831611345 0.0046469918784506755 1;
	setAttr ".wm[146]" -type "matrix" -2.0321642794047193e-07 -0.33237831388487676 -0.9431461479850326 0
		 -7.1616140755350792e-08 0.94314614798505447 -0.33237831388486894 0 0.9999999999999768 -2.4626995971589494e-13 -2.154664434523828e-07 0
		 2.5216100000122527e-06 1.071298772891172 -0.028511800000000104 1;
	setAttr ".wm[147]" -type "matrix" 0.99999024529969682 0.0044169339399489508 -1.5027472947095605e-07 0
		 1.5099571451939635e-07 -1.6289855492289195e-07 0.99999999999997524 0 0.0044169339399242908 -0.99999024529969482 -1.6356390424985462e-07 0
		 2.5080558047947612e-06 1.0713215563035856 -0.091418094035073699 1;
	setAttr ".wm[148]" -type "matrix" 0.99999024529969682 0.0044169339399489508 -1.5027472947095605e-07 0
		 1.5099571451939635e-07 -1.6289855492289195e-07 0.99999999999997524 0 0.0044169339399242908 -0.99999024529969482 -1.6356390424985462e-07 0
		 2.5080558047211494e-06 1.0713215563035854 -0.091418094035073671 1;
	setAttr ".wm[149]" -type "matrix" 1.9099946721416929e-07 0.99847407184529768 0.055222530299095601 0
		 -1.4066291218240629e-07 0.055222530299122809 -0.99847407184530457 0 -0.99999999999997169 1.8294025370402609e-07 1.5099574467157432e-07 0
		 2.5074034344280171e-06 0.99355836160202016 -0.0015262521035675177 1;
	setAttr ".wm[150]" -type "matrix" 0.99999999999997169 -1.8294025414811405e-07 -1.5099574884878858e-07 0
		 -1.5099569455835847e-07 2.9607675621607326e-07 -0.9999999999999446 0 1.8294029896234176e-07 0.99999999999993927 2.9607672867303669e-07 0
		 2.5013986340984517e-06 0.95947478651147489 -6.839190118407554e-11 1;
	setAttr ".wm[151]" -type "matrix" 1.1816616250598557 0.088179221679685671 0.21339966542288305 0
		 -0.086775535406455329 1.2007762544877787 -0.015671043071797706 0 -0.21397429470279047 -2.1141074260575519e-14 1.1848435296207585 0
		 0.041000000000000009 0.97198104858374035 0.0070000002160668104 1;
	setAttr ".wm[152]" -type "matrix" 0.04449215684320218 -0.5465060628451065 1.0719098654880987 0
		 -1.1838393937737537 -0.21147155413577004 -0.058679298040503203 0 0.21490445832174798 -1.0517842428666997 -0.54516526735339033 0
		 0.19382420894779609 0.9720110903288971 0.035085210182807497 1;
	setAttr ".wm[153]" -type "matrix" 0.035056948276990178 -0.43061150857984676 0.84459579796148243 0
		 -0.81862042069643426 -0.44002228953362538 -0.19036363731153894 0 0.47815158692029547 -0.72176965596392006 -0.38783623674616574 0
		 0.19382420894779603 0.9720110903288971 0.035085210182807434 1;
	setAttr ".wm[154]" -type "matrix" 0.66591426874672666 0.39440125021529993 0.63325021950893967 0
		 -0.2858052729283112 0.91893832972001344 -0.27178611468904179 0 -0.68911068243489404 1.7480064878369714e-15 0.72465610281989212 0
		 0.026000000000000013 1.0197770595548095 0.02456020005047312 1;
	setAttr ".wm[155]" -type "matrix" -0.82110333458844986 -0.019860369737398135 0.57043393977008561 0
		 -0.56740125680282394 -0.080172191954390098 -0.81952927550869326 0 0.062009093738770803 -0.99658315526157781 0.054560855405446383 0
		 0.10189039090721541 1.0198199999997546 0.096890143227446851 1;
	setAttr ".wm[156]" -type "matrix" -0.82110333458844986 -0.019860369737398135 0.57043393977008561 0
		 -0.56740125680282394 -0.080172191954390098 -0.81952927550869326 0 0.062009093738770803 -0.99658315526157781 0.054560855405446383 0
		 0.10189039090721538 1.0198199999997546 0.096890143227446823 1;
	setAttr ".wm[157]" -type "matrix" -0.66632864690864668 0.39418420331932102 0.63294940410936806 0
		 0.28579677618568189 0.91903145422423482 -0.27147999717909072 0 -0.68871353771416666 -1.1517261037934004e-15 -0.72503355989170348 0
		 -0.025852899999999856 1.0197770042612919 0.024560199999999775 1;
	setAttr ".wm[158]" -type "matrix" -0.82110333385492562 0.01986038152626456 -0.57043394041550244 0
		 0.56740125699937205 -0.080172188795573765 -0.81952927568163136 0 -0.06200910165337533 -0.99658315528076125 0.054560846060002381 0
		 -0.10199747293257674 1.0198155740653088 0.096890363516415501 1;
	setAttr ".wm[159]" -type "matrix" -0.82110333385492562 0.01986038152626456 -0.57043394041550244 0
		 0.56740125699937205 -0.080172188795573765 -0.81952927568163136 0 -0.06200910165337533 -0.99658315528076125 0.054560846060002381 0
		 -0.10199747293257684 1.0198155740653085 0.096890363516415445 1;
	setAttr ".wm[160]" -type "matrix" -1.1816805243057205 0.088142681594272757 0.21331009032781839 0
		 0.086740770485195434 1.2007789372566062 -0.015657939017125273 0 -0.21388400054685247 -2.2230770924031625e-15 -1.1848598325489001 0
		 -0.040999999999999988 0.97198107065914696 0.0069999999999999863 1;
	setAttr ".wm[161]" -type "matrix" 0.044492150656783053 0.54650603256756902 -1.0719098811816798 0
		 1.1838393921161081 -0.21147156224861194 -0.058679302245586651 0 -0.21490446873397384 -1.0517842569677116 -0.54516523604388245 0
		 -0.19390620299390218 0.9720111991307343 0.035085188528246491 1;
	setAttr ".wm[162]" -type "matrix" 0.035056943402491145 0.43061148472310118 -0.84459581032701159 0
		 0.93278904153685294 -0.16662594366756556 -0.046235503282140961 0 -0.16933085243432192 -0.82873811725994628 -0.42955502359116504 0
		 -0.19390620299390232 0.9720111991307343 0.035085188528246318 1;
	setAttr ".wm[163]" -type "matrix" 1.8281616120116629e-07 0.40989174600250688 0.7141294105609346 0
		 -1.0493172329079944e-07 0.7141294105609578 -0.40989174600249345 0 -0.82340273163809719 7.0208347859636457e-15 2.1078997935354176e-07 0
		 2.5082400000155441e-06 1.0379583625682678 0.026716399999999876 1;
	setAttr ".wm[164]" -type "matrix" -0.82339469959124834 -0.0036369154716206615 1.2325224849225581e-07 0
		 -1.2384597721269956e-07 1.3414747501716488e-07 -0.82340273163810418 0 0.0036369154716005101 -0.82339469959124656 -1.3469318627770495e-07 0
		 2.5314561236099357e-06 1.0380177873880303 0.11741125331070801 1;
	setAttr ".wm[165]" -type "matrix" -1.0225694853327321 -0.0045166659244466655 1.5306630995972423e-07 0
		 -1.5380365849062054e-07 1.665970336645167e-07 -1.0225794602888785 0 0.0045166659244216395 -1.0225694853327298 -1.6727474956808976e-07 0
		 2.5314561235742265e-06 1.0380177873880303 0.11741125331070801 1;
	setAttr -s 166 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 -1.5707963267948961 0 -1.5099582926491247e-07 0 1.779480544559006e-06
		 1.0808874811777249 -1.0013355343887649 0 0 0 6.3291529169581893e-14 -1.7468560070676986e-09
		 -7.4999743304715594e-08 -3.6734198463196485e-40 6.6174449004242214e-24 0 6.3291529169581893e-14
		 -1.746856007067692e-09 -7.4999743304715594e-08 -1.632095015644216e-07 -1.080887479431113
		 1.0013356093885082 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 1.5707971257432236 -1.570795927320733
		 0 0 -6.1555105457244963e-10 0 -1.4558378780933287e-22 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 2.3293406049493259e-21
		 0 0 0 0 -1.4791141972893971e-31 -1.0339757656912846e-25 8.3819031715393066e-09 0
		 0 0 -1.4791141972893971e-31 -1.0339757656912846e-25 8.3819031715393066e-09 0 0 0 
		0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 -1.5707960307184621 -6.4795257821717852e-07
		 -1.5707959592651581 0 0.95947471151231767 -3.575810918569374e-07 1.6787493686069368e-09 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.0099992603935610564
		 -0.0024280500411871819 -0.039748505825889291 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-6.6579156699879211e-08 -1.5972224741590568e-08 -1.0634172539160488e-15 0.99999999999999767 1
		 1 1 no;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.096277245112815796 -3.7843155263530409e-08
		 -2.6360021054827598e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.64796856537911884 -0.0063928751973328368 -0.75931204125087282 0.059507087297822919 1
		 1 1 no;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.3996815692317317 -3.1732561697028761e-05
		 -0.00021920973687755696 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.0023605573256060596 0.022237696361804025 0.0068901503100454384 0.99972618174094929 1
		 1 1 no;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 -0.25672047967584594 -0.32553881208198238
		 0.011257373675363426 0 -0.44246250177823987 3.7180286648064165e-08 2.6388941937183219e-07 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.12742981171544321 -0.010311062984590336 -0.50528538288793812 0.85342955591313097 1
		 1 1 no;
	setAttr ".xm[8]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.12751269912385643 -4.6917746899383106e-07
		 -1.1869053769819615e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.6499506466405458 0.18681352155558761 -0.17963412510689086 0.71442035678766758 1
		 1 1 no;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.8388068845354155e-16
		 1.1102230246251565e-16 3.1571967262777889e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.5673907444456745e-16
		 1.2490009027033011e-16 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.37446369424087517
		 -0.015502596047509101 0.0047584755073381557 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.2204460492503131e-16
		 -3.4694469519536142e-17 -1.1102230246251565e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 -1.3877787807814457e-17
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.027464961621785799
		 -0.043268472433213717 -0.0079358599029700494 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.54733883851457632 -0.49379465989442539 -0.4924294250889632 0.46270972652389353 1
		 1 1 no;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.5511151231257827e-17
		 1.1102230246251565e-16 -1.3877787807814457e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[16]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.076367245661115857
		 0.040546482368656836 -0.021307844703341405 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.52418485570955764 0.83986246277567278 -0.066153559087255648 0.12443868886010048 1
		 1 1 no;
	setAttr ".xm[17]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.084056137148565413
		 0.051000019430109123 -1.5427629687647659e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.43427451383049798 -0.87808184006932422 0.13299428499662014 0.15063349207925811 1
		 1 1 no;
	setAttr ".xm[18]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.34512469907573418
		 0.0012009657881922875 -0.0022663515503676401 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[19]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.3306690738754696e-16
		 0 1.1102230246251565e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.0536712349851209e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[20]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 2.7755575615628914e-17 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[21]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.068000000000000005
		 -0.033324899023157807 -0.01 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.062310513775560836 -0.051479368612188853 -0.86830669952917072 0.48939835515975588 1
		 1 1 no;
	setAttr ".xm[22]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.081615722354875853
		 0.041675627435646345 3.1515556742953144e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.063733856472236103 0.00309328495553398 0.89560178729127116 0.44025659078319401 1
		 1 1 no;
	setAttr ".xm[23]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.3348230050919665 0.011165516206969039
		 -0.0040612903992303662 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[24]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.2204460492503131e-16
		 5.5511151231257827e-17 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[25]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.1102230246251565e-16
		 5.5511151231257827e-17 -1.9428902930940239e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[26]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.0099992589811724823
		 -0.0024280499304019237 -0.039748711508191703 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.99999999999999722 -2.1287787101427752e-15 3.1944449483168973e-08 6.6640018675682264e-08 1
		 1 1 no;
	setAttr ".xm[27]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.096276874044815899
		 1.7966384643040845e-09 -4.8721512380112131e-09 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.64796866693523592 -0.0063929649567354696 -0.75931194477487995 0.059507202853309377 1
		 1 1 no;
	setAttr ".xm[28]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.3996819458452584 3.1626161781803108e-05
		 0.00021886618967276172 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.0023605573256478131 0.022237696361805014 0.0068901503100446022 0.99972618174094918 1
		 1 1 no;
	setAttr ".xm[29]" -type "matrix" "xform" 1 1 1 -0.25672047967584594 -0.32553881208198238
		 0.011257373675363426 0 0.44246220003967873 4.9786316812239217e-08 -1.9721412169992902e-08 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.12742981171540757 -0.010311062984613227 -0.50528538288793734 0.85342955591313674 1
		 1 1 no;
	setAttr ".xm[30]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.12751294480759978 4.3471307167516904e-07
		 4.8551875209135176e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.6499506466405458 0.18681352155558759 -0.1796341251068915 0.71442035678766735 1
		 1 1 no;
	setAttr ".xm[31]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.0408340855860843e-17
		 1.1102230246251565e-16 -5.7939764097625357e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[32]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.7061686225238191e-16
		 -4.163336342344337e-16 -1.1102230246251565e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[33]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.37446389924853796 0.015502639262867268
		 -0.004758121261067394 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[34]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1102230246251565e-16
		 4.163336342344337e-17 5.5511151231257827e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[35]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.2204460492503131e-16
		 6.9388939039072284e-18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[36]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.027464049584964512
		 0.043267933238540585 0.0079306033493262151 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.46270926261133005 -0.49242986100249925 0.49379517553612884 0.54733837331579649 1
		 1 1 no;
	setAttr ".xm[37]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 2.2204460492503131e-16
		 3.4694469519536142e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[38]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.075999999999999998
		 -0.040587032252631439 0.021358018984509369 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.83986236814211623 0.52418532343544899 -0.12443807534314749 -0.066152208417279423 1
		 1 1 no;
	setAttr ".xm[39]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.084161441991012664
		 0.050653734837815434 8.9938936231839794e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.87808187924087511 0.43427506678181416 -0.15063280188955658 0.13299300250526661 1
		 1 1 no;
	setAttr ".xm[40]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.34512464929854603 -0.0012010830610064693
		 0.0022664515878428049 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1.290478410243088e-08 0 0 0.99999999999999989 1
		 1 1 no;
	setAttr ".xm[41]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 5.5511151231257827e-17
		 -1.1102230246251565e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[42]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.1102230246251565e-16
		 0 -5.5511151231257827e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[43]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.068000000000000005
		 0.032798812384837776 0.01 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.051480272226639631 -0.06230992417752805 0.48939774437780215 0.86830703251694397 1
		 1 1 no;
	setAttr ".xm[44]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.0820222677758361 0.042018016041274753
		 -4.1494585545365226e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.0030941523627952168 0.063733184646246707 -0.44025601140112769 0.89560211691418712 1
		 1 1 no;
	setAttr ".xm[45]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.33482362779094299 -0.011165506473845288
		 0.0040615541651473908 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[46]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 2.7755575615628914e-17 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[47]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1102230246251565e-16
		 0 2.7755575615628914e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[48]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0.0015262621265289896
		 0.034083574638656744 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.019531460548441737 -0.70683698406976769 -0.019531460548444679 0.70683698406976725 1
		 1 1 no;
	setAttr ".xm[49]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.061115573774179532
		 -0.028953674733701622 1.2736977869334993e-10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.02183919728137243 0.99976149628904254 1 1 1 no;
	setAttr ".xm[50]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.2204460492503131e-16
		 -3.4694469519536142e-18 -4.5003707520568231e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[51]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.11178850278288222 9.0205620750793969e-17
		 -1.4893295608277637e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.070085491303234951 0.99754098858582452 1
		 1 1 no;
	setAttr ".xm[52]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.11916307417334115 1.2699880869160296e-09
		 -7.621089115076511e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.047995421176715014 0.9988475557091131 1
		 1 1 no;
	setAttr ".xm[53]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.048247482426039712
		 -0.084855629795413334 0.068297627635209135 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.078400753954303543 0 0 0.99692192361257492 1 1 1 no;
	setAttr ".xm[54]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.2204460492503131e-16
		 -1.1102230246251565e-16 -1.5612511283791264e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.11019009386523275 0.99391053078935188 1 1 1 no;
	setAttr ".xm[55]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.048249499064359824
		 -0.084855990067367271 -0.068297628282795425 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.5228887479247398e-07 0.078400573042454444 -0.99692193783996519 1.1976427055460339e-08 1
		 1 1 no;
	setAttr ".xm[56]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.2204460492503131e-16
		 -1.1102230246251565e-16 -1.1449174941446927e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[57]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.15735811436386626 -0.015468368216285583
		 -0.033641324207264262 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.73491532882595734 0.17291633932227338 -0.65492320047377461 0.032787200752847079 1
		 1 1 no;
	setAttr ".xm[58]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.11999999999999994
		 -6.9388939039072284e-18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.045901281053139981 -0.21258167647205312 -0.074077975288272369 0.97324948333056005 1
		 1 1 no;
	setAttr ".xm[59]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.24085645282569884
		 -0.00032512178276389303 9.5234753917150528e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.0029722823104971598 0.0044494523190715353 0.96126365096311006 0.27557859359717862 1
		 1 1 no;
	setAttr ".xm[60]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.22174829516515557 -1.3600842065086827e-06
		 2.7933669533020122e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.043611065060323848 0.029503159499579643 -0.9940049509360569 0.095821689081616077 1
		 1 1 no;
	setAttr ".xm[61]" -type "matrix" "xform" 1 1 1 0.0099309234438477341 0.14748032179352083
		 -0.10630800473897462 0 -0.084168033016549321 -0.014726827678484301 -0.017838380597151593 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.065880761515552722 -0.46207410206868255 0.16911031616555094 0.86807197306786665 1
		 1 1 no;
	setAttr ".xm[62]" -type "matrix" "xform" 1 1 1 0 0.35672784581512101 0 0 -0.043152267392662869
		 8.5787891901389912e-07 -1.5564560917891157e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[63]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.2204460492503131e-16
		 -4.0245584642661925e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[64]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.2204460492503131e-16
		 -4.4408920985006262e-16 -1.1102230246251565e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[65]" -type "matrix" "xform" 1 1 1 0.074333572842438494 0.20799088696016424
		 0.062674773439116371 0 -0.083915379297889447 0.028846179114232463 -0.027910369694658321 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.072684736018697668 -0.38267119719362891 -0.052370422405550961 0.91953087106706277 1
		 1 1 no;
	setAttr ".xm[66]" -type "matrix" "xform" 1 1 1 0 0.25350907385217636 0 0 -0.042977089244439881
		 2.0787860585680384e-07 3.497089676729459e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[67]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.1102230246251565e-16
		 -4.7184478546569153e-16 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[68]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1102230246251565e-16
		 -4.0245584642661925e-16 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[69]" -type "matrix" "xform" 1 1 1 0 0 0.047315876021566269 0 -0.033512186269922473
		 0.046450601970531982 -0.03518168109509312 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.50465587702149439 -0.28680242983121218 -0.37327491134516266 0.72369375608114783 1
		 1 1 no;
	setAttr ".xm[70]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.029078489221788351
		 -6.6934553949460351e-07 -1.5938323247866037e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		2.6355081700346636e-08 0 0 0.99999999999999967 1 1 1 no;
	setAttr ".xm[71]" -type "matrix" "xform" 1 1 1 7.045937527079172e-17 0.1745329251994335
		 2.0785515704883561e-16 0 0 0 -3.8857805861880479e-16 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[72]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.2204460492503131e-16
		 0 -4.9960036108132044e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[73]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.7755575615628914e-16
		 -3.6082248300317588e-16 2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[74]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.059999999999999998
		 3.4694469519536142e-17 -0.041000000000000002 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.047681762131597978 0 0 0.99886257791551369 1 1 1 no;
	setAttr ".xm[75]" -type "matrix" "xform" 1 1 1 0 0 0 0 -5.5511151231257827e-17
		 9.7144514654701197e-17 -4.4408920985006262e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[76]" -type "matrix" "xform" 1 1 1 0.028117437339260407 -0.081134128963893437
		 -2.9466553759472704 0 0.110874 -1.3600842065641938e-06 2.7933669530799676e-06 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[77]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.2204460492503131e-16
		 -2.7755575615628914e-17 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[78]" -type "matrix" "xform" 1 1 1 4.2687207031454291e-17 -2.039322072584867e-16
		 -0.089057403449433858 0 -0.10855109559665099 0.021031470895290796 -0.0055092092896660283 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[79]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.7755575615628914e-17
		 2.7755575615628914e-17 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[80]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.21781902398372943 -2.8435689636285844e-09
		 7.5886162859226808e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.1721339106110952 0.98507355908974203 1
		 1 1 no;
	setAttr ".xm[81]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.079581973492034441
		 0 -1.20249879389904e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[82]" -type "matrix" "xform" 1 1 1 0 0 0 0 -4.4408920985006262e-16
		 -1.1102230246251565e-16 -3.9752950280538824e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[83]" -type "matrix" "xform" 1 1 1 0 0 0 0 -6.6613381480000004e-16
		 2.2204460490000001e-16 -8.823118695e-18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 no;
	setAttr ".xm[84]" -type "matrix" "xform" 1 0.99999999999999989 0.99999999999999967 0
		 0 0 0 0.0075038591181066927 -0.053131384575175966 1.7148054962221222e-16 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.45687864749277862 0.53968685500498281 -0.45687864749277862 0.53968685500498281 1
		 1 1 yes;
	setAttr ".xm[85]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.12835201785126871 -0.026326570153564599
		 2.6330773054109973e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.45711566647316065 0.53948605930893612 -0.4571153363994116 0.53948644886092001 1
		 1 1 yes;
	setAttr ".xm[86]" -type "matrix" "xform" 1.0568583523819695 1 1 0 0 0 0 0.065319685473054445
		 -0.056294554965123034 2.6293057754101307e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.45703515529441274 0.53970329968244635 -0.45688819398686881 0.53952978910557747 1
		 1 1 yes;
	setAttr ".xm[87]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.035373202950510302
		 0.01342618992197675 0.031639526854205846 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.094098733603052709 -0.70093230463048295 0.094068272194658409 0.70070713770163162 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[88]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.024091543708911645
		 -0.0010717872006749118 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.0210123054151545e-07 1.2931225159662134e-07 0.538957491275314 0.84233296421199277 1
		 1 1 yes;
	setAttr ".xm[89]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.035373197515654216
		 0.013426373544768611 0.031638413187116313 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.00071792517399604794 -0.70722003593382909 -0.00071769447758879279 0.70699277950473793 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[90]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.022612475712183513
		 3.3006245205191576e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.64701575727517069 0.76247662904356439 1
		 1 1 yes;
	setAttr ".xm[91]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.035373199827749953
		 0.013428192200802602 0.031631219121535492 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.19251391232239953 -0.68051384130311787 -0.19245205035293939 0.68029516658002809 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[92]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.023259400696694743
		 -0.00012176313010092699 4.8572257327350599e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.72329046514415796 0.69054391824962702 1 1 1 yes;
	setAttr ".xm[93]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.029116964999142167
		 0.027556712347665657 0.052781770085943175 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.053535699141700727 -0.00016038957309533197 -8.5862862346796881e-06 0.99856592327140326 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[94]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.029083031995087518
		 0.027556712347664991 0.052800474942365477 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.053190435502520103 -0.00038806193064006006 3.5756086110283537e-06 0.99858431139599091 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[95]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.035391889344317085
		 0.013428948510302741 0.031608732774797865 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.19131608057274377 -0.68085154377043255 -0.19125483647084457 0.68063273517089429 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[96]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.023258826356405304
		 -0.00020361814288527569 -8.4134921252143613e-12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-1.3931411767861683e-07 1.3347611683999868e-07 0.7220742794970969 0.69181553530454276 1
		 1 1 yes;
	setAttr ".xm[97]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.035391897408792908
		 0.01342714993417049 0.03161579972007772 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.0016458416964825751 -0.70721848522780562 -0.0016453128255717875 0.70699122929701486 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[98]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.022612311246212907
		 9.2344060204752054e-05 -2.5817884266726709e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.64801561761706972 0.76162704739548726 1 1 1 yes;
	setAttr ".xm[99]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.03539189776109488
		 0.013426980873064043 0.031616895904520201 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.095845656477610286 -0.70069558638340079 0.095814857658956309 0.70047042650563918 0.94620059324523398
		 1 1 yes;
	setAttr ".xm[100]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.023907575835352968
		 -0.0015416931201883699 -2.7755575615628914e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.53685599723676314 0.8436738932970016 1 1 1 yes;
	setAttr ".xm[101]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.2204460492503131e-16
		 -1.1102230246251565e-16 -1.6977504878291569e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[102]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.20894722221534301
		 0.018938149775890423 -0.05601762257032579 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		4.3971941382080326e-07 -2.5320761219337227e-07 -0.17213391061097427 0.98507355908963234 1
		 1 1 no;
	setAttr ".xm[103]" -type "matrix" "xform" 1 1 1 0 0 0 0 -4.4408920985006262e-16
		 -1.1102230246251565e-16 2.0816681711721685e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[104]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.20894543857588199
		 0.018938451333547879 0.056017657209175342 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-3.1040609393844762e-08 5.4241040513272183e-09 0.98507355908974159 0.17213391061109498 1
		 1 1 no;
	setAttr ".xm[105]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.2204460492503131e-16
		 1.1102230246251565e-16 -2.7755575615628914e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[106]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.15735810408582296
		 -0.015468356006465345 0.033641375792733887 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.17291646318000223 -0.73491542292149381 0.032787307703704416 0.65492305682956631 1
		 1 1 no;
	setAttr ".xm[107]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.12001305315136901
		 1.4105487395471572e-07 -2.5133216587924778e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.045901281053139328 -0.21258167647205317 -0.074077975288272202 0.97324948333056005 1
		 1 1 no;
	setAttr ".xm[108]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.24085645282569906
		 0.00032512178276364323 -9.5234753916484394e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.0029722823104965579 0.0044494523190719941 0.96126365096311006 0.27557859359717862 1
		 1 1 no;
	setAttr ".xm[109]" -type "matrix" "xform" 1 1 1 0.095399696914010054 0 0 0 -0.22168470728889489
		 3.8528612344740365e-05 0.00085295613297398098 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.043611065060323286 0.029503159499581089 -0.99400495093605679 0.095821689081615813 1
		 1 1 no;
	setAttr ".xm[110]" -type "matrix" "xform" 1 1 1 0.0099309234438477341 0.14748032179352083
		 -0.10630800473897462 0 0.08416803301654957 0.014726827678484385 0.017838380597151593 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.065880761515555608 -0.46207410206868232 0.16911031616555294 0.86807197306786621 1
		 1 1 no;
	setAttr ".xm[111]" -type "matrix" "xform" 1 1 1 0 0.35672784581512101 0 0 0.043152267392663091
		 -8.5787891906941027e-07 1.5564560928993387e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.4901161193847653e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[112]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.4022874393070381e-06
		 4.5565044507617225e-07 1.5459230662262513e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-1.4901165693720363e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[113]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.5537291704912377e-06
		 -6.4908293939680561e-07 4.2332341054773792e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[114]" -type "matrix" "xform" 1 1 1 0.074333572842438494 0.20799088696016424
		 0.062674773439116371 0 0.08391537929788967 -0.028846179114232484 0.027910369694658543 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.072684736018698889 -0.38267119719362885 -0.052370422405551155 0.91953087106706266 1
		 1 1 no;
	setAttr ".xm[115]" -type "matrix" "xform" 1 1 1 0 0.25350907385217636 0 0 0.042977089244439659
		 -2.0787860584986495e-07 -3.4970896778396821e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		1.6660004686562638e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[116]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.5385696917653604e-08
		 -1.2147539082268954e-08 -6.4598360438594682e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-1.6660005097701723e-08 0 0 0.99999999999999989 1 1 1 no;
	setAttr ".xm[117]" -type "matrix" "xform" 1 1 1 0 0 0 0 -2.3385178229418102e-06
		 -3.7504684560762946e-07 8.7794974623633948e-08 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[118]" -type "matrix" "xform" 1 1 1 0 0 0.047315876021566269 0 0.033512186269922556
		 -0.046450601970531934 0.03518168109509312 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.50465587702149406 -0.28680242983121246 -0.37327491134516244 0.72369375608114817 1
		 1 1 no;
	setAttr ".xm[119]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.029078489221788462
		 6.6934553955011467e-07 1.5938323247866037e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		3.3320009373125275e-08 0 0 0.99999999999999944 1 1 1 no;
	setAttr ".xm[120]" -type "matrix" "xform" 1 1 1 0 0 0 0 -4.109401383733946e-06
		 -2.4813770693743464e-07 -1.2931592555109894e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[121]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1807915569761462e-06
		 -3.51845766966008e-07 -4.0671238604739202e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[122]" -type "matrix" "xform" 1 1 1 0 0 0 0 2.5249939029636792e-06
		 2.8336771056014509e-07 3.2125841571417624e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[123]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.060999999999999999
		 0 0.049000000000000002 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.047681762131598027 0 0 0.99886257791551369 1
		 1 1 no;
	setAttr ".xm[124]" -type "matrix" "xform" 1 1 1 2.9802343488871681e-08 4.6837533851373804e-17
		 -2.2204460492503136e-16 0 -1.2470015026133652e-07 -1.033683299095367e-07 2.8248327699209597e-07 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[125]" -type "matrix" "xform" 1 1 1 0.028117437339257451 -0.081134128963891244
		 -2.9466553759472718 0 -0.110874 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[126]" -type "matrix" "xform" 1 1 1 -6.3843628412371815e-17 -1.0303611805777494e-16
		 -0.089057403449435191 0 0.1085513387164575 -0.021031494278039728 0.0055099805043639094 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[127]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.4410655035934639e-06
		 -1.9078325105836846e-07 1.8824945766660051e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[128]" -type "matrix" "xform" 1 1 1 0 0 0 0 -4.5722289315763831e-08
		 9.8594417352604324e-10 -1.91767493440409e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[129]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 5.5511151231257827e-17
		 -2.9815136226877745e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[130]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.11026547808894938
		 0.0077551002628059584 -0.13421574049914495 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.82975234262291386 0.37641496248199702 -0.23504348248279525 0.33849281716725294 1
		 1 1 no;
	setAttr ".xm[131]" -type "matrix" "xform" 1 1 1 3.1415926535897931 0 0 0 0.051808186971804115
		 -0.030999956896802683 -0.067990421310209048 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.56782112654162542 0.089817512229353885 -0.58886256462474829 0.56811342417997268 1
		 1 1 no;
	setAttr ".xm[132]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 -1.3877787807814457e-17
		 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[133]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.13359146076750106
		 0.0052584688303747296 -0.072994162620050498 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.91337230120577606 0.31894801833471065 -0.12507040030932121 0.21995589548109928 1
		 1 1 no;
	setAttr ".xm[134]" -type "matrix" "xform" 1 1 1 3.1415926535897931 0 0 0 0.065905881243753184
		 -0.058000006177095553 -0.049337338962601548 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.60058755221426874 -0.047597708930259774 -0.65272757035941231 0.45932098702602514 1
		 1 1 no;
	setAttr ".xm[135]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.5511151231257827e-17
		 -5.5511151231257827e-17 -2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[136]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.14440698729984836
		 0.0024600960090983004 1.539708443810719e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.95914197271811463 -0.28292521302513812 -1.0977042272863142e-06 1.9694299726272351e-06 1
		 1 1 no;
	setAttr ".xm[137]" -type "matrix" "xform" 1 1 1 3.1415926535897931 0 0 0 0.071879403913751361
		 -0.076307896143120169 -3.3728084869688547e-12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.6588010485770327 0.26113147141888277 0.65589873733689152 -0.25997765170930115 1
		 1 1 no;
	setAttr ".xm[138]" -type "matrix" "xform" 1 1 1 0 0 0 0 -9.6277152916712794e-17
		 -1.9428902930940239e-16 -6.6613381477509392e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[139]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.13345737923113377
		 0.0057026922337278518 0.072839103478154241 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.91337244186842947 -0.31894771525075649 -0.12507040590087246 0.21995574768442791 1
		 1 1 no;
	setAttr ".xm[140]" -type "matrix" "xform" 1 1 1 -3.1415926535897931 3.1415926535897931
		 3.1415926535897931 0 0.065831286804661882 -0.057653499557021481 0.048999997999323072 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.04759745745236138 -0.60058757484127034 0.45932074052607919 0.65272774133855094 1
		 1 1 no;
	setAttr ".xm[141]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1102230246251565e-16
		 1.3877787807814457e-16 4.4408920985006262e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[142]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.11013733875373011
		 0.007826930643483665 0.13428494632165161 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.82975239164432313 -0.37641334099796447 -0.23504382373950672 0.33849426317322978 1
		 1 1 no;
	setAttr ".xm[143]" -type "matrix" "xform" 1 1 1 3.1415926535897931 3.1415926535897931
		 3.1415926535897931 0 0.051807906229560108 -0.030837335804792421 0.067999997038313997 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.089819809275797163 -0.56782132952494913 0.56811276471070382 0.58886265475995236 1
		 1 1 no;
	setAttr ".xm[144]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 2.6367796834847468e-16
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[145]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.4408920985006262e-16
		 -8.3266726846886741e-17 -2.5294944903855171e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[146]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.030938827079179498
		 0.035916293793965631 -4.0594177640619945e-09 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.6119341564574492 0.79090871038363253 7.6705421352971364e-08 5.9347768832354887e-08 1
		 1 1 no;
	setAttr ".xm[147]" -type "matrix" "xform" 1 1 1 0 3.1415926535897931 3.1415926535897931 0 0.059322256190993683
		 0.020930176031780379 2.1573802111624941e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.40944178825544753 0.57841670878380069 0.40763732443088796 -0.57586747152511053 1
		 1 1 no;
	setAttr ".xm[148]" -type "matrix" "xform" 1 1 1 0 0 0 0 -7.4593109467002705e-17
		 4.163336342344337e-17 2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[149]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.1102230246251565e-16
		 -1.3877787807814457e-17 -5.3375781171229736e-18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[150]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 5.2939559203393771e-23
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[151]" -type "matrix" "xform" 1.204009629727991 1.204009629727991 1.204009629727991 0
		 0 0 0 0.040997495256495708 -0.0070000027720906006 0.012506271644896483 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.70150238153619227 -0.088849756742227864 -0.037234384849241284 0.70612585989382648 1
		 1 1 no;
	setAttr ".xm[152]" -type "matrix" "xform" 1 1 1 3.1415926535897931 0 -1.8325957145940464 0 0.12870963205513908
		 -0.0094267965325253167 0.00039742784866459747 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.50243449931104966 0.094378142180454316 0.18831356071303662 0.83856445371372512 0.83055814115533222
		 0.83055814115533222 0.83055814115533222 no;
	setAttr ".xm[153]" -type "matrix" "xform" 0.78793546468283704 0.78793546468283704
		 0.78793546468283704 0.3490658503988659 0 0 0 -5.5511151231257827e-17 5.5511151231257827e-17
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[154]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.025997483861166217
		 -0.024560186190272625 0.060302285071024864 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.59036589979613141 -0.38918897737995628 -0.12479939662341252 0.69600657672631228 1
		 1 1 no;
	setAttr ".xm[155]" -type "matrix" "xform" 1 1 1 -3.1415926535897931 0 -1.8325957145940464 0 0.096356382324940482
		 -0.041308688496866419 0.00011745567148795493 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.69325270710876641 0.1334318105135896 -0.09366591027834803 0.70201377000822507 1
		 1 1 no;
	setAttr ".xm[156]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.3877787807814457e-17
		 2.7755575615628914e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[157]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.025855416138822078
		 -0.024560178310251 0.060302220291522213 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.12469091780952368 -0.69602610967213829 -0.59051846876401426 0.3889572826405116 1
		 1 1 no;
	setAttr ".xm[158]" -type "matrix" "xform" 1 1 1 0 0 -1.8325957145940464 0 0.096533847755917834
		 -0.041362619192490957 2.260273503176699e-09 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.13316308277314309 -0.69332067741129655 0.70198351336571152 0.093771950086503769 1
		 1 1 no;
	setAttr ".xm[159]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.3266726846886741e-17
		 -2.7755575615628914e-17 2.2204460492503131e-16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 no;
	setAttr ".xm[160]" -type "matrix" "xform" 1.204009629727991 1.204009629727991 1.204009629727991 0
		 0 0 0 -0.041002504743505995 -0.0069999901743702762 0.012506278719198627 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.037218244472472038 -0.70612673381712443 -0.7015071244927984 0.088812118277816127 1
		 1 1 no;
	setAttr ".xm[161]" -type "matrix" "xform" 1 1 1 0 0 -1.8325957145940464 0 0.12877672824613404
		 -0.0094277117392047582 -0.00039514754876282375 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0.094339153543677362 0.50244544315757322 -0.83856376497018414 0.18830696439028008 0.83055814115533222
		 0.83055814115533222 0.83055814115533222 no;
	setAttr ".xm[162]" -type "matrix" "xform" 0.78793546468283704 0.78793546468283704
		 0.78793546468283704 0 0 0 0 5.5511151231257827e-17 -1.6653345369377348e-16 1.1102230246251565e-16 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 no;
	setAttr ".xm[163]" -type "matrix" "xform" 0.8234027316381245 0.8234027316381245 0.8234027316381245 0
		 0 0 0 -1.1550502273161603e-08 -0.026716376831228718 0.078483583966893811 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.35432952872834911 -0.61192375059418425 -0.35432939965344878 0.61192367585436613 1
		 1 1 no;
	setAttr ".xm[164]" -type "matrix" "xform" 1 1 1 0 3.1415926535897931 0 0 0.095564865501694629
		 -0.054768539397500815 1.9862497055290313e-12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.35354614629834019 0.61057076204777805 0.35511113551773371 0.61327363256648659 1.2144725315770362
		 1.2144725315770362 1.2144725315770362 no;
	setAttr ".xm[165]" -type "matrix" "xform" 1.2418946658757442 1.2418946658757442 1.2418946658757442 0
		 0 0 0 4.3368086899420177e-17 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 no;
	setAttr -s 99 ".m";
	setAttr -s 166 ".p";
	setAttr -s 166 ".g[0:165]" yes yes yes no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no;
	setAttr ".bp" yes;
createNode blinn -n "add_Atlas_12";
	rename -uid "F5B3CAF8-4017-DA16-9A4B-33865B7F5B60";
createNode shadingEngine -n "add_blinn1SG16";
	rename -uid "B11B8722-4E5A-85E9-2319-50829A5CAD37";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo24";
	rename -uid "BE86D15C-47FA-4985-A564-24A5A01ED384";
createNode materialInfo -n "add_materialInfo25";
	rename -uid "332D4FB5-40DC-63C9-E0C3-8E8BA762ED66";
createNode shadingEngine -n "blinn1SG3";
	rename -uid "57F477CA-4747-FBDF-2450-BD8E0E1EBD0C";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo13";
	rename -uid "C782547A-42D0-56BF-D85F-4CA21237B905";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -873.80948908745438 -686.73856618981426 ;
	setAttr ".tgi[0].vh" -type "double2" 358.92855716603208 556.97666658418404 ;
	setAttr ".tgi[0].ni[0].x" 312.85714721679688;
	setAttr ".tgi[0].ni[0].y" 100;
	setAttr ".tgi[0].ni[0].nvs" 1923;
createNode blinn -n "add_Atlas_13";
	rename -uid "5FB47C2B-4575-C8DE-410A-EF9311B35B8D";
createNode shadingEngine -n "add_blinn1SG17";
	rename -uid "FAC09DE7-480A-8F62-3A81-4EB9419CAD00";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "add_materialInfo26";
	rename -uid "D3CB036D-4461-FB0D-DBAF-0997022BA01C";
createNode nodeGraphEditorInfo -n "add_hyperShadePrimaryNodeEditorSavedTabsInfo14";
	rename -uid "291D7227-4D88-CF55-0D70-1CA397EE7E22";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1481.8003517436825 -698.67296580279094 ;
	setAttr ".tgi[0].vh" -type "double2" 70.884086653039574 283.35697051159343 ;
	setAttr -s 5 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -1307.142822265625;
	setAttr ".tgi[0].ni[0].y" -98.571426391601563;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -78.571426391601563;
	setAttr ".tgi[0].ni[1].y" 37.142856597900391;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" -692.85711669921875;
	setAttr ".tgi[0].ni[2].y" -52.857143402099609;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -385.71429443359375;
	setAttr ".tgi[0].ni[3].y" 60;
	setAttr ".tgi[0].ni[3].nvs" 1923;
	setAttr ".tgi[0].ni[4].x" -1000;
	setAttr ".tgi[0].ni[4].y" -75.714286804199219;
	setAttr ".tgi[0].ni[4].nvs" 1923;
createNode file -n "add_file10";
	rename -uid "F1CC3871-4EAA-2636-12F7-669BBD8280D7";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "E:/!ArtCharactersWH//ArmorsAndClothes/DarkDisciple/Texturing_DarkDisciple/AT_DarkDiscipeBoss/AT_DarkDiscipeBoss_n.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "add_place2dTexture15";
	rename -uid "753DBFC9-45FD-0085-BAB7-D9A5A3634CBB";
createNode bump2d -n "add_bump2d5";
	rename -uid "A615BC26-4A07-44E3-0B4F-E08CDFB9EAF2";
	setAttr ".bi" 1;
	setAttr ".vc1" -type "float3" 0 0.00022000005 0 ;
	setAttr ".vc2" -type "float3" 9.9999997e-06 9.9999997e-06 0 ;
createNode file -n "add_file11";
	rename -uid "F975FDED-4DD7-27B2-149E-94B72195DD50";
	setAttr ".ftn" -type "string" "E:/!ArtCharactersWH//ArmorsAndClothes/DarkDisciple/Texturing_DarkDisciple/AT_DarkDiscipeBoss/AT_DarkDiscipeBoss_n.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "add_place2dTexture16";
	rename -uid "4DDE6CC5-4377-5930-D209-D9B02DF15290";
createNode file -n "add_file12";
	rename -uid "00EA6F25-4D89-AB7E-907C-F299B65C8026";
	setAttr ".ftn" -type "string" "E:/!ArtCharactersWH//ArmorsAndClothes/DarkDisciple/Texturing_DarkDisciple/AT_DarkDiscipeBoss/AT_DarkDiscipeBoss_d.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "add_place2dTexture17";
	rename -uid "B25B3BD3-4DB1-0652-5418-24A12D608D49";
createNode ngst2SkinLayerData -n "ngSkinToolsData_SP_DarkDisciple_F_HM_SkinCluster";
	rename -uid "BD242739-45A8-2D7B-B359-AE88E972616F";
	setAttr ".ld" -type "ngst2SkinLayerDataStorage" 14 5201 {
"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"};
	setAttr ".imo" -type "string" "{}";
createNode ngst2SkinLayerData -n "ngSkinToolsData_BT_DarkDisciple2_F_HM_SkinCluster";
	rename -uid "AC0ED408-4E72-F5DB-AC8B-1680EBDF1A21";
	setAttr ".ld" -type "ngst2SkinLayerDataStorage" 14 12942 {
"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"};
	setAttr ".imo" -type "string" "{}";
createNode ngst2SkinLayerData -n "ngSkinToolsData_BT_DarkDisciple1_F_HM_SkinCluster";
	rename -uid "77A1EF8B-46D7-F65E-4F9D-88870523EEE1";
	setAttr ".ld" -type "ngst2SkinLayerDataStorage" 14 4348 {
"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"};
	setAttr ".imo" -type "string" "{}";
createNode ngst2SkinLayerData -n "ngSkinToolsData_skinCluster6048";
	rename -uid "D7D5E9C8-4086-A9D1-2A23-D88FF685FEA0";
	setAttr ".ld" -type "ngst2SkinLayerDataStorage" 14 8558 {
"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"};
	setAttr ".imo" -type "string" "{}";
createNode ngst2SkinLayerData -n "ngSkinToolsData_MA_DarkDisciple_F_HM_SkinCluster";
	rename -uid "6C81DB4C-4C06-561B-A7B5-ACB979259766";
	setAttr ".ld" -type "ngst2SkinLayerDataStorage" 14 486 {
"sAxcIgAAAAEAAAAMAAAAQmFzZSB3ZWlnaHRzARQJAQTwPwkIBAAAASwQBQAAAFAREQkcDKBkweENJAUsBEBjCRAM4HeGvgEYCEAUhwUIDGBSfu8BEAQAUQkIDKDebs0FEA1IDGCvI+IBEAigk/oJKA0YCKB3djIoAAQgqQ0oBEOqBSgEYD8JCBEw4ggACM6c4wGADEBrweQBCD5IAAxAfsHUDRgFAQTAGwkoFGDRnOM/UgUTFQEMoDZ93C4sAASAOTYQABUBCLQ1kAUoAOANCDoBAAxAobjbBSAIgLFFBQhaAQAEoK0JKAzAFG+FASgIgCVwBQjuAQAFAQhkxtgBUAxgKX3WAQh+AQAEgMgJKBRAXcbYP2B+LgD+AQD+AQD+AQBWAQAM4ECf5S0sZRAyAQAAYjIOAGYBAASRESV4BCCfCQg+AQAMwEGa2g1kcgEACKCsm5IoAP4BAPIBAAB+ln4ADIBoJuAB9ATgTQkIQgEABE+ulqQCBBepkigA/gEA/gEATgEABJqZAQEEuT+hnwB4obQsY2xvc2VzdFBvaW50ARBhdAhUAABFaEFsCEwAAAUEobQBBAhRAAAFBIGwAQQBLAE0MFgAAABcAAAAWgAAAFsNBAEMARQsWAAAAH4AAAB+AAAA"};
	setAttr ".imo" -type "string" "{}";
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -cb on ".ihi";
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
	setAttr -av ".ta";
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
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 67 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 85 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 68 ".u";
select -ne :defaultRenderingList1;
	setAttr -k on ".ihi";
select -ne :defaultTextureList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 50 ".tx";
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
	setAttr -av -k on ".ren" -type "string" "arnold";
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
	setAttr -av -k on ".fs";
	setAttr -av -k on ".ef";
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
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr -k on ".hwfr";
	setAttr -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -k on ".bswa";
	setAttr -k on ".shml";
	setAttr -k on ".hwel";
select -ne :defaultHideFaceDataSet;
	setAttr -s 3 ".dnsm";
select -ne :ikSystem;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".gsn";
	setAttr -k on ".gsv";
	setAttr -s 4 ".sol";
select -ne :hyperGraphLayout;
connectAttr "Reference_Pelvis.s" "Reference_L_Pre_Up_Leg.is";
connectAttr "Reference_L_Pre_Up_Leg.s" "Reference_L_Up_leg.is";
connectAttr "Reference_L_Up_leg.s" "Reference_L_leg.is";
connectAttr "Reference_L_leg.s" "Reference_L_foot.is";
connectAttr "Reference_L_foot.s" "Reference_L_toe.is";
connectAttr "Reference_L_Up_leg.s" "Reference_L_A.is";
connectAttr "Reference_L_Up_leg.s" "Reference_L_Sceart_____Front_00.is";
connectAttr "Reference_L_Sceart_____Front_00.s" "Reference_L_Sceart_Front_01.is"
		;
connectAttr "Reference_L_Sceart_Front_01.s" "Reference_L_Sceart_Font_02.is";
connectAttr "Reference_L_Up_leg.s" "Reference_L_Sceart_____Back_00.is";
connectAttr "Reference_L_Sceart_____Back_00.s" "Reference_L_Sceart_Back_01.is";
connectAttr "Reference_L_Sceart_Back_01.s" "Reference_L_Sceart_Back_02.is";
connectAttr "Reference_Pelvis.s" "Reference_R_Pre_Up_Leg.is";
connectAttr "Reference_R_Pre_Up_Leg.s" "Reference_R_Up_leg.is";
connectAttr "Reference_R_Up_leg.s" "Reference_R_leg.is";
connectAttr "Reference_R_leg.s" "Reference_R_foot.is";
connectAttr "Reference_R_foot.s" "Reference_R_toe.is";
connectAttr "Reference_R_Up_leg.s" "Reference_R_A.is";
connectAttr "Reference_R_Up_leg.s" "Reference_R_Sceart_____Front_00.is";
connectAttr "Reference_R_Sceart_____Front_00.s" "Reference_R_Sceart_Front_01.is"
		;
connectAttr "Reference_R_Sceart_Front_01.s" "Reference_R_Sceart_Font_02.is";
connectAttr "Reference_R_Up_leg.s" "Reference_R_Sceart_____Back_00.is";
connectAttr "Reference_R_Sceart_____Back_00.s" "Reference_R_Sceart_Back_01.is";
connectAttr "Reference_R_Sceart_Back_01.s" "Reference_R_Sceart_Back_02.is";
connectAttr "Reference_Pelvis.s" "Reference_Spine_1.is";
connectAttr "Reference_Spine_1.s" "Reference_Stomach.is";
connectAttr "Reference_Spine_1.s" "Reference_Spine_2.is";
connectAttr "Reference_Spine_2.s" "Reference_Spine_3.is";
connectAttr "Reference_Spine_3.s" "Reference_R_B.is";
connectAttr "Reference_Spine_3.s" "Reference_L_B.is";
connectAttr "Reference_Spine_3.s" "Reference_L_Clavicle.is";
connectAttr "L_Up_arm_segmentScaleCompensate.o" "Reference_L_Up_arm.ssc";
connectAttr "Reference_L_Clavicle.s" "Reference_L_Up_arm.is";
connectAttr "L_Up_arm_scaleX.o" "Reference_L_Up_arm.sx";
connectAttr "L_Up_arm_scaleY.o" "Reference_L_Up_arm.sy";
connectAttr "L_Up_arm_scaleZ.o" "Reference_L_Up_arm.sz";
connectAttr "L_Up_arm_visibility.o" "Reference_L_Up_arm.v";
connectAttr "L_Up_arm_translateX.o" "Reference_L_Up_arm.tx";
connectAttr "L_Up_arm_translateY.o" "Reference_L_Up_arm.ty";
connectAttr "L_Up_arm_translateZ.o" "Reference_L_Up_arm.tz";
connectAttr "L_Up_arm_rotateX.o" "Reference_L_Up_arm.rx";
connectAttr "L_Up_arm_rotateY.o" "Reference_L_Up_arm.ry";
connectAttr "L_Up_arm_rotateZ.o" "Reference_L_Up_arm.rz";
connectAttr "Reference_L_Up_arm.s" "Reference_L_ForeArm.is";
connectAttr "Reference_L_ForeArm.s" "Reference_L_Hand.is";
connectAttr "Reference_L_Hand.s" "Reference_L_Toe_2_01.is";
connectAttr "Reference_L_Toe_2_01.s" "Reference_L_Toe_2_02.is";
connectAttr "Reference_L_Hand.s" "Reference_L_Toe_1_01.is";
connectAttr "Reference_L_Toe_1_01.s" "Reference_L_Toe_1_02.is";
connectAttr "Reference_L_Hand.s" "Reference_L_Toe_3_01.is";
connectAttr "Reference_L_Toe_3_01.s" "Reference_L_Toe_3_02.is";
connectAttr "Reference_L_Hand.s" "Reference_L_WeaponBone.is";
connectAttr "Reference_Spine_3.s" "Reference_Neck.is";
connectAttr "Reference_Neck.s" "Reference_Head.is";
connectAttr "Reference_Head.s" "Reference_Jaw_Scale.is";
connectAttr "Reference_Head.s" "Reference_Skull_Scale.is";
connectAttr "Reference_Head.s" "Reference_Face_Scale.is";
connectAttr "L_eyelish_top_translateX_Base_AnimLayer_inputA.o" "Reference_L_eyelish_top.tx"
		;
connectAttr "L_eyelish_top_translateY_Base_AnimLayer_inputA.o" "Reference_L_eyelish_top.ty"
		;
connectAttr "L_eyelish_top_translateZ_Base_AnimLayer_inputA.o" "Reference_L_eyelish_top.tz"
		;
connectAttr "L_eyelish_top_rotate_Base_AnimLayer_inputAX.o" "Reference_L_eyelish_top.rx"
		;
connectAttr "L_eyelish_top_rotate_Base_AnimLayer_inputAY.o" "Reference_L_eyelish_top.ry"
		;
connectAttr "L_eyelish_top_rotate_Base_AnimLayer_inputAZ.o" "Reference_L_eyelish_top.rz"
		;
connectAttr "L_eyelish_top_scaleX_Base_AnimLayer_inputA.o" "Reference_L_eyelish_top.sx"
		;
connectAttr "L_eyelish_top_scaleY_Base_AnimLayer_inputA.o" "Reference_L_eyelish_top.sy"
		;
connectAttr "L_eyelish_top_scaleZ_Base_AnimLayer_inputA.o" "Reference_L_eyelish_top.sz"
		;
connectAttr "Reference_Face_Scale.s" "Reference_L_eyelish_top.is";
connectAttr "L_eyelish_top_visibility_Base_AnimLayer_inputA.o" "Reference_L_eyelish_top.v"
		;
connectAttr "Reference_L_eyelish_top.s" "Reference_L_eyelish_top_end.is";
connectAttr "Reference_Face_Scale.s" "Reference_L_eye.is";
connectAttr "Reference_L_eye.s" "Reference_L_eye_end.is";
connectAttr "Reference_Face_Scale.s" "Reference_L_eyelish_bottom.is";
connectAttr "Reference_L_eyelish_bottom.s" "Reference_L_eyelish_bottom_end.is";
connectAttr "R_eyebrow_translateX_Base_AnimLayer_inputA.o" "Reference_R_eyebrow.tx"
		;
connectAttr "R_eyebrow_translateY_Base_AnimLayer_inputA.o" "Reference_R_eyebrow.ty"
		;
connectAttr "R_eyebrow_translateZ_Base_AnimLayer_inputA.o" "Reference_R_eyebrow.tz"
		;
connectAttr "R_eyebrow_rotate_Base_AnimLayer_inputAX.o" "Reference_R_eyebrow.rx"
		;
connectAttr "R_eyebrow_rotate_Base_AnimLayer_inputAY.o" "Reference_R_eyebrow.ry"
		;
connectAttr "R_eyebrow_rotate_Base_AnimLayer_inputAZ.o" "Reference_R_eyebrow.rz"
		;
connectAttr "R_eyebrow_scaleX_Base_AnimLayer_inputA.o" "Reference_R_eyebrow.sx";
connectAttr "R_eyebrow_scaleY_Base_AnimLayer_inputA.o" "Reference_R_eyebrow.sy";
connectAttr "R_eyebrow_scaleZ_Base_AnimLayer_inputA.o" "Reference_R_eyebrow.sz";
connectAttr "Reference_Face_Scale.s" "Reference_R_eyebrow.is";
connectAttr "R_eyebrow_visibility_Base_AnimLayer_inputA.o" "Reference_R_eyebrow.v"
		;
connectAttr "L_eyebrow_translateX_Base_AnimLayer_inputA.o" "Reference_L_eyebrow.tx"
		;
connectAttr "L_eyebrow_translateY_Base_AnimLayer_inputA.o" "Reference_L_eyebrow.ty"
		;
connectAttr "L_eyebrow_translateZ_Base_AnimLayer_inputA.o" "Reference_L_eyebrow.tz"
		;
connectAttr "L_eyebrow_rotate_Base_AnimLayer_inputAX.o" "Reference_L_eyebrow.rx"
		;
connectAttr "L_eyebrow_rotate_Base_AnimLayer_inputAY.o" "Reference_L_eyebrow.ry"
		;
connectAttr "L_eyebrow_rotate_Base_AnimLayer_inputAZ.o" "Reference_L_eyebrow.rz"
		;
connectAttr "L_eyebrow_scaleX_Base_AnimLayer_inputA.o" "Reference_L_eyebrow.sx";
connectAttr "L_eyebrow_scaleY_Base_AnimLayer_inputA.o" "Reference_L_eyebrow.sy";
connectAttr "L_eyebrow_scaleZ_Base_AnimLayer_inputA.o" "Reference_L_eyebrow.sz";
connectAttr "Reference_Face_Scale.s" "Reference_L_eyebrow.is";
connectAttr "L_eyebrow_visibility_Base_AnimLayer_inputA.o" "Reference_L_eyebrow.v"
		;
connectAttr "R_eyelish_bottom_translateX_Base_AnimLayer_inputA.o" "Reference_R_eyelish_bottom.tx"
		;
connectAttr "R_eyelish_bottom_translateY_Base_AnimLayer_inputA.o" "Reference_R_eyelish_bottom.ty"
		;
connectAttr "R_eyelish_bottom_translateZ_Base_AnimLayer_inputA.o" "Reference_R_eyelish_bottom.tz"
		;
connectAttr "R_eyelish_bottom_rotate_Base_AnimLayer_inputAX.o" "Reference_R_eyelish_bottom.rx"
		;
connectAttr "R_eyelish_bottom_rotate_Base_AnimLayer_inputAY.o" "Reference_R_eyelish_bottom.ry"
		;
connectAttr "R_eyelish_bottom_rotate_Base_AnimLayer_inputAZ.o" "Reference_R_eyelish_bottom.rz"
		;
connectAttr "R_eyelish_bottom_scaleX_Base_AnimLayer_inputA.o" "Reference_R_eyelish_bottom.sx"
		;
connectAttr "R_eyelish_bottom_scaleY_Base_AnimLayer_inputA.o" "Reference_R_eyelish_bottom.sy"
		;
connectAttr "R_eyelish_bottom_scaleZ_Base_AnimLayer_inputA.o" "Reference_R_eyelish_bottom.sz"
		;
connectAttr "Reference_Face_Scale.s" "Reference_R_eyelish_bottom.is";
connectAttr "R_eyelish_bottom_visibility_Base_AnimLayer_inputA.o" "Reference_R_eyelish_bottom.v"
		;
connectAttr "Reference_R_eyelish_bottom.s" "Reference_R_eyelish_bottom_end.is";
connectAttr "Reference_Face_Scale.s" "Reference_R_eye.is";
connectAttr "Reference_R_eye.s" "Reference_R_eye_end.is";
connectAttr "Reference_Face_Scale.s" "Reference_R_eyelish_top.is";
connectAttr "Reference_R_eyelish_top.s" "Reference_R_eyelish_top_end.is";
connectAttr "Reference_Spine_3.s" "Reference_L_Neck_Muscl.is";
connectAttr "Reference_Spine_3.s" "Reference_R_Neck_Muscl.is";
connectAttr "Reference_Spine_3.s" "Reference_R_Clavicle.is";
connectAttr "R_Up_arm_segmentScaleCompensate.o" "Reference_R_Up_arm.ssc";
connectAttr "Reference_R_Clavicle.s" "Reference_R_Up_arm.is";
connectAttr "R_Up_arm_scaleX.o" "Reference_R_Up_arm.sx";
connectAttr "R_Up_arm_scaleY.o" "Reference_R_Up_arm.sy";
connectAttr "R_Up_arm_scaleZ.o" "Reference_R_Up_arm.sz";
connectAttr "R_Up_arm_visibility.o" "Reference_R_Up_arm.v";
connectAttr "R_Up_arm_translateX.o" "Reference_R_Up_arm.tx";
connectAttr "R_Up_arm_translateY.o" "Reference_R_Up_arm.ty";
connectAttr "R_Up_arm_translateZ.o" "Reference_R_Up_arm.tz";
connectAttr "R_Up_arm_rotateX.o" "Reference_R_Up_arm.rx";
connectAttr "R_Up_arm_rotateY.o" "Reference_R_Up_arm.ry";
connectAttr "R_Up_arm_rotateZ.o" "Reference_R_Up_arm.rz";
connectAttr "Reference_R_Up_arm.s" "Reference_R_ForeArm.is";
connectAttr "Reference_R_ForeArm.s" "Reference_R_Hand.is";
connectAttr "Reference_R_Hand.s" "Reference_R_Toe_2_01.is";
connectAttr "Reference_R_Toe_2_01.s" "Reference_R_Toe_2_02.is";
connectAttr "Reference_R_Hand.s" "Reference_R_Toe_1_01.is";
connectAttr "Reference_R_Toe_1_01.s" "Reference_R_Toe_1_02.is";
connectAttr "Reference_R_Hand.s" "Reference_R_Toe_3_01.is";
connectAttr "Reference_R_Toe_3_01.s" "Reference_R_Toe_3_02.is";
connectAttr "Reference_R_Hand.s" "Reference_R_WeaponBone.is";
connectAttr "Reference_Spine_3.s" "Reference_L_back_w_____slot_10.is";
connectAttr "Reference_L_back_w_____slot_10.s" "Reference_L_back_weapon_slot_10.is"
		;
connectAttr "Reference_Spine_3.s" "Reference_L_back_w_____slot_07.is";
connectAttr "Reference_L_back_w_____slot_07.s" "Reference_L_back_weapon_slot_07.is"
		;
connectAttr "Reference_Spine_3.s" "Reference_C_back_w_____slot_08.is";
connectAttr "Reference_C_back_w_____slot_08.s" "Reference_C_back_weapon_slot_08.is"
		;
connectAttr "Reference_Spine_3.s" "Reference_R_back_w_____slot_09.is";
connectAttr "Reference_R_back_w_____slot_09.s" "Reference_R_back_weapon_slot_09.is"
		;
connectAttr "Reference_Spine_3.s" "Reference_R_back_w_____slot_06.is";
connectAttr "Reference_R_back_w_____slot_06.s" "Reference_R_back_weapon_slot_06.is"
		;
connectAttr "Reference_Spine_2.s" "Reference_C_back_w_____slot_11.is";
connectAttr "Reference_C_back_w_____slot_11.s" "Reference_C_back_weapon_slot_11.is"
		;
connectAttr "Reference_Pelvis.s" "Reference_L_front_w____scale_05.is";
connectAttr "Reference_L_front_w____scale_05.s" "Reference_L_front_weapon_slot_05.is"
		;
connectAttr "Reference_Pelvis.s" "Reference_L_front_w____scale_04.is";
connectAttr "Reference_L_front_w____scale_04.s" "Reference_L_front_weapon_slot_04.is"
		;
connectAttr "Reference_Pelvis.s" "Reference_R_front_w____scale_02.is";
connectAttr "Reference_R_front_w____scale_02.s" "Reference_R_front_weapon_slot_02.is"
		;
connectAttr "Reference_Pelvis.s" "Reference_R_front_w____scale_01.is";
connectAttr "Reference_R_front_w____scale_01.s" "Reference_R_front_weapon_slot_01.is"
		;
connectAttr "Reference_Pelvis.s" "Reference_C_front_w____scale_03.is";
connectAttr "Reference_C_front_w____scale_03.s" "Reference_C_front_weapon_slot_03.is"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "FT_RebelClothes3_M_HMSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "ChaosCultist4_F_HM_scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "ChaosCultist4_F_HM_scale_x002:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Seneshal_F_HM_scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "ImperialNavy_F_HM_scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "CrimeLordRogueTrader_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "CriminalCostume_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "AdeptasSororittas_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "MilitarumTempestusCarapace_F_HM_scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "LowLifer1_F_HM_Scale_x001:HM_F_Brows05_F_HMSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BalefulEye1_F_HM_scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "IndustrialWorker1_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "AgriWorker1_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "GangMember4_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "FootfallWorker1_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Drukhari_Medusae_F_HM_scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Cloak1_F_HM_Scale_x001:atlas_1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Cloak1_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "GangMember3_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "TheodoraClothes_F_HM_Scale_x001:blinn2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "SP_Jae_F_HMSG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "FlakArmor_F_HM_scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "EY_Eyes02_F_HMSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "HH_Hair02_F_HMSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Eyewear1_F_HM_Scale_x002:lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "HH_Hair09_F_HMSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "HD_Head09_F_HMSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "FlakArmor_F_HM_scale_x002:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Eyewear2_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Boots1_F_HM_Scale_x001:lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "GangMember1_F_HM_Scale_x001:atlas_1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:FA_AdeptaSororitasPowerArmor_F_FMSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "ImperialNobiliti_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "BW_Brows01_F_HMSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "heads_lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__FT_RebelClothes3_M_HMSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "SP_ImperialNavy_M_HM_LPSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn1SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn1SG2.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG5.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG6.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "CL_NavyRenegade_M_HMSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG7.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG9.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG8.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG10.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG11.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG12.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG13.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn2SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__BC_ChestCommissar_F_HMSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG14.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG15.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG2.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "HM_F_Brows05_F_HMSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG16.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "blinn1SG3.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "add_blinn1SG17.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "FT_RebelClothes3_M_HMSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "ChaosCultist4_F_HM_scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "ChaosCultist4_F_HM_scale_x002:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Seneshal_F_HM_scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "ImperialNavy_F_HM_scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "CrimeLordRogueTrader_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "CriminalCostume_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "AdeptasSororittas_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "MilitarumTempestusCarapace_F_HM_scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "LowLifer1_F_HM_Scale_x001:HM_F_Brows05_F_HMSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BalefulEye1_F_HM_scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "IndustrialWorker1_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "AgriWorker1_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "GangMember4_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "FootfallWorker1_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Drukhari_Medusae_F_HM_scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Cloak1_F_HM_Scale_x001:atlas_1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Cloak1_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "GangMember3_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "TheodoraClothes_F_HM_Scale_x001:blinn2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "SP_Jae_F_HMSG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "FlakArmor_F_HM_scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "EY_Eyes02_F_HMSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "HH_Hair02_F_HMSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Eyewear1_F_HM_Scale_x002:lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "HH_Hair09_F_HMSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "HD_Head09_F_HMSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "FlakArmor_F_HM_scale_x002:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Eyewear2_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Boots1_F_HM_Scale_x001:lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "GangMember1_F_HM_Scale_x001:atlas_1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:FA_AdeptaSororitasPowerArmor_F_FMSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "ImperialNobiliti_F_HM_Scale_x001:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "BW_Brows01_F_HMSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "heads_lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__FT_RebelClothes3_M_HMSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "SP_ImperialNavy_M_HM_LPSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn1SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn1SG2.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG5.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG6.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "CL_NavyRenegade_M_HMSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG7.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG9.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG8.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG10.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG11.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG12.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG13.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn2SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__BC_ChestCommissar_F_HMSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG14.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG15.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG2.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "HM_F_Brows05_F_HMSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG16.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn1SG3.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "add_blinn1SG17.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "FT_RebelClothes3_M_HMSG.msg" "materialInfo6.sg";
connectAttr "lambert2.msg" "materialInfo6.m";
connectAttr "lambert2.oc" "FT_RebelClothes3_M_HMSG.ss";
connectAttr "ChaosCultist4_F_HM_scale_x001:atlas_1.oc" "ChaosCultist4_F_HM_scale_x001:blinn1SG.ss"
		;
connectAttr "ChaosCultist4_F_HM_scale_x001:blinn1SG.msg" "ChaosCultist4_F_HM_scale_x001:materialInfo1.sg"
		;
connectAttr "ChaosCultist4_F_HM_scale_x001:atlas_1.msg" "ChaosCultist4_F_HM_scale_x001:materialInfo1.m"
		;
connectAttr "ChaosCultist4_F_HM_scale_x001:blinn1SG.msg" "ChaosCultist4_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "ChaosCultist4_F_HM_scale_x001:atlas_1.msg" "ChaosCultist4_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "ChaosCultist4_F_HM_scale_x002:atlas_1.oc" "ChaosCultist4_F_HM_scale_x002:blinn1SG.ss"
		;
connectAttr "ChaosCultist4_F_HM_scale_x002:blinn1SG.msg" "ChaosCultist4_F_HM_scale_x002:materialInfo1.sg"
		;
connectAttr "ChaosCultist4_F_HM_scale_x002:atlas_1.msg" "ChaosCultist4_F_HM_scale_x002:materialInfo1.m"
		;
connectAttr "ChaosCultist4_F_HM_scale_x002:blinn1SG.msg" "ChaosCultist4_F_HM_scale_x002:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "ChaosCultist4_F_HM_scale_x002:atlas_1.msg" "ChaosCultist4_F_HM_scale_x002:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "Seneshal_F_HM_scale_x001:atlas_1.oc" "Seneshal_F_HM_scale_x001:blinn1SG.ss"
		;
connectAttr "Seneshal_F_HM_scale_x001:blinn1SG.msg" "Seneshal_F_HM_scale_x001:materialInfo1.sg"
		;
connectAttr "Seneshal_F_HM_scale_x001:atlas_1.msg" "Seneshal_F_HM_scale_x001:materialInfo1.m"
		;
connectAttr "Seneshal_F_HM_scale_x001:atlas_1.msg" "Seneshal_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "Seneshal_F_HM_scale_x001:blinn1SG.msg" "Seneshal_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "ImperialNavy_F_HM_scale_x001:atlas_1.oc" "ImperialNavy_F_HM_scale_x001:blinn1SG.ss"
		;
connectAttr "ImperialNavy_F_HM_scale_x001:blinn1SG.msg" "ImperialNavy_F_HM_scale_x001:materialInfo1.sg"
		;
connectAttr "ImperialNavy_F_HM_scale_x001:atlas_1.msg" "ImperialNavy_F_HM_scale_x001:materialInfo1.m"
		;
connectAttr "ImperialNavy_F_HM_scale_x001:atlas_1.msg" "ImperialNavy_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "ImperialNavy_F_HM_scale_x001:blinn1SG.msg" "ImperialNavy_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "CrimeLordRogueTrader_F_HM_Scale_x001:atlas_1.oc" "CrimeLordRogueTrader_F_HM_Scale_x001:blinn1SG.ss"
		;
connectAttr "CrimeLordRogueTrader_F_HM_Scale_x001:blinn1SG.msg" "CrimeLordRogueTrader_F_HM_Scale_x001:materialInfo1.sg"
		;
connectAttr "CrimeLordRogueTrader_F_HM_Scale_x001:atlas_1.msg" "CrimeLordRogueTrader_F_HM_Scale_x001:materialInfo1.m"
		;
connectAttr "CrimeLordRogueTrader_F_HM_Scale_x001:atlas_1.msg" "CrimeLordRogueTrader_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "CrimeLordRogueTrader_F_HM_Scale_x001:blinn1SG.msg" "CrimeLordRogueTrader_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:file1.oc" "CriminalCostume_F_HM_Scale_x001:atlas_1.c"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:file1.ot" "CriminalCostume_F_HM_Scale_x001:atlas_1.it"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:bump2d2.o" "CriminalCostume_F_HM_Scale_x001:atlas_1.n"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:atlas_1.oc" "CriminalCostume_F_HM_Scale_x001:blinn1SG.ss"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:blinn1SG.msg" "CriminalCostume_F_HM_Scale_x001:materialInfo3.sg"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:atlas_1.msg" "CriminalCostume_F_HM_Scale_x001:materialInfo3.m"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:file1.msg" "CriminalCostume_F_HM_Scale_x001:materialInfo3.t"
		 -na;
connectAttr "CriminalCostume_F_HM_Scale_x001:atlas_1.msg" "CriminalCostume_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:blinn1SG.msg" "CriminalCostume_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr ":defaultColorMgtGlobals.cme" "CriminalCostume_F_HM_Scale_x001:file1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "CriminalCostume_F_HM_Scale_x001:file1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "CriminalCostume_F_HM_Scale_x001:file1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "CriminalCostume_F_HM_Scale_x001:file1.ws"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.c" "CriminalCostume_F_HM_Scale_x001:file1.c"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.tf" "CriminalCostume_F_HM_Scale_x001:file1.tf"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.rf" "CriminalCostume_F_HM_Scale_x001:file1.rf"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.mu" "CriminalCostume_F_HM_Scale_x001:file1.mu"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.mv" "CriminalCostume_F_HM_Scale_x001:file1.mv"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.s" "CriminalCostume_F_HM_Scale_x001:file1.s"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.wu" "CriminalCostume_F_HM_Scale_x001:file1.wu"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.wv" "CriminalCostume_F_HM_Scale_x001:file1.wv"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.re" "CriminalCostume_F_HM_Scale_x001:file1.re"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.of" "CriminalCostume_F_HM_Scale_x001:file1.of"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.r" "CriminalCostume_F_HM_Scale_x001:file1.ro"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.n" "CriminalCostume_F_HM_Scale_x001:file1.n"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.vt1" "CriminalCostume_F_HM_Scale_x001:file1.vt1"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.vt2" "CriminalCostume_F_HM_Scale_x001:file1.vt2"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.vt3" "CriminalCostume_F_HM_Scale_x001:file1.vt3"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.vc1" "CriminalCostume_F_HM_Scale_x001:file1.vc1"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.o" "CriminalCostume_F_HM_Scale_x001:file1.uv"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.ofs" "CriminalCostume_F_HM_Scale_x001:file1.fs"
		;
connectAttr ":defaultColorMgtGlobals.cme" "CriminalCostume_F_HM_Scale_x001:file5.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "CriminalCostume_F_HM_Scale_x001:file5.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "CriminalCostume_F_HM_Scale_x001:file5.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "CriminalCostume_F_HM_Scale_x001:file5.ws"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.c" "CriminalCostume_F_HM_Scale_x001:file5.c"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.tf" "CriminalCostume_F_HM_Scale_x001:file5.tf"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.rf" "CriminalCostume_F_HM_Scale_x001:file5.rf"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.mu" "CriminalCostume_F_HM_Scale_x001:file5.mu"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.mv" "CriminalCostume_F_HM_Scale_x001:file5.mv"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.s" "CriminalCostume_F_HM_Scale_x001:file5.s"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.wu" "CriminalCostume_F_HM_Scale_x001:file5.wu"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.wv" "CriminalCostume_F_HM_Scale_x001:file5.wv"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.re" "CriminalCostume_F_HM_Scale_x001:file5.re"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.of" "CriminalCostume_F_HM_Scale_x001:file5.of"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.r" "CriminalCostume_F_HM_Scale_x001:file5.ro"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.n" "CriminalCostume_F_HM_Scale_x001:file5.n"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.vt1" "CriminalCostume_F_HM_Scale_x001:file5.vt1"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.vt2" "CriminalCostume_F_HM_Scale_x001:file5.vt2"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.vt3" "CriminalCostume_F_HM_Scale_x001:file5.vt3"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.vc1" "CriminalCostume_F_HM_Scale_x001:file5.vc1"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.o" "CriminalCostume_F_HM_Scale_x001:file5.uv"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.ofs" "CriminalCostume_F_HM_Scale_x001:file5.fs"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:file5.oa" "CriminalCostume_F_HM_Scale_x001:bump2d2.bv"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:file6.oa" "CriminalCostume_F_HM_Scale_x001:bump2d2.bd"
		;
connectAttr ":defaultColorMgtGlobals.cme" "CriminalCostume_F_HM_Scale_x001:file6.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "CriminalCostume_F_HM_Scale_x001:file6.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "CriminalCostume_F_HM_Scale_x001:file6.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "CriminalCostume_F_HM_Scale_x001:file6.ws"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.c" "CriminalCostume_F_HM_Scale_x001:file6.c"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.tf" "CriminalCostume_F_HM_Scale_x001:file6.tf"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.rf" "CriminalCostume_F_HM_Scale_x001:file6.rf"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.mu" "CriminalCostume_F_HM_Scale_x001:file6.mu"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.mv" "CriminalCostume_F_HM_Scale_x001:file6.mv"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.s" "CriminalCostume_F_HM_Scale_x001:file6.s"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.wu" "CriminalCostume_F_HM_Scale_x001:file6.wu"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.wv" "CriminalCostume_F_HM_Scale_x001:file6.wv"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.re" "CriminalCostume_F_HM_Scale_x001:file6.re"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.of" "CriminalCostume_F_HM_Scale_x001:file6.of"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.r" "CriminalCostume_F_HM_Scale_x001:file6.ro"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.n" "CriminalCostume_F_HM_Scale_x001:file6.n"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.vt1" "CriminalCostume_F_HM_Scale_x001:file6.vt1"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.vt2" "CriminalCostume_F_HM_Scale_x001:file6.vt2"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.vt3" "CriminalCostume_F_HM_Scale_x001:file6.vt3"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.vc1" "CriminalCostume_F_HM_Scale_x001:file6.vc1"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.o" "CriminalCostume_F_HM_Scale_x001:file6.uv"
		;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.ofs" "CriminalCostume_F_HM_Scale_x001:file6.fs"
		;
connectAttr "AdeptasSororittas_F_HM_Scale_x001:atlas_1.oc" "AdeptasSororittas_F_HM_Scale_x001:blinn1SG.ss"
		;
connectAttr "AdeptasSororittas_F_HM_Scale_x001:blinn1SG.msg" "AdeptasSororittas_F_HM_Scale_x001:materialInfo1.sg"
		;
connectAttr "AdeptasSororittas_F_HM_Scale_x001:atlas_1.msg" "AdeptasSororittas_F_HM_Scale_x001:materialInfo1.m"
		;
connectAttr "AdeptasSororittas_F_HM_Scale_x001:atlas_1.msg" "AdeptasSororittas_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "AdeptasSororittas_F_HM_Scale_x001:blinn1SG.msg" "AdeptasSororittas_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "MilitarumTempestusCarapace_F_HM_scale_x001:atlas_1.oc" "MilitarumTempestusCarapace_F_HM_scale_x001:blinn1SG.ss"
		;
connectAttr "MilitarumTempestusCarapace_F_HM_scale_x001:blinn1SG.msg" "MilitarumTempestusCarapace_F_HM_scale_x001:materialInfo1.sg"
		;
connectAttr "MilitarumTempestusCarapace_F_HM_scale_x001:atlas_1.msg" "MilitarumTempestusCarapace_F_HM_scale_x001:materialInfo1.m"
		;
connectAttr "MilitarumTempestusCarapace_F_HM_scale_x001:atlas_1.msg" "MilitarumTempestusCarapace_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "MilitarumTempestusCarapace_F_HM_scale_x001:blinn1SG.msg" "MilitarumTempestusCarapace_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:file2.oc" "LowLifer1_F_HM_Scale_x001:atlas1.c"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:atlas1.oc" "LowLifer1_F_HM_Scale_x001:HM_F_Brows05_F_HMSG.ss"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:HM_F_Brows05_F_HMSG.msg" "LowLifer1_F_HM_Scale_x001:materialInfo1.sg"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:atlas1.msg" "LowLifer1_F_HM_Scale_x001:materialInfo1.m"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:file2.msg" "LowLifer1_F_HM_Scale_x001:materialInfo1.t"
		 -na;
connectAttr "LowLifer1_F_HM_Scale_x001:place2dTexture1.o" "LowLifer1_F_HM_Scale_x001:file2.uv"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:place2dTexture1.ofu" "LowLifer1_F_HM_Scale_x001:file2.ofu"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:place2dTexture1.ofv" "LowLifer1_F_HM_Scale_x001:file2.ofv"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:place2dTexture1.rf" "LowLifer1_F_HM_Scale_x001:file2.rf"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:place2dTexture1.reu" "LowLifer1_F_HM_Scale_x001:file2.reu"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:place2dTexture1.rev" "LowLifer1_F_HM_Scale_x001:file2.rev"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:place2dTexture1.vt1" "LowLifer1_F_HM_Scale_x001:file2.vt1"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:place2dTexture1.vt2" "LowLifer1_F_HM_Scale_x001:file2.vt2"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:place2dTexture1.vt3" "LowLifer1_F_HM_Scale_x001:file2.vt3"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:place2dTexture1.vc1" "LowLifer1_F_HM_Scale_x001:file2.vc1"
		;
connectAttr "LowLifer1_F_HM_Scale_x001:place2dTexture1.ofs" "LowLifer1_F_HM_Scale_x001:file2.fs"
		;
connectAttr ":defaultColorMgtGlobals.cme" "LowLifer1_F_HM_Scale_x001:file2.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "LowLifer1_F_HM_Scale_x001:file2.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "LowLifer1_F_HM_Scale_x001:file2.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "LowLifer1_F_HM_Scale_x001:file2.ws";
connectAttr "BalefulEye1_F_HM_scale_x001:_Checker.o" "BalefulEye1_F_HM_scale_x001:_Checker_tex.uv"
		;
connectAttr "BalefulEye1_F_HM_scale_x001:_Checker.ofs" "BalefulEye1_F_HM_scale_x001:_Checker_tex.fs"
		;
connectAttr "BalefulEye1_F_HM_scale_x001:atlas_1.oc" "BalefulEye1_F_HM_scale_x001:blinn1SG.ss"
		;
connectAttr "BalefulEye1_F_HM_scale_x001:blinn1SG.msg" "BalefulEye1_F_HM_scale_x001:materialInfo5.sg"
		;
connectAttr "BalefulEye1_F_HM_scale_x001:atlas_1.msg" "BalefulEye1_F_HM_scale_x001:materialInfo5.m"
		;
connectAttr "file1.oc" "IndustrialWorker1_F_HM_Scale_x001:atlas_1.c";
connectAttr "file1.ot" "IndustrialWorker1_F_HM_Scale_x001:atlas_1.it";
connectAttr "IndustrialWorker1_F_HM_Scale_x001:atlas_1.oc" "IndustrialWorker1_F_HM_Scale_x001:blinn1SG.ss"
		;
connectAttr "IndustrialWorker1_F_HM_Scale_x001:blinn1SG.msg" "IndustrialWorker1_F_HM_Scale_x001:materialInfo1.sg"
		;
connectAttr "IndustrialWorker1_F_HM_Scale_x001:atlas_1.msg" "IndustrialWorker1_F_HM_Scale_x001:materialInfo1.m"
		;
connectAttr "file1.msg" "IndustrialWorker1_F_HM_Scale_x001:materialInfo1.t" -na;
connectAttr "IndustrialWorker1_F_HM_Scale_x001:blinn1SG.msg" "IndustrialWorker1_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "IndustrialWorker1_F_HM_Scale_x001:atlas_1.msg" "IndustrialWorker1_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "file2.oc" "AgriWorker1_F_HM_Scale_x001:atlas_1.c";
connectAttr "file2.ot" "AgriWorker1_F_HM_Scale_x001:atlas_1.it";
connectAttr "AgriWorker1_F_HM_Scale_x001:atlas_1.oc" "AgriWorker1_F_HM_Scale_x001:blinn1SG.ss"
		;
connectAttr "AgriWorker1_F_HM_Scale_x001:blinn1SG.msg" "AgriWorker1_F_HM_Scale_x001:materialInfo1.sg"
		;
connectAttr "AgriWorker1_F_HM_Scale_x001:atlas_1.msg" "AgriWorker1_F_HM_Scale_x001:materialInfo1.m"
		;
connectAttr "file2.msg" "AgriWorker1_F_HM_Scale_x001:materialInfo1.t" -na;
connectAttr "AgriWorker1_F_HM_Scale_x001:atlas_1.msg" "AgriWorker1_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "AgriWorker1_F_HM_Scale_x001:blinn1SG.msg" "AgriWorker1_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "GangMember4_F_HM_Scale_x001:file1.oc" "GangMember4_F_HM_Scale_x001:atlas_1.c"
		;
connectAttr "GangMember4_F_HM_Scale_x001:file1.ot" "GangMember4_F_HM_Scale_x001:atlas_1.it"
		;
connectAttr "GangMember4_F_HM_Scale_x001:atlas_1.oc" "GangMember4_F_HM_Scale_x001:blinn1SG.ss"
		;
connectAttr "GangMember4_F_HM_Scale_x001:blinn1SG.msg" "GangMember4_F_HM_Scale_x001:materialInfo1.sg"
		;
connectAttr "GangMember4_F_HM_Scale_x001:atlas_1.msg" "GangMember4_F_HM_Scale_x001:materialInfo1.m"
		;
connectAttr "GangMember4_F_HM_Scale_x001:file1.msg" "GangMember4_F_HM_Scale_x001:materialInfo1.t"
		 -na;
connectAttr ":defaultColorMgtGlobals.cme" "GangMember4_F_HM_Scale_x001:file1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "GangMember4_F_HM_Scale_x001:file1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "GangMember4_F_HM_Scale_x001:file1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "GangMember4_F_HM_Scale_x001:file1.ws"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.c" "GangMember4_F_HM_Scale_x001:file1.c"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.tf" "GangMember4_F_HM_Scale_x001:file1.tf"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.rf" "GangMember4_F_HM_Scale_x001:file1.rf"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.mu" "GangMember4_F_HM_Scale_x001:file1.mu"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.mv" "GangMember4_F_HM_Scale_x001:file1.mv"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.s" "GangMember4_F_HM_Scale_x001:file1.s"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.wu" "GangMember4_F_HM_Scale_x001:file1.wu"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.wv" "GangMember4_F_HM_Scale_x001:file1.wv"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.re" "GangMember4_F_HM_Scale_x001:file1.re"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.of" "GangMember4_F_HM_Scale_x001:file1.of"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.r" "GangMember4_F_HM_Scale_x001:file1.ro"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.n" "GangMember4_F_HM_Scale_x001:file1.n"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.vt1" "GangMember4_F_HM_Scale_x001:file1.vt1"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.vt2" "GangMember4_F_HM_Scale_x001:file1.vt2"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.vt3" "GangMember4_F_HM_Scale_x001:file1.vt3"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.vc1" "GangMember4_F_HM_Scale_x001:file1.vc1"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.o" "GangMember4_F_HM_Scale_x001:file1.uv"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.ofs" "GangMember4_F_HM_Scale_x001:file1.fs"
		;
connectAttr "GangMember4_F_HM_Scale_x001:blinn1SG.msg" "GangMember4_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo1.tgi[0].ni[0].dn"
		;
connectAttr "GangMember4_F_HM_Scale_x001:file1.msg" "GangMember4_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo1.tgi[0].ni[1].dn"
		;
connectAttr "GangMember4_F_HM_Scale_x001:atlas_1.msg" "GangMember4_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo1.tgi[0].ni[2].dn"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.msg" "GangMember4_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo1.tgi[0].ni[3].dn"
		;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.msg" "GangMember4_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "GangMember4_F_HM_Scale_x001:file1.msg" "GangMember4_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "GangMember4_F_HM_Scale_x001:blinn1SG.msg" "GangMember4_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "GangMember4_F_HM_Scale_x001:atlas_1.msg" "GangMember4_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "file3.oc" "FootfallWorker1_F_HM_Scale_x001:atlas_1.c";
connectAttr "file3.ot" "FootfallWorker1_F_HM_Scale_x001:atlas_1.it";
connectAttr "FootfallWorker1_F_HM_Scale_x001:atlas_1.oc" "FootfallWorker1_F_HM_Scale_x001:blinn1SG.ss"
		;
connectAttr "FootfallWorker1_F_HM_Scale_x001:blinn1SG.msg" "FootfallWorker1_F_HM_Scale_x001:materialInfo1.sg"
		;
connectAttr "FootfallWorker1_F_HM_Scale_x001:atlas_1.msg" "FootfallWorker1_F_HM_Scale_x001:materialInfo1.m"
		;
connectAttr "file3.msg" "FootfallWorker1_F_HM_Scale_x001:materialInfo1.t" -na;
connectAttr "FootfallWorker1_F_HM_Scale_x001:atlas_1.msg" "FootfallWorker1_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "FootfallWorker1_F_HM_Scale_x001:blinn1SG.msg" "FootfallWorker1_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr ":defaultColorMgtGlobals.cme" "file1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file1.ws";
connectAttr "place2dTexture1.c" "file1.c";
connectAttr "place2dTexture1.tf" "file1.tf";
connectAttr "place2dTexture1.rf" "file1.rf";
connectAttr "place2dTexture1.mu" "file1.mu";
connectAttr "place2dTexture1.mv" "file1.mv";
connectAttr "place2dTexture1.s" "file1.s";
connectAttr "place2dTexture1.wu" "file1.wu";
connectAttr "place2dTexture1.wv" "file1.wv";
connectAttr "place2dTexture1.re" "file1.re";
connectAttr "place2dTexture1.of" "file1.of";
connectAttr "place2dTexture1.r" "file1.ro";
connectAttr "place2dTexture1.n" "file1.n";
connectAttr "place2dTexture1.vt1" "file1.vt1";
connectAttr "place2dTexture1.vt2" "file1.vt2";
connectAttr "place2dTexture1.vt3" "file1.vt3";
connectAttr "place2dTexture1.vc1" "file1.vc1";
connectAttr "place2dTexture1.o" "file1.uv";
connectAttr "place2dTexture1.ofs" "file1.fs";
connectAttr ":initialShadingGroup.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr ":lambert1.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr ":initialParticleSE.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr ":defaultColorMgtGlobals.cme" "file2.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file2.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file2.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file2.ws";
connectAttr "place2dTexture2.c" "file2.c";
connectAttr "place2dTexture2.tf" "file2.tf";
connectAttr "place2dTexture2.rf" "file2.rf";
connectAttr "place2dTexture2.mu" "file2.mu";
connectAttr "place2dTexture2.mv" "file2.mv";
connectAttr "place2dTexture2.s" "file2.s";
connectAttr "place2dTexture2.wu" "file2.wu";
connectAttr "place2dTexture2.wv" "file2.wv";
connectAttr "place2dTexture2.re" "file2.re";
connectAttr "place2dTexture2.of" "file2.of";
connectAttr "place2dTexture2.r" "file2.ro";
connectAttr "place2dTexture2.n" "file2.n";
connectAttr "place2dTexture2.vt1" "file2.vt1";
connectAttr "place2dTexture2.vt2" "file2.vt2";
connectAttr "place2dTexture2.vt3" "file2.vt3";
connectAttr "place2dTexture2.vc1" "file2.vc1";
connectAttr "place2dTexture2.o" "file2.uv";
connectAttr "place2dTexture2.ofs" "file2.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file3.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file3.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file3.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file3.ws";
connectAttr "place2dTexture3.c" "file3.c";
connectAttr "place2dTexture3.tf" "file3.tf";
connectAttr "place2dTexture3.rf" "file3.rf";
connectAttr "place2dTexture3.mu" "file3.mu";
connectAttr "place2dTexture3.mv" "file3.mv";
connectAttr "place2dTexture3.s" "file3.s";
connectAttr "place2dTexture3.wu" "file3.wu";
connectAttr "place2dTexture3.wv" "file3.wv";
connectAttr "place2dTexture3.re" "file3.re";
connectAttr "place2dTexture3.of" "file3.of";
connectAttr "place2dTexture3.r" "file3.ro";
connectAttr "place2dTexture3.n" "file3.n";
connectAttr "place2dTexture3.vt1" "file3.vt1";
connectAttr "place2dTexture3.vt2" "file3.vt2";
connectAttr "place2dTexture3.vt3" "file3.vt3";
connectAttr "place2dTexture3.vc1" "file3.vc1";
connectAttr "place2dTexture3.o" "file3.uv";
connectAttr "place2dTexture3.ofs" "file3.fs";
connectAttr "Drukhari_Medusae_F_HM_scale_x001:Atlas_1.oc" "Drukhari_Medusae_F_HM_scale_x001:blinn1SG.ss"
		;
connectAttr "Drukhari_Medusae_F_HM_scale_x001:blinn1SG.msg" "Drukhari_Medusae_F_HM_scale_x001:materialInfo3.sg"
		;
connectAttr "Drukhari_Medusae_F_HM_scale_x001:Atlas_1.msg" "Drukhari_Medusae_F_HM_scale_x001:materialInfo3.m"
		;
connectAttr "file4.msg" "Drukhari_Medusae_F_HM_scale_x001:materialInfo3.t" -na;
connectAttr "file4.oc" "Drukhari_Medusae_F_HM_scale_x001:Atlas_1.c";
connectAttr "file4.ot" "Drukhari_Medusae_F_HM_scale_x001:Atlas_1.it";
connectAttr "Drukhari_Medusae_F_HM_scale_x001:blinn1SG.msg" "Drukhari_Medusae_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "Drukhari_Medusae_F_HM_scale_x001:Atlas_1.msg" "Drukhari_Medusae_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr ":defaultColorMgtGlobals.cme" "file4.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file4.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file4.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file4.ws";
connectAttr "place2dTexture4.c" "file4.c";
connectAttr "place2dTexture4.tf" "file4.tf";
connectAttr "place2dTexture4.rf" "file4.rf";
connectAttr "place2dTexture4.mu" "file4.mu";
connectAttr "place2dTexture4.mv" "file4.mv";
connectAttr "place2dTexture4.s" "file4.s";
connectAttr "place2dTexture4.wu" "file4.wu";
connectAttr "place2dTexture4.wv" "file4.wv";
connectAttr "place2dTexture4.re" "file4.re";
connectAttr "place2dTexture4.of" "file4.of";
connectAttr "place2dTexture4.r" "file4.ro";
connectAttr "place2dTexture4.n" "file4.n";
connectAttr "place2dTexture4.vt1" "file4.vt1";
connectAttr "place2dTexture4.vt2" "file4.vt2";
connectAttr "place2dTexture4.vt3" "file4.vt3";
connectAttr "place2dTexture4.vc1" "file4.vc1";
connectAttr "place2dTexture4.o" "file4.uv";
connectAttr "place2dTexture4.ofs" "file4.fs";
connectAttr "Cloak1_F_HM_Scale_x001:atlas_1.oc" "Cloak1_F_HM_Scale_x001:atlas_1SG.ss"
		;
connectAttr "Cloak1_F_HM_Scale_x001:atlas_1SG.msg" "Cloak1_F_HM_Scale_x001:materialInfo16.sg"
		;
connectAttr "Cloak1_F_HM_Scale_x001:atlas_1.msg" "Cloak1_F_HM_Scale_x001:materialInfo16.m"
		;
connectAttr "Cloak1_F_HM_Scale_x001:CP_Cloak1.oc" "Cloak1_F_HM_Scale_x001:blinn1SG.ss"
		;
connectAttr "Cloak1_F_HM_Scale_x001:blinn1SG.msg" "Cloak1_F_HM_Scale_x001:materialInfo18.sg"
		;
connectAttr "Cloak1_F_HM_Scale_x001:CP_Cloak1.msg" "Cloak1_F_HM_Scale_x001:materialInfo18.m"
		;
connectAttr "lambert3.oc" "lambert3SG.ss";
connectAttr "lambert3SG.msg" "materialInfo7.sg";
connectAttr "lambert3.msg" "materialInfo7.m";
connectAttr "GangMember3_F_HM_Scale_x001:atlas_1.oc" "GangMember3_F_HM_Scale_x001:blinn1SG.ss"
		;
connectAttr "GangMember3_F_HM_Scale_x001:blinn1SG.msg" "GangMember3_F_HM_Scale_x001:materialInfo1.sg"
		;
connectAttr "GangMember3_F_HM_Scale_x001:atlas_1.msg" "GangMember3_F_HM_Scale_x001:materialInfo1.m"
		;
connectAttr "GangMember3_F_HM_Scale_x001:atlas_1.msg" "GangMember3_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "GangMember3_F_HM_Scale_x001:blinn1SG.msg" "GangMember3_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:bump2d1.o" "TheodoraClothes_F_HM_Scale_x001:atlas_1.n"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:atlas_1.oc" "TheodoraClothes_F_HM_Scale_x001:blinn2SG.ss"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:blinn2SG.msg" "TheodoraClothes_F_HM_Scale_x001:materialInfo5.sg"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:atlas_1.msg" "TheodoraClothes_F_HM_Scale_x001:materialInfo5.m"
		;
connectAttr ":defaultColorMgtGlobals.cme" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.ws"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.c" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.c"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.tf" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.tf"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.rf" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.rf"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.mu" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.mu"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.mv" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.mv"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.s" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.s"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.wu" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.wu"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.wv" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.wv"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.re" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.re"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.of" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.of"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.r" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.ro"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.n" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.n"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.vt1" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.vt1"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.vt2" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.vt2"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.vt3" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.vt3"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.vc1" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.vc1"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.o" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.uv"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.ofs" "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.fs"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.oa" "TheodoraClothes_F_HM_Scale_x001:bump2d1.bv"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.msg" "TheodoraClothes_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.msg" "TheodoraClothes_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:bump2d1.msg" "TheodoraClothes_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:atlas_1.msg" "TheodoraClothes_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "file5.oc" "lambert4.c";
connectAttr "lambert4.oc" "lambert4SG.ss";
connectAttr "lambert4SG.msg" "materialInfo8.sg";
connectAttr "lambert4.msg" "materialInfo8.m";
connectAttr "file5.msg" "materialInfo8.t" -na;
connectAttr ":defaultColorMgtGlobals.cme" "file5.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file5.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file5.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file5.ws";
connectAttr "place2dTexture5.c" "file5.c";
connectAttr "place2dTexture5.tf" "file5.tf";
connectAttr "place2dTexture5.rf" "file5.rf";
connectAttr "place2dTexture5.mu" "file5.mu";
connectAttr "place2dTexture5.mv" "file5.mv";
connectAttr "place2dTexture5.s" "file5.s";
connectAttr "place2dTexture5.wu" "file5.wu";
connectAttr "place2dTexture5.wv" "file5.wv";
connectAttr "place2dTexture5.re" "file5.re";
connectAttr "place2dTexture5.of" "file5.of";
connectAttr "place2dTexture5.r" "file5.ro";
connectAttr "place2dTexture5.n" "file5.n";
connectAttr "place2dTexture5.vt1" "file5.vt1";
connectAttr "place2dTexture5.vt2" "file5.vt2";
connectAttr "place2dTexture5.vt3" "file5.vt3";
connectAttr "place2dTexture5.vc1" "file5.vc1";
connectAttr "place2dTexture5.o" "file5.uv";
connectAttr "place2dTexture5.ofs" "file5.fs";
connectAttr "Jay_Body:AT_Djai_F_HM_d_Recovered_2.oc" "Jay_Body:Jay_body1.c";
connectAttr "Jay_Body:AT_Djai_F_HM_d_Recovered_2.ot" "Jay_Body:Jay_body1.it";
connectAttr "Jay_Body:Jay_body1.oc" "SP_Jae_F_HMSG1.ss";
connectAttr "SP_Jae_F_HMSG1.msg" "materialInfo10.sg";
connectAttr "Jay_Body:Jay_body1.msg" "materialInfo10.m";
connectAttr "Jay_Body:AT_Djai_F_HM_d_Recovered_2.msg" "materialInfo10.t" -na;
connectAttr "place2dTexture7.o" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.uv";
connectAttr "place2dTexture7.ofu" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.ofu";
connectAttr "place2dTexture7.ofv" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.ofv";
connectAttr "place2dTexture7.rf" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.rf";
connectAttr "place2dTexture7.reu" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.reu";
connectAttr "place2dTexture7.rev" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.rev";
connectAttr "place2dTexture7.vt1" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.vt1";
connectAttr "place2dTexture7.vt2" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.vt2";
connectAttr "place2dTexture7.vt3" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.vt3";
connectAttr "place2dTexture7.vc1" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.vc1";
connectAttr "place2dTexture7.ofs" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.fs";
connectAttr ":defaultColorMgtGlobals.cme" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "Jay_Body:AT_Djai_F_HM_d_Recovered_2.ws"
		;
connectAttr "FlakArmor_F_HM_scale_x001:file13.oc" "FlakArmor_F_HM_scale_x001:atlas_1.c"
		;
connectAttr "FlakArmor_F_HM_scale_x001:file13.ot" "FlakArmor_F_HM_scale_x001:atlas_1.it"
		;
connectAttr "FlakArmor_F_HM_scale_x001:atlas_1.oc" "FlakArmor_F_HM_scale_x001:blinn1SG.ss"
		;
connectAttr "FlakArmor_F_HM_scale_x001:blinn1SG.msg" "FlakArmor_F_HM_scale_x001:materialInfo8.sg"
		;
connectAttr "FlakArmor_F_HM_scale_x001:atlas_1.msg" "FlakArmor_F_HM_scale_x001:materialInfo8.m"
		;
connectAttr "FlakArmor_F_HM_scale_x001:file13.msg" "FlakArmor_F_HM_scale_x001:materialInfo8.t"
		 -na;
connectAttr ":defaultColorMgtGlobals.cme" "FlakArmor_F_HM_scale_x001:file13.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "FlakArmor_F_HM_scale_x001:file13.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "FlakArmor_F_HM_scale_x001:file13.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "FlakArmor_F_HM_scale_x001:file13.ws";
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.c" "FlakArmor_F_HM_scale_x001:file13.c"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.tf" "FlakArmor_F_HM_scale_x001:file13.tf"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.rf" "FlakArmor_F_HM_scale_x001:file13.rf"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.mu" "FlakArmor_F_HM_scale_x001:file13.mu"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.mv" "FlakArmor_F_HM_scale_x001:file13.mv"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.s" "FlakArmor_F_HM_scale_x001:file13.s"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.wu" "FlakArmor_F_HM_scale_x001:file13.wu"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.wv" "FlakArmor_F_HM_scale_x001:file13.wv"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.re" "FlakArmor_F_HM_scale_x001:file13.re"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.of" "FlakArmor_F_HM_scale_x001:file13.of"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.r" "FlakArmor_F_HM_scale_x001:file13.ro"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.n" "FlakArmor_F_HM_scale_x001:file13.n"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.vt1" "FlakArmor_F_HM_scale_x001:file13.vt1"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.vt2" "FlakArmor_F_HM_scale_x001:file13.vt2"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.vt3" "FlakArmor_F_HM_scale_x001:file13.vt3"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.vc1" "FlakArmor_F_HM_scale_x001:file13.vc1"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.o" "FlakArmor_F_HM_scale_x001:file13.uv"
		;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.ofs" "FlakArmor_F_HM_scale_x001:file13.fs"
		;
connectAttr "FlakArmor_F_HM_scale_x001:blinn1SG.msg" "FlakArmor_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "FlakArmor_F_HM_scale_x001:atlas_1.msg" "FlakArmor_F_HM_scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "HD_Head01_F_HM_1.oc" "lambert5.c";
connectAttr "lambert5.oc" "EY_Eyes02_F_HMSG.ss";
connectAttr "EY_Eyes02_F_HMSG.msg" "materialInfo11.sg";
connectAttr "lambert5.msg" "materialInfo11.m";
connectAttr "HD_Head01_F_HM_1.msg" "materialInfo11.t" -na;
connectAttr "place2dTexture8.o" "HD_Head01_F_HM_1.uv";
connectAttr "place2dTexture8.ofu" "HD_Head01_F_HM_1.ofu";
connectAttr "place2dTexture8.ofv" "HD_Head01_F_HM_1.ofv";
connectAttr "place2dTexture8.rf" "HD_Head01_F_HM_1.rf";
connectAttr "place2dTexture8.reu" "HD_Head01_F_HM_1.reu";
connectAttr "place2dTexture8.rev" "HD_Head01_F_HM_1.rev";
connectAttr "place2dTexture8.vt1" "HD_Head01_F_HM_1.vt1";
connectAttr "place2dTexture8.vt2" "HD_Head01_F_HM_1.vt2";
connectAttr "place2dTexture8.vt3" "HD_Head01_F_HM_1.vt3";
connectAttr "place2dTexture8.vc1" "HD_Head01_F_HM_1.vc1";
connectAttr "place2dTexture8.ofs" "HD_Head01_F_HM_1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "HD_Head01_F_HM_1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "HD_Head01_F_HM_1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "HD_Head01_F_HM_1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "HD_Head01_F_HM_1.ws";
connectAttr "HD_Head01_F_HM_1.oc" "lambert6.c";
connectAttr "lambert6.oc" "HH_Hair02_F_HMSG.ss";
connectAttr "HH_Hair02_F_HMSG.msg" "materialInfo12.sg";
connectAttr "lambert6.msg" "materialInfo12.m";
connectAttr "HD_Head01_F_HM_1.msg" "materialInfo12.t" -na;
connectAttr "Eyewear1_F_HM_Scale_x002:file7.oc" "Eyewear1_F_HM_Scale_x002:Atlas1.c"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:file7.ot" "Eyewear1_F_HM_Scale_x002:Atlas1.it"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:Atlas1.oc" "Eyewear1_F_HM_Scale_x002:lambert2SG.ss"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:lambert2SG.msg" "Eyewear1_F_HM_Scale_x002:materialInfo8.sg"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:Atlas1.msg" "Eyewear1_F_HM_Scale_x002:materialInfo8.m"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:file7.msg" "Eyewear1_F_HM_Scale_x002:materialInfo8.t"
		 -na;
connectAttr "Eyewear1_F_HM_Scale_x002:lambert2SG.msg" "Eyewear1_F_HM_Scale_x002:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:Atlas1.msg" "Eyewear1_F_HM_Scale_x002:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr ":defaultColorMgtGlobals.cme" "Eyewear1_F_HM_Scale_x002:file7.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "Eyewear1_F_HM_Scale_x002:file7.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "Eyewear1_F_HM_Scale_x002:file7.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "Eyewear1_F_HM_Scale_x002:file7.ws";
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.c" "Eyewear1_F_HM_Scale_x002:file7.c"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.tf" "Eyewear1_F_HM_Scale_x002:file7.tf"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.rf" "Eyewear1_F_HM_Scale_x002:file7.rf"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.mu" "Eyewear1_F_HM_Scale_x002:file7.mu"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.mv" "Eyewear1_F_HM_Scale_x002:file7.mv"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.s" "Eyewear1_F_HM_Scale_x002:file7.s"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.wu" "Eyewear1_F_HM_Scale_x002:file7.wu"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.wv" "Eyewear1_F_HM_Scale_x002:file7.wv"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.re" "Eyewear1_F_HM_Scale_x002:file7.re"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.of" "Eyewear1_F_HM_Scale_x002:file7.of"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.r" "Eyewear1_F_HM_Scale_x002:file7.ro"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.n" "Eyewear1_F_HM_Scale_x002:file7.n"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.vt1" "Eyewear1_F_HM_Scale_x002:file7.vt1"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.vt2" "Eyewear1_F_HM_Scale_x002:file7.vt2"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.vt3" "Eyewear1_F_HM_Scale_x002:file7.vt3"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.vc1" "Eyewear1_F_HM_Scale_x002:file7.vc1"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.o" "Eyewear1_F_HM_Scale_x002:file7.uv"
		;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.ofs" "Eyewear1_F_HM_Scale_x002:file7.fs"
		;
connectAttr "AT_Jay_F_HH_d_3.oc" "lambert8.c";
connectAttr "lambert8.oc" "HH_Hair09_F_HMSG.ss";
connectAttr "HH_Hair09_F_HMSG.msg" "materialInfo14.sg";
connectAttr "lambert8.msg" "materialInfo14.m";
connectAttr "AT_Jay_F_HH_d_3.msg" "materialInfo14.t" -na;
connectAttr "place2dTexture9.o" "AT_Jay_F_HH_d_3.uv";
connectAttr "place2dTexture9.ofu" "AT_Jay_F_HH_d_3.ofu";
connectAttr "place2dTexture9.ofv" "AT_Jay_F_HH_d_3.ofv";
connectAttr "place2dTexture9.rf" "AT_Jay_F_HH_d_3.rf";
connectAttr "place2dTexture9.reu" "AT_Jay_F_HH_d_3.reu";
connectAttr "place2dTexture9.rev" "AT_Jay_F_HH_d_3.rev";
connectAttr "place2dTexture9.vt1" "AT_Jay_F_HH_d_3.vt1";
connectAttr "place2dTexture9.vt2" "AT_Jay_F_HH_d_3.vt2";
connectAttr "place2dTexture9.vt3" "AT_Jay_F_HH_d_3.vt3";
connectAttr "place2dTexture9.vc1" "AT_Jay_F_HH_d_3.vc1";
connectAttr "place2dTexture9.ofs" "AT_Jay_F_HH_d_3.fs";
connectAttr ":defaultColorMgtGlobals.cme" "AT_Jay_F_HH_d_3.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "AT_Jay_F_HH_d_3.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "AT_Jay_F_HH_d_3.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "AT_Jay_F_HH_d_3.ws";
connectAttr "AT_Djai_F_HM_d_Recovered_1.oc" "lambert9.c";
connectAttr "lambert9.oc" "HD_Head09_F_HMSG.ss";
connectAttr "HD_Head09_F_HMSG.msg" "materialInfo15.sg";
connectAttr "lambert9.msg" "materialInfo15.m";
connectAttr "AT_Djai_F_HM_d_Recovered_1.msg" "materialInfo15.t" -na;
connectAttr "place2dTexture10.o" "AT_Djai_F_HM_d_Recovered_1.uv";
connectAttr "place2dTexture10.ofu" "AT_Djai_F_HM_d_Recovered_1.ofu";
connectAttr "place2dTexture10.ofv" "AT_Djai_F_HM_d_Recovered_1.ofv";
connectAttr "place2dTexture10.rf" "AT_Djai_F_HM_d_Recovered_1.rf";
connectAttr "place2dTexture10.reu" "AT_Djai_F_HM_d_Recovered_1.reu";
connectAttr "place2dTexture10.rev" "AT_Djai_F_HM_d_Recovered_1.rev";
connectAttr "place2dTexture10.vt1" "AT_Djai_F_HM_d_Recovered_1.vt1";
connectAttr "place2dTexture10.vt2" "AT_Djai_F_HM_d_Recovered_1.vt2";
connectAttr "place2dTexture10.vt3" "AT_Djai_F_HM_d_Recovered_1.vt3";
connectAttr "place2dTexture10.vc1" "AT_Djai_F_HM_d_Recovered_1.vc1";
connectAttr "place2dTexture10.ofs" "AT_Djai_F_HM_d_Recovered_1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "AT_Djai_F_HM_d_Recovered_1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "AT_Djai_F_HM_d_Recovered_1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "AT_Djai_F_HM_d_Recovered_1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "AT_Djai_F_HM_d_Recovered_1.ws";
connectAttr "FlakArmor_F_HM_scale_x002:file13.oc" "FlakArmor_F_HM_scale_x002:atlas_1.c"
		;
connectAttr "FlakArmor_F_HM_scale_x002:file13.ot" "FlakArmor_F_HM_scale_x002:atlas_1.it"
		;
connectAttr "FlakArmor_F_HM_scale_x002:atlas_1.oc" "FlakArmor_F_HM_scale_x002:blinn1SG.ss"
		;
connectAttr "FlakArmor_F_HM_scale_x002:blinn1SG.msg" "FlakArmor_F_HM_scale_x002:materialInfo8.sg"
		;
connectAttr "FlakArmor_F_HM_scale_x002:atlas_1.msg" "FlakArmor_F_HM_scale_x002:materialInfo8.m"
		;
connectAttr "FlakArmor_F_HM_scale_x002:file13.msg" "FlakArmor_F_HM_scale_x002:materialInfo8.t"
		 -na;
connectAttr ":defaultColorMgtGlobals.cme" "FlakArmor_F_HM_scale_x002:file13.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "FlakArmor_F_HM_scale_x002:file13.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "FlakArmor_F_HM_scale_x002:file13.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "FlakArmor_F_HM_scale_x002:file13.ws";
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.c" "FlakArmor_F_HM_scale_x002:file13.c"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.tf" "FlakArmor_F_HM_scale_x002:file13.tf"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.rf" "FlakArmor_F_HM_scale_x002:file13.rf"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.mu" "FlakArmor_F_HM_scale_x002:file13.mu"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.mv" "FlakArmor_F_HM_scale_x002:file13.mv"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.s" "FlakArmor_F_HM_scale_x002:file13.s"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.wu" "FlakArmor_F_HM_scale_x002:file13.wu"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.wv" "FlakArmor_F_HM_scale_x002:file13.wv"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.re" "FlakArmor_F_HM_scale_x002:file13.re"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.of" "FlakArmor_F_HM_scale_x002:file13.of"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.r" "FlakArmor_F_HM_scale_x002:file13.ro"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.n" "FlakArmor_F_HM_scale_x002:file13.n"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.vt1" "FlakArmor_F_HM_scale_x002:file13.vt1"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.vt2" "FlakArmor_F_HM_scale_x002:file13.vt2"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.vt3" "FlakArmor_F_HM_scale_x002:file13.vt3"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.vc1" "FlakArmor_F_HM_scale_x002:file13.vc1"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.o" "FlakArmor_F_HM_scale_x002:file13.uv"
		;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.ofs" "FlakArmor_F_HM_scale_x002:file13.fs"
		;
connectAttr "FlakArmor_F_HM_scale_x002:blinn1SG.msg" "FlakArmor_F_HM_scale_x002:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "FlakArmor_F_HM_scale_x002:atlas_1.msg" "FlakArmor_F_HM_scale_x002:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "Eyewear2_F_HM_Scale_x001:Atlas_1.oc" "Eyewear2_F_HM_Scale_x001:blinn1SG.ss"
		;
connectAttr "Eyewear2_F_HM_Scale_x001:blinn1SG.msg" "Eyewear2_F_HM_Scale_x001:materialInfo2.sg"
		;
connectAttr "Eyewear2_F_HM_Scale_x001:Atlas_1.msg" "Eyewear2_F_HM_Scale_x001:materialInfo2.m"
		;
connectAttr "Eyewear2_F_HM_Scale_x001:Atlas_1.msg" "Eyewear2_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "Eyewear2_F_HM_Scale_x001:blinn1SG.msg" "Eyewear2_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "Boots1_F_HM_Scale_x001:file11.oc" "Boots1_F_HM_Scale_x001:Atlas1.c"
		;
connectAttr "Boots1_F_HM_Scale_x001:file11.ot" "Boots1_F_HM_Scale_x001:Atlas1.it"
		;
connectAttr "Boots1_F_HM_Scale_x001:bump2d7.o" "Boots1_F_HM_Scale_x001:Atlas1.n"
		;
connectAttr "Boots1_F_HM_Scale_x001:Atlas1.oc" "Boots1_F_HM_Scale_x001:lambert2SG.ss"
		;
connectAttr "Boots1_F_HM_Scale_x001:lambert2SG.msg" "Boots1_F_HM_Scale_x001:materialInfo14.sg"
		;
connectAttr "Boots1_F_HM_Scale_x001:Atlas1.msg" "Boots1_F_HM_Scale_x001:materialInfo14.m"
		;
connectAttr "Boots1_F_HM_Scale_x001:file11.msg" "Boots1_F_HM_Scale_x001:materialInfo14.t"
		 -na;
connectAttr ":defaultColorMgtGlobals.cme" "Boots1_F_HM_Scale_x001:file11.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "Boots1_F_HM_Scale_x001:file11.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "Boots1_F_HM_Scale_x001:file11.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "Boots1_F_HM_Scale_x001:file11.ws";
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.c" "Boots1_F_HM_Scale_x001:file11.c"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.tf" "Boots1_F_HM_Scale_x001:file11.tf"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.rf" "Boots1_F_HM_Scale_x001:file11.rf"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.mu" "Boots1_F_HM_Scale_x001:file11.mu"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.mv" "Boots1_F_HM_Scale_x001:file11.mv"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.s" "Boots1_F_HM_Scale_x001:file11.s"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.wu" "Boots1_F_HM_Scale_x001:file11.wu"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.wv" "Boots1_F_HM_Scale_x001:file11.wv"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.re" "Boots1_F_HM_Scale_x001:file11.re"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.of" "Boots1_F_HM_Scale_x001:file11.of"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.r" "Boots1_F_HM_Scale_x001:file11.ro"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.n" "Boots1_F_HM_Scale_x001:file11.n"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.vt1" "Boots1_F_HM_Scale_x001:file11.vt1"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.vt2" "Boots1_F_HM_Scale_x001:file11.vt2"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.vt3" "Boots1_F_HM_Scale_x001:file11.vt3"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.vc1" "Boots1_F_HM_Scale_x001:file11.vc1"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.o" "Boots1_F_HM_Scale_x001:file11.uv"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.ofs" "Boots1_F_HM_Scale_x001:file11.fs"
		;
connectAttr ":defaultColorMgtGlobals.cme" "Boots1_F_HM_Scale_x001:file12.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "Boots1_F_HM_Scale_x001:file12.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "Boots1_F_HM_Scale_x001:file12.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "Boots1_F_HM_Scale_x001:file12.ws";
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.c" "Boots1_F_HM_Scale_x001:file12.c"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.tf" "Boots1_F_HM_Scale_x001:file12.tf"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.rf" "Boots1_F_HM_Scale_x001:file12.rf"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.mu" "Boots1_F_HM_Scale_x001:file12.mu"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.mv" "Boots1_F_HM_Scale_x001:file12.mv"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.s" "Boots1_F_HM_Scale_x001:file12.s"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.wu" "Boots1_F_HM_Scale_x001:file12.wu"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.wv" "Boots1_F_HM_Scale_x001:file12.wv"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.re" "Boots1_F_HM_Scale_x001:file12.re"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.of" "Boots1_F_HM_Scale_x001:file12.of"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.r" "Boots1_F_HM_Scale_x001:file12.ro"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.n" "Boots1_F_HM_Scale_x001:file12.n"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.vt1" "Boots1_F_HM_Scale_x001:file12.vt1"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.vt2" "Boots1_F_HM_Scale_x001:file12.vt2"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.vt3" "Boots1_F_HM_Scale_x001:file12.vt3"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.vc1" "Boots1_F_HM_Scale_x001:file12.vc1"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.o" "Boots1_F_HM_Scale_x001:file12.uv"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.ofs" "Boots1_F_HM_Scale_x001:file12.fs"
		;
connectAttr "Boots1_F_HM_Scale_x001:file12.oa" "Boots1_F_HM_Scale_x001:bump2d7.bv"
		;
connectAttr "Boots1_F_HM_Scale_x001:file13.oa" "Boots1_F_HM_Scale_x001:bump2d7.bd"
		;
connectAttr ":defaultColorMgtGlobals.cme" "Boots1_F_HM_Scale_x001:file13.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "Boots1_F_HM_Scale_x001:file13.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "Boots1_F_HM_Scale_x001:file13.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "Boots1_F_HM_Scale_x001:file13.ws";
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.c" "Boots1_F_HM_Scale_x001:file13.c"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.tf" "Boots1_F_HM_Scale_x001:file13.tf"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.rf" "Boots1_F_HM_Scale_x001:file13.rf"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.mu" "Boots1_F_HM_Scale_x001:file13.mu"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.mv" "Boots1_F_HM_Scale_x001:file13.mv"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.s" "Boots1_F_HM_Scale_x001:file13.s"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.wu" "Boots1_F_HM_Scale_x001:file13.wu"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.wv" "Boots1_F_HM_Scale_x001:file13.wv"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.re" "Boots1_F_HM_Scale_x001:file13.re"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.of" "Boots1_F_HM_Scale_x001:file13.of"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.r" "Boots1_F_HM_Scale_x001:file13.ro"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.n" "Boots1_F_HM_Scale_x001:file13.n"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.vt1" "Boots1_F_HM_Scale_x001:file13.vt1"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.vt2" "Boots1_F_HM_Scale_x001:file13.vt2"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.vt3" "Boots1_F_HM_Scale_x001:file13.vt3"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.vc1" "Boots1_F_HM_Scale_x001:file13.vc1"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.o" "Boots1_F_HM_Scale_x001:file13.uv"
		;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.ofs" "Boots1_F_HM_Scale_x001:file13.fs"
		;
connectAttr "GangMember1_F_HM_Scale_x001:atlas_1SG.msg" "GangMember1_F_HM_Scale_x001:materialInfo11.sg"
		;
connectAttr "GangMember1_F_HM_Scale_x001:atlas_1.msg" "GangMember1_F_HM_Scale_x001:materialInfo11.m"
		;
connectAttr "GangMember1_F_HM_Scale_x001:file21.msg" "GangMember1_F_HM_Scale_x001:materialInfo11.t"
		 -na;
connectAttr "GangMember1_F_HM_Scale_x001:atlas_1.oc" "GangMember1_F_HM_Scale_x001:atlas_1SG.ss"
		;
connectAttr "GangMember1_F_HM_Scale_x001:file21.oc" "GangMember1_F_HM_Scale_x001:atlas_1.c"
		;
connectAttr "GangMember1_F_HM_Scale_x001:file21.ot" "GangMember1_F_HM_Scale_x001:atlas_1.it"
		;
connectAttr ":defaultColorMgtGlobals.cme" "GangMember1_F_HM_Scale_x001:file21.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "GangMember1_F_HM_Scale_x001:file21.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "GangMember1_F_HM_Scale_x001:file21.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "GangMember1_F_HM_Scale_x001:file21.ws"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.c" "GangMember1_F_HM_Scale_x001:file21.c"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.tf" "GangMember1_F_HM_Scale_x001:file21.tf"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.rf" "GangMember1_F_HM_Scale_x001:file21.rf"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.mu" "GangMember1_F_HM_Scale_x001:file21.mu"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.mv" "GangMember1_F_HM_Scale_x001:file21.mv"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.s" "GangMember1_F_HM_Scale_x001:file21.s"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.wu" "GangMember1_F_HM_Scale_x001:file21.wu"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.wv" "GangMember1_F_HM_Scale_x001:file21.wv"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.re" "GangMember1_F_HM_Scale_x001:file21.re"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.of" "GangMember1_F_HM_Scale_x001:file21.of"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.r" "GangMember1_F_HM_Scale_x001:file21.ro"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.n" "GangMember1_F_HM_Scale_x001:file21.n"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.vt1" "GangMember1_F_HM_Scale_x001:file21.vt1"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.vt2" "GangMember1_F_HM_Scale_x001:file21.vt2"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.vt3" "GangMember1_F_HM_Scale_x001:file21.vt3"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.vc1" "GangMember1_F_HM_Scale_x001:file21.vc1"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.o" "GangMember1_F_HM_Scale_x001:file21.uv"
		;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.ofs" "GangMember1_F_HM_Scale_x001:file21.fs"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.oc" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:atlas_1.c"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.ot" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:atlas_1.it"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:atlas_1.oc" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:FA_AdeptaSororitasPowerArmor_F_FMSG.ss"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:FA_AdeptaSororitasPowerArmor_F_FMSG.msg" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:materialInfo1.sg"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:atlas_1.msg" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:materialInfo1.m"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.msg" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:materialInfo1.t"
		 -na;
connectAttr ":defaultColorMgtGlobals.cme" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.ws"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.c" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.c"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.tf" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.tf"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.rf" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.rf"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.mu" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.mu"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.mv" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.mv"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.s" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.s"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.wu" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.wu"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.wv" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.wv"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.re" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.re"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.of" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.of"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.r" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.ro"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.n" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.n"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.vt1" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.vt1"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.vt2" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.vt2"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.vt3" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.vt3"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.vc1" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.vc1"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.o" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.uv"
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.ofs" "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.fs"
		;
connectAttr "file6.oc" "ImperialNobiliti_F_HM_Scale_x001:Atlas_1.c";
connectAttr "ImperialNobiliti_F_HM_Scale_x001:Atlas_1.oc" "ImperialNobiliti_F_HM_Scale_x001:blinn1SG.ss"
		;
connectAttr "ImperialNobiliti_F_HM_Scale_x001:blinn1SG.msg" "ImperialNobiliti_F_HM_Scale_x001:materialInfo3.sg"
		;
connectAttr "ImperialNobiliti_F_HM_Scale_x001:Atlas_1.msg" "ImperialNobiliti_F_HM_Scale_x001:materialInfo3.m"
		;
connectAttr "file6.msg" "ImperialNobiliti_F_HM_Scale_x001:materialInfo3.t" -na;
connectAttr "ImperialNobiliti_F_HM_Scale_x001:blinn1SG.msg" "ImperialNobiliti_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "ImperialNobiliti_F_HM_Scale_x001:Atlas_1.msg" "ImperialNobiliti_F_HM_Scale_x001:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr ":defaultColorMgtGlobals.cme" "file6.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file6.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file6.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file6.ws";
connectAttr "place2dTexture11.c" "file6.c";
connectAttr "place2dTexture11.tf" "file6.tf";
connectAttr "place2dTexture11.rf" "file6.rf";
connectAttr "place2dTexture11.mu" "file6.mu";
connectAttr "place2dTexture11.mv" "file6.mv";
connectAttr "place2dTexture11.s" "file6.s";
connectAttr "place2dTexture11.wu" "file6.wu";
connectAttr "place2dTexture11.wv" "file6.wv";
connectAttr "place2dTexture11.re" "file6.re";
connectAttr "place2dTexture11.of" "file6.of";
connectAttr "place2dTexture11.r" "file6.ro";
connectAttr "place2dTexture11.n" "file6.n";
connectAttr "place2dTexture11.vt1" "file6.vt1";
connectAttr "place2dTexture11.vt2" "file6.vt2";
connectAttr "place2dTexture11.vt3" "file6.vt3";
connectAttr "place2dTexture11.vc1" "file6.vc1";
connectAttr "place2dTexture11.o" "file6.uv";
connectAttr "place2dTexture11.ofs" "file6.fs";
connectAttr "DefaultMaterial.oc" "BW_Brows01_F_HMSG.ss";
connectAttr "BW_Brows01_F_HMSG.msg" "materialInfo16.sg";
connectAttr "DefaultMaterial.msg" "materialInfo16.m";
connectAttr "pasted__lambert3SG.msg" "pasted__materialInfo426.sg";
connectAttr "pasted__DefaultMaterial.msg" "pasted__materialInfo426.m";
connectAttr "pasted__DefaultMaterial.oc" "pasted__lambert3SG.ss";
connectAttr "heads_lambert3SG.msg" "materialInfo426.sg";
connectAttr "heads_DefaultMaterial.msg" "materialInfo426.m";
connectAttr "heads_DefaultMaterial.oc" "heads_lambert3SG.ss";
connectAttr "pasted__FT_RebelClothes3_M_HMSG.msg" "pasted__materialInfo6.sg";
connectAttr "pasted__lambert2.msg" "pasted__materialInfo6.m";
connectAttr "pasted__lambert2.oc" "pasted__FT_RebelClothes3_M_HMSG.ss";
connectAttr "add_file1.oc" "Atlas_1.c";
connectAttr "add_file1.ot" "Atlas_1.it";
connectAttr "bump2d1.o" "Atlas_1.n";
connectAttr "Atlas_1.oc" "blinn1SG.ss";
connectAttr "blinn1SG.msg" "materialInfo1.sg";
connectAttr "Atlas_1.msg" "materialInfo1.m";
connectAttr "add_file1.msg" "materialInfo1.t" -na;
connectAttr "blinn1SG.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "Atlas_1.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr ":defaultColorMgtGlobals.cme" "add_file1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "add_file1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "add_file1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "add_file1.ws";
connectAttr "add_place2dTexture1.c" "add_file1.c";
connectAttr "add_place2dTexture1.tf" "add_file1.tf";
connectAttr "add_place2dTexture1.rf" "add_file1.rf";
connectAttr "add_place2dTexture1.mu" "add_file1.mu";
connectAttr "add_place2dTexture1.mv" "add_file1.mv";
connectAttr "add_place2dTexture1.s" "add_file1.s";
connectAttr "add_place2dTexture1.wu" "add_file1.wu";
connectAttr "add_place2dTexture1.wv" "add_file1.wv";
connectAttr "add_place2dTexture1.re" "add_file1.re";
connectAttr "add_place2dTexture1.of" "add_file1.of";
connectAttr "add_place2dTexture1.r" "add_file1.ro";
connectAttr "add_place2dTexture1.n" "add_file1.n";
connectAttr "add_place2dTexture1.vt1" "add_file1.vt1";
connectAttr "add_place2dTexture1.vt2" "add_file1.vt2";
connectAttr "add_place2dTexture1.vt3" "add_file1.vt3";
connectAttr "add_place2dTexture1.vc1" "add_file1.vc1";
connectAttr "add_place2dTexture1.o" "add_file1.uv";
connectAttr "add_place2dTexture1.ofs" "add_file1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "add_file2.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "add_file2.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "add_file2.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "add_file2.ws";
connectAttr "add_place2dTexture2.c" "add_file2.c";
connectAttr "add_place2dTexture2.tf" "add_file2.tf";
connectAttr "add_place2dTexture2.rf" "add_file2.rf";
connectAttr "add_place2dTexture2.mu" "add_file2.mu";
connectAttr "add_place2dTexture2.mv" "add_file2.mv";
connectAttr "add_place2dTexture2.s" "add_file2.s";
connectAttr "add_place2dTexture2.wu" "add_file2.wu";
connectAttr "add_place2dTexture2.wv" "add_file2.wv";
connectAttr "add_place2dTexture2.re" "add_file2.re";
connectAttr "add_place2dTexture2.of" "add_file2.of";
connectAttr "add_place2dTexture2.r" "add_file2.ro";
connectAttr "add_place2dTexture2.n" "add_file2.n";
connectAttr "add_place2dTexture2.vt1" "add_file2.vt1";
connectAttr "add_place2dTexture2.vt2" "add_file2.vt2";
connectAttr "add_place2dTexture2.vt3" "add_file2.vt3";
connectAttr "add_place2dTexture2.vc1" "add_file2.vc1";
connectAttr "add_place2dTexture2.o" "add_file2.uv";
connectAttr "add_place2dTexture2.ofs" "add_file2.fs";
connectAttr "add_file2.oa" "bump2d1.bv";
connectAttr "add_bump2d1.o" "add_Atlas_1.n";
connectAttr "add_Atlas_1.oc" "add_blinn1SG.ss";
connectAttr "add_blinn1SG.msg" "add_materialInfo1.sg";
connectAttr "add_Atlas_1.msg" "add_materialInfo1.m";
connectAttr ":defaultColorMgtGlobals.cme" "AT_Boots4_n_1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "AT_Boots4_n_1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "AT_Boots4_n_1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "AT_Boots4_n_1.ws";
connectAttr "add_place2dTexture3.c" "AT_Boots4_n_1.c";
connectAttr "add_place2dTexture3.tf" "AT_Boots4_n_1.tf";
connectAttr "add_place2dTexture3.rf" "AT_Boots4_n_1.rf";
connectAttr "add_place2dTexture3.mu" "AT_Boots4_n_1.mu";
connectAttr "add_place2dTexture3.mv" "AT_Boots4_n_1.mv";
connectAttr "add_place2dTexture3.s" "AT_Boots4_n_1.s";
connectAttr "add_place2dTexture3.wu" "AT_Boots4_n_1.wu";
connectAttr "add_place2dTexture3.wv" "AT_Boots4_n_1.wv";
connectAttr "add_place2dTexture3.re" "AT_Boots4_n_1.re";
connectAttr "add_place2dTexture3.of" "AT_Boots4_n_1.of";
connectAttr "add_place2dTexture3.r" "AT_Boots4_n_1.ro";
connectAttr "add_place2dTexture3.n" "AT_Boots4_n_1.n";
connectAttr "add_place2dTexture3.vt1" "AT_Boots4_n_1.vt1";
connectAttr "add_place2dTexture3.vt2" "AT_Boots4_n_1.vt2";
connectAttr "add_place2dTexture3.vt3" "AT_Boots4_n_1.vt3";
connectAttr "add_place2dTexture3.vc1" "AT_Boots4_n_1.vc1";
connectAttr "add_place2dTexture3.o" "AT_Boots4_n_1.uv";
connectAttr "add_place2dTexture3.ofs" "AT_Boots4_n_1.fs";
connectAttr "AT_Boots4_n_1.oa" "add_bump2d1.bv";
connectAttr "add_Atlas_1.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo1.tgi[0].ni[0].dn"
		;
connectAttr "add_blinn1SG.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo1.tgi[0].ni[1].dn"
		;
connectAttr "AT_Boots4_n_1.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo1.tgi[0].ni[2].dn"
		;
connectAttr "add_place2dTexture3.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo1.tgi[0].ni[3].dn"
		;
connectAttr "add_bump2d1.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo1.tgi[0].ni[4].dn"
		;
connectAttr "add_Atlas_2.oc" "add_blinn1SG1.ss";
connectAttr "add_blinn1SG1.msg" "add_materialInfo2.sg";
connectAttr "add_Atlas_2.msg" "add_materialInfo2.m";
connectAttr "add_blinn1SG1.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo2.tgi[0].ni[0].dn"
		;
connectAttr "add_file3.oc" "atlas_1.c";
connectAttr "add_file3.ot" "atlas_1.it";
connectAttr "atlas_1.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo3.tgi[0].ni[3].dn"
		;
connectAttr "ImperialNavyCape_mat.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo3.tgi[0].ni[8].dn"
		;
connectAttr "add_file5.oc" "CP_ImperialRogueTrader.c";
connectAttr "add_file5.ot" "CP_ImperialRogueTrader.it";
connectAttr ":defaultColorMgtGlobals.cme" "add_file5.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "add_file5.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "add_file5.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "add_file5.ws";
connectAttr "add_place2dTexture6.c" "add_file5.c";
connectAttr "add_place2dTexture6.tf" "add_file5.tf";
connectAttr "add_place2dTexture6.rf" "add_file5.rf";
connectAttr "add_place2dTexture6.mu" "add_file5.mu";
connectAttr "add_place2dTexture6.mv" "add_file5.mv";
connectAttr "add_place2dTexture6.s" "add_file5.s";
connectAttr "add_place2dTexture6.wu" "add_file5.wu";
connectAttr "add_place2dTexture6.wv" "add_file5.wv";
connectAttr "add_place2dTexture6.re" "add_file5.re";
connectAttr "add_place2dTexture6.of" "add_file5.of";
connectAttr "add_place2dTexture6.r" "add_file5.ro";
connectAttr "add_place2dTexture6.n" "add_file5.n";
connectAttr "add_place2dTexture6.vt1" "add_file5.vt1";
connectAttr "add_place2dTexture6.vt2" "add_file5.vt2";
connectAttr "add_place2dTexture6.vt3" "add_file5.vt3";
connectAttr "add_place2dTexture6.vc1" "add_file5.vc1";
connectAttr "add_place2dTexture6.o" "add_file5.uv";
connectAttr "add_place2dTexture6.ofs" "add_file5.fs";
connectAttr "SP_ImperialNavy_M_HM_LPSG.msg" "add_materialInfo7.sg";
connectAttr "SP_ImperialNavy.msg" "add_materialInfo7.m";
connectAttr "add_file4.msg" "add_materialInfo7.t" -na;
connectAttr "SP_ImperialNavy.oc" "SP_ImperialNavy_M_HM_LPSG.ss";
connectAttr "add_file4.oc" "SP_ImperialNavy.c";
connectAttr "add_file4.ot" "SP_ImperialNavy.it";
connectAttr ":defaultColorMgtGlobals.cme" "add_file4.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "add_file4.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "add_file4.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "add_file4.ws";
connectAttr "add_place2dTexture5.c" "add_file4.c";
connectAttr "add_place2dTexture5.tf" "add_file4.tf";
connectAttr "add_place2dTexture5.rf" "add_file4.rf";
connectAttr "add_place2dTexture5.mu" "add_file4.mu";
connectAttr "add_place2dTexture5.mv" "add_file4.mv";
connectAttr "add_place2dTexture5.s" "add_file4.s";
connectAttr "add_place2dTexture5.wu" "add_file4.wu";
connectAttr "add_place2dTexture5.wv" "add_file4.wv";
connectAttr "add_place2dTexture5.re" "add_file4.re";
connectAttr "add_place2dTexture5.of" "add_file4.of";
connectAttr "add_place2dTexture5.r" "add_file4.ro";
connectAttr "add_place2dTexture5.n" "add_file4.n";
connectAttr "add_place2dTexture5.vt1" "add_file4.vt1";
connectAttr "add_place2dTexture5.vt2" "add_file4.vt2";
connectAttr "add_place2dTexture5.vt3" "add_file4.vt3";
connectAttr "add_place2dTexture5.vc1" "add_file4.vc1";
connectAttr "add_place2dTexture5.o" "add_file4.uv";
connectAttr "add_place2dTexture5.ofs" "add_file4.fs";
connectAttr ":defaultColorMgtGlobals.cme" "add_file3.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "add_file3.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "add_file3.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "add_file3.ws";
connectAttr "add_place2dTexture4.c" "add_file3.c";
connectAttr "add_place2dTexture4.tf" "add_file3.tf";
connectAttr "add_place2dTexture4.rf" "add_file3.rf";
connectAttr "add_place2dTexture4.mu" "add_file3.mu";
connectAttr "add_place2dTexture4.mv" "add_file3.mv";
connectAttr "add_place2dTexture4.s" "add_file3.s";
connectAttr "add_place2dTexture4.wu" "add_file3.wu";
connectAttr "add_place2dTexture4.wv" "add_file3.wv";
connectAttr "add_place2dTexture4.re" "add_file3.re";
connectAttr "add_place2dTexture4.of" "add_file3.of";
connectAttr "add_place2dTexture4.r" "add_file3.ro";
connectAttr "add_place2dTexture4.n" "add_file3.n";
connectAttr "add_place2dTexture4.vt1" "add_file3.vt1";
connectAttr "add_place2dTexture4.vt2" "add_file3.vt2";
connectAttr "add_place2dTexture4.vt3" "add_file3.vt3";
connectAttr "add_place2dTexture4.vc1" "add_file3.vc1";
connectAttr "add_place2dTexture4.o" "add_file3.uv";
connectAttr "add_place2dTexture4.ofs" "add_file3.fs";
connectAttr "add_bump2d2.o" "add_Atlas_3.n";
connectAttr ":defaultColorMgtGlobals.cme" "EnforcerLightCarapace_bn_P.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "EnforcerLightCarapace_bn_P.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "EnforcerLightCarapace_bn_P.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "EnforcerLightCarapace_bn_P.ws";
connectAttr "add_place2dTexture7.c" "EnforcerLightCarapace_bn_P.c";
connectAttr "add_place2dTexture7.tf" "EnforcerLightCarapace_bn_P.tf";
connectAttr "add_place2dTexture7.rf" "EnforcerLightCarapace_bn_P.rf";
connectAttr "add_place2dTexture7.mu" "EnforcerLightCarapace_bn_P.mu";
connectAttr "add_place2dTexture7.mv" "EnforcerLightCarapace_bn_P.mv";
connectAttr "add_place2dTexture7.s" "EnforcerLightCarapace_bn_P.s";
connectAttr "add_place2dTexture7.wu" "EnforcerLightCarapace_bn_P.wu";
connectAttr "add_place2dTexture7.wv" "EnforcerLightCarapace_bn_P.wv";
connectAttr "add_place2dTexture7.re" "EnforcerLightCarapace_bn_P.re";
connectAttr "add_place2dTexture7.of" "EnforcerLightCarapace_bn_P.of";
connectAttr "add_place2dTexture7.r" "EnforcerLightCarapace_bn_P.ro";
connectAttr "add_place2dTexture7.n" "EnforcerLightCarapace_bn_P.n";
connectAttr "add_place2dTexture7.vt1" "EnforcerLightCarapace_bn_P.vt1";
connectAttr "add_place2dTexture7.vt2" "EnforcerLightCarapace_bn_P.vt2";
connectAttr "add_place2dTexture7.vt3" "EnforcerLightCarapace_bn_P.vt3";
connectAttr "add_place2dTexture7.vc1" "EnforcerLightCarapace_bn_P.vc1";
connectAttr "add_place2dTexture7.o" "EnforcerLightCarapace_bn_P.uv";
connectAttr "add_place2dTexture7.ofs" "EnforcerLightCarapace_bn_P.fs";
connectAttr "EnforcerLightCarapace_bn_P.oa" "add_bump2d2.bv";
connectAttr "Character_human_atlas_layout_4k_WH_P.oc" "Character_human_atlas_layout_4k_WH_M.c"
		;
connectAttr ":defaultColorMgtGlobals.cme" "Character_human_atlas_layout_4k_WH_P.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "Character_human_atlas_layout_4k_WH_P.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "Character_human_atlas_layout_4k_WH_P.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "Character_human_atlas_layout_4k_WH_P.ws"
		;
connectAttr "add_place2dTexture8.c" "Character_human_atlas_layout_4k_WH_P.c";
connectAttr "add_place2dTexture8.tf" "Character_human_atlas_layout_4k_WH_P.tf";
connectAttr "add_place2dTexture8.rf" "Character_human_atlas_layout_4k_WH_P.rf";
connectAttr "add_place2dTexture8.mu" "Character_human_atlas_layout_4k_WH_P.mu";
connectAttr "add_place2dTexture8.mv" "Character_human_atlas_layout_4k_WH_P.mv";
connectAttr "add_place2dTexture8.s" "Character_human_atlas_layout_4k_WH_P.s";
connectAttr "add_place2dTexture8.wu" "Character_human_atlas_layout_4k_WH_P.wu";
connectAttr "add_place2dTexture8.wv" "Character_human_atlas_layout_4k_WH_P.wv";
connectAttr "add_place2dTexture8.re" "Character_human_atlas_layout_4k_WH_P.re";
connectAttr "add_place2dTexture8.of" "Character_human_atlas_layout_4k_WH_P.of";
connectAttr "add_place2dTexture8.r" "Character_human_atlas_layout_4k_WH_P.ro";
connectAttr "add_place2dTexture8.n" "Character_human_atlas_layout_4k_WH_P.n";
connectAttr "add_place2dTexture8.vt1" "Character_human_atlas_layout_4k_WH_P.vt1"
		;
connectAttr "add_place2dTexture8.vt2" "Character_human_atlas_layout_4k_WH_P.vt2"
		;
connectAttr "add_place2dTexture8.vt3" "Character_human_atlas_layout_4k_WH_P.vt3"
		;
connectAttr "add_place2dTexture8.vc1" "Character_human_atlas_layout_4k_WH_P.vc1"
		;
connectAttr "add_place2dTexture8.o" "Character_human_atlas_layout_4k_WH_P.uv";
connectAttr "add_place2dTexture8.ofs" "Character_human_atlas_layout_4k_WH_P.fs";
connectAttr "EnforcerLightCarapace_bn_P.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo4.tgi[0].ni[1].dn"
		;
connectAttr "add_place2dTexture7.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo4.tgi[0].ni[2].dn"
		;
connectAttr "add_bump2d2.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo4.tgi[0].ni[3].dn"
		;
connectAttr "add_Atlas_3.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo4.tgi[0].ni[4].dn"
		;
connectAttr "Atlas_3.oc" "blinn1SG2.ss";
connectAttr "blinn1SG2.msg" "add_materialInfo10.sg";
connectAttr "Atlas_3.msg" "add_materialInfo10.m";
connectAttr "bump2d3.o" "Atlas_3.n";
connectAttr "LL_EnforcerLightCarapace_n_1.oa" "bump2d3.bv";
connectAttr ":defaultColorMgtGlobals.cme" "LL_EnforcerLightCarapace_n_1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "LL_EnforcerLightCarapace_n_1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "LL_EnforcerLightCarapace_n_1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "LL_EnforcerLightCarapace_n_1.ws";
connectAttr "add_place2dTexture9.c" "LL_EnforcerLightCarapace_n_1.c";
connectAttr "add_place2dTexture9.tf" "LL_EnforcerLightCarapace_n_1.tf";
connectAttr "add_place2dTexture9.rf" "LL_EnforcerLightCarapace_n_1.rf";
connectAttr "add_place2dTexture9.mu" "LL_EnforcerLightCarapace_n_1.mu";
connectAttr "add_place2dTexture9.mv" "LL_EnforcerLightCarapace_n_1.mv";
connectAttr "add_place2dTexture9.s" "LL_EnforcerLightCarapace_n_1.s";
connectAttr "add_place2dTexture9.wu" "LL_EnforcerLightCarapace_n_1.wu";
connectAttr "add_place2dTexture9.wv" "LL_EnforcerLightCarapace_n_1.wv";
connectAttr "add_place2dTexture9.re" "LL_EnforcerLightCarapace_n_1.re";
connectAttr "add_place2dTexture9.of" "LL_EnforcerLightCarapace_n_1.of";
connectAttr "add_place2dTexture9.r" "LL_EnforcerLightCarapace_n_1.ro";
connectAttr "add_place2dTexture9.n" "LL_EnforcerLightCarapace_n_1.n";
connectAttr "add_place2dTexture9.vt1" "LL_EnforcerLightCarapace_n_1.vt1";
connectAttr "add_place2dTexture9.vt2" "LL_EnforcerLightCarapace_n_1.vt2";
connectAttr "add_place2dTexture9.vt3" "LL_EnforcerLightCarapace_n_1.vt3";
connectAttr "add_place2dTexture9.vc1" "LL_EnforcerLightCarapace_n_1.vc1";
connectAttr "add_place2dTexture9.o" "LL_EnforcerLightCarapace_n_1.uv";
connectAttr "add_place2dTexture9.ofs" "LL_EnforcerLightCarapace_n_1.fs";
connectAttr "Atlas_2.oc" "blinn1SG1.ss";
connectAttr "blinn1SG1.msg" "add_materialInfo9.sg";
connectAttr "Atlas_2.msg" "add_materialInfo9.m";
connectAttr "bump2d2.o" "Atlas_2.n";
connectAttr "EnforcerLightCarapace_bn_P1.oa" "bump2d2.bv";
connectAttr ":defaultColorMgtGlobals.cme" "EnforcerLightCarapace_bn_P1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "EnforcerLightCarapace_bn_P1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "EnforcerLightCarapace_bn_P1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "EnforcerLightCarapace_bn_P1.ws";
connectAttr "place2dTexture6.c" "EnforcerLightCarapace_bn_P1.c";
connectAttr "place2dTexture6.tf" "EnforcerLightCarapace_bn_P1.tf";
connectAttr "place2dTexture6.rf" "EnforcerLightCarapace_bn_P1.rf";
connectAttr "place2dTexture6.mu" "EnforcerLightCarapace_bn_P1.mu";
connectAttr "place2dTexture6.mv" "EnforcerLightCarapace_bn_P1.mv";
connectAttr "place2dTexture6.s" "EnforcerLightCarapace_bn_P1.s";
connectAttr "place2dTexture6.wu" "EnforcerLightCarapace_bn_P1.wu";
connectAttr "place2dTexture6.wv" "EnforcerLightCarapace_bn_P1.wv";
connectAttr "place2dTexture6.re" "EnforcerLightCarapace_bn_P1.re";
connectAttr "place2dTexture6.of" "EnforcerLightCarapace_bn_P1.of";
connectAttr "place2dTexture6.r" "EnforcerLightCarapace_bn_P1.ro";
connectAttr "place2dTexture6.n" "EnforcerLightCarapace_bn_P1.n";
connectAttr "place2dTexture6.vt1" "EnforcerLightCarapace_bn_P1.vt1";
connectAttr "place2dTexture6.vt2" "EnforcerLightCarapace_bn_P1.vt2";
connectAttr "place2dTexture6.vt3" "EnforcerLightCarapace_bn_P1.vt3";
connectAttr "place2dTexture6.vc1" "EnforcerLightCarapace_bn_P1.vc1";
connectAttr "place2dTexture6.o" "EnforcerLightCarapace_bn_P1.uv";
connectAttr "place2dTexture6.ofs" "EnforcerLightCarapace_bn_P1.fs";
connectAttr "add_atlas_1.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo5.tgi[0].ni[0].dn"
		;
connectAttr "add_blinn1SG5.msg" "add_materialInfo12.sg";
connectAttr "add_Atlas_4.msg" "add_materialInfo12.m";
connectAttr "add_Atlas_4.oc" "add_blinn1SG5.ss";
connectAttr "add_Atlas_5.oc" "add_blinn1SG6.ss";
connectAttr "add_blinn1SG6.msg" "add_materialInfo13.sg";
connectAttr "add_Atlas_5.msg" "add_materialInfo13.m";
connectAttr "add_blinn1SG6.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo6.tgi[0].ni[0].dn"
		;
connectAttr "add_place2dTexture10.o" "add_file6.uv";
connectAttr "add_place2dTexture10.ofu" "add_file6.ofu";
connectAttr "add_place2dTexture10.ofv" "add_file6.ofv";
connectAttr "add_place2dTexture10.rf" "add_file6.rf";
connectAttr "add_place2dTexture10.reu" "add_file6.reu";
connectAttr "add_place2dTexture10.rev" "add_file6.rev";
connectAttr "add_place2dTexture10.vt1" "add_file6.vt1";
connectAttr "add_place2dTexture10.vt2" "add_file6.vt2";
connectAttr "add_place2dTexture10.vt3" "add_file6.vt3";
connectAttr "add_place2dTexture10.vc1" "add_file6.vc1";
connectAttr "add_place2dTexture10.ofs" "add_file6.fs";
connectAttr ":defaultColorMgtGlobals.cme" "add_file6.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "add_file6.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "add_file6.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "add_file6.ws";
connectAttr "add_bump2d3.o" "add_atlas_2.n";
connectAttr "add_atlas_2.oc" "CL_NavyRenegade_M_HMSG.ss";
connectAttr "CL_NavyRenegade_M_HMSG.msg" "materialInfo2.sg";
connectAttr "add_atlas_2.msg" "materialInfo2.m";
connectAttr "Seneshal_N_1.oa" "add_bump2d3.bv";
connectAttr "add_place2dTexture11.o" "Seneshal_N_1.uv";
connectAttr "add_place2dTexture11.ofu" "Seneshal_N_1.ofu";
connectAttr "add_place2dTexture11.ofv" "Seneshal_N_1.ofv";
connectAttr "add_place2dTexture11.rf" "Seneshal_N_1.rf";
connectAttr "add_place2dTexture11.reu" "Seneshal_N_1.reu";
connectAttr "add_place2dTexture11.rev" "Seneshal_N_1.rev";
connectAttr "add_place2dTexture11.vt1" "Seneshal_N_1.vt1";
connectAttr "add_place2dTexture11.vt2" "Seneshal_N_1.vt2";
connectAttr "add_place2dTexture11.vt3" "Seneshal_N_1.vt3";
connectAttr "add_place2dTexture11.vc1" "Seneshal_N_1.vc1";
connectAttr "add_place2dTexture11.ofs" "Seneshal_N_1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "Seneshal_N_1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "Seneshal_N_1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "Seneshal_N_1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "Seneshal_N_1.ws";
connectAttr "pasted__bump2d1.o" "pasted__atlas_1.n";
connectAttr "pasted__Seneshal_N_1.oa" "pasted__bump2d1.bv";
connectAttr "pasted__place2dTexture1.o" "pasted__Seneshal_N_1.uv";
connectAttr "pasted__place2dTexture1.ofu" "pasted__Seneshal_N_1.ofu";
connectAttr "pasted__place2dTexture1.ofv" "pasted__Seneshal_N_1.ofv";
connectAttr "pasted__place2dTexture1.rf" "pasted__Seneshal_N_1.rf";
connectAttr "pasted__place2dTexture1.reu" "pasted__Seneshal_N_1.reu";
connectAttr "pasted__place2dTexture1.rev" "pasted__Seneshal_N_1.rev";
connectAttr "pasted__place2dTexture1.vt1" "pasted__Seneshal_N_1.vt1";
connectAttr "pasted__place2dTexture1.vt2" "pasted__Seneshal_N_1.vt2";
connectAttr "pasted__place2dTexture1.vt3" "pasted__Seneshal_N_1.vt3";
connectAttr "pasted__place2dTexture1.vc1" "pasted__Seneshal_N_1.vc1";
connectAttr "pasted__place2dTexture1.ofs" "pasted__Seneshal_N_1.fs";
connectAttr ":defaultColorMgtGlobals.cme" "pasted__Seneshal_N_1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "pasted__Seneshal_N_1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "pasted__Seneshal_N_1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "pasted__Seneshal_N_1.ws";
connectAttr "add_Atlas_6.oc" "add_blinn1SG7.ss";
connectAttr "add_blinn1SG7.msg" "add_materialInfo6.sg";
connectAttr "add_Atlas_6.msg" "add_materialInfo6.m";
connectAttr "add_blinn1SG9.msg" "materialInfo32.sg";
connectAttr "Atlas1.msg" "materialInfo32.m";
connectAttr "Atlas1.oc" "add_blinn1SG9.ss";
connectAttr "add_blinn1SG8.msg" "add_materialInfo15.sg";
connectAttr "add_Atlas_7.msg" "add_materialInfo15.m";
connectAttr "add_Atlas_7.oc" "add_blinn1SG8.ss";
connectAttr "add_Atlas_8.oc" "add_blinn1SG10.ss";
connectAttr "add_blinn1SG10.msg" "add_materialInfo16.sg";
connectAttr "add_Atlas_8.msg" "add_materialInfo16.m";
connectAttr "add_blinn1SG10.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo8.tgi[0].ni[0].dn"
		;
connectAttr "add_Atlas_9.oc" "add_blinn1SG11.ss";
connectAttr "add_blinn1SG11.msg" "add_materialInfo17.sg";
connectAttr "add_Atlas_9.msg" "add_materialInfo17.m";
connectAttr "BP_AdeptusAdministratum_M.oc" "blinn2SG.ss";
connectAttr "blinn2SG.msg" "add_materialInfo18.sg";
connectAttr "BP_AdeptusAdministratum_M.msg" "add_materialInfo18.m";
connectAttr "BP_AdeptusAdministratum_M.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo9.tgi[0].ni[0].dn"
		;
connectAttr "blinn2SG.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo9.tgi[0].ni[1].dn"
		;
connectAttr "add_blinn1SG11.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo9.tgi[0].ni[2].dn"
		;
connectAttr "add_Atlas_9.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo9.tgi[0].ni[3].dn"
		;
connectAttr "ChaosCultist4__scale_x001:bump2d1.o" "ChaosCultist4__scale_x001:Atlas_1.n"
		;
connectAttr "ChaosCultist4__scale_x001:ChaosCultist4_N_1.oa" "ChaosCultist4__scale_x001:bump2d1.bv"
		;
connectAttr "ChaosCultist4__scale_x001:place2dTexture2.o" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.uv"
		;
connectAttr "ChaosCultist4__scale_x001:place2dTexture2.ofu" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.ofu"
		;
connectAttr "ChaosCultist4__scale_x001:place2dTexture2.ofv" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.ofv"
		;
connectAttr "ChaosCultist4__scale_x001:place2dTexture2.rf" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.rf"
		;
connectAttr "ChaosCultist4__scale_x001:place2dTexture2.reu" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.reu"
		;
connectAttr "ChaosCultist4__scale_x001:place2dTexture2.rev" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.rev"
		;
connectAttr "ChaosCultist4__scale_x001:place2dTexture2.vt1" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.vt1"
		;
connectAttr "ChaosCultist4__scale_x001:place2dTexture2.vt2" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.vt2"
		;
connectAttr "ChaosCultist4__scale_x001:place2dTexture2.vt3" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.vt3"
		;
connectAttr "ChaosCultist4__scale_x001:place2dTexture2.vc1" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.vc1"
		;
connectAttr "ChaosCultist4__scale_x001:place2dTexture2.ofs" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.fs"
		;
connectAttr ":defaultColorMgtGlobals.cme" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "ChaosCultist4__scale_x001:ChaosCultist4_N_1.ws"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:bump2d1.o" "CrimeLordRogueTrader_M_HM_Scale_x001:atlas_1.n"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.oa" "CrimeLordRogueTrader_M_HM_Scale_x001:bump2d1.bv"
		;
connectAttr ":defaultColorMgtGlobals.cme" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.ws"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.c" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.c"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.tf" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.tf"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.rf" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.rf"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.mu" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.mu"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.mv" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.mv"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.s" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.s"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.wu" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.wu"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.wv" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.wv"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.re" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.re"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.of" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.of"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.r" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.ro"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.n" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.n"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.vt1" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.vt1"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.vt2" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.vt2"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.vt3" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.vt3"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.vc1" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.vc1"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.o" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.uv"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.ofs" "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.fs"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:bump2d1.o" "CrimeLordRogueTrader_M_HM_Scale_x002:atlas_1.n"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.oa" "CrimeLordRogueTrader_M_HM_Scale_x002:bump2d1.bv"
		;
connectAttr ":defaultColorMgtGlobals.cme" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.ws"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.c" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.c"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.tf" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.tf"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.rf" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.rf"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.mu" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.mu"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.mv" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.mv"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.s" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.s"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.wu" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.wu"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.wv" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.wv"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.re" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.re"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.of" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.of"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.r" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.ro"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.n" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.n"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.vt1" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.vt1"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.vt2" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.vt2"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.vt3" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.vt3"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.vc1" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.vc1"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.o" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.uv"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.ofs" "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.fs"
		;
connectAttr "ChaosCultist4__scale_x002:bump2d1.o" "ChaosCultist4__scale_x002:Atlas_1.n"
		;
connectAttr "ChaosCultist4__scale_x002:ChaosCultist4_N_1.oa" "ChaosCultist4__scale_x002:bump2d1.bv"
		;
connectAttr "ChaosCultist4__scale_x002:place2dTexture2.o" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.uv"
		;
connectAttr "ChaosCultist4__scale_x002:place2dTexture2.ofu" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.ofu"
		;
connectAttr "ChaosCultist4__scale_x002:place2dTexture2.ofv" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.ofv"
		;
connectAttr "ChaosCultist4__scale_x002:place2dTexture2.rf" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.rf"
		;
connectAttr "ChaosCultist4__scale_x002:place2dTexture2.reu" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.reu"
		;
connectAttr "ChaosCultist4__scale_x002:place2dTexture2.rev" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.rev"
		;
connectAttr "ChaosCultist4__scale_x002:place2dTexture2.vt1" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.vt1"
		;
connectAttr "ChaosCultist4__scale_x002:place2dTexture2.vt2" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.vt2"
		;
connectAttr "ChaosCultist4__scale_x002:place2dTexture2.vt3" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.vt3"
		;
connectAttr "ChaosCultist4__scale_x002:place2dTexture2.vc1" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.vc1"
		;
connectAttr "ChaosCultist4__scale_x002:place2dTexture2.ofs" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.fs"
		;
connectAttr ":defaultColorMgtGlobals.cme" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "ChaosCultist4__scale_x002:ChaosCultist4_N_1.ws"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:bump2d1.o" "CrimeLordRogueTrader_M_HM_Scale_x003:atlas_1.n"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.oa" "CrimeLordRogueTrader_M_HM_Scale_x003:bump2d1.bv"
		;
connectAttr ":defaultColorMgtGlobals.cme" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.ws"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.c" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.c"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.tf" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.tf"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.rf" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.rf"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.mu" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.mu"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.mv" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.mv"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.s" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.s"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.wu" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.wu"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.wv" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.wv"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.re" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.re"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.of" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.of"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.r" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.ro"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.n" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.n"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.vt1" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.vt1"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.vt2" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.vt2"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.vt3" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.vt3"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.vc1" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.vc1"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.o" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.uv"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.ofs" "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.fs"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:bump2d1.o" "CrimeLordRogueTrader_M_HM_Scale_x004:atlas_1.n"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.oa" "CrimeLordRogueTrader_M_HM_Scale_x004:bump2d1.bv"
		;
connectAttr ":defaultColorMgtGlobals.cme" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.cme"
		;
connectAttr ":defaultColorMgtGlobals.cfe" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.cmcf"
		;
connectAttr ":defaultColorMgtGlobals.cfp" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.cmcp"
		;
connectAttr ":defaultColorMgtGlobals.wsn" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.ws"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.c" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.c"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.tf" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.tf"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.rf" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.rf"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.mu" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.mu"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.mv" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.mv"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.s" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.s"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.wu" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.wu"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.wv" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.wv"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.re" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.re"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.of" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.of"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.r" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.ro"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.n" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.n"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.vt1" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.vt1"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.vt2" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.vt2"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.vt3" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.vt3"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.vc1" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.vc1"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.o" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.uv"
		;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.ofs" "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.fs"
		;
connectAttr "Reference_UMA_Male_Rig.msg" "bindPose6.m[0]";
connectAttr "Reference_Global.msg" "bindPose6.m[1]";
connectAttr "Reference_Position.msg" "bindPose6.m[2]";
connectAttr "Reference_Pelvis.msg" "bindPose6.m[3]";
connectAttr "Reference_L_Pre_Up_Leg.msg" "bindPose6.m[4]";
connectAttr "Reference_L_Up_leg.msg" "bindPose6.m[5]";
connectAttr "Reference_L_leg.msg" "bindPose6.m[6]";
connectAttr "Reference_L_foot.msg" "bindPose6.m[7]";
connectAttr "Reference_L_toe.msg" "bindPose6.m[8]";
connectAttr "Reference_L_A.msg" "bindPose6.m[14]";
connectAttr "Reference_L_Sceart_____Front_00.msg" "bindPose6.m[16]";
connectAttr "Reference_L_Sceart_Front_01.msg" "bindPose6.m[17]";
connectAttr "Reference_L_Sceart_Font_02.msg" "bindPose6.m[18]";
connectAttr "Reference_L_Sceart_____Back_00.msg" "bindPose6.m[21]";
connectAttr "Reference_L_Sceart_Back_01.msg" "bindPose6.m[22]";
connectAttr "Reference_L_Sceart_Back_02.msg" "bindPose6.m[23]";
connectAttr "Reference_R_Pre_Up_Leg.msg" "bindPose6.m[26]";
connectAttr "Reference_R_Up_leg.msg" "bindPose6.m[27]";
connectAttr "Reference_R_leg.msg" "bindPose6.m[28]";
connectAttr "Reference_R_foot.msg" "bindPose6.m[29]";
connectAttr "Reference_R_toe.msg" "bindPose6.m[30]";
connectAttr "Reference_R_A.msg" "bindPose6.m[36]";
connectAttr "Reference_R_Sceart_____Front_00.msg" "bindPose6.m[38]";
connectAttr "Reference_R_Sceart_Front_01.msg" "bindPose6.m[39]";
connectAttr "Reference_R_Sceart_Font_02.msg" "bindPose6.m[40]";
connectAttr "Reference_R_Sceart_____Back_00.msg" "bindPose6.m[43]";
connectAttr "Reference_R_Sceart_Back_01.msg" "bindPose6.m[44]";
connectAttr "Reference_R_Sceart_Back_02.msg" "bindPose6.m[45]";
connectAttr "Reference_Spine_1.msg" "bindPose6.m[48]";
connectAttr "Reference_Stomach.msg" "bindPose6.m[49]";
connectAttr "Reference_Spine_2.msg" "bindPose6.m[51]";
connectAttr "Reference_Spine_3.msg" "bindPose6.m[52]";
connectAttr "Reference_R_B.msg" "bindPose6.m[53]";
connectAttr "Reference_L_B.msg" "bindPose6.m[55]";
connectAttr "Reference_L_Clavicle.msg" "bindPose6.m[57]";
connectAttr "Reference_L_Up_arm.msg" "bindPose6.m[58]";
connectAttr "Reference_L_ForeArm.msg" "bindPose6.m[59]";
connectAttr "Reference_L_Hand.msg" "bindPose6.m[60]";
connectAttr "Reference_L_Toe_2_01.msg" "bindPose6.m[61]";
connectAttr "Reference_L_Toe_2_02.msg" "bindPose6.m[62]";
connectAttr "Reference_L_Toe_1_01.msg" "bindPose6.m[65]";
connectAttr "Reference_L_Toe_1_02.msg" "bindPose6.m[66]";
connectAttr "Reference_L_Toe_3_01.msg" "bindPose6.m[69]";
connectAttr "Reference_L_Toe_3_02.msg" "bindPose6.m[70]";
connectAttr "Reference_L_WeaponBone.msg" "bindPose6.m[74]";
connectAttr "Reference_Neck.msg" "bindPose6.m[80]";
connectAttr "Reference_Head.msg" "bindPose6.m[81]";
connectAttr "Reference_Jaw_Scale.msg" "bindPose6.m[84]";
connectAttr "Reference_Skull_Scale.msg" "bindPose6.m[85]";
connectAttr "Reference_Face_Scale.msg" "bindPose6.m[86]";
connectAttr "Reference_L_eyelish_top.msg" "bindPose6.m[87]";
connectAttr "Reference_L_eyelish_top_end.msg" "bindPose6.m[88]";
connectAttr "Reference_L_eye.msg" "bindPose6.m[89]";
connectAttr "Reference_L_eye_end.msg" "bindPose6.m[90]";
connectAttr "Reference_L_eyelish_bottom.msg" "bindPose6.m[91]";
connectAttr "Reference_L_eyelish_bottom_end.msg" "bindPose6.m[92]";
connectAttr "Reference_R_eyebrow.msg" "bindPose6.m[93]";
connectAttr "Reference_L_eyebrow.msg" "bindPose6.m[94]";
connectAttr "Reference_R_eyelish_bottom.msg" "bindPose6.m[95]";
connectAttr "Reference_R_eyelish_bottom_end.msg" "bindPose6.m[96]";
connectAttr "Reference_R_eye.msg" "bindPose6.m[97]";
connectAttr "Reference_R_eye_end.msg" "bindPose6.m[98]";
connectAttr "Reference_R_eyelish_top.msg" "bindPose6.m[99]";
connectAttr "Reference_R_eyelish_top_end.msg" "bindPose6.m[100]";
connectAttr "Reference_L_Neck_Muscl.msg" "bindPose6.m[102]";
connectAttr "Reference_R_Neck_Muscl.msg" "bindPose6.m[104]";
connectAttr "Reference_R_Clavicle.msg" "bindPose6.m[106]";
connectAttr "Reference_R_Up_arm.msg" "bindPose6.m[107]";
connectAttr "Reference_R_ForeArm.msg" "bindPose6.m[108]";
connectAttr "Reference_R_Hand.msg" "bindPose6.m[109]";
connectAttr "Reference_R_Toe_2_01.msg" "bindPose6.m[110]";
connectAttr "Reference_R_Toe_2_02.msg" "bindPose6.m[111]";
connectAttr "Reference_R_Toe_1_01.msg" "bindPose6.m[114]";
connectAttr "Reference_R_Toe_1_02.msg" "bindPose6.m[115]";
connectAttr "Reference_R_Toe_3_01.msg" "bindPose6.m[118]";
connectAttr "Reference_R_Toe_3_02.msg" "bindPose6.m[119]";
connectAttr "Reference_R_WeaponBone.msg" "bindPose6.m[123]";
connectAttr "Reference_L_back_w_____slot_10.msg" "bindPose6.m[130]";
connectAttr "Reference_L_back_weapon_slot_10.msg" "bindPose6.m[131]";
connectAttr "Reference_L_back_w_____slot_07.msg" "bindPose6.m[133]";
connectAttr "Reference_L_back_weapon_slot_07.msg" "bindPose6.m[134]";
connectAttr "Reference_C_back_w_____slot_08.msg" "bindPose6.m[136]";
connectAttr "Reference_C_back_weapon_slot_08.msg" "bindPose6.m[137]";
connectAttr "Reference_R_back_w_____slot_09.msg" "bindPose6.m[139]";
connectAttr "Reference_R_back_weapon_slot_09.msg" "bindPose6.m[140]";
connectAttr "Reference_R_back_w_____slot_06.msg" "bindPose6.m[142]";
connectAttr "Reference_R_back_weapon_slot_06.msg" "bindPose6.m[143]";
connectAttr "Reference_C_back_w_____slot_11.msg" "bindPose6.m[146]";
connectAttr "Reference_C_back_weapon_slot_11.msg" "bindPose6.m[147]";
connectAttr "Reference_L_front_w____scale_05.msg" "bindPose6.m[151]";
connectAttr "Reference_L_front_weapon_slot_05.msg" "bindPose6.m[152]";
connectAttr "Reference_L_front_w____scale_04.msg" "bindPose6.m[154]";
connectAttr "Reference_L_front_weapon_slot_04.msg" "bindPose6.m[155]";
connectAttr "Reference_R_front_w____scale_02.msg" "bindPose6.m[157]";
connectAttr "Reference_R_front_weapon_slot_02.msg" "bindPose6.m[158]";
connectAttr "Reference_R_front_w____scale_01.msg" "bindPose6.m[160]";
connectAttr "Reference_R_front_weapon_slot_01.msg" "bindPose6.m[161]";
connectAttr "Reference_C_front_w____scale_03.msg" "bindPose6.m[163]";
connectAttr "Reference_C_front_weapon_slot_03.msg" "bindPose6.m[164]";
connectAttr "bindPose6.w" "bindPose6.p[0]";
connectAttr "bindPose6.m[0]" "bindPose6.p[1]";
connectAttr "bindPose6.m[1]" "bindPose6.p[2]";
connectAttr "bindPose6.m[2]" "bindPose6.p[3]";
connectAttr "bindPose6.m[3]" "bindPose6.p[4]";
connectAttr "bindPose6.m[4]" "bindPose6.p[5]";
connectAttr "bindPose6.m[5]" "bindPose6.p[6]";
connectAttr "bindPose6.m[6]" "bindPose6.p[7]";
connectAttr "bindPose6.m[7]" "bindPose6.p[8]";
connectAttr "bindPose6.m[8]" "bindPose6.p[9]";
connectAttr "bindPose6.m[7]" "bindPose6.p[10]";
connectAttr "bindPose6.m[6]" "bindPose6.p[11]";
connectAttr "bindPose6.m[6]" "bindPose6.p[12]";
connectAttr "bindPose6.m[5]" "bindPose6.p[13]";
connectAttr "bindPose6.m[5]" "bindPose6.p[14]";
connectAttr "bindPose6.m[14]" "bindPose6.p[15]";
connectAttr "bindPose6.m[5]" "bindPose6.p[16]";
connectAttr "bindPose6.m[16]" "bindPose6.p[17]";
connectAttr "bindPose6.m[17]" "bindPose6.p[18]";
connectAttr "bindPose6.m[18]" "bindPose6.p[19]";
connectAttr "bindPose6.m[17]" "bindPose6.p[20]";
connectAttr "bindPose6.m[5]" "bindPose6.p[21]";
connectAttr "bindPose6.m[21]" "bindPose6.p[22]";
connectAttr "bindPose6.m[22]" "bindPose6.p[23]";
connectAttr "bindPose6.m[23]" "bindPose6.p[24]";
connectAttr "bindPose6.m[22]" "bindPose6.p[25]";
connectAttr "bindPose6.m[3]" "bindPose6.p[26]";
connectAttr "bindPose6.m[26]" "bindPose6.p[27]";
connectAttr "bindPose6.m[27]" "bindPose6.p[28]";
connectAttr "bindPose6.m[28]" "bindPose6.p[29]";
connectAttr "bindPose6.m[29]" "bindPose6.p[30]";
connectAttr "bindPose6.m[30]" "bindPose6.p[31]";
connectAttr "bindPose6.m[29]" "bindPose6.p[32]";
connectAttr "bindPose6.m[28]" "bindPose6.p[33]";
connectAttr "bindPose6.m[28]" "bindPose6.p[34]";
connectAttr "bindPose6.m[27]" "bindPose6.p[35]";
connectAttr "bindPose6.m[27]" "bindPose6.p[36]";
connectAttr "bindPose6.m[36]" "bindPose6.p[37]";
connectAttr "bindPose6.m[27]" "bindPose6.p[38]";
connectAttr "bindPose6.m[38]" "bindPose6.p[39]";
connectAttr "bindPose6.m[39]" "bindPose6.p[40]";
connectAttr "bindPose6.m[40]" "bindPose6.p[41]";
connectAttr "bindPose6.m[39]" "bindPose6.p[42]";
connectAttr "bindPose6.m[27]" "bindPose6.p[43]";
connectAttr "bindPose6.m[43]" "bindPose6.p[44]";
connectAttr "bindPose6.m[44]" "bindPose6.p[45]";
connectAttr "bindPose6.m[45]" "bindPose6.p[46]";
connectAttr "bindPose6.m[44]" "bindPose6.p[47]";
connectAttr "bindPose6.m[3]" "bindPose6.p[48]";
connectAttr "bindPose6.m[48]" "bindPose6.p[49]";
connectAttr "bindPose6.m[49]" "bindPose6.p[50]";
connectAttr "bindPose6.m[48]" "bindPose6.p[51]";
connectAttr "bindPose6.m[51]" "bindPose6.p[52]";
connectAttr "bindPose6.m[52]" "bindPose6.p[53]";
connectAttr "bindPose6.m[53]" "bindPose6.p[54]";
connectAttr "bindPose6.m[52]" "bindPose6.p[55]";
connectAttr "bindPose6.m[55]" "bindPose6.p[56]";
connectAttr "bindPose6.m[52]" "bindPose6.p[57]";
connectAttr "bindPose6.m[57]" "bindPose6.p[58]";
connectAttr "bindPose6.m[58]" "bindPose6.p[59]";
connectAttr "bindPose6.m[59]" "bindPose6.p[60]";
connectAttr "bindPose6.m[60]" "bindPose6.p[61]";
connectAttr "bindPose6.m[61]" "bindPose6.p[62]";
connectAttr "bindPose6.m[62]" "bindPose6.p[63]";
connectAttr "bindPose6.m[61]" "bindPose6.p[64]";
connectAttr "bindPose6.m[60]" "bindPose6.p[65]";
connectAttr "bindPose6.m[65]" "bindPose6.p[66]";
connectAttr "bindPose6.m[66]" "bindPose6.p[67]";
connectAttr "bindPose6.m[65]" "bindPose6.p[68]";
connectAttr "bindPose6.m[60]" "bindPose6.p[69]";
connectAttr "bindPose6.m[69]" "bindPose6.p[70]";
connectAttr "bindPose6.m[70]" "bindPose6.p[71]";
connectAttr "bindPose6.m[69]" "bindPose6.p[72]";
connectAttr "bindPose6.m[60]" "bindPose6.p[73]";
connectAttr "bindPose6.m[60]" "bindPose6.p[74]";
connectAttr "bindPose6.m[59]" "bindPose6.p[75]";
connectAttr "bindPose6.m[59]" "bindPose6.p[76]";
connectAttr "bindPose6.m[58]" "bindPose6.p[77]";
connectAttr "bindPose6.m[58]" "bindPose6.p[78]";
connectAttr "bindPose6.m[57]" "bindPose6.p[79]";
connectAttr "bindPose6.m[52]" "bindPose6.p[80]";
connectAttr "bindPose6.m[80]" "bindPose6.p[81]";
connectAttr "bindPose6.m[81]" "bindPose6.p[82]";
connectAttr "bindPose6.m[81]" "bindPose6.p[83]";
connectAttr "bindPose6.m[81]" "bindPose6.p[84]";
connectAttr "bindPose6.m[81]" "bindPose6.p[85]";
connectAttr "bindPose6.m[81]" "bindPose6.p[86]";
connectAttr "bindPose6.m[86]" "bindPose6.p[87]";
connectAttr "bindPose6.m[87]" "bindPose6.p[88]";
connectAttr "bindPose6.m[86]" "bindPose6.p[89]";
connectAttr "bindPose6.m[89]" "bindPose6.p[90]";
connectAttr "bindPose6.m[86]" "bindPose6.p[91]";
connectAttr "bindPose6.m[91]" "bindPose6.p[92]";
connectAttr "bindPose6.m[86]" "bindPose6.p[93]";
connectAttr "bindPose6.m[86]" "bindPose6.p[94]";
connectAttr "bindPose6.m[86]" "bindPose6.p[95]";
connectAttr "bindPose6.m[95]" "bindPose6.p[96]";
connectAttr "bindPose6.m[86]" "bindPose6.p[97]";
connectAttr "bindPose6.m[97]" "bindPose6.p[98]";
connectAttr "bindPose6.m[86]" "bindPose6.p[99]";
connectAttr "bindPose6.m[99]" "bindPose6.p[100]";
connectAttr "bindPose6.m[80]" "bindPose6.p[101]";
connectAttr "bindPose6.m[52]" "bindPose6.p[102]";
connectAttr "bindPose6.m[102]" "bindPose6.p[103]";
connectAttr "bindPose6.m[52]" "bindPose6.p[104]";
connectAttr "bindPose6.m[104]" "bindPose6.p[105]";
connectAttr "bindPose6.m[52]" "bindPose6.p[106]";
connectAttr "bindPose6.m[106]" "bindPose6.p[107]";
connectAttr "bindPose6.m[107]" "bindPose6.p[108]";
connectAttr "bindPose6.m[108]" "bindPose6.p[109]";
connectAttr "bindPose6.m[109]" "bindPose6.p[110]";
connectAttr "bindPose6.m[110]" "bindPose6.p[111]";
connectAttr "bindPose6.m[111]" "bindPose6.p[112]";
connectAttr "bindPose6.m[110]" "bindPose6.p[113]";
connectAttr "bindPose6.m[109]" "bindPose6.p[114]";
connectAttr "bindPose6.m[114]" "bindPose6.p[115]";
connectAttr "bindPose6.m[115]" "bindPose6.p[116]";
connectAttr "bindPose6.m[114]" "bindPose6.p[117]";
connectAttr "bindPose6.m[109]" "bindPose6.p[118]";
connectAttr "bindPose6.m[118]" "bindPose6.p[119]";
connectAttr "bindPose6.m[119]" "bindPose6.p[120]";
connectAttr "bindPose6.m[118]" "bindPose6.p[121]";
connectAttr "bindPose6.m[109]" "bindPose6.p[122]";
connectAttr "bindPose6.m[109]" "bindPose6.p[123]";
connectAttr "bindPose6.m[108]" "bindPose6.p[124]";
connectAttr "bindPose6.m[108]" "bindPose6.p[125]";
connectAttr "bindPose6.m[107]" "bindPose6.p[126]";
connectAttr "bindPose6.m[107]" "bindPose6.p[127]";
connectAttr "bindPose6.m[106]" "bindPose6.p[128]";
connectAttr "bindPose6.m[52]" "bindPose6.p[129]";
connectAttr "bindPose6.m[52]" "bindPose6.p[130]";
connectAttr "bindPose6.m[130]" "bindPose6.p[131]";
connectAttr "bindPose6.m[131]" "bindPose6.p[132]";
connectAttr "bindPose6.m[52]" "bindPose6.p[133]";
connectAttr "bindPose6.m[133]" "bindPose6.p[134]";
connectAttr "bindPose6.m[134]" "bindPose6.p[135]";
connectAttr "bindPose6.m[52]" "bindPose6.p[136]";
connectAttr "bindPose6.m[136]" "bindPose6.p[137]";
connectAttr "bindPose6.m[137]" "bindPose6.p[138]";
connectAttr "bindPose6.m[52]" "bindPose6.p[139]";
connectAttr "bindPose6.m[139]" "bindPose6.p[140]";
connectAttr "bindPose6.m[140]" "bindPose6.p[141]";
connectAttr "bindPose6.m[52]" "bindPose6.p[142]";
connectAttr "bindPose6.m[142]" "bindPose6.p[143]";
connectAttr "bindPose6.m[143]" "bindPose6.p[144]";
connectAttr "bindPose6.m[51]" "bindPose6.p[145]";
connectAttr "bindPose6.m[51]" "bindPose6.p[146]";
connectAttr "bindPose6.m[146]" "bindPose6.p[147]";
connectAttr "bindPose6.m[147]" "bindPose6.p[148]";
connectAttr "bindPose6.m[48]" "bindPose6.p[149]";
connectAttr "bindPose6.m[3]" "bindPose6.p[150]";
connectAttr "bindPose6.m[3]" "bindPose6.p[151]";
connectAttr "bindPose6.m[151]" "bindPose6.p[152]";
connectAttr "bindPose6.m[152]" "bindPose6.p[153]";
connectAttr "bindPose6.m[3]" "bindPose6.p[154]";
connectAttr "bindPose6.m[154]" "bindPose6.p[155]";
connectAttr "bindPose6.m[155]" "bindPose6.p[156]";
connectAttr "bindPose6.m[3]" "bindPose6.p[157]";
connectAttr "bindPose6.m[157]" "bindPose6.p[158]";
connectAttr "bindPose6.m[158]" "bindPose6.p[159]";
connectAttr "bindPose6.m[3]" "bindPose6.p[160]";
connectAttr "bindPose6.m[160]" "bindPose6.p[161]";
connectAttr "bindPose6.m[161]" "bindPose6.p[162]";
connectAttr "bindPose6.m[3]" "bindPose6.p[163]";
connectAttr "bindPose6.m[163]" "bindPose6.p[164]";
connectAttr "bindPose6.m[164]" "bindPose6.p[165]";
connectAttr "add_bump2d4.o" "add_Atlas_10.n";
connectAttr "add_file8.oc" "add_Atlas_10.c";
connectAttr "add_Atlas_10.oc" "add_blinn1SG12.ss";
connectAttr "add_blinn1SG12.msg" "add_materialInfo19.sg";
connectAttr "add_Atlas_10.msg" "add_materialInfo19.m";
connectAttr "add_file8.msg" "add_materialInfo19.t" -na;
connectAttr "BA_AdeptasSororitasAnointedSaintArmor01_M.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo10.tgi[0].ni[0].dn"
		;
connectAttr "BP_AdeptasSororitasAnointedSaintArmor_M.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo10.tgi[0].ni[3].dn"
		;
connectAttr "add_blinn1SG12.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo10.tgi[0].ni[4].dn"
		;
connectAttr "add_Atlas_10.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo10.tgi[0].ni[11].dn"
		;
connectAttr ":defaultColorMgtGlobals.cme" "add_file7.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "add_file7.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "add_file7.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "add_file7.ws";
connectAttr "add_place2dTexture12.c" "add_file7.c";
connectAttr "add_place2dTexture12.tf" "add_file7.tf";
connectAttr "add_place2dTexture12.rf" "add_file7.rf";
connectAttr "add_place2dTexture12.mu" "add_file7.mu";
connectAttr "add_place2dTexture12.mv" "add_file7.mv";
connectAttr "add_place2dTexture12.s" "add_file7.s";
connectAttr "add_place2dTexture12.wu" "add_file7.wu";
connectAttr "add_place2dTexture12.wv" "add_file7.wv";
connectAttr "add_place2dTexture12.re" "add_file7.re";
connectAttr "add_place2dTexture12.of" "add_file7.of";
connectAttr "add_place2dTexture12.r" "add_file7.ro";
connectAttr "add_place2dTexture12.n" "add_file7.n";
connectAttr "add_place2dTexture12.vt1" "add_file7.vt1";
connectAttr "add_place2dTexture12.vt2" "add_file7.vt2";
connectAttr "add_place2dTexture12.vt3" "add_file7.vt3";
connectAttr "add_place2dTexture12.vc1" "add_file7.vc1";
connectAttr "add_place2dTexture12.o" "add_file7.uv";
connectAttr "add_place2dTexture12.ofs" "add_file7.fs";
connectAttr "add_file7.oa" "add_bump2d4.bv";
connectAttr ":defaultColorMgtGlobals.cme" "add_file8.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "add_file8.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "add_file8.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "add_file8.ws";
connectAttr "add_place2dTexture13.c" "add_file8.c";
connectAttr "add_place2dTexture13.tf" "add_file8.tf";
connectAttr "add_place2dTexture13.rf" "add_file8.rf";
connectAttr "add_place2dTexture13.mu" "add_file8.mu";
connectAttr "add_place2dTexture13.mv" "add_file8.mv";
connectAttr "add_place2dTexture13.s" "add_file8.s";
connectAttr "add_place2dTexture13.wu" "add_file8.wu";
connectAttr "add_place2dTexture13.wv" "add_file8.wv";
connectAttr "add_place2dTexture13.re" "add_file8.re";
connectAttr "add_place2dTexture13.of" "add_file8.of";
connectAttr "add_place2dTexture13.r" "add_file8.ro";
connectAttr "add_place2dTexture13.n" "add_file8.n";
connectAttr "add_place2dTexture13.vt1" "add_file8.vt1";
connectAttr "add_place2dTexture13.vt2" "add_file8.vt2";
connectAttr "add_place2dTexture13.vt3" "add_file8.vt3";
connectAttr "add_place2dTexture13.vc1" "add_file8.vc1";
connectAttr "add_place2dTexture13.o" "add_file8.uv";
connectAttr "add_place2dTexture13.ofs" "add_file8.fs";
connectAttr "add_Atlas_11.oc" "add_blinn1SG13.ss";
connectAttr "add_blinn1SG13.msg" "add_materialInfo20.sg";
connectAttr "add_Atlas_11.msg" "add_materialInfo20.m";
connectAttr "BP_AdeptaSororitasRelicArmor_n.oc" "add_blinn2SG1.ss";
connectAttr "add_blinn2SG1.msg" "add_materialInfo21.sg";
connectAttr "BP_AdeptaSororitasRelicArmor_n.msg" "add_materialInfo21.m";
connectAttr "add_blinn1SG13.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo11.tgi[0].ni[2].dn"
		;
connectAttr "add_Atlas_11.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo11.tgi[0].ni[3].dn"
		;
connectAttr "add_blinn2SG1.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo11.tgi[0].ni[5].dn"
		;
connectAttr "BP_AdeptaSororitasRelicArmor_n.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo11.tgi[0].ni[6].dn"
		;
connectAttr "pasted__BC_ChestCommissar_F_HMSG.msg" "pasted__materialInfo1.sg";
connectAttr "pasted__atlas_2.msg" "pasted__materialInfo1.m";
connectAttr "pasted__atlas_2.oc" "pasted__BC_ChestCommissar_F_HMSG.ss";
connectAttr "add_atlas_3.oc" "add_blinn1SG14.ss";
connectAttr "add_blinn1SG14.msg" "add_materialInfo22.sg";
connectAttr "add_atlas_3.msg" "add_materialInfo22.m";
connectAttr "add_blinn1SG15.msg" "add_materialInfo23.sg";
connectAttr "add_blinn1SG2.msg" "materialInfo3.sg";
connectAttr "add_blinn1SG14.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo12.tgi[0].ni[0].dn"
		;
connectAttr "add_atlas_3.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo12.tgi[0].ni[1].dn"
		;
connectAttr "HM_F_Brows05_F_HMSG.msg" "materialInfo4.sg";
connectAttr "atlas.msg" "materialInfo4.m";
connectAttr "add_file9.msg" "materialInfo4.t" -na;
connectAttr "atlas.oc" "HM_F_Brows05_F_HMSG.ss";
connectAttr "add_file9.oc" "atlas.c";
connectAttr "add_place2dTexture14.o" "add_file9.uv";
connectAttr "add_place2dTexture14.ofu" "add_file9.ofu";
connectAttr "add_place2dTexture14.ofv" "add_file9.ofv";
connectAttr "add_place2dTexture14.rf" "add_file9.rf";
connectAttr "add_place2dTexture14.reu" "add_file9.reu";
connectAttr "add_place2dTexture14.rev" "add_file9.rev";
connectAttr "add_place2dTexture14.vt1" "add_file9.vt1";
connectAttr "add_place2dTexture14.vt2" "add_file9.vt2";
connectAttr "add_place2dTexture14.vt3" "add_file9.vt3";
connectAttr "add_place2dTexture14.vc1" "add_file9.vc1";
connectAttr "add_place2dTexture14.ofs" "add_file9.fs";
connectAttr ":defaultColorMgtGlobals.cme" "add_file9.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "add_file9.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "add_file9.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "add_file9.ws";
connectAttr "Reference_UMA_Male_Rig.msg" "bindPose7.m[0]";
connectAttr "Reference_Global.msg" "bindPose7.m[1]";
connectAttr "Reference_Position.msg" "bindPose7.m[2]";
connectAttr "Reference_Pelvis.msg" "bindPose7.m[3]";
connectAttr "Reference_L_Pre_Up_Leg.msg" "bindPose7.m[4]";
connectAttr "Reference_L_Up_leg.msg" "bindPose7.m[5]";
connectAttr "Reference_L_leg.msg" "bindPose7.m[6]";
connectAttr "Reference_L_foot.msg" "bindPose7.m[7]";
connectAttr "Reference_L_toe.msg" "bindPose7.m[8]";
connectAttr "Reference_L_A.msg" "bindPose7.m[14]";
connectAttr "Reference_L_Sceart_____Front_00.msg" "bindPose7.m[16]";
connectAttr "Reference_L_Sceart_Front_01.msg" "bindPose7.m[17]";
connectAttr "Reference_L_Sceart_Font_02.msg" "bindPose7.m[18]";
connectAttr "Reference_L_Sceart_____Back_00.msg" "bindPose7.m[21]";
connectAttr "Reference_L_Sceart_Back_01.msg" "bindPose7.m[22]";
connectAttr "Reference_L_Sceart_Back_02.msg" "bindPose7.m[23]";
connectAttr "Reference_R_Pre_Up_Leg.msg" "bindPose7.m[26]";
connectAttr "Reference_R_Up_leg.msg" "bindPose7.m[27]";
connectAttr "Reference_R_leg.msg" "bindPose7.m[28]";
connectAttr "Reference_R_foot.msg" "bindPose7.m[29]";
connectAttr "Reference_R_toe.msg" "bindPose7.m[30]";
connectAttr "Reference_R_A.msg" "bindPose7.m[36]";
connectAttr "Reference_R_Sceart_____Front_00.msg" "bindPose7.m[38]";
connectAttr "Reference_R_Sceart_Front_01.msg" "bindPose7.m[39]";
connectAttr "Reference_R_Sceart_Font_02.msg" "bindPose7.m[40]";
connectAttr "Reference_R_Sceart_____Back_00.msg" "bindPose7.m[43]";
connectAttr "Reference_R_Sceart_Back_01.msg" "bindPose7.m[44]";
connectAttr "Reference_R_Sceart_Back_02.msg" "bindPose7.m[45]";
connectAttr "Reference_Spine_1.msg" "bindPose7.m[48]";
connectAttr "Reference_Stomach.msg" "bindPose7.m[49]";
connectAttr "Reference_Spine_2.msg" "bindPose7.m[51]";
connectAttr "Reference_Spine_3.msg" "bindPose7.m[52]";
connectAttr "Reference_R_B.msg" "bindPose7.m[53]";
connectAttr "Reference_L_B.msg" "bindPose7.m[55]";
connectAttr "Reference_L_Clavicle.msg" "bindPose7.m[57]";
connectAttr "Reference_L_Up_arm.msg" "bindPose7.m[58]";
connectAttr "Reference_L_ForeArm.msg" "bindPose7.m[59]";
connectAttr "Reference_L_Hand.msg" "bindPose7.m[60]";
connectAttr "Reference_L_Toe_2_01.msg" "bindPose7.m[61]";
connectAttr "Reference_L_Toe_2_02.msg" "bindPose7.m[62]";
connectAttr "Reference_L_Toe_1_01.msg" "bindPose7.m[65]";
connectAttr "Reference_L_Toe_1_02.msg" "bindPose7.m[66]";
connectAttr "Reference_L_Toe_3_01.msg" "bindPose7.m[69]";
connectAttr "Reference_L_Toe_3_02.msg" "bindPose7.m[70]";
connectAttr "Reference_L_WeaponBone.msg" "bindPose7.m[74]";
connectAttr "Reference_Neck.msg" "bindPose7.m[80]";
connectAttr "Reference_Head.msg" "bindPose7.m[81]";
connectAttr "Reference_Jaw_Scale.msg" "bindPose7.m[84]";
connectAttr "Reference_Skull_Scale.msg" "bindPose7.m[85]";
connectAttr "Reference_Face_Scale.msg" "bindPose7.m[86]";
connectAttr "Reference_L_eyelish_top.msg" "bindPose7.m[87]";
connectAttr "Reference_L_eyelish_top_end.msg" "bindPose7.m[88]";
connectAttr "Reference_L_eye.msg" "bindPose7.m[89]";
connectAttr "Reference_L_eye_end.msg" "bindPose7.m[90]";
connectAttr "Reference_L_eyelish_bottom.msg" "bindPose7.m[91]";
connectAttr "Reference_L_eyelish_bottom_end.msg" "bindPose7.m[92]";
connectAttr "Reference_R_eyebrow.msg" "bindPose7.m[93]";
connectAttr "Reference_L_eyebrow.msg" "bindPose7.m[94]";
connectAttr "Reference_R_eyelish_bottom.msg" "bindPose7.m[95]";
connectAttr "Reference_R_eyelish_bottom_end.msg" "bindPose7.m[96]";
connectAttr "Reference_R_eye.msg" "bindPose7.m[97]";
connectAttr "Reference_R_eye_end.msg" "bindPose7.m[98]";
connectAttr "Reference_R_eyelish_top.msg" "bindPose7.m[99]";
connectAttr "Reference_R_eyelish_top_end.msg" "bindPose7.m[100]";
connectAttr "Reference_L_Neck_Muscl.msg" "bindPose7.m[102]";
connectAttr "Reference_R_Neck_Muscl.msg" "bindPose7.m[104]";
connectAttr "Reference_R_Clavicle.msg" "bindPose7.m[106]";
connectAttr "Reference_R_Up_arm.msg" "bindPose7.m[107]";
connectAttr "Reference_R_ForeArm.msg" "bindPose7.m[108]";
connectAttr "Reference_R_Hand.msg" "bindPose7.m[109]";
connectAttr "Reference_R_Toe_2_01.msg" "bindPose7.m[110]";
connectAttr "Reference_R_Toe_2_02.msg" "bindPose7.m[111]";
connectAttr "Reference_R_Toe_1_01.msg" "bindPose7.m[114]";
connectAttr "Reference_R_Toe_1_02.msg" "bindPose7.m[115]";
connectAttr "Reference_R_Toe_3_01.msg" "bindPose7.m[118]";
connectAttr "Reference_R_Toe_3_02.msg" "bindPose7.m[119]";
connectAttr "Reference_R_WeaponBone.msg" "bindPose7.m[123]";
connectAttr "Reference_L_back_w_____slot_10.msg" "bindPose7.m[130]";
connectAttr "Reference_L_back_weapon_slot_10.msg" "bindPose7.m[131]";
connectAttr "Reference_L_back_w_____slot_07.msg" "bindPose7.m[133]";
connectAttr "Reference_L_back_weapon_slot_07.msg" "bindPose7.m[134]";
connectAttr "Reference_C_back_w_____slot_08.msg" "bindPose7.m[136]";
connectAttr "Reference_C_back_weapon_slot_08.msg" "bindPose7.m[137]";
connectAttr "Reference_R_back_w_____slot_09.msg" "bindPose7.m[139]";
connectAttr "Reference_R_back_weapon_slot_09.msg" "bindPose7.m[140]";
connectAttr "Reference_R_back_w_____slot_06.msg" "bindPose7.m[142]";
connectAttr "Reference_R_back_weapon_slot_06.msg" "bindPose7.m[143]";
connectAttr "Reference_C_back_w_____slot_11.msg" "bindPose7.m[146]";
connectAttr "Reference_C_back_weapon_slot_11.msg" "bindPose7.m[147]";
connectAttr "Reference_L_front_w____scale_05.msg" "bindPose7.m[151]";
connectAttr "Reference_L_front_weapon_slot_05.msg" "bindPose7.m[152]";
connectAttr "Reference_L_front_w____scale_04.msg" "bindPose7.m[154]";
connectAttr "Reference_L_front_weapon_slot_04.msg" "bindPose7.m[155]";
connectAttr "Reference_R_front_w____scale_02.msg" "bindPose7.m[157]";
connectAttr "Reference_R_front_weapon_slot_02.msg" "bindPose7.m[158]";
connectAttr "Reference_R_front_w____scale_01.msg" "bindPose7.m[160]";
connectAttr "Reference_R_front_weapon_slot_01.msg" "bindPose7.m[161]";
connectAttr "Reference_C_front_w____scale_03.msg" "bindPose7.m[163]";
connectAttr "Reference_C_front_weapon_slot_03.msg" "bindPose7.m[164]";
connectAttr "bindPose7.w" "bindPose7.p[0]";
connectAttr "bindPose7.m[0]" "bindPose7.p[1]";
connectAttr "bindPose7.m[1]" "bindPose7.p[2]";
connectAttr "bindPose7.m[2]" "bindPose7.p[3]";
connectAttr "bindPose7.m[3]" "bindPose7.p[4]";
connectAttr "bindPose7.m[4]" "bindPose7.p[5]";
connectAttr "bindPose7.m[5]" "bindPose7.p[6]";
connectAttr "bindPose7.m[6]" "bindPose7.p[7]";
connectAttr "bindPose7.m[7]" "bindPose7.p[8]";
connectAttr "bindPose7.m[8]" "bindPose7.p[9]";
connectAttr "bindPose7.m[7]" "bindPose7.p[10]";
connectAttr "bindPose7.m[6]" "bindPose7.p[11]";
connectAttr "bindPose7.m[6]" "bindPose7.p[12]";
connectAttr "bindPose7.m[5]" "bindPose7.p[13]";
connectAttr "bindPose7.m[5]" "bindPose7.p[14]";
connectAttr "bindPose7.m[14]" "bindPose7.p[15]";
connectAttr "bindPose7.m[5]" "bindPose7.p[16]";
connectAttr "bindPose7.m[16]" "bindPose7.p[17]";
connectAttr "bindPose7.m[17]" "bindPose7.p[18]";
connectAttr "bindPose7.m[18]" "bindPose7.p[19]";
connectAttr "bindPose7.m[17]" "bindPose7.p[20]";
connectAttr "bindPose7.m[5]" "bindPose7.p[21]";
connectAttr "bindPose7.m[21]" "bindPose7.p[22]";
connectAttr "bindPose7.m[22]" "bindPose7.p[23]";
connectAttr "bindPose7.m[23]" "bindPose7.p[24]";
connectAttr "bindPose7.m[22]" "bindPose7.p[25]";
connectAttr "bindPose7.m[3]" "bindPose7.p[26]";
connectAttr "bindPose7.m[26]" "bindPose7.p[27]";
connectAttr "bindPose7.m[27]" "bindPose7.p[28]";
connectAttr "bindPose7.m[28]" "bindPose7.p[29]";
connectAttr "bindPose7.m[29]" "bindPose7.p[30]";
connectAttr "bindPose7.m[30]" "bindPose7.p[31]";
connectAttr "bindPose7.m[29]" "bindPose7.p[32]";
connectAttr "bindPose7.m[28]" "bindPose7.p[33]";
connectAttr "bindPose7.m[28]" "bindPose7.p[34]";
connectAttr "bindPose7.m[27]" "bindPose7.p[35]";
connectAttr "bindPose7.m[27]" "bindPose7.p[36]";
connectAttr "bindPose7.m[36]" "bindPose7.p[37]";
connectAttr "bindPose7.m[27]" "bindPose7.p[38]";
connectAttr "bindPose7.m[38]" "bindPose7.p[39]";
connectAttr "bindPose7.m[39]" "bindPose7.p[40]";
connectAttr "bindPose7.m[40]" "bindPose7.p[41]";
connectAttr "bindPose7.m[39]" "bindPose7.p[42]";
connectAttr "bindPose7.m[27]" "bindPose7.p[43]";
connectAttr "bindPose7.m[43]" "bindPose7.p[44]";
connectAttr "bindPose7.m[44]" "bindPose7.p[45]";
connectAttr "bindPose7.m[45]" "bindPose7.p[46]";
connectAttr "bindPose7.m[44]" "bindPose7.p[47]";
connectAttr "bindPose7.m[3]" "bindPose7.p[48]";
connectAttr "bindPose7.m[48]" "bindPose7.p[49]";
connectAttr "bindPose7.m[49]" "bindPose7.p[50]";
connectAttr "bindPose7.m[48]" "bindPose7.p[51]";
connectAttr "bindPose7.m[51]" "bindPose7.p[52]";
connectAttr "bindPose7.m[52]" "bindPose7.p[53]";
connectAttr "bindPose7.m[53]" "bindPose7.p[54]";
connectAttr "bindPose7.m[52]" "bindPose7.p[55]";
connectAttr "bindPose7.m[55]" "bindPose7.p[56]";
connectAttr "bindPose7.m[52]" "bindPose7.p[57]";
connectAttr "bindPose7.m[57]" "bindPose7.p[58]";
connectAttr "bindPose7.m[58]" "bindPose7.p[59]";
connectAttr "bindPose7.m[59]" "bindPose7.p[60]";
connectAttr "bindPose7.m[60]" "bindPose7.p[61]";
connectAttr "bindPose7.m[61]" "bindPose7.p[62]";
connectAttr "bindPose7.m[62]" "bindPose7.p[63]";
connectAttr "bindPose7.m[61]" "bindPose7.p[64]";
connectAttr "bindPose7.m[60]" "bindPose7.p[65]";
connectAttr "bindPose7.m[65]" "bindPose7.p[66]";
connectAttr "bindPose7.m[66]" "bindPose7.p[67]";
connectAttr "bindPose7.m[65]" "bindPose7.p[68]";
connectAttr "bindPose7.m[60]" "bindPose7.p[69]";
connectAttr "bindPose7.m[69]" "bindPose7.p[70]";
connectAttr "bindPose7.m[70]" "bindPose7.p[71]";
connectAttr "bindPose7.m[69]" "bindPose7.p[72]";
connectAttr "bindPose7.m[60]" "bindPose7.p[73]";
connectAttr "bindPose7.m[60]" "bindPose7.p[74]";
connectAttr "bindPose7.m[59]" "bindPose7.p[75]";
connectAttr "bindPose7.m[59]" "bindPose7.p[76]";
connectAttr "bindPose7.m[58]" "bindPose7.p[77]";
connectAttr "bindPose7.m[58]" "bindPose7.p[78]";
connectAttr "bindPose7.m[57]" "bindPose7.p[79]";
connectAttr "bindPose7.m[52]" "bindPose7.p[80]";
connectAttr "bindPose7.m[80]" "bindPose7.p[81]";
connectAttr "bindPose7.m[81]" "bindPose7.p[82]";
connectAttr "bindPose7.m[81]" "bindPose7.p[83]";
connectAttr "bindPose7.m[81]" "bindPose7.p[84]";
connectAttr "bindPose7.m[81]" "bindPose7.p[85]";
connectAttr "bindPose7.m[81]" "bindPose7.p[86]";
connectAttr "bindPose7.m[86]" "bindPose7.p[87]";
connectAttr "bindPose7.m[87]" "bindPose7.p[88]";
connectAttr "bindPose7.m[86]" "bindPose7.p[89]";
connectAttr "bindPose7.m[89]" "bindPose7.p[90]";
connectAttr "bindPose7.m[86]" "bindPose7.p[91]";
connectAttr "bindPose7.m[91]" "bindPose7.p[92]";
connectAttr "bindPose7.m[86]" "bindPose7.p[93]";
connectAttr "bindPose7.m[86]" "bindPose7.p[94]";
connectAttr "bindPose7.m[86]" "bindPose7.p[95]";
connectAttr "bindPose7.m[95]" "bindPose7.p[96]";
connectAttr "bindPose7.m[86]" "bindPose7.p[97]";
connectAttr "bindPose7.m[97]" "bindPose7.p[98]";
connectAttr "bindPose7.m[86]" "bindPose7.p[99]";
connectAttr "bindPose7.m[99]" "bindPose7.p[100]";
connectAttr "bindPose7.m[80]" "bindPose7.p[101]";
connectAttr "bindPose7.m[52]" "bindPose7.p[102]";
connectAttr "bindPose7.m[102]" "bindPose7.p[103]";
connectAttr "bindPose7.m[52]" "bindPose7.p[104]";
connectAttr "bindPose7.m[104]" "bindPose7.p[105]";
connectAttr "bindPose7.m[52]" "bindPose7.p[106]";
connectAttr "bindPose7.m[106]" "bindPose7.p[107]";
connectAttr "bindPose7.m[107]" "bindPose7.p[108]";
connectAttr "bindPose7.m[108]" "bindPose7.p[109]";
connectAttr "bindPose7.m[109]" "bindPose7.p[110]";
connectAttr "bindPose7.m[110]" "bindPose7.p[111]";
connectAttr "bindPose7.m[111]" "bindPose7.p[112]";
connectAttr "bindPose7.m[110]" "bindPose7.p[113]";
connectAttr "bindPose7.m[109]" "bindPose7.p[114]";
connectAttr "bindPose7.m[114]" "bindPose7.p[115]";
connectAttr "bindPose7.m[115]" "bindPose7.p[116]";
connectAttr "bindPose7.m[114]" "bindPose7.p[117]";
connectAttr "bindPose7.m[109]" "bindPose7.p[118]";
connectAttr "bindPose7.m[118]" "bindPose7.p[119]";
connectAttr "bindPose7.m[119]" "bindPose7.p[120]";
connectAttr "bindPose7.m[118]" "bindPose7.p[121]";
connectAttr "bindPose7.m[109]" "bindPose7.p[122]";
connectAttr "bindPose7.m[109]" "bindPose7.p[123]";
connectAttr "bindPose7.m[108]" "bindPose7.p[124]";
connectAttr "bindPose7.m[108]" "bindPose7.p[125]";
connectAttr "bindPose7.m[107]" "bindPose7.p[126]";
connectAttr "bindPose7.m[107]" "bindPose7.p[127]";
connectAttr "bindPose7.m[106]" "bindPose7.p[128]";
connectAttr "bindPose7.m[52]" "bindPose7.p[129]";
connectAttr "bindPose7.m[52]" "bindPose7.p[130]";
connectAttr "bindPose7.m[130]" "bindPose7.p[131]";
connectAttr "bindPose7.m[131]" "bindPose7.p[132]";
connectAttr "bindPose7.m[52]" "bindPose7.p[133]";
connectAttr "bindPose7.m[133]" "bindPose7.p[134]";
connectAttr "bindPose7.m[134]" "bindPose7.p[135]";
connectAttr "bindPose7.m[52]" "bindPose7.p[136]";
connectAttr "bindPose7.m[136]" "bindPose7.p[137]";
connectAttr "bindPose7.m[137]" "bindPose7.p[138]";
connectAttr "bindPose7.m[52]" "bindPose7.p[139]";
connectAttr "bindPose7.m[139]" "bindPose7.p[140]";
connectAttr "bindPose7.m[140]" "bindPose7.p[141]";
connectAttr "bindPose7.m[52]" "bindPose7.p[142]";
connectAttr "bindPose7.m[142]" "bindPose7.p[143]";
connectAttr "bindPose7.m[143]" "bindPose7.p[144]";
connectAttr "bindPose7.m[51]" "bindPose7.p[145]";
connectAttr "bindPose7.m[51]" "bindPose7.p[146]";
connectAttr "bindPose7.m[146]" "bindPose7.p[147]";
connectAttr "bindPose7.m[147]" "bindPose7.p[148]";
connectAttr "bindPose7.m[48]" "bindPose7.p[149]";
connectAttr "bindPose7.m[3]" "bindPose7.p[150]";
connectAttr "bindPose7.m[3]" "bindPose7.p[151]";
connectAttr "bindPose7.m[151]" "bindPose7.p[152]";
connectAttr "bindPose7.m[152]" "bindPose7.p[153]";
connectAttr "bindPose7.m[3]" "bindPose7.p[154]";
connectAttr "bindPose7.m[154]" "bindPose7.p[155]";
connectAttr "bindPose7.m[155]" "bindPose7.p[156]";
connectAttr "bindPose7.m[3]" "bindPose7.p[157]";
connectAttr "bindPose7.m[157]" "bindPose7.p[158]";
connectAttr "bindPose7.m[158]" "bindPose7.p[159]";
connectAttr "bindPose7.m[3]" "bindPose7.p[160]";
connectAttr "bindPose7.m[160]" "bindPose7.p[161]";
connectAttr "bindPose7.m[161]" "bindPose7.p[162]";
connectAttr "bindPose7.m[3]" "bindPose7.p[163]";
connectAttr "bindPose7.m[163]" "bindPose7.p[164]";
connectAttr "bindPose7.m[164]" "bindPose7.p[165]";
connectAttr "add_Atlas_12.oc" "add_blinn1SG16.ss";
connectAttr "add_blinn1SG16.msg" "add_materialInfo24.sg";
connectAttr "add_Atlas_12.msg" "add_materialInfo24.m";
connectAttr "blinn1SG3.msg" "add_materialInfo25.sg";
connectAttr "add_blinn1SG16.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo13.tgi[0].ni[0].dn"
		;
connectAttr "add_bump2d5.o" "add_Atlas_13.n";
connectAttr "add_file12.oc" "add_Atlas_13.c";
connectAttr "add_file12.ot" "add_Atlas_13.it";
connectAttr "add_Atlas_13.oc" "add_blinn1SG17.ss";
connectAttr "add_blinn1SG17.msg" "add_materialInfo26.sg";
connectAttr "add_Atlas_13.msg" "add_materialInfo26.m";
connectAttr "add_file12.msg" "add_materialInfo26.t" -na;
connectAttr "add_blinn1SG17.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo14.tgi[0].ni[1].dn"
		;
connectAttr "add_Atlas_13.msg" "add_hyperShadePrimaryNodeEditorSavedTabsInfo14.tgi[0].ni[3].dn"
		;
connectAttr ":defaultColorMgtGlobals.cme" "add_file10.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "add_file10.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "add_file10.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "add_file10.ws";
connectAttr "add_place2dTexture15.c" "add_file10.c";
connectAttr "add_place2dTexture15.tf" "add_file10.tf";
connectAttr "add_place2dTexture15.rf" "add_file10.rf";
connectAttr "add_place2dTexture15.mu" "add_file10.mu";
connectAttr "add_place2dTexture15.mv" "add_file10.mv";
connectAttr "add_place2dTexture15.s" "add_file10.s";
connectAttr "add_place2dTexture15.wu" "add_file10.wu";
connectAttr "add_place2dTexture15.wv" "add_file10.wv";
connectAttr "add_place2dTexture15.re" "add_file10.re";
connectAttr "add_place2dTexture15.of" "add_file10.of";
connectAttr "add_place2dTexture15.r" "add_file10.ro";
connectAttr "add_place2dTexture15.n" "add_file10.n";
connectAttr "add_place2dTexture15.vt1" "add_file10.vt1";
connectAttr "add_place2dTexture15.vt2" "add_file10.vt2";
connectAttr "add_place2dTexture15.vt3" "add_file10.vt3";
connectAttr "add_place2dTexture15.vc1" "add_file10.vc1";
connectAttr "add_place2dTexture15.o" "add_file10.uv";
connectAttr "add_place2dTexture15.ofs" "add_file10.fs";
connectAttr "add_file10.oa" "add_bump2d5.bv";
connectAttr "add_file11.oa" "add_bump2d5.bd";
connectAttr ":defaultColorMgtGlobals.cme" "add_file11.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "add_file11.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "add_file11.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "add_file11.ws";
connectAttr "add_place2dTexture16.c" "add_file11.c";
connectAttr "add_place2dTexture16.tf" "add_file11.tf";
connectAttr "add_place2dTexture16.rf" "add_file11.rf";
connectAttr "add_place2dTexture16.mu" "add_file11.mu";
connectAttr "add_place2dTexture16.mv" "add_file11.mv";
connectAttr "add_place2dTexture16.s" "add_file11.s";
connectAttr "add_place2dTexture16.wu" "add_file11.wu";
connectAttr "add_place2dTexture16.wv" "add_file11.wv";
connectAttr "add_place2dTexture16.re" "add_file11.re";
connectAttr "add_place2dTexture16.of" "add_file11.of";
connectAttr "add_place2dTexture16.r" "add_file11.ro";
connectAttr "add_place2dTexture16.n" "add_file11.n";
connectAttr "add_place2dTexture16.vt1" "add_file11.vt1";
connectAttr "add_place2dTexture16.vt2" "add_file11.vt2";
connectAttr "add_place2dTexture16.vt3" "add_file11.vt3";
connectAttr "add_place2dTexture16.vc1" "add_file11.vc1";
connectAttr "add_place2dTexture16.o" "add_file11.uv";
connectAttr "add_place2dTexture16.ofs" "add_file11.fs";
connectAttr ":defaultColorMgtGlobals.cme" "add_file12.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "add_file12.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "add_file12.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "add_file12.ws";
connectAttr "add_place2dTexture17.c" "add_file12.c";
connectAttr "add_place2dTexture17.tf" "add_file12.tf";
connectAttr "add_place2dTexture17.rf" "add_file12.rf";
connectAttr "add_place2dTexture17.mu" "add_file12.mu";
connectAttr "add_place2dTexture17.mv" "add_file12.mv";
connectAttr "add_place2dTexture17.s" "add_file12.s";
connectAttr "add_place2dTexture17.wu" "add_file12.wu";
connectAttr "add_place2dTexture17.wv" "add_file12.wv";
connectAttr "add_place2dTexture17.re" "add_file12.re";
connectAttr "add_place2dTexture17.of" "add_file12.of";
connectAttr "add_place2dTexture17.r" "add_file12.ro";
connectAttr "add_place2dTexture17.n" "add_file12.n";
connectAttr "add_place2dTexture17.vt1" "add_file12.vt1";
connectAttr "add_place2dTexture17.vt2" "add_file12.vt2";
connectAttr "add_place2dTexture17.vt3" "add_file12.vt3";
connectAttr "add_place2dTexture17.vc1" "add_file12.vc1";
connectAttr "add_place2dTexture17.o" "add_file12.uv";
connectAttr "add_place2dTexture17.ofs" "add_file12.fs";
connectAttr "FT_RebelClothes3_M_HMSG.pa" ":renderPartition.st" -na;
connectAttr "ChaosCultist4_F_HM_scale_x001:blinn1SG.pa" ":renderPartition.st" -na
		;
connectAttr "ChaosCultist4_F_HM_scale_x002:blinn1SG.pa" ":renderPartition.st" -na
		;
connectAttr "Seneshal_F_HM_scale_x001:blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "ImperialNavy_F_HM_scale_x001:blinn1SG.pa" ":renderPartition.st" -na
		;
connectAttr "CrimeLordRogueTrader_F_HM_Scale_x001:blinn1SG.pa" ":renderPartition.st"
		 -na;
connectAttr "CriminalCostume_F_HM_Scale_x001:blinn1SG.pa" ":renderPartition.st" 
		-na;
connectAttr "AdeptasSororittas_F_HM_Scale_x001:blinn1SG.pa" ":renderPartition.st"
		 -na;
connectAttr "MilitarumTempestusCarapace_F_HM_scale_x001:blinn1SG.pa" ":renderPartition.st"
		 -na;
connectAttr "LowLifer1_F_HM_Scale_x001:HM_F_Brows05_F_HMSG.pa" ":renderPartition.st"
		 -na;
connectAttr "BalefulEye1_F_HM_scale_x001:blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "IndustrialWorker1_F_HM_Scale_x001:blinn1SG.pa" ":renderPartition.st"
		 -na;
connectAttr "AgriWorker1_F_HM_Scale_x001:blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "GangMember4_F_HM_Scale_x001:blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "FootfallWorker1_F_HM_Scale_x001:blinn1SG.pa" ":renderPartition.st" 
		-na;
connectAttr "Drukhari_Medusae_F_HM_scale_x001:blinn1SG.pa" ":renderPartition.st"
		 -na;
connectAttr "Cloak1_F_HM_Scale_x001:atlas_1SG.pa" ":renderPartition.st" -na;
connectAttr "Cloak1_F_HM_Scale_x001:blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "GangMember3_F_HM_Scale_x001:blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "TheodoraClothes_F_HM_Scale_x001:blinn2SG.pa" ":renderPartition.st" 
		-na;
connectAttr "lambert4SG.pa" ":renderPartition.st" -na;
connectAttr "SP_Jae_F_HMSG1.pa" ":renderPartition.st" -na;
connectAttr "FlakArmor_F_HM_scale_x001:blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "EY_Eyes02_F_HMSG.pa" ":renderPartition.st" -na;
connectAttr "HH_Hair02_F_HMSG.pa" ":renderPartition.st" -na;
connectAttr "Eyewear1_F_HM_Scale_x002:lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "HH_Hair09_F_HMSG.pa" ":renderPartition.st" -na;
connectAttr "HD_Head09_F_HMSG.pa" ":renderPartition.st" -na;
connectAttr "FlakArmor_F_HM_scale_x002:blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "Eyewear2_F_HM_Scale_x001:blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "Boots1_F_HM_Scale_x001:lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "GangMember1_F_HM_Scale_x001:atlas_1SG.pa" ":renderPartition.st" -na
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:FA_AdeptaSororitasPowerArmor_F_FMSG.pa" ":renderPartition.st"
		 -na;
connectAttr "ImperialNobiliti_F_HM_Scale_x001:blinn1SG.pa" ":renderPartition.st"
		 -na;
connectAttr "BW_Brows01_F_HMSG.pa" ":renderPartition.st" -na;
connectAttr "pasted__lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "heads_lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "pasted__FT_RebelClothes3_M_HMSG.pa" ":renderPartition.st" -na;
connectAttr "blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG1.pa" ":renderPartition.st" -na;
connectAttr "SP_ImperialNavy_M_HM_LPSG.pa" ":renderPartition.st" -na;
connectAttr "blinn1SG1.pa" ":renderPartition.st" -na;
connectAttr "blinn1SG2.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG5.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG6.pa" ":renderPartition.st" -na;
connectAttr "CL_NavyRenegade_M_HMSG.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG7.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG9.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG8.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG10.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG11.pa" ":renderPartition.st" -na;
connectAttr "blinn2SG.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG12.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG13.pa" ":renderPartition.st" -na;
connectAttr "add_blinn2SG1.pa" ":renderPartition.st" -na;
connectAttr "pasted__BC_ChestCommissar_F_HMSG.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG14.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG15.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG2.pa" ":renderPartition.st" -na;
connectAttr "HM_F_Brows05_F_HMSG.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG16.pa" ":renderPartition.st" -na;
connectAttr "blinn1SG3.pa" ":renderPartition.st" -na;
connectAttr "add_blinn1SG17.pa" ":renderPartition.st" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "ChaosCultist4_F_HM_scale_x001:atlas_1.msg" ":defaultShaderList1.s" 
		-na;
connectAttr "ChaosCultist4_F_HM_scale_x002:atlas_1.msg" ":defaultShaderList1.s" 
		-na;
connectAttr "Seneshal_F_HM_scale_x001:atlas_1.msg" ":defaultShaderList1.s" -na;
connectAttr "ImperialNavy_F_HM_scale_x001:atlas_1.msg" ":defaultShaderList1.s" -na
		;
connectAttr "CrimeLordRogueTrader_F_HM_Scale_x001:atlas_1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "CriminalCostume_F_HM_Scale_x001:atlas_1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "AdeptasSororittas_F_HM_Scale_x001:atlas_1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "MilitarumTempestusCarapace_F_HM_scale_x001:atlas_1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "LowLifer1_F_HM_Scale_x001:atlas1.msg" ":defaultShaderList1.s" -na;
connectAttr "BalefulEye1_F_HM_scale_x001:atlas_1.msg" ":defaultShaderList1.s" -na
		;
connectAttr "IndustrialWorker1_F_HM_Scale_x001:atlas_1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "AgriWorker1_F_HM_Scale_x001:atlas_1.msg" ":defaultShaderList1.s" -na
		;
connectAttr "GangMember4_F_HM_Scale_x001:atlas_1.msg" ":defaultShaderList1.s" -na
		;
connectAttr "FootfallWorker1_F_HM_Scale_x001:atlas_1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "Drukhari_Medusae_F_HM_scale_x001:Atlas_1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "Cloak1_F_HM_Scale_x001:atlas_1.msg" ":defaultShaderList1.s" -na;
connectAttr "Cloak1_F_HM_Scale_x001:CP_Cloak1.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert3.msg" ":defaultShaderList1.s" -na;
connectAttr "GangMember3_F_HM_Scale_x001:atlas_1.msg" ":defaultShaderList1.s" -na
		;
connectAttr "TheodoraClothes_F_HM_Scale_x001:atlas_1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "lambert4.msg" ":defaultShaderList1.s" -na;
connectAttr "Jay_Body:Jay_body1.msg" ":defaultShaderList1.s" -na;
connectAttr "FlakArmor_F_HM_scale_x001:atlas_1.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert5.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert6.msg" ":defaultShaderList1.s" -na;
connectAttr "Eyewear1_F_HM_Scale_x002:Atlas1.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert8.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert9.msg" ":defaultShaderList1.s" -na;
connectAttr "FlakArmor_F_HM_scale_x002:atlas_1.msg" ":defaultShaderList1.s" -na;
connectAttr "Eyewear2_F_HM_Scale_x001:Atlas_1.msg" ":defaultShaderList1.s" -na;
connectAttr "Boots1_F_HM_Scale_x001:Atlas1.msg" ":defaultShaderList1.s" -na;
connectAttr "GangMember1_F_HM_Scale_x001:atlas_1.msg" ":defaultShaderList1.s" -na
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:atlas_1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "ImperialNobiliti_F_HM_Scale_x001:Atlas_1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "DefaultMaterial.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__DefaultMaterial.msg" ":defaultShaderList1.s" -na;
connectAttr "heads_DefaultMaterial.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "Atlas_1.msg" ":defaultShaderList1.s" -na;
connectAttr "add_Atlas_1.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__Atlas_1.msg" ":defaultShaderList1.s" -na;
connectAttr "add_Atlas_2.msg" ":defaultShaderList1.s" -na;
connectAttr "atlas_1.msg" ":defaultShaderList1.s" -na;
connectAttr "ImperialNavyCape_mat.msg" ":defaultShaderList1.s" -na;
connectAttr "CP_ImperialRogueTrader.msg" ":defaultShaderList1.s" -na;
connectAttr "SP_ImperialNavy.msg" ":defaultShaderList1.s" -na;
connectAttr "add_Atlas_3.msg" ":defaultShaderList1.s" -na;
connectAttr "Character_human_atlas_layout_4k_WH_M.msg" ":defaultShaderList1.s" -na
		;
connectAttr "Atlas_2.msg" ":defaultShaderList1.s" -na;
connectAttr "Atlas_3.msg" ":defaultShaderList1.s" -na;
connectAttr "add_atlas_1.msg" ":defaultShaderList1.s" -na;
connectAttr "add_Atlas_4.msg" ":defaultShaderList1.s" -na;
connectAttr "add_Atlas_5.msg" ":defaultShaderList1.s" -na;
connectAttr "CP_CloakAstraMilitariumRT_M1.msg" ":defaultShaderList1.s" -na;
connectAttr "add_atlas_2.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__atlas_1.msg" ":defaultShaderList1.s" -na;
connectAttr "add_Atlas_6.msg" ":defaultShaderList1.s" -na;
connectAttr "Atlas1.msg" ":defaultShaderList1.s" -na;
connectAttr "add_Atlas_7.msg" ":defaultShaderList1.s" -na;
connectAttr "add_Atlas_8.msg" ":defaultShaderList1.s" -na;
connectAttr "add_Atlas_9.msg" ":defaultShaderList1.s" -na;
connectAttr "BP_AdeptusAdministratum_M.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__DefaultMaterial1.msg" ":defaultShaderList1.s" -na;
connectAttr "ChaosCultist4__scale_x001:Atlas_1.msg" ":defaultShaderList1.s" -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:atlas_1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:atlas_1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "pasted__DefaultMaterial2.msg" ":defaultShaderList1.s" -na;
connectAttr "ChaosCultist4__scale_x002:Atlas_1.msg" ":defaultShaderList1.s" -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:atlas_1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:atlas_1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "add_Atlas_10.msg" ":defaultShaderList1.s" -na;
connectAttr "BA_AdeptasSororitasAnointedSaintArmor01_M.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "BP_AdeptasSororitasAnointedSaintArmor_M.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "add_Atlas_11.msg" ":defaultShaderList1.s" -na;
connectAttr "BP_AdeptaSororitasRelicArmor_n.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__atlas_2.msg" ":defaultShaderList1.s" -na;
connectAttr "add_atlas_3.msg" ":defaultShaderList1.s" -na;
connectAttr "atlas.msg" ":defaultShaderList1.s" -na;
connectAttr "add_Atlas_12.msg" ":defaultShaderList1.s" -na;
connectAttr "add_Atlas_13.msg" ":defaultShaderList1.s" -na;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture5.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "CriminalCostume_F_HM_Scale_x001:bump2d2.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "CriminalCostume_F_HM_Scale_x001:place2dTexture6.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "LowLifer1_F_HM_Scale_x001:place2dTexture1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "BalefulEye1_F_HM_scale_x001:_Checker.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "GangMember4_F_HM_Scale_x001:place2dTexture1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "TheodoraClothes_F_HM_Scale_x001:place2dTexture1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "TheodoraClothes_F_HM_Scale_x001:bump2d1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "place2dTexture5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "FlakArmor_F_HM_scale_x001:place2dTexture13.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "place2dTexture8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "Eyewear1_F_HM_Scale_x002:place2dTexture8.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "place2dTexture9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "FlakArmor_F_HM_scale_x002:place2dTexture13.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture15.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture16.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "Boots1_F_HM_Scale_x001:bump2d7.msg" ":defaultRenderUtilityList1.u" 
		-na;
connectAttr "Boots1_F_HM_Scale_x001:place2dTexture17.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "GangMember1_F_HM_Scale_x001:place2dTexture21.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:place2dTexture1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "place2dTexture11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "bump2d1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_bump2d1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_bump2d2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "bump2d2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "bump2d3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_bump2d3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture11.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "pasted__bump2d1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "pasted__place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "ChaosCultist4__scale_x001:bump2d1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "ChaosCultist4__scale_x001:place2dTexture2.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:place2dTexture1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:bump2d1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:place2dTexture1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:bump2d1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "ChaosCultist4__scale_x002:bump2d1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "ChaosCultist4__scale_x002:place2dTexture2.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:place2dTexture1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:bump2d1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:place2dTexture1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:bump2d1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "add_place2dTexture12.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_bump2d4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture13.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture14.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture15.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_bump2d5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture16.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "add_place2dTexture17.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "CriminalCostume_F_HM_Scale_x001:file1.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "CriminalCostume_F_HM_Scale_x001:file5.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "CriminalCostume_F_HM_Scale_x001:file6.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "LowLifer1_F_HM_Scale_x001:file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "BalefulEye1_F_HM_scale_x001:_Checker_tex.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "GangMember4_F_HM_Scale_x001:file1.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "file3.msg" ":defaultTextureList1.tx" -na;
connectAttr "file4.msg" ":defaultTextureList1.tx" -na;
connectAttr "TheodoraClothes_F_HM_Scale_x001:TheodoraClothes_bn_1.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "file5.msg" ":defaultTextureList1.tx" -na;
connectAttr "Jay_Body:AT_Djai_F_HM_d_Recovered_2.msg" ":defaultTextureList1.tx" 
		-na;
connectAttr "FlakArmor_F_HM_scale_x001:file13.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "HD_Head01_F_HM_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "Eyewear1_F_HM_Scale_x002:file7.msg" ":defaultTextureList1.tx" -na;
connectAttr "AT_Jay_F_HH_d_3.msg" ":defaultTextureList1.tx" -na;
connectAttr "AT_Djai_F_HM_d_Recovered_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "FlakArmor_F_HM_scale_x002:file13.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "Boots1_F_HM_Scale_x001:file11.msg" ":defaultTextureList1.tx" -na;
connectAttr "Boots1_F_HM_Scale_x001:file12.msg" ":defaultTextureList1.tx" -na;
connectAttr "Boots1_F_HM_Scale_x001:file13.msg" ":defaultTextureList1.tx" -na;
connectAttr "GangMember1_F_HM_Scale_x001:file21.msg" ":defaultTextureList1.tx" -na
		;
connectAttr "AdeptaSororitasPowerArmor_F_HM_Scale_x001:file1.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "file6.msg" ":defaultTextureList1.tx" -na;
connectAttr "add_file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "add_file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "AT_Boots4_n_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "add_file4.msg" ":defaultTextureList1.tx" -na;
connectAttr "add_file5.msg" ":defaultTextureList1.tx" -na;
connectAttr "add_file3.msg" ":defaultTextureList1.tx" -na;
connectAttr "EnforcerLightCarapace_bn_P.msg" ":defaultTextureList1.tx" -na;
connectAttr "Character_human_atlas_layout_4k_WH_P.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "EnforcerLightCarapace_bn_P1.msg" ":defaultTextureList1.tx" -na;
connectAttr "LL_EnforcerLightCarapace_n_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "add_file6.msg" ":defaultTextureList1.tx" -na;
connectAttr "Seneshal_N_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "pasted__Seneshal_N_1.msg" ":defaultTextureList1.tx" -na;
connectAttr "ChaosCultist4__scale_x001:ChaosCultist4_N_1.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x001:CrimeLordRogueTrader_N_1.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x002:CrimeLordRogueTrader_N_1.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "ChaosCultist4__scale_x002:ChaosCultist4_N_1.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x003:CrimeLordRogueTrader_N_1.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "CrimeLordRogueTrader_M_HM_Scale_x004:CrimeLordRogueTrader_N_1.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "add_file7.msg" ":defaultTextureList1.tx" -na;
connectAttr "add_file8.msg" ":defaultTextureList1.tx" -na;
connectAttr "add_file9.msg" ":defaultTextureList1.tx" -na;
connectAttr "add_file10.msg" ":defaultTextureList1.tx" -na;
connectAttr "add_file11.msg" ":defaultTextureList1.tx" -na;
connectAttr "add_file12.msg" ":defaultTextureList1.tx" -na;
connectAttr "BalefulEye1_F_HM_scale_x001:_Checker_tex.oc" ":lambert1.c";
connectAttr "BalefulEye1_F_HM_scale_x001:_Checker_tex.msg" ":initialMaterialInfo.t"
		 -na;
connectAttr "BalefulEye1_F_HM_scale_x001:TS_TorsoBase_M_HMShapeHiddenFacesSet.msg" ":defaultHideFaceDataSet.dnsm"
		 -na;
connectAttr "Eyewear1_F_HM_Scale_x001:TS_TorsoBase_M_HMShapeHiddenFacesSet.msg" ":defaultHideFaceDataSet.dnsm"
		 -na;
connectAttr "Eyewear1_F_HM_Scale_x002:TS_TorsoBase_M_HMShapeHiddenFacesSet.msg" ":defaultHideFaceDataSet.dnsm"
		 -na;
// End of reference_human_female_skeleton.ma
