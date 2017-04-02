/**
 * Copyright: (c) 2015-2017, Oleg Lelenkov.
 * License: Proprietary
 * Authors: Oleg Lelenkov
 */
module fssp.window;

private
{
    import std.format : fmt = format;

    import glib.RandG;
    import gtk.Main;
    import gtk.ScrolledWindow;
    import gtk.MainWindow;
    import gtk.TreeView;
    import gtk.TreeModel;
    import gtk.TreeViewColumn;
    import gtk.CellRendererText;
    import gtk.ListStore;

    import fssp.customlist;
}


class CustomListWindow : MainWindow
{
    this()
    {
        super("GtkD - Custom TreeModel");
        setDefaultSize(300, 400);

        ScrolledWindow scrollwin = new ScrolledWindow();
        scrollwin.setKineticScrolling(true);
        scrollwin.setOverlayScrolling(true);

        TreeView view = createViewAndModel();

        scrollwin.add(view);
        add(scrollwin);

        showAll();
    }

    TreeView createViewAndModel()
    {
        CustomList list = new CustomList();
        TreeView view = new TreeView(list);
        fillModel(list, view);

        return view;
    }

    void fillModel (CustomList customlist, TreeView view)
    {
        import std.algorithm.iteration : map;
        import std.algorithm.sorting : sort;
        import std.conv : to;
        import std.range : iota;
        import std.array : join;

        import vibe.http.client;
        import vibe.stream.operations : readAll;
        import vibe.data.json;

        TreeViewColumn   col;
        CellRendererText renderer;

        auto res = requestHTTP("http://10.81.3.191:8081/api/query/ips?code=00000&limit=15000");
        string str = cast(string)res.bodyReader.readAll;
        Json json = parseJson(str);

        customlist.initColumns(json["meta"]);
            
        Json[] columns = json["meta"]["columns"].get!(Json[]);
        columns.sort!((col1, col2) => col1["order"].get!int < col2["order"].get!int);

        foreach (uint i, Json colData; columns)
        {
            string type = colData["type"].get!string;
            col = new TreeViewColumn();
            renderer  = new CellRendererText();
            col.setTitle(colData["caption"].get!string);
            col.packStart(renderer, true);
            col.addAttribute(renderer, "text", i+1);
            view.appendColumn(col);
        }

        ulong count;
        foreach (Json item; json["data"])
        {
            customlist.appendRecord(item["attributes"]);
            count++;
        }   

        import std.stdio: wl = writeln;
        wl(count);
    }
}
