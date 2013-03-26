ExtractDenoteExamples := function()
local dirname, file, f, filename, content, alltests, output, nr, line, teststart, testlines;
dirname:= DirectoryCurrent();
alltests := [ ];
# Exclude hidden files and directories. Sort to ensure the order is not system-dependent
for file in SortedList( Filtered( DirectoryContents(dirname), f -> Length(f)>4 and f[1] <> '.' ) ) do
  if file{[Length(file)-3..Length(file)]} = ".txt" then 
    filename := Filename ( dirname, file );
    content := SplitString( StringFile( filename ), "\r\n");
    output := [ ];
    nr:=0;
    repeat
        nr := nr+1;
        if nr > Length(content) then
            break;
        fi;
        line := content[nr];
        if Length(line) > 0 then
            if line[1]='|' then
                # new example starts here
                teststart := nr;
                testlines := [];
                repeat
                    Add( testlines, Concatenation(line{[3..Length(line)]},"\n") );
                    nr := nr+1; 
                    if nr > Length(content) then
                        break;
                    fi;
                    line := content[nr];
                until Length(line)=0 or line[1] <> '|';
                if Length( testlines ) > 0 then
                    Add(output, Concatenation( "# ", filename, ", line ", String(teststart), "\n") );
                    Append(output, testlines );
                    Add( output, "\n" );
                fi;
            fi;
        fi;
    until false;
    if Length(output) > 0 then 
      Add( output, "#######################\n#END\n");
      Add( alltests, [ filename, Concatenation( output ) ] );
    fi;  
  fi;  
od;
return alltests;
end;


TestDenoteExamples:=function()
    local tests, t, resfile, testfile, str;
    tests := ExtractDenoteExamples();
    for t in tests do
        Print("Checking " , t[1],"\n");
        resfile := "TESTDENOTEOUTPUT";
        testfile := Concatenation( t[1],".tst");
        FileString( testfile , t[2] );
        Exec( Concatenation(
        "echo 'Test(\"", testfile, "\");' | ~/HGREPS/hpcgap/bin/gap.sh -b -r -A -S -q > ", resfile ));
        str := StringFile(resfile);
        Print(str);
    od;
    RemoveFile(resfile);
end;