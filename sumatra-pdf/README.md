# PDFtk - The PDF Tookit


### install
```bash
sudo apt install pdftk-java --fix-missing
```


### dump bookmarks of a pdf
```bash
pdftk input.pdf dump_data output bookmarks.txt
```


### update pdf to have new set of bookmarks
```bash
pdftk input.pdf update_info bookmarks.txt output output.pdf
```


### combine multiple pdfs into one
```bash
pdftk input1.pdf input2.pdf inpu3.pdf cat output output.pdf
```


### example bookmarks.txt
```
BookmarkBegin
BookmarkTitle: Top Level Section 1
BookmarkLevel: 1
BookmarkPageNumber: 1
BookmarkEnd

    BookmarkBegin
    BookmarkTitle: Subsection 1.1
    BookmarkLevel: 2
    BookmarkPageNumber: 2
    BookmarkEnd

    BookmarkBegin
    BookmarkTitle: Subsection 1.2
    BookmarkLevel: 2
    BookmarkPageNumber: 3
    BookmarkEnd

    BookmarkBegin
    BookmarkTitle: Subsection 1.3
    BookmarkLevel: 2
    BookmarkPageNumber: 4
    BookmarkEnd

BookmarkBegin
BookmarkTitle: Top Level Section 2
BookmarkLevel: 1
BookmarkPageNumber: 5
BookmarkEnd

    BookmarkBegin
    BookmarkTitle: Subsection 2.1
    BookmarkLevel: 2
    BookmarkPageNumber: 6
    BookmarkEnd

        BookmarkBegin
        BookmarkTitle: Sub-subsection 2.1.1
        BookmarkLevel: 3
        BookmarkPageNumber: 7
        BookmarkEnd

        BookmarkBegin
        BookmarkTitle: Sub-subsection 2.1.2
        BookmarkLevel: 3
        BookmarkPageNumber: 8
        BookmarkEnd

        BookmarkBegin
        BookmarkTitle: Sub-subsection 2.1.3
        BookmarkLevel: 3
        BookmarkPageNumber: 9
        BookmarkEnd

    BookmarkBegin
    BookmarkTitle: Subsection 2.2
    BookmarkLevel: 2
    BookmarkPageNumber: 10
    BookmarkEnd
```


### other functions

**Split a PDF**: You can split a PDF into individual pages or ranges of pages using the `cat` command with the `output` option. For example, to split a PDF into separate pages:
 ```bash
 pdftk input.pdf burst
 ```


**Rotate Pages**: You can rotate pages in a PDF using the `rotate` option. For example, to rotate page 2 of a PDF 90 degrees clockwise:
```bash
pdftk input.pdf cat 1-1 2R 3-end output rotated.pdf
 ```

**Encrypt and Decrypt PDFs**: `pdftk` allows you to encrypt and decrypt PDFs. To encrypt a PDF, use the `owner_pw` and `user_pw` options. For example:
```bash
pdftk input.pdf output encrypted.pdf owner_pw myownerpassword user_pw myuserpassword
```

**Merge PDF Forms**: You can use `pdftk` to merge PDF forms (PDFs with form fields). This can be useful for combining completed forms into one PDF:
```bash
pdftk form1.pdf form2.pdf cat output combined_forms.pdf
```

**Flatten PDF Forms**: If you have interactive forms and want to flatten them (remove form fields and make them static), you can use `pdftk` with the `flatten` option:
```bash
pdftk input.pdf fill_form data.fdf output flattened.pdf flatten
```

**Stamp Watermarks**: You can add watermarks to your PDF documents using the `stamp` option. For example:
```bash
pdftk input.pdf stamp watermark.pdf output watermarked.pdf
```

**Extract Pages**: You can extract specific pages from a PDF into a new PDF using the `cat` command. For example, to extract pages 5 to 10:
```bash
pdftk input.pdf cat 5-10 output extracted.pdf
```

**Join PDFs in a Directory**: To join all PDFs in a directory, you can use shell wildcards. For example, to combine all PDFs in the current directory into one PDF:
```bash
pdftk *.pdf cat output combined.pdf
```
