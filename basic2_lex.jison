/* description: Basic grammar that contains a nullable A nonterminal. */

%lex
%%

\s+               {/* skip whitespace */}
[a-zA-Z_]\w*      {return 'ID';}
\d+		  {return 'NUM';}
[;\.]             {return 'SEP';}
[=]               {return 'EQU';}

/lex

%left 'SEP'

%{

    variables = {};   

%}

%%

s   :   a        {
                    console.log("Fin");
		    console.log(JSON.stringify(variables));
                 }
    ;

a   : /* empty */  
    | a SEP a    {
	            console.log("Separación");		
                 }
    | ID EQU NUM {
	            console.log("Igualdad detectada");
		    variables[$1] = Number($3);
                 }
    ;

