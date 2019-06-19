# Custom command-line utilities

A collection of command-line utilities that have filled a need I had - I'll add new ones as the need arises.

## Installation

1) Clone this repository (`git clone https://github.com/pdexheimer/cmdline_utils.git`)
2) Source the included activate inside your shell startup script  - .bash\_profile or .zshrc, for example (`source <DIR>/activate`)
3) That's it! (Maybe?  You might need to `chmod a+x *` to make the files executable)

## Utilities

As a general rule, all utilities that operate on files will read from standard in if no file is specified.  All utilities write output to standard output.  Nearly all of these utilities will display a help message with the -?, -h, or --help parameters.

* **change\_delimiter** - Change the delimiters in a \<whatever\>-separated text file.  Respects both quoting and escaping of cell contents.
* **csv2tsv**, **tsv2csv** - These are bash aliases that are defined using change\_delimiter
* **header** - Extract column headers from a file and display them with their column numbers and (optionally) example values
* **hgrep** - Grep with headers.  Invokes the standard grep utility, but first displays the first line of the file.
* **number** - Prepends a line number to every line of input.  The only utility with no options or help message.
* **ocut** - Ordered cut.  The cut utility always outputs selected files in order - ie, specifying `cut -f 3,2,1` will output the first three columns of the input, in the same order as the input.  The ocut utility mimics cut, but uses the order specified by the user.
* **transpose** - Transposes a text file matrix.

## Examples

Data exploration - what does my file look like?

`header -n 3 <FILE>`

Transpose a simple tsv

`transpose -n -1 file.tsv > fileT.tsv`

Transpose a csv file, but use tabs as the delimiter in the new file

`transpose -d , -n -1 file.csv | csv2tsv > fileT.tsv`

OR

`csv2tsv file.csv | transpose -n -1 > fileT.tsv`

Identify lines in a csv that include the value "January 1, 2010" in a single cell.  Then display the columns 1, 4, and 5 from those results as rows

`csv2tsv file.csv | hgrep "January 1, 2010" | cut -f1,4,5 | transpose`
