#include <iostream>

#include<vector>

#include<string>
#include<cstdlib>
#include<iomanip>




//vector downdel0 (const vector<vector<int> >& t );




using namespace std;
void print(vector< vector<int> >);

void downdel0 (vector<vector<int> >& t );
void add_down(vector<vector<int> >& t );


void updel0( vector< vector<int> >& t);  //const????
void add_up(vector< vector<int> >& t );

void leftdel0 (vector< vector<int> >& t);
void add_left(vector< vector<int> >& t );

void rightdel0 (vector< vector<int> >& t);
void add_right(vector< vector<int> >& t );

void random (vector< vector<int> >& t,vector< vector<int> >& t1);

bool check_same ( const vector< vector<int> >& t);
bool game_over (const vector< vector<int> >& t);

int check_maxflag (const vector< vector<int> >& t);

int main() {
    
    vector<int> r1,r2,r3,r4;
    
    int tmp=0;
    
    for(int i=0;i<4;i++){
        
        r1.push_back(tmp);
        
        r2.push_back(tmp);
        
        r3.push_back(tmp);
        
        r4.push_back(tmp);
        
    }
    
    r4[3]=2;
    
    r3[3]=0;
    
    r2[3]=0;
    
    r1[3]=2;
    
    r4[2]=4;
    
    r3[2]=4;
    
    r2[2]=4;
    
    r1[2]=2;
    
    r4[1]=4;
    
    r3[1]=2;
    
    r2[1]=4;
    
    r1[1]=2;
    
    r4[0]=4;
    
    r3[0]=2;
    
    r2[0]=0;
    
    r1[0]=12345678;
    
    
    
    vector< vector<int> > t;
    
    t.push_back(r1);
    
    t.push_back(r2);
    
    t.push_back(r3);
    
    t.push_back(r4);
    
    print(t);
    
    
    
    string move;
    
    
    
    
    while(!game_over(t)){
        cin>>move;
    
    if(move=="s"){
        vector< vector<int> > t1=t;
        downdel0 ( t );
        add_down(t);
        random(t,t1);
        if(game_over(t)){
            cout<<"game over"<<endl;
        }
        else{
            if(t!=t1){
            print(t);
            }
       }
    }
    else if(move=="w"){
        vector< vector<int> > t1=t;
        updel0(t);
        add_up(t);
        random(t,t1);
        if(game_over(t)){
            cout<<"game over"<<endl;
        }
        else{
            if(t!=t1){
                print(t);
            }
            
        }
    }
    
    else if(move=="a"){
        vector< vector<int> > t1=t;
        leftdel0(t);
        add_left(t);
        random(t,t1);
        if(game_over(t)){
            cout<<"game over"<<endl;
        }
        else{
            if(t!=t1){
                print(t);
            }
            
        }
     }
    
    else if(move=="d"){
        vector< vector<int> > t1=t;
        rightdel0(t);
        add_right(t);
        random(t,t1);
        if(game_over(t)){
            cout<<"game over"<<endl;
        }
        else{
            if(t!=t1){
                print(t);
            }
            
        }
     }
  }
    
    return 0;
    
}

void print(vector< vector<int> > t){
    
    int c;
    
    for(int r=0;r<4;r++ ){
        
        c=0;
        
        for(c=0;c<4;c++){
            
            cout<<left<<setw(check_maxflag(t)+6)<<t[r][c];
            
        }
        
        cout<<endl;
        
    }
    
}


void downdel0 ( vector<vector<int> >& t ){
  for(int c=0;c<4;c++){
 
 
    for(int i=3;i>0;i--){
 
 
        if(t[3][c]==0){
          t[3][c]=t[2][c];
          t[2][c]=t[1][c];
          t[1][c]=t[0][c];
          t[0][c]=0;
 
        }
        else if(t[3][c]!=0){
           if(t[2][c]==0){
             t[2][c]=t[1][c];
             t[1][c]=t[0][c];
             t[0][c]=0;
           }
           else if(t[2][c]!=0){
              if(t[1][c]==0){
              t[1][c]=t[0][c];
              t[0][c]=0;
              }
           }
        }
     }
  }
}

void add_down(vector<vector<int> >& t ){
    
    for(int r=3;r>0;r--){
        
        
        for(int c=0;c<4;c++){
            
            if(t[r-1][c]==t[r][c]){
                
                t[r][c]=2*t[r][c];
                
                t[r-1][c]=0;
                
                
                
                
                downdel0 (  t );
                
                }
            
        }
        
    }
   
    
}

void updel0( vector< vector<int> >& t){
    for(int c=0;c<4;c++){
        
        
        for(int i=3;i>0;i--){
            
            
            if(t[0][c]==0){
                t[0][c]=t[1][c];
                t[1][c]=t[2][c];
                t[2][c]=t[3][c];
                t[3][c]=0;
                
            }
            else if(t[0][c]!=0){
                if(t[1][c]==0){
                    t[1][c]=t[2][c];
                    t[2][c]=t[3][c];
                    t[3][c]=0;
                }
                else if(t[1][c]!=0){
                    if(t[2][c]==0){
                        t[2][c]=t[3][c];
                        t[3][c]=0;
                    }
                }
            }
        }
    }

}

void add_up(vector<vector<int> >& t ) {
    for(int r=0;r<3;r++){
        
        
        for(int c=0;c<4;c++){
            
            if(t[r+1][c]==t[r][c]){
                
                t[r][c]=2*t[r][c];
                
                t[r+1][c]=0;
                
                updel0(t);
            }
        }
     }
}


void leftdel0 (vector< vector<int> >& t){
  for(int r=0;r<4;r++){
    
    
    for(int i=3;i>0;i--){
        
        
        if(t[r][0]==0){
            t[r][0]=t[r][1];
            t[r][1]=t[r][2];
            t[r][2]=t[r][3];
            t[r][3]=0;
            
        }
        else if(t[r][0]!=0){
            if(t[r][1]==0){
                t[r][1]=t[r][2];
                t[r][2]=t[r][3];
                t[r][3]=0;
            }
            else if(t[r][1]!=0){
                if(t[r][2]==0){
                    t[r][2]=t[r][3];
                    t[r][3]=0;
                }
            }
        }
    }
  }
}

void add_left(vector< vector<int> >& t ){
    for(int c=0;c<3;c++){
        
        
        for(int r=0;r<4;r++){
            
            if(t[r][c+1]==t[r][c]){
                
                t[r][c]=2*t[r][c];
                
                t[r][c+1]=0;
                
                leftdel0(t);
            }
        }
    }
}

void rightdel0 (vector< vector<int> >& t){
for(int r=0;r<4;r++){
    
    
    for(int i=3;i>0;i--){
        
        
        if(t[r][3]==0){
            t[r][3]=t[r][2];
            t[r][2]=t[r][1];
            t[r][1]=t[r][0];
            t[r][0]=0;
            
        }
        else if(t[r][3]!=0){
            if(t[r][2]==0){
                t[r][2]=t[r][1];
                t[r][1]=t[r][0];
                t[r][0]=0;
            }
            else if(t[r][2]!=0){
                if(t[r][1]==0){
                    t[r][1]=t[r][0];
                    t[r][0]=0;
                }
            }
        }
    }
}
}

void add_right(vector< vector<int> >& t ){
    for(int c=3;c>0;c--){
        
        
        for(int r=0;r<4;r++){
            
            if(t[r][c]==t[r][c-1]){
                
                t[r][c]=2*t[r][c];
                
                t[r][c-1]=0;
                rightdel0(t);
            }
        }
    }
    
}

void random (vector< vector<int> >& t,vector< vector<int> >& t1){
    if(t!=t1){
        int r=rand() % 4;
        int c=rand() % 4;
        while(t[r][c]!=0){
            r=rand() % 4;
            c=rand() % 4;
        }
        t[r][c]=2;
    }
}

/*bool game_over (vector< vector<int> >& t){
    int i=0;
    for(int c=0;c<4;c++){
        for(int r=0;r<4;r++){
            if(t[r][c]==0){
                i++;
            }
        }
     }
    if(i==0){  //full
        if(!check_same(t)){    //over
            return true; // over
        }
        else{             //full but has same -- executable
            return false; //not over
        }
    }
    else if(i!=0){ //not full can continue
        return false;   //not over
        }
}*/

bool check_same (const vector< vector<int> >& t){
    int j=0;
    for(int c=0;c<4;c++){
        for(int r=0;r<3;r++){
            if(t[r][c]==t[r+1][c]){
                j++;
             }
        }
     }
    for(int r=0;r<4;r++){
        for(int c=0;c<3;c++){
            if(t[r][c]==t[r][c+1]){
                j++;
            }
        }
    }
    if(j==0){
        return false;  //no same
    }
    else{      //else if(j!=0){
        return true;
    }
}


bool game_over (const vector< vector<int> >& t){
     int i=0;
     for(int c=0;c<4;c++){
         for(int r=0;r<4;r++){
             if(t[r][c]==0){
                   i++;
             }
          }
      }
     if(i==0){  //full
          if(!check_same(t)){    //over
                return true; // over
          }
          else{         //(else if (check_same(t)){)             //full but has same -- executable
                return false; //not over
          }
     }
     else{           //(else if(i!=0){) control may result in non-void function                      //not full can continue
         return false;   //not over
     }
}
int check_maxflag (const vector< vector<int> >& t){
    int max=0;
    int tmp2;
    for(int r=0;r<4;r++){
       for(int c=0;c<4;c++){
          int flag=0;
        
           tmp2=t[r][c];
             while(tmp2>0){
               tmp2=tmp2/10;
               flag++;
            
             }
            if(flag>max){
             max=flag;
            }
       }
    }
    return max;
}


/*int a=123456789,i=0;
while(a>0){
    a=a/10;
    i++;
}
cout<<i<<endl;*/


/*for(int i=0;i<4;i++){
 
 if(t[1][i]==t[2][i]){
 
 t[2][i]=2*t[2][i];
 
 t[1][i]=0;
 
 }
 
 }
 
 for(int i=0;i<4;i++){
 
 if(t[0][i]==t[1][i]){
 
 t[1][i]=2*t[1][i];
 
 t[0][i]=0;
 
 }
 
 }
 
 
 
 
 
 }*/
