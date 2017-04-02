module gi18n;

import core.stdc.locale;
import glib.Internationalization: Internationalization;
import std.conv: to;
import std.functional: curry;

private import libintl;


public class I18n : Internationalization {
    public static setLocale() {
        return to!string(setlocale(LC_ALL, ""));    
    }

    public static setLocale(int category, in string locale) {
        return to!string(setlocale(category, locale.ptr));
    }

    public static string bindtextdomain(string domainname, string codeset) {
        return to!string(libintl.bindtextdomain(domainname.ptr, codeset.ptr));    
    }

    public static string textdomain(string domainname) {
        return to!string(libintl.textdomain(domainname.ptr));
    }

    alias gettext = curry!(dgettext, null);
} 
