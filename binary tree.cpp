//
//  main.cpp
//  task
//
//  Created by 凯悦  孙 on 2/18/18.
//  Copyright © 2018 凯悦  孙. All rights reserved.
//

#include<iostream>
#include<string>
#include<vector>
#include<sstream>

struct bdnode{
    std::string val;
    bdnode* left;
    bdnode* right;
};

typedef bdnode* bdt;

bdt buildbdt(const std::vector<std::string>& fvalues);
bdt instree (int i,bdt t);
bdt constree (int i,bdt l,bdt r);
bdt boolean (bdt t,const std::string& a,long n);

bdt buildcompactbdt(const std::vector<std::string>& fvalues);
void compactbdt (bdt& t);

bool sameroot(bdt t1,bdt t2);
bool sametree (bdt t1,bdt t2);
void deletetree(bdt t);

std::string evalcompactbdt(bdt t, const std::string& input);


std::string evalbdt(bdt t, const std::string& input);
void printtree(bdt t);
void printroot(bdt t);


int main(){
    /*std::vector<std::string> input;
    std::string in = "10";
    input.push_back(in);
    in = "11";
    input.push_back(in);
    in = "01";
    input.push_back(in);
    bdt orbdt = buildbdt(input);
    printtree(orbdt);*/
    
    
   /*std::cout << evalbdt(orbdt, "00") << std::endl;
    // prints "0"
    std::cout << evalbdt(orbdt, "01") << std::endl;
    // prints "1"*/
    
    std::vector<std::string> input;
     std::string in = "010";
     input.push_back(in);
     in = "011";
     input.push_back(in);
     in = "110";
     input.push_back(in);
     in = "111";
     input.push_back(in);
     bdt bdt = buildcompactbdt(input);
     printtree(bdt);
    
     std::cout<<std::endl;
    
     std::cout << evalcompactbdt(bdt, "000") << std::endl;
     std::cout << evalcompactbdt(bdt, "001") << std::endl;
     std::cout << evalcompactbdt(bdt, "010") << std::endl;
     std::cout << evalcompactbdt(bdt, "011") << std::endl;
     std::cout << evalcompactbdt(bdt, "100") << std::endl;
     std::cout << evalcompactbdt(bdt, "101") << std::endl;
     std::cout << evalcompactbdt(bdt, "110") << std::endl;
     std::cout << evalcompactbdt(bdt, "111") << std::endl;
    
   /* std::vector<std::string> input;
    std::string in = "0000";//2
    input.push_back(in);
    in = "0001";//18
    input.push_back(in);
    in = "0010";
    input.push_back(in);
    in = "0100";
    input.push_back(in);
    in = "0101";
    input.push_back(in);
    in = "0110";
    input.push_back(in);
    in = "1000";
    input.push_back(in);
    in = "1011";
    input.push_back(in);
    in = "1101";
    input.push_back(in);
    in = "1110";
    input.push_back(in);

    bdt fbdt = buildcompactbdt(input);
    printtree(fbdt);*/
    
 
    

   /* std::cout << evalcompactbdt(fbdt, "0000") << std::endl;
    std::cout << evalcompactbdt(fbdt, "0001") << std::endl;
    std::cout << evalcompactbdt(fbdt, "0010") << std::endl;
    std::cout << evalcompactbdt(fbdt, "0011") << std::endl;
    std::cout << evalcompactbdt(fbdt, "0100") << std::endl;
    std::cout << evalcompactbdt(fbdt, "0101") << std::endl;
    std::cout << evalcompactbdt(fbdt, "0110") << std::endl;
    std::cout << evalcompactbdt(fbdt, "0111") << std::endl;
    std::cout << evalcompactbdt(fbdt, "1000") << std::endl;
    std::cout << evalcompactbdt(fbdt, "1001") << std::endl;
    std::cout << evalcompactbdt(fbdt, "1010") << std::endl;
    std::cout << evalcompactbdt(fbdt, "1011") << std::endl;
    std::cout << evalcompactbdt(fbdt, "1100") << std::endl;
    std::cout << evalcompactbdt(fbdt, "1101") << std::endl;
    std::cout << evalcompactbdt(fbdt, "1110") << std::endl;

    std::cout << evalcompactbdt(fbdt, "1111") << std::endl;*/


    // prints "1"
    //std::cout << evalbdt(fbdt, "000001") << std::endl;
    // prints "0"
    
    
    
    
    
    
    return 0;
}

bdt buildbdt(const std::vector<std::string>& fvalues){
    long n=fvalues[0].length();   //no. of items in a string
    bdt t=NULL;
    
    for(int i=1;i<=n;i++){
        t=instree(i,t);
    }
    
    t=instree(0,t);
    
    for(int j=0;j<fvalues.size();j++){
        std::string a=fvalues[j];
        bdt tmp=boolean(t,a,n);
        tmp->val="1";
    }
    
    return t;
}

bdt constree (int i,bdt l,bdt r){
    std::string x="x";
    bdt tmp=new bdnode;
    std::ostringstream ss;
    ss<<i;
    if(i!=0){
        tmp->val=x+ss.str();}
    else{
        tmp->val="0";
    }
    tmp->left=l;
    tmp->right=r;
    return tmp;
}



bdt instree (int i,bdt t){
    if (t==NULL){
        return constree(i,NULL,NULL);
    }
    else{
        t->left=instree(i,t->left);
        t->right=instree(i,t->right);
        return t;
    }
}


bdt boolean (bdt t,const std::string& a,long n){
    bdt tmp=t;
    for(int i=0;i<n;i++){
        if(a[i]=='1'){
            tmp=tmp->right;
        }
        else{
            tmp=tmp->left;
        }
    }
    return tmp;
}

std::string evalcompactbdt(bdt t, const std::string& input){
    bdt tmp=t;
    while((tmp->val!="0")&&(tmp->val!="1")){
        int b=tmp->val[1]-'0';  //x1,x2...  char to int
        if(input[b-1]=='1'){
            tmp=tmp->right;
        }
        else{
            tmp=tmp->left;
        }
    }
    return tmp->val;
}


void compactbdt (bdt& t){
    if((t->left!=NULL)&&(t->right!=NULL)){
        int a=sametree(t->left,t->right);
        if(a==1){ //same tree
            bdt tmp=t;
            deletetree(t->right);
            t=t->left;
            delete tmp;
            compactbdt(t);
        }
        else{  //not same tree
            compactbdt(t->left);
            compactbdt(t->right);
        }
    }
}


bdt buildcompactbdt(const std::vector<std::string>& fvalues){
    bdt t = buildbdt(fvalues);
    compactbdt(t);
    return t;
}

bool sameroot(bdt t1,bdt t2){
    if(t1->val==t2->val){
        return 1; //true
    }
    else{
        return 0;
    }
}

bool sametree (bdt t1,bdt t2){
    int a;
    if((t1!=NULL)&&(t2!=NULL)){
        a=sametree(t1->left,t2->left);
        if(a!=1){return 0;}
        a=sameroot(t1,t2);
        if(a!=1){return 0;}
        a=sametree(t1->right,t2->right);
        if(a!=1){return 0;}
    }
     //else((t1==NULL)&&(t2==NULL)),is seen as same
    return 1;
}

void deletetree(bdt t){
    if(t!=NULL){
        deletetree(t->left);
        deletetree(t->right);
        delete t;
    }
}




std::string evalbdt(bdt t, const std::string& input){
    bdt tmp=boolean(t,input,input.length());
    return tmp->val;
}


void printroot(bdt t){
    std::cout<<t->val<<std::endl;
}
void printtree(bdt t){
    if(t!=NULL){
        printtree(t->left);
        printroot(t);
        printtree(t->right);
    }
}

