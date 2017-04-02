module libintl;

extern(C) { 
    char *gettext (const(char) *__msgid);
    char *dgettext (const(char)*__domainname, const(char) *__msgid);
    
    char *dcgettext (const(char) *__domainname, const(char) *__msgid, int __category);
    char *ngettext (const(char) *__msgid1, const(char) *__msgid2, 
            ulong __n);

    char *dngettext (const(char) *__domainname, const(char) *__msgid1,
            const(char) *__msgid2, ulong __n);
    char *dcngettext (const(char) *__domainname, const(char) *__msgid1,
             const(char) *__msgid2, ulong __n,
             int __category);

    char* textdomain(const(char)* domainname);
    char* bindtextdomain(const(char)* domainname, const(char)* codeset);  
    char *bind_textdomain_codeset (const(char) *__domainname,
                      const(char) *__codeset);
}
