package com.controllers;

import com.pojo.Provider;
import com.service.provider.ProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProviderController {
    @Autowired
    private ProviderService providerService;

    @RequestMapping("/check.do")
    @ResponseBody
    public String check(@RequestParam String proCode){
        if(providerService.isExistsProCode(proCode)){
            return "exists";
        }else{
            return "notExists";
        }
    }
    @RequestMapping("/addProvider.do")
    public String add(Provider provider, Model model){
        //防止用户卡前后跳页面的BUG
        if(!model.containsAttribute("result")){
            try {
                if(providerService.addOne(provider) > 0){
                    model.addAttribute("result","finished");
                }else{
                    model.addAttribute("result","failed");
                }
            }catch (Exception e){
                model.addAttribute("result","failed");
            }
        }
        return "addProviderPage.jsp";
    }
}
