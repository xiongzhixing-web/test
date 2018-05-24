package test;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

public class TestFreemarker {
    public static void main(String[] args) {
        String dir = "C:/Users/Administrator/Desktop/freemarker";
        Configuration cfg = new Configuration();

        try {
            cfg.setDirectoryForTemplateLoading(new File(dir));
            cfg.setObjectWrapper(new DefaultObjectWrapper());
            cfg.setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);
            Map root = new HashMap();
            root.put("name", "hello,keke");
            root.put("flag", false);
            Template template = cfg.getTemplate("source.txt");
            PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(dir + "/target.txt")));
            try {
                template.process(root, out);
            } catch (TemplateException e) {
                e.printStackTrace();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
