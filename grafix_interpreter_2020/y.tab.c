/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "grafix.y" /* yacc.c:339  */

	#include <stdlib.h>
	#include <stdio.h>
	#include <graphics.h>
	#include <math.h>
	
	
	typedef struct _node {
		char type;
		int varPos;
		float value;
    	struct _node *first;
    	struct _node *second;
    	struct _node *third;
    } node;
	
	//valorile conditiilor
    int conditions[10];
    int nrOfCond = 0;


    //valorile expresiilor
    float expressions[50];
    int nrOfExp = 0;



    struct _node* allTrees[100];
    int nrOfTree = 0;

    //here are the variables sored
    float varValues[25];



	//division factor:  width (x=640) / hight (y=480)
	#define FACTOR (4/3.0f)
	//logical limit of the x and y e.g.  (x, y): (-Limit, -Limit) -> (Limit, Limit)
	#define LIMIT 10


	/**
		This logical values of x and y have to be transfered into the real value of the pixel that will
		be in the window. The scalling FACTOR is used to make the with and the height look like they have 
		the same module.

	*/

	node* createNode(char type, float value, int varPos, node* first, node* second, node* third);


	float* createMonom(float coef, float power);
	float* addMonoms(float* coefs1, float* coefs2);
	float* subMonoms(float* coefs1, float* coefs2);

	int getX(float x);
	int getY(float y);
	
	void drawPoly(float* coefs);
	void drawSinus(float* coefs);
	void drawCosinus(float* coefs);
	void drawExp(float b, float* coefs);


	void beginGrafix();
	void endGrafix();

	void draw(node* allTrees[]);
	void handleTree(node* tree);


	float* handleMonom(node* monom);
	float* handlePoly(node* poly);


	int nrOfTabs = 0;


#line 145 "y.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "y.tab.h".  */
#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    X = 258,
    CONST = 259,
    SIN = 260,
    COS = 261,
    DRAW = 262,
    FOR = 263,
    VAR = 264,
    IN = 265,
    TO = 266,
    BY = 267,
    IF = 268,
    ELSE = 269,
    PI = 270,
    E = 271,
    IFX = 272,
    COMA = 273
  };
#endif
/* Tokens.  */
#define X 258
#define CONST 259
#define SIN 260
#define COS 261
#define DRAW 262
#define FOR 263
#define VAR 264
#define IN 265
#define TO 266
#define BY 267
#define IF 268
#define ELSE 269
#define PI 270
#define E 271
#define IFX 272
#define COMA 273

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 85 "grafix.y" /* yacc.c:355  */

	float number;
	char variable;
	float* coefs;
	struct _node* parseNode;

#line 228 "y.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 245 "y.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  2
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   127

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  29
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  13
/* YYNRULES -- Number of rules.  */
#define YYNRULES  42
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  91

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   273

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      19,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      26,    27,     2,    25,     2,    24,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    20,     2,
      23,    21,    22,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    28,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   106,   106,   107,   112,   117,   122,   127,   138,   145,
     150,   157,   162,   169,   178,   192,   197,   202,   207,   212,
     217,   275,   276,   277,   278,   283,   287,   296,   303,   310,
     314,   318,   322,   326,   332,   336,   341,   346,   351,   360,
     364,   368,   372
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "X", "CONST", "SIN", "COS", "DRAW",
  "FOR", "VAR", "IN", "TO", "BY", "IF", "ELSE", "PI", "E", "IFX", "COMA",
  "'\\n'", "':'", "'='", "'>'", "'<'", "'-'", "'+'", "'('", "')'", "'^'",
  "$accept", "program", "line", "for", "if", "then", "coma", "cond",
  "statement", "assign", "polinom", "monom", "term", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,    10,
      58,    61,    62,    60,    45,    43,    40,    41,    94
};
# endif

#define YYPACT_NINF -28

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-28)))

#define YYTABLE_NINF -1

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int8 yypact[] =
{
     -28,    58,   -28,   -25,   -28,   -19,   -12,   -18,     7,    -2,
      27,   -28,   -28,     6,   -28,    26,    29,    34,    14,   -28,
      -1,     2,    86,    86,   -28,    41,    28,   101,    36,   -28,
     -28,    65,   -28,   -28,   -28,   -28,     6,     6,    51,    67,
     -28,    45,    59,     2,     2,   -28,    83,    99,    90,    88,
      72,   -28,   -28,     2,    86,   -28,   -28,    98,   -28,     2,
       2,   -28,     2,     2,   -28,   -28,   -28,   -28,    95,   -28,
      17,   -28,    73,     2,   -28,   -28,   -28,   -28,   -28,   104,
     -28,     0,    36,   115,    72,    72,    36,   -28,   -28,    72,
     -28
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       2,     0,     1,    38,    39,     0,     0,     0,     0,    42,
       0,    40,    41,     0,     3,     0,     0,     0,     0,    28,
      37,     0,     0,     0,     8,     0,     0,     0,     0,    42,
      27,    37,     6,     7,     5,     4,     0,     0,    36,     0,
      35,     0,     0,     0,     0,    25,     0,     0,     0,     0,
       0,    30,    29,     0,     0,    31,    32,     0,    26,     0,
       0,    16,     0,     0,    17,    13,    24,    23,    11,    21,
      22,    34,     0,     0,    15,    18,    19,    20,    14,     0,
      33,     0,     0,     0,     0,     0,     0,     9,    12,     0,
      10
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -28,   -28,   -28,   124,   125,   -27,   -28,   -28,    32,   126,
       3,    -8,   -13
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     1,    14,    66,    67,    50,    79,    28,    68,    69,
      70,    19,    20
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      31,    24,    38,    21,    18,    30,     4,    22,    40,     3,
       4,    29,    83,    45,    23,    29,    25,    11,    12,    26,
      49,    11,    12,    31,    31,    41,    42,    39,    51,    52,
      57,    58,     4,    35,    61,    64,    27,    29,    36,    37,
      71,    36,    37,    11,    12,    32,    74,    75,    33,    76,
      77,    43,    44,    34,    84,    85,    49,    72,     2,    89,
      81,     3,     4,     5,     6,     7,     8,     9,    38,    36,
      37,    10,    55,    11,    12,     3,     4,     5,     6,    53,
       8,     9,    13,    36,    37,    10,    56,    11,    12,     3,
       4,     5,     6,    54,     4,    29,    13,    36,    37,    29,
      80,    11,    12,     4,    59,    11,    12,    65,    29,    73,
      13,    62,    63,    78,    11,    12,    87,    88,    82,    86,
      60,    90,    46,    47,    48,    15,    16,    17
};

static const yytype_uint8 yycheck[] =
{
      13,    19,     3,    28,     1,    13,     4,    26,    21,     3,
       4,     9,    12,    26,    26,     9,     9,    15,    16,    21,
      20,    15,    16,    36,    37,    22,    23,    28,    36,    37,
      43,    44,     4,    19,    47,    48,     9,     9,    24,    25,
      53,    24,    25,    15,    16,    19,    59,    60,    19,    62,
      63,    10,    24,    19,    81,    82,    20,    54,     0,    86,
      73,     3,     4,     5,     6,     7,     8,     9,     3,    24,
      25,    13,    27,    15,    16,     3,     4,     5,     6,    28,
       8,     9,    24,    24,    25,    13,    27,    15,    16,     3,
       4,     5,     6,    26,     4,     9,    24,    24,    25,     9,
      27,    15,    16,     4,    21,    15,    16,    19,     9,    11,
      24,    21,    22,    18,    15,    16,    84,    85,    14,     4,
      21,    89,    21,    22,    23,     1,     1,     1
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    30,     0,     3,     4,     5,     6,     7,     8,     9,
      13,    15,    16,    24,    31,    32,    33,    38,    39,    40,
      41,    28,    26,    26,    19,     9,    21,     9,    36,     9,
      40,    41,    19,    19,    19,    19,    24,    25,     3,    28,
      41,    39,    39,    10,    24,    41,    21,    22,    23,    20,
      34,    40,    40,    28,    26,    27,    27,    41,    41,    21,
      21,    41,    21,    22,    41,    19,    32,    33,    37,    38,
      39,    41,    39,    11,    41,    41,    41,    41,    18,    35,
      27,    41,    14,    12,    34,    34,     4,    37,    37,    34,
      37
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    29,    30,    30,    31,    31,    31,    31,    31,    32,
      32,    33,    33,    34,    35,    36,    36,    36,    36,    36,
      36,    37,    37,    37,    37,    38,    38,    39,    39,    39,
      39,    39,    39,    39,    40,    40,    40,    40,    40,    41,
      41,    41,    41
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     0,     2,     2,     2,     2,     2,     2,     8,
      10,     4,     8,     2,     1,     4,     3,     3,     4,     4,
       4,     1,     1,     1,     1,     3,     4,     2,     1,     3,
       3,     4,     4,     5,     4,     3,     2,     1,     1,     1,
       1,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 3:
#line 108 "grafix.y" /* yacc.c:1646  */
    {}
#line 1382 "y.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 113 "grafix.y" /* yacc.c:1646  */
    {
			allTrees[nrOfTree] = (yyvsp[-1].parseNode);
			nrOfTree++;
		}
#line 1391 "y.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 118 "grafix.y" /* yacc.c:1646  */
    {
			allTrees[nrOfTree] = (yyvsp[-1].parseNode);
			nrOfTree++;
		}
#line 1400 "y.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 123 "grafix.y" /* yacc.c:1646  */
    {
			allTrees[nrOfTree] = (yyvsp[-1].parseNode);
			nrOfTree++;
		}
#line 1409 "y.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 128 "grafix.y" /* yacc.c:1646  */
    {
			allTrees[nrOfTree] = (yyvsp[-1].parseNode);
			nrOfTree++;
		}
#line 1418 "y.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 139 "grafix.y" /* yacc.c:1646  */
    {
			draw(allTrees);
			exit(1);
		}
#line 1427 "y.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 146 "grafix.y" /* yacc.c:1646  */
    {
			nrOfTabs--;
			(yyval.parseNode) = createNode('f', 1, (yyvsp[-6].variable) - 'a', (yyvsp[0].parseNode), (yyvsp[-4].parseNode), (yyvsp[-2].parseNode));
		}
#line 1436 "y.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 151 "grafix.y" /* yacc.c:1646  */
    {
			nrOfTabs--;
			(yyval.parseNode) = createNode('f', (yyvsp[-2].number), (yyvsp[-8].variable) - 'a', (yyvsp[0].parseNode), (yyvsp[-6].parseNode), (yyvsp[-4].parseNode));
		}
#line 1445 "y.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 158 "grafix.y" /* yacc.c:1646  */
    {
			nrOfTabs--;
			(yyval.parseNode) = createNode('i', 0, 0, (yyvsp[-2].parseNode), (yyvsp[0].parseNode), NULL);
		}
#line 1454 "y.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 163 "grafix.y" /* yacc.c:1646  */
    {
			nrOfTabs--;
			(yyval.parseNode) = createNode('i', 0, 0, (yyvsp[-6].parseNode), (yyvsp[-4].parseNode), (yyvsp[0].parseNode));
		}
#line 1463 "y.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 170 "grafix.y" /* yacc.c:1646  */
    {
			nrOfTabs++;
			for(int i = 0; i < nrOfTabs; i++){
				printf("    ");	
			}
		}
#line 1474 "y.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 179 "grafix.y" /* yacc.c:1646  */
    {
			nrOfTabs--;
			for(int i = 0; i < nrOfTabs; i++){
				printf("    ");	
			}
		}
#line 1485 "y.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 193 "grafix.y" /* yacc.c:1646  */
    {
			(yyval.parseNode) = createNode('q', nrOfCond, (yyvsp[-3].variable) - 'a', (yyvsp[0].parseNode), NULL, NULL);
			nrOfCond++;
		}
#line 1494 "y.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 198 "grafix.y" /* yacc.c:1646  */
    {
			(yyval.parseNode) = createNode('>', nrOfCond, (yyvsp[-2].variable) - 'a', (yyvsp[0].parseNode), NULL, NULL);
			nrOfCond++;
		}
#line 1503 "y.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 203 "grafix.y" /* yacc.c:1646  */
    {
			(yyval.parseNode) = createNode('<', nrOfCond, (yyvsp[-2].variable) - 'a', (yyvsp[0].parseNode), NULL, NULL);
			nrOfCond++;
		}
#line 1512 "y.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 208 "grafix.y" /* yacc.c:1646  */
    {
			(yyval.parseNode) = createNode('g', nrOfCond, (yyvsp[-3].variable) - 'a', (yyvsp[0].parseNode), NULL, NULL);
			nrOfCond++;
		}
#line 1521 "y.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 213 "grafix.y" /* yacc.c:1646  */
    {
			(yyval.parseNode) = createNode('l', nrOfCond, (yyvsp[-3].variable) - 'a', (yyvsp[0].parseNode), NULL, NULL);
			nrOfCond++;
		}
#line 1530 "y.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 218 "grafix.y" /* yacc.c:1646  */
    {
			(yyval.parseNode) = createNode('d', nrOfCond, (yyvsp[-3].variable) - 'a', (yyvsp[0].parseNode), NULL, NULL);
			nrOfCond++;
		}
#line 1539 "y.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 284 "grafix.y" /* yacc.c:1646  */
    {
				(yyval.parseNode) = createNode('=', 1, (yyvsp[-2].variable) - 'a', (yyvsp[0].parseNode), NULL, NULL);
			}
#line 1547 "y.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 288 "grafix.y" /* yacc.c:1646  */
    {
				(yyval.parseNode) = createNode('=', 0, (yyvsp[-3].variable) - 'a', (yyvsp[0].parseNode), NULL, NULL);
			}
#line 1555 "y.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 297 "grafix.y" /* yacc.c:1646  */
    {
				node* coef = createNode('c', 0, 0, NULL, NULL, NULL);
				node* power = createNode('c', 0, 0, NULL, NULL, NULL);
				node* zero = createNode('m', 0, 0, coef, power, NULL);
				(yyval.parseNode) = createNode('p', 0, 0, zero, (yyvsp[0].parseNode), NULL);
			}
#line 1566 "y.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 304 "grafix.y" /* yacc.c:1646  */
    {
				node* coef = createNode('c', 0, 0, NULL, NULL, NULL);
				node* power = createNode('c', 0, 0, NULL, NULL, NULL);
				node* zero = createNode('m', 0, 0, coef, power, NULL);
				(yyval.parseNode) = createNode('p', 1, 0, zero, (yyvsp[0].parseNode), NULL);
			}
#line 1577 "y.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 311 "grafix.y" /* yacc.c:1646  */
    {
				(yyval.parseNode) = createNode('p', 1, 0, (yyvsp[-2].parseNode), (yyvsp[0].parseNode), NULL);
			}
#line 1585 "y.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 315 "grafix.y" /* yacc.c:1646  */
    {
				(yyval.parseNode) = createNode('p', 0, 0, (yyvsp[-2].parseNode), (yyvsp[0].parseNode), NULL);
			}
#line 1593 "y.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 319 "grafix.y" /* yacc.c:1646  */
    {
				(yyval.parseNode) = createNode('s', 1, 0, (yyvsp[-1].parseNode), NULL, NULL);
			}
#line 1601 "y.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 323 "grafix.y" /* yacc.c:1646  */
    {
				(yyval.parseNode) = createNode('s', 0, 0, (yyvsp[-1].parseNode), NULL, NULL);
			}
#line 1609 "y.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 327 "grafix.y" /* yacc.c:1646  */
    {
				(yyval.parseNode) = createNode('e', 0, 0, (yyvsp[-4].parseNode), (yyvsp[-1].parseNode), NULL);
			}
#line 1617 "y.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 333 "grafix.y" /* yacc.c:1646  */
    {
				(yyval.parseNode) = createNode('m', 0, 0, (yyvsp[-3].parseNode), (yyvsp[0].parseNode), NULL);
			}
#line 1625 "y.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 337 "grafix.y" /* yacc.c:1646  */
    {
				node* coef = createNode('c', 1, 0, NULL, NULL, NULL);
				(yyval.parseNode) = createNode('m', 0, 0, coef, (yyvsp[0].parseNode), NULL);
			}
#line 1634 "y.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 342 "grafix.y" /* yacc.c:1646  */
    {	
				node* power = createNode('c', 1, 0, NULL, NULL, NULL);
				(yyval.parseNode) = createNode('m', 0, 0, (yyvsp[-1].parseNode), power, NULL);
			}
#line 1643 "y.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 347 "grafix.y" /* yacc.c:1646  */
    {
				node* power = createNode('c', 0, 0, NULL, NULL, NULL);
				(yyval.parseNode) = createNode('m', 0, 0, (yyvsp[0].parseNode), power, NULL);
			}
#line 1652 "y.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 352 "grafix.y" /* yacc.c:1646  */
    {
				node* coef = createNode('c', 1, 0, NULL, NULL, NULL);
				node* power = createNode('c', 1, 0, NULL, NULL, NULL);
				(yyval.parseNode) = createNode('m', 0, 0, coef, power, NULL);
			}
#line 1662 "y.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 361 "grafix.y" /* yacc.c:1646  */
    {
				(yyval.parseNode) = createNode('c', (yyvsp[0].number), 0, NULL, NULL, NULL);
			}
#line 1670 "y.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 365 "grafix.y" /* yacc.c:1646  */
    {
				(yyval.parseNode) = createNode('c', 3.141592, 0, NULL, NULL, NULL);
			}
#line 1678 "y.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 369 "grafix.y" /* yacc.c:1646  */
    {
				(yyval.parseNode) = createNode('c', 2.718281, 0, NULL, NULL, NULL);
			}
#line 1686 "y.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 373 "grafix.y" /* yacc.c:1646  */
    {
				(yyval.parseNode) = createNode('v', 0, (yyvsp[0].variable) - 'a', NULL, NULL, NULL);
			}
#line 1694 "y.tab.c" /* yacc.c:1646  */
    break;


#line 1698 "y.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 378 "grafix.y" /* yacc.c:1906  */


node* createNode(char type, float value, int varPos, node* first, node* second, node* third){
	node* p = (node*)malloc(sizeof(node));
	p->type = type;
   	p->value = value;
   	p->varPos = varPos;
   	p->first = first;
   	p->second = second;
   	p->third = third;
   	return p;
}


void handleTree(node* tree){
	if(tree != NULL){
		switch(tree->type){
			case 'p' :  drawPoly(handlePoly(tree));
						break;
			case 's' :  if(tree->value == 1){
							drawSinus(handlePoly(tree->first));
						}else if(tree->value == 0){
							drawCosinus(handlePoly(tree->first));
						}
						break;
			case 'e' :  if(tree->first->type == 'c'){
							drawExp(tree->first->value, handlePoly(tree->second));
						} else if(tree->first->type == 'v'){
							drawExp(varValues[tree->first->varPos], handlePoly(tree->second));
						}
						break;
			case '=' :  if((int)tree->value == 1){
							if(tree->first->type == 'c'){
								varValues[tree->varPos] = tree->first->value;
							}else if(tree->first->type == 'v'){
								varValues[tree->varPos] = varValues[tree->first->varPos];
							}
						} else if((int)tree->value == 0){
							if(tree->first->type == 'c'){
								varValues[tree->varPos] = -tree->first->value;
							}else if(tree->first->type == 'v'){
								varValues[tree->varPos] = -varValues[tree->first->varPos];
							}
						}

						break;

			//some conditions

			//equals
			case 'q' :  if(tree->first->type == 'c'){
							if(varValues[tree->varPos] == tree->first->value){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}else if(tree->first->type == 'v'){
							if(varValues[tree->varPos] == varValues[tree->first->varPos]){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}
						break;

			//greater
			case '>' :  if(tree->first->type == 'c'){
							if(varValues[tree->varPos] > tree->first->value){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}else if(tree->first->type == 'v'){
							if(varValues[tree->varPos] > varValues[tree->first->varPos]){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}
						break;

			//lower
			case '<' :  if(tree->first->type == 'c'){
							if(varValues[tree->varPos] < tree->first->value){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}else if(tree->first->type == 'v'){
							if(varValues[tree->varPos] < varValues[tree->first->varPos]){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}
						break;

			//greater equal
			case 'g' :  if(tree->first->type == 'c'){
							if(varValues[tree->varPos] >= tree->first->value){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}else if(tree->first->type == 'v'){
							if(varValues[tree->varPos] >= varValues[tree->first->varPos]){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}
						break;

			//lower equal
			case 'l' :  if(tree->first->type == 'c'){
							if(varValues[tree->varPos] <= tree->first->value){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}else if(tree->first->type == 'v'){
							if(varValues[tree->varPos] <= varValues[tree->first->varPos]){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}
						break;

			//different
			case 'd' :  if(tree->first->type == 'c'){
							if(varValues[tree->varPos] != tree->first->value){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}else if(tree->first->type == 'v'){
							if(varValues[tree->varPos] != varValues[tree->first->varPos]){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}
						break;


			//expressions

			//add
			case '+' :  if(tree->first->type == 'c'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = tree->first->value + tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = tree->first->value + varValues[tree->second->varPos];
							}
						} else if(tree->first->type == 'v'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = varValues[tree->first->varPos] + tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = varValues[tree->first->varPos] + varValues[tree->second->varPos];
							}
						}
						printf("here: %f\n", expressions[tree->varPos]);
						break;

			//sub
			case '-' :  if(tree->first->type == 'c'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = tree->first->value - tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = tree->first->value - varValues[tree->second->varPos];
							}
						} else if(tree->first->type == 'v'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = varValues[tree->first->varPos] - tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = varValues[tree->first->varPos] - varValues[tree->second->varPos];
							}
						}
						printf("here: %f\n", expressions[tree->varPos]);
						break;

			//multiply
			case '*' :  if(tree->first->type == 'c'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = tree->first->value * tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = tree->first->value * varValues[tree->second->varPos];
							}
						} else if(tree->first->type == 'v'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = varValues[tree->first->varPos] * tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = varValues[tree->first->varPos] * varValues[tree->second->varPos];
							}
						}
						printf("here: %f\n", expressions[tree->varPos]);
						break;

			//devide
			case '/' :  if(tree->first->type == 'c'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = tree->first->value / tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = tree->first->value / varValues[tree->second->varPos];
							}
						} else if(tree->first->type == 'v'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = varValues[tree->first->varPos] / tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = varValues[tree->first->varPos] / varValues[tree->second->varPos];
							}
						}
						printf("here: %f\n", expressions[tree->varPos]);
						break;

			//modulo
			case '%' :  if(tree->first->type == 'c'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = (int)(tree->first->value) % (int)(tree->second->value);
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = (int)(tree->first->value) % (int)(varValues[tree->second->varPos]);
							}
						} else if(tree->first->type == 'v'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = (int)(varValues[tree->first->varPos]) % (int)(tree->second->value);
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = (int)(varValues[tree->first->varPos]) % (int)(varValues[tree->second->varPos]);
							}
						}
						printf("here: %f\n", expressions[tree->varPos]);
						break;




			//if
			case 'i' :  if(tree->third == NULL){
							handleTree(tree->first);
							if(conditions[(int)tree->first->value] == 1){
								handleTree(tree->second);
							}
						} else {
							handleTree(tree->first);
							if(conditions[(int)tree->first->value] == 1){
								handleTree(tree->second);
							}else if(conditions[(int)tree->first->value] == -1){
								handleTree(tree->third);
							}
						}
						break;

			//for
			case 'f' :  if(tree->second->type == 'c'){
							if(tree->third->type == 'c'){
								for(varValues[tree->varPos] = tree->second->value; varValues[tree->varPos] <= tree->third->value; varValues[tree->varPos] += tree->value){
									handleTree(tree->first);
								}
							} else if(tree->third->type == 'v'){
								for(varValues[tree->varPos] = tree->second->value; varValues[tree->varPos] <= varValues[tree->third->varPos]; varValues[tree->varPos] += tree->value){
									handleTree(tree->first);
								}
							}
						} else if(tree->second->type == 'v'){
							if(tree->third->type == 'c'){
								for(varValues[tree->varPos] = varValues[tree->second->varPos]; varValues[tree->varPos] <= tree->third->value; varValues[tree->varPos] += tree->value){
									handleTree(tree->first);
								}
							} else if(tree->third->type == 'v'){
								for(varValues[tree->varPos] = varValues[tree->second->varPos]; varValues[tree->varPos] <= varValues[tree->third->varPos]; varValues[tree->varPos] += tree->value){
									handleTree(tree->first);
								}
							}
						}

						break;

			default  :  break;
		}
	}
}

void draw(node* allTrees[]){
	beginGrafix();
	for(int i = 0; i < 10; i++){
		handleTree(allTrees[i]);
	}
	endGrafix();
}


float* handleMonom(node* monom){
	if(monom != NULL){
		if(monom->first->type == 'c'){
			if(monom->second->type == 'c'){
				return createMonom(monom->first->value, monom->second->value);
			}
			if(monom->second->type == 'v'){
				return createMonom(monom->first->value, varValues[monom->second->varPos]);
			} 
		}
		if(monom->first->type == 'v'){
			if(monom->second->type == 'c'){
				return createMonom(varValues[monom->first->varPos], monom->second->value);
			}
			if(monom->second->type == 'v'){
				return createMonom(varValues[monom->first->varPos], varValues[monom->second->varPos]);
			} 
		}
	}
	return createMonom(0, 0);
}


float* handlePoly(node* poly){
	if(poly != NULL){

		if(poly->first->type == 'm' && poly->second->type == 'm'){

			//add the monoms
			if(poly->value == 1){
				return addMonoms(handleMonom(poly->first), handleMonom(poly->second));
			}
			
			//sub the monoms
			if(poly->value == 0){
				return subMonoms(handleMonom(poly->first), handleMonom(poly->second));
			}
		}

		if(poly->first->type == 'p'){
			//add
			if(poly->value == 1){
				return addMonoms(handlePoly(poly->first), handleMonom(poly->second));
			}
			
			//sub
			if(poly->value == 0){
				return subMonoms(handlePoly(poly->first), handleMonom(poly->second));
			} 
		}		
	}
	return createMonom(0, 0);
}








float* createMonom(float coef, float power){
	float* coefs = (float*)calloc(20, sizeof(float));
	if(coefs == NULL){
		printf("no more memory\n");
		exit(1);
	}
	coefs[(int)power+10] = coef;
	return coefs;
}


float* addMonoms(float* coefs1, float* coefs2){
	float* poli = createMonom(0, 0);
	for(int i = 0; i < 20; i++){
		poli[i] = coefs1[i] + coefs2[i];
	}
	return poli;
}

float* subMonoms(float* coefs1, float* coefs2){
	float* poli = createMonom(0, 0);
	for(int i = 0; i < 20; i++){
		poli[i] = coefs1[i] - coefs2[i];
	}
	return poli;
}


//the x value for the window
int getX(float x){
	return FACTOR * (x * 240 / LIMIT) + 320;
}

//the y value for window
int getY(float y){
	return -(y * 240 / LIMIT) + 240;
}

float valueOfPoly(float* coefs, float x){
	float value = 0.0f;
	
	for(int i = -10; i < 10; i++){
		if(coefs[i+10] != 0){
			value += pow(x, i) * coefs[i+10];	
		}
	}
	return value;
}

void drawPoly(float* coefs){
	int newX, newY;
	for(float x = - LIMIT; x < LIMIT; x += 0.0001f){
		newX = getX(x);
		newY = getY(valueOfPoly(coefs, x));
		if(newX < 0 || newX > 640 || newY < 0 || newY > 480){
			continue;
		}
		putpixel(newX, newY, WHITE);
	}
}



void drawSinus(float* coefs){
	int newX, newY;
	for(float x = - LIMIT; x < LIMIT; x += 0.0001f){
		newX = getX(x);
		newY = getY(sin(valueOfPoly(coefs, x)));
		if(newX < 0 || newX > 640 || newY < 0 || newY > 480){
			continue;
		}
		putpixel(newX, newY, WHITE);
	}	
}

void drawCosinus(float* coefs){
	int newX, newY;
	for(float x = - LIMIT; x < LIMIT; x += 0.0001f){
		newX = getX(x);
		newY = getY(cos(valueOfPoly(coefs, x)));
		if(newX < 0 || newX > 640 || newY < 0 || newY > 480){
			continue;
		}
		putpixel(newX, newY, WHITE);
	}
}

void drawExp(float b, float* coefs){
	int newX, newY;
	for(float x = - LIMIT; x < LIMIT; x += 0.0001f){
		newX = getX(x);
		newY = getY(pow(b, valueOfPoly(coefs, x)));
		if(newX < 0 || newX > 640 || newY < 0 || newY > 480){
			continue;
		}
		putpixel(newX, newY, WHITE);
	}
}


void beginGrafix(){
	//initialise the graph
	int gd = DETECT, gm; 
	initgraph(&gd, &gm, "");

	//axis
	line(0, 240, 640, 240);
	line(320, 0, 320, 480);
	//borders
	line(0, 0, 0, 480);
	line(0, 0, 640, 0);
	line(639, 0, 639, 480);
	line(0, 479, 640, 479);
	
}

void endGrafix(){
	//delay the closing
	getchar();
	closegraph();
}




