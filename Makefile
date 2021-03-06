BINDIR=${EZDIR_HOME}/bin
LIBDIR=${EZDIR_HOME}/lib
BINARY=ezatmcmd
OBJFILE=ezatmcmd.o
SOURCE=ezatmcmd.cpp
PROCSOURCE=ezatmcmddb.pc
COBJFILE=ezatmcmddb.o
CSOURCE=ezatmcmddb.c

LIBLIST=-lezdebug_util -lezcmdutil -leztaskutil -lezchlocateutil -lezcfg_util -lezatmutil -lezdatetimeutil -lezdbutil -lezchannelutil -lezatmmemutil
INCLUDEDIR=${EZDIR_HOME}/include


${BINARY}	:	${OBJFILE} ${COBJFILE}  
			g++ ${OBJFILE} ${COBJFILE} -L${LIBDIR} ${LIBLIST} -L${ORACLE_HOME}/lib -lclntsh -o ${BINARY}	

${OBJFILE}	:	${SOURCE}
			g++ -g -c ${SOURCE} -I${INCLUDEDIR}

${COBJFILE}	:	${PROCSOURCE}
			proc ${PROCSOURCE}
			cc -c ${CSOURCE} -I${ORACLE_HOME}/precomp/public -I${INCLUDEDIR}

install		:
			mv ${BINARY} ${BINDIR}

clean		:
			rm *.o
			rm tp*
