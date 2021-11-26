@Echo off
@Echo .
@Echo . TEST2 append argument %1 to file name with suffix %1
@Echo . Concept: SET <feature> (<state> | <state> <value>)
@Echo . 
@Echo . <feature>:
@Echo . 
@Echo . Terms: <attribute> in all cases means: (<attribute> | <identifier> | <property>)
@Echo . It really depends on your use case and domain jargon. 
@Echo . IE. It refers to broadly feature identifiers where attributes is the more common use case. 
@Echo . Valid if: 
@Echo . Exists <feature>.CFG (The feature name, alone or as a suffix to Actions, States and attribute values. 
@Echo . Exists <feature><state>.CFG (get set to <value>, if omitted display contents)
@Echo . Exists <feature>_<state>.CFG (set feature to this state, ie ON, OFF, <FeatureAttributeState>)
@Echo . 
@Echo . (<state> | <state> <value>*):
@Echo .
@Echo . <state>: Text.
@Echo . Ussage is by case and may be attributes, options, debug or plugin points, etc. 
@Echo . So these are attributes that you can set for the feature.
@Echo . From another view, features should have a boolean On / Off often.
@Echo . However a feature or module has dozens settings where
@Echo . you will see the most essential implemented here. 
@Echo . More often, you will see code that is external to the companion
@Echo . (calling) application executed at the command prompt.
@Echo . 
@Echo . Feature/attribute settings (SET) are constrained by defined states
@Echo . while allowing the user to (VERY UNSAFELY) enter text/numeric values 
@Echo . where appropiate. Both variations can be valid concurrently.
@Echo . For example PAUSE as a debug setting. 
@Echo . Valid values include ON OFF 0-999* <empty>.
@Echo . 
@Echo . They are controlled the same way as the main feature.
@Echo . By intention, many features
@Echo . 
@Echo . 
@Echo . <value>: Text, not validated currently (which is limited in either case.) 
@Echo . 
@Echo . Example: SET SearchBrowser FireFox
@Echo . Feature = Search, Attribute = Browser, value = "FireFox"
@Echo . Example: SET Pause On
@Echo . Example: SET PauseZone On
@Echo . Example: SET PauseZonePublic Off
@Echo . 
@Echo . Filenames have this structure:
@Echo . <Feature><FeatureAttribute>(<FeatureAttributeValue> | <FeatureAttributeState>).CFG
@Echo . Syntax: XXXXX <state> allowing: 
@Echo . Feature, Feature Attribute, Feature Attribute Value or State changing content, 
@Echo . 
@Echo . 
@Echo . 
@Echo . (original Axion Sw&Sys / MacroscopeDM)
@Echo . file extensions: 
@Echo . 
@Echo . CFG = <feature> exists
@Echo . DAT = <feature> <value>
@Echo . STD = <feature> <value> <default>
@Echo . OLD = <feature> <value> (<prev> | <original>) 
@Echo . 
@Echo . file name prefixes: 
@Echo . _SET =
@Echo . <featureAttribute> = Text, short legth. 
@Echo . <featureAttributeValue> = Text, short legth. 

@Echo . _ON =
@Echo . _OFF =
@Echo . _BEG = Beginning
@Echo . _END = 
@Echo . _STAT = State / Status
@Echo .
@Echo .
@Echo .
@Echo .
@Echo .
@Echo .
@Echo .


@Echo .
@Echo . Simply place %2 into the .result file named %1
@Echo .
@Echo . del TEST2%1.result
@del TEST2%1.result
@Echo .
@Echo . syntax: TEST2 name value (%1) content value (%2)
@Echo . Echo %1 1> TEST2.result
@Echo %2 1> TEST2%1.result
@Echo .
@Echo . Result:
@Type TEST2%1.result
@Echo .
@Echo . Done.