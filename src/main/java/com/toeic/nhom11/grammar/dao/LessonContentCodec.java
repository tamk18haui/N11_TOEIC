package com.toeic.nhom11.grammar.dao;

import com.toeic.nhom11.grammar.model.Example;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import java.util.*;

/**
 * Presentation convention within the team's existing LONGTEXT content_html.
 * No extra columns or tables. Plain legacy HTML is still a readable lecture.
 * Editor input is escaped/sanitized by the service before it reaches this codec.
 */
public final class LessonContentCodec {
    private LessonContentCodec() {}
    public record Content(String summary,String lecture,List<Example> examples) {}
    public static Content decode(long lessonId,String html) {
        var body=Jsoup.parseBodyFragment(Objects.toString(html,"")).body();
        var lecture=body.selectFirst("section[data-n11=lecture]");
        if(lecture==null) {
            String plain=body.text();
            return new Content(plain.substring(0,Math.min(plain.length(),220)),body.html(),new ArrayList<>());
        }
        var summary=body.selectFirst("p[data-n11=summary]");
        List<Example> examples=new ArrayList<>();
        for(Element item:body.select("section[data-n11=examples] > article[data-example-id]")) {
            try {
                Example e=new Example();e.setId(Long.parseLong(item.attr("data-example-id")));e.setLessonId(lessonId);
                e.setSentence(value(item,".sentence"));e.setTranslation(value(item,".translation"));e.setNote(value(item,".note"));
                e.setSortOrder(Integer.parseInt(item.attr("data-order")));examples.add(e);
            } catch(NumberFormatException ignored) { /* Ignore malformed structured examples from external imports. */ }
        }
        examples.sort(Comparator.comparingInt(Example::getSortOrder).thenComparing(Example::getId));
        return new Content(summary==null?"":summary.text(),lecture.html(),examples);
    }
    private static String value(Element e,String selector) {var node=e.selectFirst(selector);return node==null?"":node.text();}
    public static String encode(String summary,String lecture,List<Example> examples) {
        var body=Jsoup.parseBodyFragment("").body();
        body.appendElement("p").attr("data-n11","summary").text(Objects.toString(summary,""));
        body.appendElement("section").attr("data-n11","lecture").html(Objects.toString(lecture,""));
        var section=body.appendElement("section").attr("data-n11","examples");
        section.appendElement("h2").text("Ví dụ thực tế");
        for(Example e:examples) {
            var item=section.appendElement("article").attr("data-example-id",e.getId().toString()).attr("data-order",Integer.toString(e.getSortOrder()));
            item.appendElement("p").addClass("sentence").text(e.getSentence());
            item.appendElement("p").addClass("translation").text(e.getTranslation());
            item.appendElement("p").addClass("note").text(Objects.toString(e.getNote(),""));
        }
        return body.html();
    }
}
