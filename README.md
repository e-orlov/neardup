# neardup
echo "# neardup" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/e-orlov/neardup.git
git push -u origin master

Near-Duplicate Detection

If you have lots of digital documents you might already know how many duplicates or near-duplicates exist on your hard drive or on your network storage devices. If you want to clean up the space - you need to find these duplicates. In this particular case we want to talk specifically about text based documents, like HTML, Microsoft Word, PDF, etc. Some documents are exact copies, (or archived exact copies), and usually these are easy to find - just calculate good checksum and compare it with others. But if you are involved in anything related to the document life cycle (like project development), then many of your archived documents will be copies made during the life cycle of this document, which basically are different versions of the same document. Usually the situation is worse, on top of that you may have different formats of documents, for example a document created in Microsoft Word and later converted to PDF format. 

Similar problem exists for search engines, especially for global search engines like Google or Bing. The web crawler finds lots of documents, which are duplicates, or near-duplicates, or different formats of the same document. Each big search engine has tools to deal with such situation. Duplicate or near-duplicate documents can be discarded by the search engine, or presented as a link to similar documents instead of littering the search results. What makes matter even worse for the search engine is the fact that it has to make a decision if the document has near-duplicates among millions or even billions of other documents almost instantly, as crawler keeps crawling the web and new documents keep coming constantly. 

The problem of Near-Duplicate Detection also relates to Plagiarism Analysis and Authorship Identification. 

Near Duplicates Finder
The Near Duplicates Finder software is a Java program, which finds duplicates and near-duplicates of text documents based on internal text of a document and provides a report for future action. For example, you can automatically delete found duplicates. It takes some time to initially process the document and create a fingerprint, but finding near-duplicates among already processed documents usually takes milliseconds. 
Here are two documents from Gutenberg collection, which are reported as near duplicates: gutenberg/1/1/119/old/20040619_119.txt and gutenberg/1/1/119/119-8.txt. 
You can see that the content of the documents is different, however most of the text is matching in both documents. 
Besides Near Duplicates Finder you can run the Cluster Finder, which will report the clusters of discovered near-duplicate documents. Click here for more information about the Cluster Finder. You also can see the near duplicate documents presented as a chain, which is built by the Near Dupilcates Chain Finder. Click here for more information about the Near Duplicates Chain Finder. The chain is an ordered collection of documents, with a root document, sorted by document differences. The last document in a chain can be quite different from the first one, however the software allows you to see the chain of changes in one set. 

The Near Duplicates Finder works with different types of documents, including Plain Text, HTML, XML, PDF, Microsoft Office, OpenOffice, RTF, etc. It extracts text from documents and creates a fingerprint (or signature) for each document, which allows quickly find duplicates or near-duplicates for this document. The program uses a database index to store the document fingerprints and detecting near-duplicates in large collections should be very fast*. The near-duplicate search algorithm is an implementation of the "Method and apparatus for identifying near-duplicate documents" patent 8370390. For commercial usage of this software or the patent please contact us using email: info@softcorporation.com. 

The Near Duplicates Finder runs on Java platform 1.5 (or up) and can be used on Windows, Mac, UNIX, Linux, etc. The Java ver 1.7 is recommended because of compatibility with third party libraries. The software works under 32 bit OS, however, depending on your documents, it might require up to 1-2 Gb of virtual memory, so we recommend it running under 64 bit OS with 4 GB of virtual memory. 

The home page for the Near Duplicates Finder Software can be found on the SoftCorporation LLC. Web site http://www.softcorporation.com/products/neardup. There you also can find the latest release, as well as all other information you might need regarding this project. 
Click here to Download the Near Duplicates Finder. It is a working version of the software, but you will need to contact us to get a free license, because attached evaluation license will expire after 3 months. By default this version is limited to process the following file extensions: ".pdf", ".htm", ".html", ".doc", ".docx", ".xls", ".txt", ".text", ".css", ".java", ".js", ".c", ".bak", ".bat", ".sh", ".xml", ".xsl", ".pl", ".properties", ".config", ".cfg", ".log". If you are not familiar with Java or you have any problems - send us an email and we will guide you on how to install the software on your computer and run it. 

To run the software you need to download the zip file and unpack all files in the directory of your choice. You also need to download required 3-rd party libraries listed here. Put 3-rd party libraries in the same folder, where you put the files from neardup.zip and add all jar files to the classpath. JVM 1.7 is recommended to be installed on this computer. On Microsoft Windows you can use the run.bat file included in the zip file. Enter following command: run DIR_WITH_DOCS, where DIR_WITH_DOCS is a directory with your documents, for which you want to check if there are any duplicates or near-duplicates. If you click on run.bat without parameters, it should produce the following output: 
java com.softcorporation.neardup.DuplicatesFinder
Invalid input parameters: Invalid number of arguments

Near Duplicates Finder v.1.0.2
Usage: java com.softcorporation.neardup.DuplicatesFinder parameters ...

Parameters format: -parameter [value]
    -start filename[,filename]  directory / file(s) to search for duplicates (mandatory)
    -report filename            report file (by default report goes to ./report.log file)
    -format log|prog            report formatting (log by default)
    -score value                the score to report a duplicate
    -addonly                    add documents to the database without looking for duplicates
    -update                     process only updated documents
    -unpack                     unpack documents from zip and gzip archives
    -purge                      clear files list from past runs
    -db path                    location of database directory
    -delete criteria            remove duplicates by criteria (old, new, small, large)
    -deletepath pattern         remove only matching pattern files (mandatory for delete)
    -verbose                    display progress information
    -help                       display this message and terminate the program

Example: Find duplicates from text files in directory 'docs' and save report in 'duplicates.log'
    java com.softcorporation.neardup.DuplicatesFinder -start docs -report duplicates.log

For more information visit web site: http://www.softcorporation.com/products/neardup
Check the classpath if you cannot get a similar output (see example of the classpath setting in the run.bat file). The classpath should have all jar files listed above. You also need to make sure the software has rights to write to local directory, where it will save the report and (more importantly) the database in directory ./db. The database is created automatically and with every next run the software uses the existing database and compares new documents with the documents processed in previous run and stored in the database. You can simply delete whole directory ./db to start the comparison process all over again. 

The run.bat file contains following commands: 
java com.softcorporation.neardup.DuplicatesFinder -start %1% -score 0.7 -update -addonly -verbose 
This command will process the folder with your files (specified by -start parameter), extract a text from the files with listed above extensions, create a database in ./db folder and save records for processed files in the database. It will not search for duplicates yet, as the option -addonly is applied. The search for duplicates will be done by the following command: 
java com.softcorporation.neardup.ClusterFinder -score 0.7 -distinct -report clusters.txt -verbose 
This command will start the Cluster Finder, which will search for duplicates with a score of 0.7 within all files in the database, create clusters of duplicates, and print the report in "clusters.txt" file. For more information about the Cluster Finder click here. 
However if you want to report the near-duplicates instantly, you can run the following command: 
java com.softcorporation.neardup.DuplicatesFinder -start %1% -score 0.7 -report duplicates.txt -verbose 
This command will process the folder with your files (specified by -start parameter), extract a text from each text file, create a record in the database, instantly lookup for near-duplicates with a score of 0.7, compare current file with all previously processed files and make a report (saved in "duplicates.txt") listing all near-duplicates for this file. 

Note: The Near Duplicates Finder by default is configured to work with relatively large documents and may not work very well with small documents (size less then 1Kb). This limitation can be removed by changing the configuration settings. 

For legal and licensing issues, please read the LICENSE.TXT file. This product uses Derby, Tika and Log4J Java Software developed by The Apache Software Foundation (http://www.apache.org/). See Apache License: LICENSE-3RDPARTY.TXT. 

* - This statement was not verified for very large collections as currently the Near Duplicates Finder was tested up to a million documents, however we expect it to work with much larger numbers. 
