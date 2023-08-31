import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets=["prefecture","city","store"]
  static values={
    cities:Array,
    stores:Array,
    assessmentareas:Array,
  }

  connect(){

    this.prefectureTarget.value=1
    this.cityTarget.value=1
    this.filter_city_and_store();

  }

  filter_city_and_store(){
    this.filter_city();
    this.filter_store();
  }

  filter_city(){
    this.cityTarget.innerHTML="";

    let options=this.citiesValue.filter((city)=>{
      return city.prefecture_id==this.prefectureTarget.value;
    }).map((city)=>{
      let option=document.createElement("option");
      option.text=city.name;
      option.value=city.id;      
      return option
    })

    options.forEach(option => {
      this.cityTarget.appendChild(option);
    });
  }

  filter_store(){
    this.storeTarget.innerHTML="";

    let assessment_store_ids=this.assessmentareasValue.filter((area)=>{
      return area.city_id==this.cityTarget.value;
    }).map((area)=>{
      return area.store_id;
    })

    let assessment_stores=this.storesValue.filter((store)=>{
      return assessment_store_ids.includes(store.id)
    })

    for(let i=0; i<assessment_stores.length;i++){

      let store_name="";
      if (assessment_stores[i].name === null ){
        store_name=assessment_stores[i].company_name;
      }else{
        store_name=assessment_stores[i].company_name+" "+assessment_stores[i].name;
      }
      
      let option=document.createElement("option");
      option.text=store_name;
      option.value=assessment_stores[i].id;
      this.storeTarget.appendChild(option);
    }

    
  }

}
