import { Controller } from "@hotwired/stimulus"
import assessment_form_controller from "./assessment_form_controller";

export default class extends Controller {

  static targets=["prefecture","city","store"]
  static values={
    cities:Array,
    stores:Array,
    assessmentareas:Array,
  }

  connect(){
    this.prefectureTarget.firstElementChild.value=-1;
    this.prefectureTarget.firstElementChild.classList.add("assessment_form");
    console.log(this.prefectureTarget);
  }

  filter_city_and_store(){
    this.filter_city();
    this.filter_store();
  }

  filter_city(){
    this.cityTarget.innerHTML="<option value=-1> 市区町村を選択してください</option>";

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
    this.storeTarget.innerHTML="<option value=-1> 店舗を選択してください</option>";

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

    if (this.storeTarget.childElementCount ==0 ){
      let option=document.createElement("option");
      option.text="査定可能な店舗がありません";
      option.value=-1;
      this.storeTarget.appendChild(option);
    }

    
  }

}

