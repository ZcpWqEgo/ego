package com.xxxx.manager.FreemarkerUtils;

import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

import java.util.List;

public class FtlTest implements TemplateMethodModelEx {


    @Override
    public Object exec(List arguments) throws TemplateModelException {

        return arguments;
    }
}
